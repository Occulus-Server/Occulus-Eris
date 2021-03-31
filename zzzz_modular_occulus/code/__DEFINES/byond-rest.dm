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

var/datum/rest_server/rest_server = new

/datum/rest_server
	var/up = FALSE
	var/rest_server_port = 0
	var/rest_server_bot_port = 33621 // TODO: Add functionality to change this.
	var/rest_server_bot_call = "Bot.StatusChange" // TODO: Add functionality to change this.

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

		while (1)
			if (rest_server_port == 0)
				while (rest_server_port == 0 || rest_server_port == world.port || rest_server_port == 3621)
					rest_server_port = rand(30000, 40000)

			up = TRUE
			// TODO: Add debugging information.

			var/c = shell("[REST_EXEC] [rest_server_port] [rest_server_bot_port] [rest_server_bot_call]")

			rest_server.up = FALSE
			if (c != 0 || c == null)
				if (retry_attempts < 5)
					// TODO: add in debugging information

					retry_attempts++
					// sleep 5 seconds, because otherwise this will be very painful if it's unrecoverable
					// i believe this is the better way to do it rather than spawn(), no?
					sleep(50)
				else
					// TODO: add in debugging information
					break
	else
		return REST_SERVER_UP

/datum/rest_server/proc/send(D)
	if (up)
		var/C

		if (world.system_type != UNIX)
			C = call_wait("byond-socks.dll", "SendAndClose", "127.0.0.1", "[rest_server_port]", json_encode(D))
		else
			// welp, let's hope the library doesn't lock up
			C = call("byond-socks.so", "SendAndClose")("127.0.0.1", "[rest_server_port]", json_encode(D))

		if (C == CONN_SUCCESS)
			// TODO: Add in debugging information
		else if (C == CONN_ERROR)
			// TODO: Add in debugging information
	// else
			// TODO: Add in debugging information
