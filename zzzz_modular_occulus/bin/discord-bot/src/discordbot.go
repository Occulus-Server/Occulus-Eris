package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net"
	"net/http"
	"net/rpc"
	"net/rpc/jsonrpc"
	"os"
	"os/signal"
	"syscall"
	"strings"

	"github.com/bwmarrin/discordgo"
)

type Bot struct {
	BotName               string `json:"botName"`
	NotificationChannel   string `json:"notificationChannel"`
	NotificationGroup     string `json:"notificationGroup"`
	State                 *State
	session               *discordgo.Session
}

func startBot(t string, r int) error {
	var err error

	b := new(Bot)
	f, err := os.Open("config.json")
	if err != nil { return err }
	j, err := io.ReadAll(f)
	if err != nil { return err }

	err = json.Unmarshal(j, b)
	if err != nil { return err }

	if b.BotName == "" {
		return fmt.Errorf("bot name cannot be empty")
	}

	f.Close()

	b.session, err = discordgo.New("Bot " + t)
	if err != nil { return err }

	// startup the discord bot
	err = b.session.Open()
	if err != nil { return err }
	b.session.AddHandler(b.handleMessage)
	b.session.Identify.Intents = discordgo.IntentsGuildMessages | discordgo.IntentsDirectMessages
	log.Println("discord session now open")

	// startup the rpc listener

	rpc.Register(b)
	err = listenRPC(r)
	if err != nil { return err }
	log.Println("rpc listener now listening")

	sc := make(chan os.Signal, 1)
	signal.Notify(sc, syscall.SIGINT, syscall.SIGTERM, os.Interrupt, os.Kill)
	<-sc

	// close the session, write the current config
	b.session.Close()
	b.State = nil
	f, _ = os.Create("config.json")
	j, _ = json.MarshalIndent(b, "", "\t")
	f.Write(j)
	f.Close()

	return nil
}

func listenRPC(port int) error {
	l, err := net.Listen("tcp", fmt.Sprintf(":%d", port))
	if err != nil { return err }

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

func (b *Bot) getState() error {
	log.Println("getting state")
	resp, err := http.Get("http://localhost:3621/api/status")
	if err != nil { return err }
	if resp.StatusCode != 200 {
		fmt.Errorf("getting server response did not return OK")
	}

	j, err := io.ReadAll(resp.Body)
	if err != nil { return err }
	json.Unmarshal(j, b.State)

	return nil
}

// StatusChange is the function called by BYOND-REST
// to indicate that an important status has changed
// on the server. It will automatically notify
// anybody in the defined NotificationGroup,
// while also updating the current bot's state.
func (b *Bot) StatusChange(j string, r *bool) error {
	log.Println("status changed")
	log.Println(string(j))
	json.Unmarshal([]byte(j), b.State)
	if s := getRoundStatus(b.State.Status) ; s != "" {
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
	log.Println(b.State)

	return nil
}

type botCommand struct {
	name string // command name
	priv bool // display it in !help or not
	off bool // can this be run if the server is offline?
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
	if m.Author.ID == s.State.User.ID {
		return
	}

	if len(m.Content) >= len(b.BotName) + 1 {
		if m.Content[0:len(b.BotName) + 1] == b.BotName + `!` {
			c := strings.Split(m.Content[len(b.BotName) + 1:], " ")
			if c[0] == "help" {
				s.ChannelMessageSend(m.ChannelID, fmt.Sprintf(
					"Available commands: %s",
					strings.Join(botCommandList, ", "),
				))
			} else if f, e := botCommands[c[0]] ; e {
				err := b.getState()
				if err != nil {
					log.Println(err)
					s.ChannelMessageSend(m.ChannelID, "An error occurred while getting the server state. Maybe it isn't up?")
				} else {
					err = f.cmd(b, c, m)
					if err != nil {
						log.Println(err)
						s.ChannelMessageSend(m.ChannelID, "An error occurred while running the command.")
					}
				}
			} else {
				s.ChannelMessageSend(m.ChannelID, "Command not found.")
			}
		}
	}
}

/*
func (b *Bot) handleMessage(s *discordgo.Session, m *discordgo.MessageCreate) {
	if m.Author.ID == s.State.User.ID {
		return
	}

	if len(m.Content) > len(b.BotName) + 1 {
		if m.Content[0:len(b.BotName) + 1] == b.BotName + "!" {
			var r string
			e := strings.Split(m.Content, " ")

			switch e[0][len(b.BotName) + 1:] {
			case "status":

			case "players":
				err := b.getState()
				if err != nil {
					log.Println(err)
					r = "An error occurred while getting the current server state."
				} else {
					r = fmt.Sprintf("Current players online: %d", b.State.Players)
				}

				s.ChannelMessageSend(m.ChannelID, r)
			case "admins":
				err := b.getState()
				if err != nil {
					log.Println(err)
					r = "An error occurred while getting the current server state."
				} else {
					r = fmt.Sprintf("Current admins online: %d", b.State.Admins)
				}

				s.ChannelMessageSend(m.ChannelID, r)
			case "crew":
				err := b.getState()
				if err != nil {
					log.Println(err)
					r = "An error occurred while getting the current server state."
				} else {
					r = "```\n" + writeCrewManifest(b.State.CrewManifest) + "\n```"
				}

				u, err := s.UserChannelCreate(m.Author.ID)
				if err != nil { log.Println("An error occurred when trying to DM a user.") }
				s.ChannelMessageSend(u.ID, r)
			case "setnotif":
				var r string
				if o, err := s.Guild(m.GuildID); err == nil {
					if m.Author.ID == o.OwnerID {
						b.NotificationChannel = m.ChannelID
						r = "Set the notifications channel to the current channel."
					} else {
						log.Println("Owner ID mismatch - ", m.ID, o.OwnerID)
						return
					}
				} else {
					log.Println(err)
					r = "An error occurred while attempting to change the notification channel."
				}

				s.ChannelMessageSend(m.ChannelID, r)
			case "setnotifgroup":
				var r string
				if g, err := s.Guild(m.GuildID); err == nil {
					if m.Author.ID == g.OwnerID {
						if len(m.MentionRoles) > 0 {
							b.NotificationGroup = m.MentionRoles[0]
							r = "Set the notifications channel to the first mentioned group."
						} else {
							r = "You must mention a group in your message to set the notification group."
						}
					} else {
						log.Println("Owner ID mismatch - ", m.ID, g.OwnerID)
						return
					}
				} else {
					log.Println(err)
					r = "An error occurred while attempting to change the notification channel."
				}

				s.ChannelMessageSend(m.ChannelID, r)
			}
		}
	}
}
*/
