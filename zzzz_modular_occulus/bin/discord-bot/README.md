Occulus Discord Bot
===================

Compiling
---------

This requires the latest version of [Go](https://golang.org)

Run go build -o discord-bot.exe in the src/ folder.

Using
-----

Open discord-bot.exe (preferably in a command line). **config.json must be in the same folder as the bot executable.**
It is preferable to do this before opening Dream Daemon
with byond-rest.exe implemented, but otherwise byond-rest.exe
will attempt to connect to this server's RPC port otherwise.

Set these enviromental variables:

- `BYOND_GATEWAY_RPC_PORT` - The intended port you want to use for remote calls. The default is 33621.
- `DISCORD_KEY` - Your bot user's discord key.

  OR

  `DISCORD_KEY_FILE` - A file containing your bot user's discord key.

Adding features
---------------

Look in `src/occulus-ss13.go` if you want to add more features.
