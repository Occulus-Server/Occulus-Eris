/datum/nano_module/appearance_changer/Topic(ref, href_list, var/datum/nano_topic_state/state = GLOB.default_state)
	if(..())
		return 1

	if(href_list["name"])
		if(can_change(APPEARANCE_NAME))
			if(owner.change_name(href_list["name"]))
				cut_and_generate_data()
				return 1

	if(href_list["race"])
		if(can_change(APPEARANCE_RACE) && (href_list["race"] in valid_species))
			if(owner.change_species(href_list["race"]))
				cut_and_generate_data()
				return 1
	if(href_list["gender"])
		if(can_change(APPEARANCE_GENDER) && (href_list["gender"] in owner.species.genders))
			if(owner.change_gender(href_list["gender"]))
				cut_and_generate_data()
				return 1
	if(href_list["gender_id"])
		if(can_change(APPEARANCE_GENDER) && (href_list["gender_id"] in all_pronouns_define_list))
			owner.identifying_gender = href_list["gender_id"]
			cut_and_generate_data()
			return 1
	//if(href_list["skin_tone"])
		// TODO: enable after baymed
		/*if(can_change_skin_tone())
			var/new_s_tone = input(usr, "Choose your character's skin-tone:\n1 (lighter) - [owner.species.max_skin_tone()] (darker)", "Skin Tone", -owner.s_tone + 35) as num|null
			if(isnum(new_s_tone) && can_still_topic(state))// && owner.species.appearance_flags & HAS_SKIN_TONE_NORMAL)	// TODO: enable after baymed
				new_s_tone = 35 - max(min(round(new_s_tone), owner.species.max_skin_tone()), 1)
				return owner.change_skin_tone(new_s_tone)*/
	if(href_list["skin_color"])
		if(can_change_skin_color())
			var/new_skin = input(usr, "Choose your character's skin colour: ", "Skin Color", rgb(owner.r_skin, owner.g_skin, owner.b_skin)) as color|null
			if(new_skin && can_still_topic(state))
				var/r_skin = hex2num(copytext(new_skin, 2, 4))
				var/g_skin = hex2num(copytext(new_skin, 4, 6))
				var/b_skin = hex2num(copytext(new_skin, 6, 8))
				if(owner.change_skin_color(r_skin, g_skin, b_skin))
					return 1
	if(href_list["hair"])
		if(can_change(APPEARANCE_HAIR) && (href_list["hair"] in valid_hairstyles))
			if(owner.change_hair(href_list["hair"]))
				return 1
	if(href_list["hair_color"])
		if(can_change(APPEARANCE_HAIR_COLOR))
			var/new_hair = input("Please select hair color.", "Hair Color", rgb(owner.r_hair, owner.g_hair, owner.b_hair)) as color|null
			if(new_hair && can_still_topic(state))
				var/r_hair = hex2num(copytext(new_hair, 2, 4))
				var/g_hair = hex2num(copytext(new_hair, 4, 6))
				var/b_hair = hex2num(copytext(new_hair, 6, 8))
				if(owner.change_hair_color(r_hair, g_hair, b_hair))
					return 1
	if(href_list["facial_hair"])
		if(can_change(APPEARANCE_FACIAL_HAIR) && (href_list["facial_hair"] in valid_facial_hairstyles))
			if(owner.change_facial_hair(href_list["facial_hair"]))
				return 1
	if(href_list["facial_hair_color"])
		if(can_change(APPEARANCE_FACIAL_HAIR_COLOR))
			var/new_facial = input("Please select facial hair color.", "Facial Hair Color", rgb(owner.r_facial, owner.g_facial, owner.b_facial)) as color|null
			if(new_facial && can_still_topic(state))
				var/r_facial = hex2num(copytext(new_facial, 2, 4))
				var/g_facial = hex2num(copytext(new_facial, 4, 6))
				var/b_facial = hex2num(copytext(new_facial, 6, 8))
				if(owner.change_facial_hair_color(r_facial, g_facial, b_facial))
					return 1
	if(href_list["eye_color"])
		if(can_change(APPEARANCE_EYE_COLOR))
			var/new_eyes = input("Please select eye color.", "Eye Color", rgb(owner.r_eyes, owner.g_eyes, owner.b_eyes)) as color|null
			if(new_eyes && can_still_topic(state))
				var/r_eyes = hex2num(copytext(new_eyes, 2, 4))
				var/g_eyes = hex2num(copytext(new_eyes, 4, 6))
				var/b_eyes = hex2num(copytext(new_eyes, 6, 8))
				if(owner.change_eye_color(r_eyes, g_eyes, b_eyes))
					return 1
	return 0

/datum/nano_module/appearance_changer/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS, var/datum/nano_topic_state/state = GLOB.default_state)
	if(!owner || !owner.species)
		return

	generate_data(check_whitelist, whitelist, blacklist)
	var/list/data = host.initial_data()

	data["change_name"] = can_change(APPEARANCE_NAME)
	if (data["change_name"])
		data["name"] = owner.real_name
	data["specimen"] = owner.species.name
	data["gender"] = owner.gender
	data["gender_id"] = owner.identifying_gender
	data["change_race"] = can_change(APPEARANCE_RACE)
	if(data["change_race"])
		var/species[0]
		for(var/specimen in valid_species)
			species[++species.len] =  list("specimen" = specimen)
		data["species"] = species

	data["change_gender"] = can_change(APPEARANCE_GENDER)
	if(data["change_gender"])
		var/genders[0]
		for(var/gender in owner.species.genders)
			genders[++genders.len] =  list("gender_name" = gender2text(gender), "gender_key" = gender)
		data["genders"] = genders
		var/id_genders[0]
		for(var/gender in all_pronouns_define_list)
			id_genders[++id_genders.len] =  list("gender_name" = gender2text(gender), "gender_key" = gender)
		data["id_genders"] = id_genders

	data["change_skin_tone"] = can_change_skin_tone()
	data["change_skin_color"] = can_change_skin_color()
	data["change_eye_color"] = can_change(APPEARANCE_EYE_COLOR)
	data["change_hair"] = can_change(APPEARANCE_HAIR)
	if(data["change_hair"])
		var/hair_styles[0]
		for(var/hair_style in valid_hairstyles)
			hair_styles[++hair_styles.len] = list("hairstyle" = hair_style)
		data["hair_styles"] = hair_styles
		data["hair_style"] = owner.h_style

	data["change_facial_hair"] = can_change(APPEARANCE_FACIAL_HAIR)
	if(data["change_facial_hair"])
		var/facial_hair_styles[0]
		for(var/facial_hair_style in valid_facial_hairstyles)
			facial_hair_styles[++facial_hair_styles.len] = list("facialhairstyle" = facial_hair_style)
		data["facial_hair_styles"] = facial_hair_styles
		data["facial_hair_style"] = owner.f_style

	data["change_hair_color"] = can_change(APPEARANCE_HAIR_COLOR)
	data["change_facial_hair_color"] = can_change(APPEARANCE_FACIAL_HAIR_COLOR)
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "appearance_changer.tmpl", "[src]", 800, 450, state = state)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)