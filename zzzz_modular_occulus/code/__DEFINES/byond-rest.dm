// byond-rest
//
// Allows you to transmit a state object in JSON for clients to read.
// Requires byond-extools, if you don't want to lock up the server
// every single time you transmit state (this is dependent on a lot
// of things, but it might actually be transparent considering how
// it's potentially a small data transfer)

#define REST_SERVER_UP 1
#define REST_EXEC (world.system_type == MS_WINDOWS ? "./byond-rest.exe" : "./byond-rest")
#define CONN_LIBRARY (world.system_type == MS_WINDOWS ? "byond-socks.dll" : "byond-socks.so")
#define CONN_SUCCESS "SUCCESS"
#define CONN_ERROR "ERROR"

#define STATUS_LOBBY 1
#define STATUS_INGAME 2
#define STATUS_TRANSFER 3
#define STATUS_RESTART 4

var/datum/rest_server/rest_server = new

/datum/rest_server
	var/up = FALSE
	var/rest_server_port = 0
	var/rest_server_bot_port = 33621 // TODO: Add functionality to change this.
	var/rest_server_bot_call = "Bot.StatusChange" // TODO: Add functionality to change this.
	var/state = list()

/*
/datum/rest_server/New()
	start_rest_server()
*/

/datum/rest_server/proc/start()
	if (!up)
		var/retry_attempts = 0

		// this is broken on linux, sad
		if (world.system_type != UNIX)
			// so we don't lock up the server
			tffi_initialize() 

		spawn()
			while (1)
				rest_server_port = rand(30000, 40000)
				while (rest_server_port == world.port)
					rest_server_port = rand(30000, 40000)

				up = TRUE
					log_debug("Starting REST server at [rest_server_port].")

				var/c = shell("[REST_EXEC] [rest_server_port] [world.port] [rest_server_bot_port] [rest_server_bot_call]")

				rest_server.up = FALSE
				if (c != 0 || c == null)
					if (retry_attempts < 5)
						log_debug("REST server exited with non-zero code, attempting to restart.")

						retry_attempts++
						// sleep 5 seconds, because otherwise this will be very painful if it's unrecoverable
						// i believe this is the better way to do it rather than spawn(), no?
						sleep(5 SECONDS)
					else
						log_debug("REST server refused to restart, breaking.")
						break

		// state_update_loop()
	else
		return REST_SERVER_UP

/datum/rest_server/proc/get_state()
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

/datum/rest_server/proc/get_round_status()
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

/datum/rest_server/proc/send(D)
	if (up)
		var/C

		if (world.system_type != UNIX)
			C = call_wait("byond-socks.dll", "SendAndClose", "127.0.0.1", "[rest_server_port]", json_encode(D))
		else
			// welp, let's hope the library doesn't lock up
			C = call("byond-socks.so", "SendAndClose")("127.0.0.1", "[rest_server_port]", json_encode(D))

		if (C == CONN_SUCCESS)
			log_debug("State successfully transferred to REST server.")
		else if (C == CONN_ERROR)
			log_debug("Could not transfer state to REST server.")

		return C
	else
		log_debug("Attempted state transfer to inactive REST server.")
		return CONN_ERROR

/datum/rest_server/proc/send_state()
	get_state()
	return send(state)

/// Admin verbs for starting/restarting instance ///

ADMIN_VERB_ADD(/client/proc/Start_REST_Server, R_ADMIN|R_DEBUG, FALSE)
/client/proc/Start_REST_Server()
	if (rest_server.start() == REST_SERVER_UP)
		to_chat(src, "The REST server is already up.")

ADMIN_VERB_ADD(/client/proc/Update_REST_Server, R_ADMIN|R_DEBUG, FALSE)
/client/proc/Update_REST_Server()
	if (REST_SERVER_UP)
		if (rest_server.send_state() == CONN_SUCCESS)
			to_chat(src, "State successfully transferred.")
		else
			to_chat(src, "State could not be transferred.")

/// Hook, Topic ///

/datum/world_topic/update_rest
	keyword = "update_rest"
	log = FALSE

/datum/world_topic/update_rest/Run(list/input)
	while (rest_server.send_state() != CONN_SUCCESS)
		log_debug("Retrying REST transfer state.")
		sleep(5 SECONDS)

	return CONN_SUCCESS


/hook/startup/proc/start_rest_server()
	rest_server.start()
	return 1
