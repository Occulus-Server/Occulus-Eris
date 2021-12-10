/datum/preferences
	var/BIOMOD = 0
	var/COGMOD = 0
	var/MECMOD = 0
	var/ROBMOD = 0
	var/TGHMOD = 0
	var/VIGMOD = 0

/datum/category_item/player_setup_item/background/education
	name = "Skills"
	sort_order = 7

/datum/category_item/player_setup_item/background/education/load_character(var/savefile/S)
	from_file(S["BIOMOD"],pref.BIOMOD)
	from_file(S["COGMOD"],pref.COGMOD)
	from_file(S["MECMOD"],pref.MECMOD)
	from_file(S["ROBMOD"],pref.ROBMOD)
	from_file(S["TGHMOD"],pref.TGHMOD)
	from_file(S["VIGMOD"],pref.VIGMOD)

/datum/category_item/player_setup_item/background/education/save_character(var/savefile/S)
	to_file(S["BIOMOD"],pref.BIOMOD)
	to_file(S["COGMOD"],pref.COGMOD)
	to_file(S["MECMOD"],pref.MECMOD)
	to_file(S["ROBMOD"],pref.ROBMOD)
	to_file(S["TGHMOD"],pref.TGHMOD)
	to_file(S["VIGMOD"],pref.VIGMOD)

/datum/category_item/player_setup_item/background/sanitize_character()
	pref.BIOMOD             = sanitize_integer(pref.BIOMOD, -10, 15, initial(pref.BIOMOD))
	pref.COGMOD             = sanitize_integer(pref.COGMOD, -10, 15, initial(pref.COGMOD))
	pref.MECMOD             = sanitize_integer(pref.MECMOD, -10, 15, initial(pref.MECMOD))
	pref.ROBMOD             = sanitize_integer(pref.ROBMOD, -10, 15, initial(pref.ROBMOD))
	pref.TGHMOD             = sanitize_integer(pref.TGHMOD, -10, 15, initial(pref.TGHMOD))
	pref.VIGMOD             = sanitize_integer(pref.VIGMOD, -10, 15, initial(pref.VIGMOD))

/datum/category_item/player_setup_item/background/education/content(var/mob/user)
	. = list()
	. += "<br/><b>Skills</b>:<br/>"
	. += "Biology: <a href='?src=\ref[src];biomod=1'>[pref.BIOMOD]</a><br>"
	. += "Cognition: <a href='?src=\ref[src];cogmod=1'>[pref.COGMOD]</a><br>"
	. += "Mechanical: <a href='?src=\ref[src];mecmod=1'>[pref.MECMOD]</a><br>"
	. += "Robustness:  <a href='?src=\ref[src];robmod=1'>[pref.ROBMOD]</a><br>"
	. += "Toughness:  <a href='?src=\ref[src];tghmod=1'>[pref.TGHMOD]</a><br>"
	. += "Vigilance:  <a href='?src=\ref[src];vigmod=1'>[pref.VIGMOD]</a><br>"
	. += "<br/>"
	. += "You have used [pref.BIOMOD + round(pref.COGMOD/2) + pref.MECMOD + pref.ROBMOD + pref.TGHMOD + pref.VIGMOD] / 15 skill points"
	. = jointext(.,null)

/datum/category_item/player_setup_item/background/education/proc/calculatetotalpoints()
	return (pref.BIOMOD + round(pref.COGMOD/2) + pref.MECMOD + pref.ROBMOD + pref.TGHMOD + pref.VIGMOD)

/datum/category_item/player_setup_item/background/education/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["biomod"])
		var/new_bio = input(user, "Enter a value between -10 and 15 for your biology", CHARACTER_PREFERENCE_INPUT_TITLE, pref.BIOMOD) as num|null
		if(new_bio && CanUseTopic(user))
			if(calculatetotalpoints() + text2num(new_bio)<16)
				pref.BIOMOD = max(min(round(text2num(new_bio)), 15), -10)
			return TOPIC_REFRESH

	else if(href_list["cogmod"])
		var/new_cog = input(user, "Enter a value between -10 and 15 for your cognition. (COG half the cost of other stats).", CHARACTER_PREFERENCE_INPUT_TITLE, pref.COGMOD) as num|null
		if(new_cog && CanUseTopic(user))
			if(calculatetotalpoints() + round(text2num(new_cog)/2)<16)
				pref.COGMOD = max(min(round(text2num(new_cog)), 15), -10)
			return TOPIC_REFRESH

	else if(href_list["mecmod"])
		var/new_mec = input(user, "Enter a value between -10 and 15 for your mechanical.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.MECMOD) as num|null
		if(new_mec && CanUseTopic(user))
			if(calculatetotalpoints() + text2num(new_mec)<16)
				pref.MECMOD = max(min(round(text2num(new_mec)), 15), -10)
			return TOPIC_REFRESH

	else if(href_list["robmod"])
		var/new_rob = input(user, "Enter a value between -10 and 15 for your robustness.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.ROBMOD) as num|null
		if(new_rob && CanUseTopic(user))
			if(calculatetotalpoints() + text2num(new_rob)<16)
				pref.ROBMOD = max(min(round(text2num(new_rob)), 15), -10)
			return TOPIC_REFRESH

	else if(href_list["tghmod"])
		var/new_tgh = input(user, "Enter a value between -10 and 15 for your toughness.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.TGHMOD) as num|null
		if(new_tgh && CanUseTopic(user))
			if(calculatetotalpoints() + text2num(new_tgh)<16)
				pref.TGHMOD = max(min(round(text2num(new_tgh)), 15), -10)
			return TOPIC_REFRESH

	else if(href_list["vigmod"])
		var/new_vig = input(user, "Enter a value between -10 and 15 for your vigilance.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.VIGMOD) as num|null
		if(new_vig && CanUseTopic(user))
			if(calculatetotalpoints() + text2num(new_vig)<16)
				pref.VIGMOD = max(min(round(text2num(new_vig)), 15), -10)
			return TOPIC_REFRESH

	return ..()
