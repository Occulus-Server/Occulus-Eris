// Occulus Discord Bot server-side code
//
// This used to be a whole thing that let an internal
// server expose an API over HTTP, but that probably was
// too much to aim for, so now it's just code to communicate
// to the discord bot.
//
// Hit me up if you want the web API setup again.
// - Flipp Syder (vulppine)

#define CONN_LIBRARY (world.system_type == MS_WINDOWS ? "zzzz_modular_occulus/bin/byond-socks.dll" : "zzzz_modular_occulus/bin/byond-socks.so")
#define CONN_SUCCESS "SUCCESS"
#define CONN_ERROR "ERROR"

#define STATUS_SETUP 0
#define STATUS_LOBBY 1
#define STATUS_INGAME 2
#define STATUS_TRANSFER 3
#define STATUS_RESTART 4

var/datum/discord_bot/discord_bot = new

/datum/discord_bot
	var/port = 33621

/proc/get_state()
	var/t
	var/s
	var/l
	var/j

	switch (Master.current_runlevel) // got lazy trying to convert from base 10 to 2
		if(0)
			s = STATUS_SETUP
		if(1 || 2)
			s = STATUS_LOBBY
		if(3)
			if (evacuation_controller.state != 0 && !evacuation_controller.emergency_evacuation)
				s = STATUS_TRANSFER
			else
				s = STATUS_INGAME
		if(4)
			s = STATUS_RESTART


	if(GLOB.storyteller)
		t = GLOB.storyteller.name

	l = list(list(
		"status" = s,
		"storyteller" = t,
		"duration" = roundduration2text(),
		"roaches" = s != STATUS_LOBBY ? roach_counter : 0,
	))

	j = json_encode(l)
	qdel(l)

	return j

/proc/create_json_rpc_call(method, json)
	var/l = list("method" = method, "params" = json, id = rand(1, 1000))
	var/c = json_encode(l)
	qdel(l)

	return c

/// Bot communication ///

/datum/discord_bot/proc/send(info)
	var/C = call(CONN_LIBRARY, "SendAndClose")("127.0.0.1", "[port]", info)

	if (C == CONN_SUCCESS)
		log_debug("Successfully sent to the discord bot.")
	else if (C == CONN_ERROR)
		log_debug("Something could not be sent to the discord bot.")

	return C

/datum/discord_bot/proc/update_bot()
	// var/r = json_encode(list("method" = "Bot.StateChange", "params" = list(json_encode(get_state())), id = rand(1, 1000)))
	var/r = create_json_rpc_call("Bot.StateChange", get_state())
	if (send(r) != CONN_SUCCESS)
		log_debug("An error occurred while attempting to update the bot.")

// topic calls don't send valid JSON
/datum/discord_bot/proc/send_state()
	// var/r = json_encode(list("method" = "Bot.StateRecieve", "params" = list(json_encode(get_state())), id = rand(1, 1000)))
	var/r = create_json_rpc_call("Bot.StateRecieve", get_state())
	return send(r)

/// Topic ///

/datum/world_topic/update_bot
	keyword = "update_bot"
	log = FALSE

/datum/world_topic/update_bot/Run(list/input)
	return discord_bot.send_state()

/// Hooks ///

/hook/startup/proc/update_status()
	spawn(0)
		discord_bot.update_bot()

/hook/roundstart/proc/update_status()
	spawn(0)
		discord_bot.update_bot()

/hook/roundend/proc/update_status()
	spawn(0)
		discord_bot.update_bot()
