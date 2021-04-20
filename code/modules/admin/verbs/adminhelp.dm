
/client/verb/adminhelp(msg as text)
	set category = "Admin"
	set name = "Adminhelp"

	if(say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "\red Speech is currently admin-disabled.")
		return

	//handle muting and automuting
	if(prefs.muted & MUTE_ADMINHELP)
		to_chat(src, "<font color='red'>Error: Admin-PM: You cannot send adminhelps (Muted).</font>")
		return

	adminhelped = 1 //Determines if they get the message to reply by clicking the name.

	if(src.handle_spam_prevention(msg,MUTE_ADMINHELP))
		return

	//clean the input msg
	if(!msg)
		return
	msg = sanitize(msg)
	if(!msg)
		return

	var/original_msg = msg


	if(!mob) //this doesn't happen
		return

	//show it to the person adminhelping too
	to_chat(src, "<font color='blue'>PM to-<b>Staff </b>: [msg]</font>")

	// Mentors won't see coloring of names on people with special_roles (Antags, etc.)
	// var/mentor_msg = "\blue <b><font color=red>Request for Help: </font>[get_options_bar(mob, 4, 1, 1, 0)]:</b> [msg]"

	// Send adminhelp message to Discord chat
	send2adminchat(key_name(src), original_msg)

	if(admins.len <= 0) //START SYZ EDIT - If there are no admins, send ahelps to deadmins
		for(var/client/X in deadmins)
			if(X.deadmin_holder)
				if(X.get_preference_value(/datum/client_preference/staff/play_adminhelp_ping) == GLOB.PREF_HEAR)
					X << 'sound/effects/adminhelp.ogg'
				to_chat(X, mentor_msg)		// Generally assume deadmins don't want to know antag status
	else for(var/client/X in admins) //END SYZ EDIT
		if((R_ADMIN|R_MOD|R_MENTOR) & X.holder.rights)

	// Assuming it is an an admin help and not a mentor help	
	SStickets.newHelpRequest(src, msg) // Ahelp

	// SSmentor_tickets.newHelpRequest(src, mentormsg) // Mhelp (for mentors if they ever get implemented)

	return

