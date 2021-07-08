Occulus Discord Bot
===================

Compiling
---------

This requires the latest version of [Go](https://golang.org)

Run go build -o discord-bot.exe in the src/ folder.

Using
-----

Open discord-bot.exe (preferably in a command line).
**config.json must be in the same folder as the bot executable, as well as**
**spola_words and sanity_messages.**

Your config.json file should have:

```
"token": [ DISCORD TOKEN ],
"port": [ INTERNAL BOT PORT ],
"ddport": [ BYOND SERVER PORT ],
```

Adding features
---------------

Look in `src/occulus-ss13.go` if you want to add more features.
