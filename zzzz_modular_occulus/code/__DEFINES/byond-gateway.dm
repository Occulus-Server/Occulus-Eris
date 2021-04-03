// byond-gateway
//
// Allows you to transmit a state object in JSON for clients to read.
// Requires byond-extools, if you don't want to lock up the server
// every single time you transmit state (this is dependent on a lot
// of things, but it might actually be transparent considering how
// it's potentially a small data transfer)
//
// This was originally called "byond-rest", but limiting it to being
// only a RESTful API seemed too constrained. Besides, it wasn't really
// a RESTful API anyways (the actual server stores internal state, and
// does more than just state transfers)

#define GATEWAY_UP 1

// both of these are hardcoded specifically to Occulus
#define GATEWAY_EXEC (world.system_type == MS_WINDOWS ? "zzzz_modular_occulus/bin/byond-gateway.exe" : "zzzz_modular_occulus/bin/byond-gateway")
#define CONN_LIBRARY (world.system_type == MS_WINDOWS ? "zzzz_modular_occulus/bin/byond-socks.dll" : "zzzz_modular_occulus/bin/byond-socks.so")
#define CONN_SUCCESS "SUCCESS"
#define CONN_ERROR "ERROR"

#define STATUS_LOBBY 1
#define STATUS_INGAME 2
#define STATUS_TRANSFER 3
#define STATUS_RESTART 4

var/datum/gateway_server/gateway_server = new

/datum/gateway_server
	var/up = FALSE
	var/port = 0
	var/bot_port = 33621 // TODO: Add functionality to change this.
	var/bot_call = "Bot.StatusChange" // TODO: Add functionality to change this.
	var/state = list()

/*
/datum/gateway_server/New()
	start_gateway()
*/

/datum/gateway_server/proc/start()
	if (!up)
		var/retry_attempts = 0

		// this is broken on linux, sad
		if (world.system_type != UNIX)
			// so we don't lock up the server
			tffi_initialize() 

		spawn()
			while (1)
				port = rand(30000, 40000)
				while (port == world.port)
					port = rand(30000, 40000)

				up = TRUE
					log_debug("Starting gateway server at [port].")

				var/c = shell("[GATEWAY_EXEC] [port] [world.port] [bot_port] [bot_call]")

				up = FALSE
				if (c != 0 || c == null)
					if (retry_attempts < 5)
						log_debug("Gateway server exited with non-zero code, attempting to restart.")

						retry_attempts++
						// sleep 5 seconds, because otherwise this will be very painful if it's unrecoverable
						// i believe this is the better way to do it rather than spawn(), no?
						sleep(5 SECONDS)
					else
						log_debug("Gateway server refused to restart, breaking.")
						break

		// state_update_loop()
	else
		return GATEWAY_UP

/datum/gateway_server/proc/get_state()
	var/t

	if(GLOB.storyteller)
		t = GLOB.storyteller.name

	state = list(
		"status" = get_round_status(),
		"storyteller" = t,
		"duration" = roundduration2text(),
		"roaches" = get_round_status() != STATUS_LOBBY ? roach_counter : 0,
	)

/* totally made that world.Topic() call, by the way
// here's an advantage of the world/Topic() call:
// you don't have to do *this* lmao
/datum/rest_server/proc/state_update_loop()
	spawn()
		while (1)
			  sleep(60 SECONDS)
			  if (up)
			  	 if (send_state() == CONN_ERROR)
			  	 	log_debug("An error occurred updating the server's state.")
*/

/datum/gateway_server/proc/get_round_status()
	switch (Master.current_runlevel) // got lazy trying to convert from base 10 to 2
		if(1 || 2)
			return STATUS_LOBBY
		if(3)
			if (evacuation_controller.state != 0 && !evacuation_controller.emergency_evacuation)
				return STATUS_TRANSFER
			else
				return STATUS_INGAME
		if(4)
			return STATUS_RESTART

/datum/gateway_server/proc/send(D)
	if (up)
		var/C

		if (world.system_type != UNIX)
			C = call_wait("byond-socks.dll", "SendAndClose", "127.0.0.1", "[port]", json_encode(D))
		else
			// welp, let's hope the library doesn't lock up
			C = call("byond-socks.so", "SendAndClose")("127.0.0.1", "[port]", json_encode(D))

		if (C == CONN_SUCCESS)
			log_debug("State successfully transferred to gateway server.")
		else if (C == CONN_ERROR)
			log_debug("Could not transfer state to gateway server.")

		return C
	else
		log_debug("Attempted state transfer to inactive gateway server.")
		return CONN_ERROR

/datum/gateway_server/proc/send_state()
	get_state()
	return send(state)

/// Admin verbs for starting/restarting instance ///

ADMIN_VERB_ADD(/client/proc/Start_Gateway_Server, R_ADMIN|R_DEBUG, FALSE)
/client/proc/Start_Gateway_Server()
	if (gateway_server.start() == GATEWAY_UP)
		to_chat(src, "The gateway server is already up.")

ADMIN_VERB_ADD(/client/proc/Update_Gateway_Server, R_ADMIN|R_DEBUG, FALSE)
/client/proc/Update_Gateway_Server()
	if (GATEWAY_UP)
		if (gateway_server.send_state() == CONN_SUCCESS)
			to_chat(src, "State successfully transferred.")
		else
			to_chat(src, "State could not be transferred.")

/// Hook, Topic ///

/datum/world_topic/update_gateway_state
	keyword = "update_state"
	log = FALSE

/datum/world_topic/update_gateway_state/Run(list/input)
	var/retry = 0
	while (gateway_server.send_state() != CONN_SUCCESS && retry < 5) // hardcoded 5 retry attempts
		log_debug("Retrying state transfer to gateway.")
		sleep(5 SECONDS)

	if (retry > 5)
		return CONN_ERROR

	return CONN_SUCCESS

/hook/startup/proc/start_gateway_server()
	gateway_server.start()
	return 1
