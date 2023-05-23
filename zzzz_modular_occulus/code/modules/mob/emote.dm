/mob/verb/me_verb_subtle(message as message) //This would normally go in say.dm
	set name = "Subtle"
	set hidden = TRUE

	message = sanitize(message)
	message = formatSpeech(message, "|", "<i>", "</i>")
	message = formatSpeech(message, "+", "<b>", "</b>")

	if(say_disabled)
		to_chat(usr, "Speech is currently admin-disabled.")
		return

	if(!message)
		return
	if(use_me)
		usr.emote_subtle("subtle", usr.emote_type, message)

/mob/proc/emote_subtle(var/act, var/type, var/message) //This would normally go in say.dm
	if(act == "subtle")
		return subtle_emote(type, message)

/mob/verb/subtle_wrapper()
	set name = "Subtle  verb"
	set category = "IC"
	set desc = "Emote to nearby people only."

	set_typing_indicator(FALSE)
	var/message = input("", "subtle (text)") as message|null
	hud_typing = FALSE
	set_typing_indicator(FALSE)
	if(message)
		me_verb_subtle(message)


//This is a central proc that all subtle emotes are run through. This handles sending the messages to living mobs
/mob/proc/subtle_emote(var/type, var/message)
	var/list/messageturfs = list()//List of turfs we broadcast to.
	var/list/messagemobs = list()//List of living mobs nearby who can hear it, and distant ghosts who've chosen to hear it
	var/list/messagemobs_neardead = list()//List of nearby ghosts who can hear it. Those that qualify ONLY go in this list
	for (var/turf in circlerangeturfs(center=usr, radius=1))
		messageturfs += turf

	for(var/mob/M in GLOB.player_list)
		if (!M.client || istype(M, /mob/new_player))
			continue
		if(get_turf(M) in messageturfs)
			if (istype(M, /mob/observer))
				messagemobs_neardead += M
				continue
			else if (istype(M, /mob/living) && !(type == 2 && (sdisabilities & DEAF || ear_deaf)))
				messagemobs += M
		else if(src.client)
			if  (M.stat == DEAD && (M.get_preference_value(/datum/client_preference/ghost_ears) == GLOB.PREF_ALL_SPEECH))
				messagemobs += M
				continue

	message = "<i><b>[src]</b> [message]</i>"

	for (var/mob/N in messagemobs)
		N.show_message(message, type)
	for (var/mob/O in messagemobs_neardead)
		O.show_message(message, type)
