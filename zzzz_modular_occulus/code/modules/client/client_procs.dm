/client/proc/apply_fps(var/client_fps)
	if(world.byond_version >= 511 && byond_version >= 511 && client_fps >= 0 && client_fps <= 1000)
		vars["fps"] = prefs.clientfps