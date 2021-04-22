package main

import (
	"io"
	"log"
	"os"
	"strconv"
)

var discordKey string
var discordKeyFile string

func init() {
	discordKey = os.Getenv("DISCORD_KEY")
	discordKeyFile = os.Getenv("DISCORD_KEY_FILE")
}

func main() {
	b, err := makeBot("config.json")
	if err != nil {
		log.Fatal(err)
	}

	rpcPort := os.Getenv("DISCORD_BOT_PORT")
	if rpcPort != "" && b.Port == 0 {
		b.Port, err = strconv.Atoi(rpcPort)
		if err != nil {
			log.Fatal("invalid port in DISCORD_BOT_PORT")
		}
	}

	if err != nil && b.Port == 0 {
		log.Fatal("specify a port using DISCORD_BOT_PORT or put a port in the config.json file")
	}

	if discordKey == "" && discordKeyFile == "" && b.Token == "" {
		log.Fatal("you need to either specify a discord secret key, or key file")
	}

	if discordKey != "" {
		b.Token = discordKey
		b.startBot()
	} else if discordKeyFile != "" {
		f, err := os.Open(discordKeyFile)
		if err != nil {
			log.Fatal(err)
		}
		k, err := io.ReadAll(f)
		if err != nil {
			log.Fatal(err)
		}
		b.Token = string(k)
		b.startBot()
	} else {
		// implies that a token was already defined
		b.startBot()
	}

	log.Println(err)
}
