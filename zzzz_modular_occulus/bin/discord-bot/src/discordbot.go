package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net"
	"net/rpc"
	"net/rpc/jsonrpc"
	"os"
	"os/signal"
	"strings"
	"syscall"

	"github.com/bwmarrin/discordgo"
	byondtopic "github.com/vulppine/byond-topic-go"
)

type Bot struct {
	BotName             string `json:"botName"`
	NotificationChannel string `json:"notificationChannel"`
	NotificationGroup   string `json:"notificationGroup"`
	Token               string `json:"token"` // probably not?
	Port                int    `json:"port"`
	DDPort              int    `json:"ddport"`
	recv                chan bool
	state               State
	session             *discordgo.Session
}

func makeBot(f string) (*Bot, error) {
	b := new(Bot)
	b.recv = make(chan bool)

	c, err := os.Open("config.json")
	if err != nil {
		return nil, err
	}
	defer c.Close()

	i, err := io.ReadAll(c)
	if err != nil {
		return nil, err
	}

	err = json.Unmarshal(i, b)
	if err != nil {
		return nil, err
	}

	if b.BotName == "" {
		return nil, fmt.Errorf("bot name cannot be empty")
	}

	return b, nil
}

func (b *Bot) startBot() error {
	var err error

	// in case we're reading from a keyfile and the file ends with a newline
	b.Token = strings.TrimRight(b.Token, "\n")

	b.session, err = discordgo.New("Bot " + b.Token)
	if err != nil {
		return err
	}

	// startup the discord bot
	err = b.session.Open()
	if err != nil {
		return err
	}
	b.session.AddHandler(b.handleMessage)
	b.session.Identify.Intents = discordgo.IntentsGuildMessages | discordgo.IntentsDirectMessages
	log.Println("discord session now open")

	// startup the rpc listener

	rpc.Register(b)
	err = listenRPC(b.Port)
	if err != nil {
		return err
	}
	log.Println("rpc listener now listening")

	sc := make(chan os.Signal, 1)
	signal.Notify(sc, syscall.SIGINT, syscall.SIGTERM, os.Interrupt, os.Kill)
	<-sc

	// close the session, write the current config
	b.session.Close()
	b.state = State{}
	f, _ := os.Create("config.json")
	j, _ := json.MarshalIndent(b, "", "\t")
	f.Write(j)
	f.Close()

	return nil
}

func listenRPC(port int) error {
	l, err := net.Listen("tcp", fmt.Sprintf(":%d", port))
	if err != nil {
		return err
	}

	go func() {
		for {
			c, err := l.Accept()
			if err != nil {
				log.Println(err)
			}

			go jsonrpc.ServeConn(c)
		}
	}()

	return nil
}

/*
func (b *Bot) getState() error {
	log.Println("getting state")
	resp, err := http.Get("http://localhost:3621/api/status")
	if err != nil { return err }
	if resp.StatusCode != 200 {
		return fmt.Errorf("getting server response did not return OK")
	}

	j, err := io.ReadAll(resp.Body)
	if err != nil { return err }
	err = json.Unmarshal(j, &b.state)
	if err != nil { return err }

	return nil
}
*/

func (b *Bot) getState() error {
	log.Println("getting state")

	var r string
	var err error
	if r, err = byondtopic.SendTopic(fmt.Sprintf(":%d", b.DDPort), "update_bot"); err != nil {
		log.Println(r)
		return err
	}

	s := <-b.recv
	if !s {
		return fmt.Errorf("an error occurred while retrieving the state")
	}

	return nil
}

// SetBYONDPort is a function that allows the server
// to dynamically change the bot's listening port.
func (b *Bot) SetBYONDPort(p int, r *bool) error {
	log.Printf("setting BYOND listening port to %d\n", p)
	b.DDPort = p

	return nil
}

// StateRecieve is a function called by the server
// to indicate that it wants the bot to recieve a state,
// that does not contain anything important.
func (b *Bot) StateRecieve(j string, r *bool) error {
	log.Println("state recieved")
	log.Println(string(j))
	err := json.Unmarshal([]byte(j), &b.state)
	if err != nil {
		b.recv <- false
		return err
	}

	b.recv <- true
	return nil
}

// StateChange is the function called by the server
// to indicate that an important state has changed
// on the server. It will automatically notify
// anybody in the defined NotificationGroup,
// while also updating the current bot's state.
func (b *Bot) StateChange(j string, r *bool) error {
	log.Println("state recieved")
	log.Println(string(j))
	err := json.Unmarshal([]byte(j), &b.state)
	if err != nil {
		return err
	}

	if s := getRoundStatus(b.state.Status); s != "" {
		b.session.ChannelMessageSendComplex(
			b.NotificationChannel,
			&discordgo.MessageSend{
				Content: strings.Join([]string{
					"<@&" + b.NotificationGroup + ">",
					s,
				}, " "),
				AllowedMentions: &discordgo.MessageAllowedMentions{
					Roles: []string{b.NotificationGroup},
				},
			})
	}
	log.Println(b.state)

	return nil
}

type botCommand struct {
	name string // command name
	help string // help message
	priv bool   // display it in !help or not
	// bot, the args, and the raw message sent
	cmd func(*Bot, []string, *discordgo.MessageCreate) error
}

var botCommands map[string]*botCommand
var botCommandList []string

func addCommand(c *botCommand) {
	if botCommands == nil {
		botCommands = make(map[string]*botCommand)
	}

	botCommands[c.name] = c

	if !c.priv {
		botCommandList = append(botCommandList, c.name)
	}
}

func (b *Bot) handleMessage(s *discordgo.Session, m *discordgo.MessageCreate) {
	// don't listen to messages made outside of guilds it's in
	if m.Author.ID == s.State.User.ID || m.GuildID == "" {
		return
	}

	if len(m.Content) >= len(b.BotName)+1 {
		if m.Content[0:len(b.BotName)+1] == b.BotName+`!` {
			c := strings.Split(m.Content[len(b.BotName)+1:], " ")
			if c[0] == "help" {
				if len(c) == 1 {
					s.ChannelMessageSend(m.ChannelID, fmt.Sprintf(
						"Available commands (add the command name for more details): %s",
						strings.Join(botCommandList, ", "),
					))
				} else if f, e := botCommands[c[1]]; e && !f.priv {
					s.ChannelMessageSend(m.ChannelID, fmt.Sprintf(
						"Command `%s`: %s",
						c[1], f.help,
					))
				} else {
					s.ChannelMessageSend(m.ChannelID, fmt.Sprintf(
						"Command not found.",
					))
				}
			} else if f, e := botCommands[c[0]]; e {
				err := f.cmd(b, c, m)
				if err != nil {
					log.Println(err)
					s.ChannelMessageSend(m.ChannelID, fmt.Sprintf("An error occurred while running command `%s`: %s", c[0], err))
				}
			} else {
				s.ChannelMessageSend(m.ChannelID, "Command not found.")
			}
		}
	}
}
