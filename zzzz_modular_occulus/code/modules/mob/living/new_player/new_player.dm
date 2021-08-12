/mob/new_player/get_gender()
	if(!client || !client.prefs) ..()
	return client.prefs.biological_gender