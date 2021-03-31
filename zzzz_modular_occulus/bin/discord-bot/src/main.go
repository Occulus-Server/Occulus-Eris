package main

import (
	"io"
	"log"
	"os"
	"strconv"
)

var rpcPort int
var discordKey string
var discordKeyFile string

func init() {
	var err error

	rpcPort, err = strconv.Atoi(os.Getenv("BYOND_REST_RPC_PORT"))
	if err != nil { log.Fatal("you need to specify a RPC port using BYOND_REST_RPC_PORT, or you put something invalid here") }
	discordKey = os.Getenv("DISCORD_KEY")
	discordKeyFile = os.Getenv("DISCORD_KEY_FILE")
}

func main() {
	var err error
	if discordKey == "" && discordKeyFile == "" {
		log.Fatal("you need to either specify a discord secret key, or key file")
	}

	if discordKey != "" {
		err = startBot(discordKey, rpcPort)
	} else if discordKeyFile != "" {
		f, err := os.Open(discordKeyFile)
		if err != nil { log.Fatal(err) }
		k, err := io.ReadAll(f)
		if err != nil { log.Fatal(err) }
		err = startBot(string(k), rpcPort)
	}

	log.Println(err)
}
