package main

import (
	"errors"
	"fmt"
	"io"
	"log"
	"math/rand"
	"os"
	"strings"

	// "text/tabwriter" Required by the crew manifest constructor, do not remove yet
	// "strconv"

	"github.com/bwmarrin/discordgo"
)

// RoundStatus represents the current status
// of the round.
type RoundStatus int

const (
	Setup RoundStatus = iota
	Lobby
	InRound
	CrewTransfer
	Restarting
)

/*
func (s *RoundStatus) UnmarshallJSON(b []byte) error {
	i, err := strconv.Atoi(string(b))
	if err != nil {
		return err
	}

	v := RoundStatus(i)
	s = &v

	return nil
}
*/

/* Disabled until a consensus can be reached about player visiblity.
// thanks, /proc/nano_crew_manifest()

// CrewManifest is a representation of
// a CrewManifest, as returned by
// /proc/nano_crew_manifest()
type CrewManifest map[string][]CrewManifestEntry

// CrewManifestEntry represents a crewmember
// on the station.
type CrewManifestEntry struct {
	Name string `json:"name"`
	Rank string `json:"rank"`
	Status string `json:"status"`
}
*/

// State represents the current state of the server.
// It is updated whenever the discord bot either
// is polled, or recieves Bot.StatusUpdate() from
// the associated BYOND-REST server.
//
// I have selectively chosen not to include some
// round information, as this was originally meant
// for a private server with a low population
// average. Perhaps somebody can add in toggles
// so that more information about the current
// server state can be grabbed?
type State struct {
	// Status represents the current state of the game round.
	// There are four possible states: Lobby, InRound,
	// CrewTransfer, and Restarting. This allows enough information
	// so that a requesting player knows that the round is either
	// starting, is in crew transfer, or is restarting.
	Status RoundStatus `json:"status"`

	// Players      int `json:"players"` requested to be disabled by RadiantFlash
	// Admins       int `json:"admins"`  perhaps this, too?

	// CrewManifest represents the current amount of crewmembers awake
	// on the ship. It doesn't *directly* state how many people
	// are online, as some players can either be in cryogenics,
	// or not on the crew manifest altogether.
	//
	// Disabled until a consensus is made about player visibility.
	// CrewManifest CrewManifest `json:"crewManifest"`

	// Storyteller represents the current storyteller used by the round.
	Storyteller string `json:"storyteller"`

	// Duration represents the current round duration.
	// It is taken from time2text(get_game_time(), "hh:mm").
	Duration string `json:"duration"`

	// roach count, thanks mr. fox for the idea
	Roaches int `json:"roaches"`
}

// TODO: learn Go code generation
func getRoundStatus(s RoundStatus) string {
	var r string

	switch s {
	case Setup, Lobby:
		r = "The server is about to start a new round."
	case InRound:
		r = "The server is currently in a round."
	case CrewTransfer:
		r = "The ship is undergoing a crew transfer."
	case Restarting:
		r = "The server is currently restarting."
	}

	return r
}

/* Disabled until a consensus can be reached about remotely getting the current crew manifest.
func getCrewManifestDepartment(s string) string {
	var h string

	switch s {
	case "heads":
		h = "Command Staff"
	case "sci":
		h = "NanoTrasen Research"
	case "sec":
		h = "Cobalt Aegis Security"
	case "eng":
		h = "Einstein Engineering Solutions"
	case "med":
		h = "NanoTrasen Medical"
	case "sup":
		h = "Free Trade Union"
	case "chr":
		h = "Children of Mekhane"
	case "bot":
		h = "Silicon"
	case "civ":
		h = "Civilian"
	}

	return h
}

// maps in Go are not safe, and actually are
// accessed in a non-linear order when ranged over - this
// enforces the order that the map should be
// accessed in
var crewManifestDepartmentOrder = []string{
	"heads",
	"sci",
	"sec",
	"eng",
	"med",
	"sup",
	"chr",
	"bot",
	"civ",
}

func writeCrewManifest(m CrewManifest) string {
	s := new(strings.Builder)
	t := tabwriter.NewWriter(s, 0, 0, 1, ' ', 0)
	for _, v := range crewManifestDepartmentOrder {
		if len(m[v]) > 0 {
			d := m[v]

			h := getCrewManifestDepartment(v)
			t.Write([]byte(h + "\n"))
			for _, v := range d {
				log.Println(fmt.Sprintf("%s\t%s\t%s\t\n", v.Name, v.Rank, v.Status))
				fmt.Fprintf(t, "%s\t%s\t%s\t\n", v.Name, v.Rank, v.Status)
			}
		}
	}

	t.Flush()
	return s.String()
}
*/

// Spola outputs a portmanteau of various Space Station 13 items.
// As per the terms of the NEV Northern Light command board,
// most, if not all of these terms, are banned from normal use.
func Spola() string {
	l := []string{
		"spola",
		"churger",
		"soupersalad",
		"churgenspola",
		"burgenspola",
		"tacoritto",
		"pizalad",
		"spup",
		"dibb",
		"lotgun",
		"lactiotgun",
		"spountaind",
		"spleaner",
	}

	return l[rand.Intn(len(l)-1)]
}

func sanity_message() string {
	f, err := os.Open("sanity_messages")
	if err != nil {
		return "You try to peek into your mind, but it returns incomprehensible imagery. (An error occurred while trying to get a sanity message!)"
	}

	b, err := io.ReadAll(f)
	if err != nil {
		return "You try to peek into your mind, but it returns incomprehensible imagery. (An error occurred while trying to get a sanity message!)"
	}

	m := strings.Split(string(b), "\n")
	return m[rand.Intn(len(m)-1)]
}

var (
	ErrServerOffline = errors.New("server offline or state unobtainable")
	ErrServerLog     = errors.New("see server log for details")
)

func init() {
	addCommand(&botCommand{
		name: "status",
		help: "Returns the current status of the server, if it's up.",
		cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
			var s string
			err := b.getState()
			if err != nil {
				log.Println(err)
				// b.session.ChannelMessageSend(m.ChannelID, "An error occurred while getting the server state. Maybe it isn't up?")
				return ErrServerOffline
			}
			log.Println(b.state)
			if b.state.Storyteller == "" {
				b.state.Storyteller = "unset"
			}

			if b.state.Status == Setup || b.state.Status == Lobby {
				s = fmt.Sprintf("%s", getRoundStatus(b.state.Status))
			} else {
				s = fmt.Sprintf("%s\n%s\n%s\n%s",
					getRoundStatus(b.state.Status),
					fmt.Sprintf("The round duration is currently %s.", b.state.Duration),
					fmt.Sprintf("The storyteller is currently %s.", b.state.Storyteller),
					fmt.Sprintf("There have been %d roaches active onboard the ship.", b.state.Roaches),
				)
			}

			b.session.ChannelMessageSend(m.ChannelID, s)

			return nil
		},
	})
	addCommand(&botCommand{
		name: "time",
		help: "Returns the current round duration.",
		cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
			err := b.getState()
			if err != nil {
				log.Println(err)
				// b.session.ChannelMessageSend(m.ChannelID, "An error occurred while getting the server state. Maybe it isn't up?")
				return ErrServerOffline
			}

			b.session.ChannelMessageSend(
				m.ChannelID,
				fmt.Sprintf("The round duration is currently %s.", b.state.Duration),
			)

			return nil
		},
	})
	addCommand(&botCommand{
		name: "roaches",
		help: "Returns the number of roaches on the ship.",
		cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
			err := b.getState()
			if err != nil {
				log.Println(err)
				// b.session.ChannelMessageSend(m.ChannelID, "An error occurred while getting the server state. Maybe it isn't up?")
				return ErrServerOffline
			}

			b.session.ChannelMessageSend(
				m.ChannelID,
				fmt.Sprintf("There have been %d roaches active onboard the ship.", b.state.Roaches),
			)

			return nil
		},
	})
	addCommand(&botCommand{
		name: "setnotif",
		priv: true,
		cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
			var r string
			if o, err := b.session.Guild(m.GuildID); err == nil {
				if m.Author.ID == o.OwnerID {
					b.NotificationChannel = m.ChannelID
					r = "Set the notifications channel to the current channel."
				} else {
					log.Println("Owner ID mismatch - ", m.ID, o.OwnerID)
					return nil // silently do this
				}
			} else {
				log.Println(err)
				return fmt.Errorf("setnotif: %s", ErrServerLog)
			}

			b.session.ChannelMessageSend(m.ChannelID, r)

			return nil
		},
	})
	addCommand(&botCommand{
		name: "setnotifgroup",
		priv: true,
		cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
			var r string
			if g, err := b.session.Guild(m.GuildID); err == nil {
				if m.Author.ID == g.OwnerID {
					if len(m.MentionRoles) > 0 {
						b.NotificationGroup = m.MentionRoles[0]
						r = "Set the notifications channel to the first mentioned group."
					} else {
						r = "You must mention a group in your message to set the notification group."
					}
				} else {
					log.Println("Owner ID mismatch - ", m.ID, g.OwnerID)
					return nil
				}
			} else {
				log.Println(err)
				return fmt.Errorf("setnotifgroup: %s", ErrServerLog)
			}

			b.session.ChannelMessageSend(m.ChannelID, r)

			return nil
		},
	})
	addCommand(&botCommand{
		name: "spola",
		help: "Words banned by the Northern Light command board. Do you dare?",
		cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
			b.session.ChannelMessageSend(m.ChannelID, Spola())

			return nil
		},
	})
	addCommand(&botCommand{
		name: "sanity",
		help: "Peek into the void. Hope it does not stare back.",
		cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
			b.session.ChannelMessageSend(m.ChannelID, sanity_message())

			return nil
		},
	})

}
