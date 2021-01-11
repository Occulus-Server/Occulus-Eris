/datum/soulcrypt_module/warrant
	name = "Warrant Assistant"
	description = "A program for accessing the ship's warrant database."
	activation_message = "Connected to database network."
	deactivation_message = "Database network connection terminated."
	activates = TRUE
//	req_access = list(access_moebius)
	nanomodule_type = /datum/nano_module/digitalwarrant
	has_nanomodule = TRUE

/datum/soulcrypt_module/warrant/stat_text()
	return "Engage Warrant Assistant"
