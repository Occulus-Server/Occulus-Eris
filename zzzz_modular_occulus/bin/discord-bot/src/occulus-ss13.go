package main

import (
	"fmt"
	// "math" used by Spola()
	"log"
	// "strings" Required by the crew manifest constructor, do not remove yet
	// "text/tabwriter" Required by the crew manifest constructor, do not remove yet
	"strconv"

	"github.com/bwmarrin/discordgo"
)

// RoundStatus represents the current status
// of the round.
type RoundStatus int

const (
	// set this to start at 1, so that the bot doesn't
	// send a message when the server is starting,
	// *and* it's reached lobby state

	Lobby RoundStatus = iota + 1
	InRound
	CrewTransfer
	Restarting
)

func (s *RoundStatus) UnmarshallJSON(b []byte) error {
	i, err := strconv.Atoi(string(b))
	if err != nil {
		return err
	}

	v := RoundStatus(i)
	s = &v

	return nil
}

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
	case Lobby:
		r = "The server is currently in the lobby."
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

/*

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

	return l[math.Rand(0, len(l)-1)]
}
*/

func init() {
	addCommand(&botCommand{
		name: "status",
		cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
			b.session.ChannelMessageSend(
				m.ChannelID,
				fmt.Sprintf("%s\n%s\n%s\n%s",
					getRoundStatus(b.State.Status),
					fmt.Sprintf("The round duration is currently %s.", b.State.Duration),
					fmt.Sprintf("The storyteller is currently %s.", b.State.Storyteller),
					fmt.Sprintf("There have been %d roaches active onboard the ship.", b.State.Roaches),
				),
			)

			return nil
		},
	})
	addCommand(&botCommand{
		name: "time",
		cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
			b.session.ChannelMessageSend(
				m.ChannelID,
				fmt.Sprintf("The round duration is currently %s.", b.State.Duration),
			)

			return nil
		},
	})
	addCommand(&botCommand{
		name: "roaches",
		cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
			b.session.ChannelMessageSend(
				m.ChannelID,
				fmt.Sprintf("There have been %d roaches active onboard the ship.", b.State.Roaches),
			)

			return nil
		},
	})
	addCommand(&botCommand{
		name: "setnotif",
		priv: true,
		off: true,
		cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
			var r string
			if o, err := b.session.Guild(m.GuildID); err == nil {
				if m.Author.ID == o.OwnerID {
					b.NotificationChannel = m.ChannelID
					r = "Set the notifications channel to the current channel."
				} else {
					log.Println("Owner ID mismatch - ", m.ID, o.OwnerID)
					return nil
				}
			} else {
				log.Println(err)
				r = "An error occurred while attempting to change the notification channel."
			}

			b.session.ChannelMessageSend(m.ChannelID, r)

			return nil
		},
	})
	addCommand(&botCommand{
		name: "setnotifgroup",
		priv: true,
		off: true,
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
				r = "An error occurred while attempting to change the notification channel."
			}

			b.session.ChannelMessageSend(m.ChannelID, r)

			return nil
		},
	})
	/*
		addCommand(&botCommand{
			name: "spola",
			cmd: func(b *Bot, c []string, m *discordgo.MessageCreate) error {
				b.Session.ChannelMessageSend(m.ChannelID, Spola())

				return nil
			}
		})
	*/
}
