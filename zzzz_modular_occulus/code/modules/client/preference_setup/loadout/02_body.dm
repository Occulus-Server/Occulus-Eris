/datum/preferences
	var/blood_color = "#A10808"

/datum/category_item/player_setup_item/physical/body/load_character(var/savefile/S)
	. = ..()
	from_file(S["blood_color"], pref.blood_color)

/datum/category_item/player_setup_item/physical/body/save_character(var/savefile/S)
	. = ..()
	to_file(S["blood_color"], pref.blood_color)

/datum/category_item/player_setup_item/physical/body/content(var/mob/user)
	if(!pref.preview_icon)
		pref.update_preview_icon()
	user << browse_rsc(pref.preview_icon, "previewicon.png")

	var/datum/species/mob_species = all_species[pref.species]
	var/title = "<b>Species<a href='?src=\ref[src];show_species=1'><small>?</small></a>:</b> <a href='?src=\ref[src];set_species=1'>[mob_species.name]</a>"
	var/append_text = "<a href='?src=\ref[src];toggle_species_verbose=1'>[hide_species ? "Expand" : "Collapse"]</a>"
	. += "<style>span.color_holder_box{display: inline-block; width: 20px; height: 8px; border:1px solid #000; padding: 0px;}</style>"
	. += "<hr>"
	. += mob_species.get_description(title, append_text, verbose = !hide_species, skip_detail = TRUE, skip_photo = TRUE)
	. += "<table><tr style='vertical-align:top; width: 100%'><td width=65%><b>Body</b> "
	. += "(<a href='?src=\ref[src];random=1'>&reg;</A>)"
	. += "<br>"

	. += "Blood Type: <a href='?src=\ref[src];blood_type=1'>[pref.b_type]</a><br>"

//	. += "Base Colour: <a href='?src=\ref[src];base_skin=1'>[pref.s_base]</a><br>"

//	. += "Skin Tone: <a href='?src=\ref[src];skin_tone=1'>[-pref.s_tone + 35]/220</a><br>"
/*
	. += "Soulcrypt: "
	. += pref.has_soulcrypt ? "present." : "<b>not present.</b>"
	. += " \[<a href='byond://?src=\ref[src];toggle_soulcrypt=1'>toggle</a>\]"
	. += "<br>"
*/
	. += "Needs Glasses: <a href='?src=\ref[src];disabilities=[NEARSIGHTED]'><b>[pref.disabilities & NEARSIGHTED ? "Yes" : "No"]</b></a><br><br>"

	. += "<b>Hair Style: </b><br>"
	. += "<a href='?src=\ref[src];cycle_hair=right'>&lt;&lt;</a><a href='?src=\ref[src];cycle_hair=left'>&gt;&gt;</a><a href='?src=\ref[src];hair_style=1'>[pref.h_style]</a>"
	if(has_flag(mob_species, HAS_HAIR_COLOR))
		. += "<a href='?src=\ref[src];hair_color=1'>Change Color</a> <font face='fixedsys' size='3' color='[pref.hair_color]'><table style='display:inline;' bgcolor='[pref.hair_color]'><tr><td>__</td></tr></table></font> "

	. += "<br><b>Facial Style: </b><br>"
	. += "<a href='?src=\ref[src];cycle_facial_hair=right'>&lt;&lt;</a><a href='?src=\ref[src];cycle_facial_hair=left'>&gt;&gt;</a><a href='?src=\ref[src];facial_style=1'>[pref.f_style]</a>"
	if(has_flag(mob_species, HAS_HAIR_COLOR))
		. += "<a href='?src=\ref[src];facial_color=1'>Change Color</a> <font face='fixedsys' size='3' color='[pref.facial_color]'><table  style='display:inline;' bgcolor='[pref.facial_color]'><tr><td>__</td></tr></table></font> "

	if(has_flag(mob_species, HAS_EYE_COLOR))
		. += "<br><b>Eyes:</b><br>"
		. += "<a href='?src=\ref[src];eye_color=1'>Change Color</a> <font face='fixedsys' size='3' color='[pref.eyes_color]'><table  style='display:inline;' bgcolor='[pref.eyes_color]'><tr><td>__</td></tr></table></font><br>"

	if(has_flag(mob_species, HAS_SKIN_COLOR))
		. += "<br><b>Body Color:</b><br>"
		. += "<a href='?src=\ref[src];skin_color=1'>Change Color</a> <font face='fixedsys' size='3' color='[pref.skin_color]'><table style='display:inline;' bgcolor='[pref.skin_color]'><tr><td>__</td></tr></table></font><br>"

	if(!has_flag(mob_species, NO_BLOOD))
		. += "<br><b>Blood Color:</b>"
		. += "<a href='?src=\ref[src];blood_color=1'>Change Color</a> <font face= fixedsys' size='3' color='[pref.blood_color]'><table style='display:inline;' bgcolor='[pref.blood_color]'><td>__</td></tr></table></font><br>"

	. += "<br><a href='?src=\ref[src];marking_style=1'>Body Markings +</a><br>"
	for(var/M in pref.body_markings)
		. += "[M] [pref.body_markings.len > 1 ? "<a href='?src=\ref[src];marking_up=[M]'>&#708;</a> <a href='?src=\ref[src];marking_down=[M]'>&#709;</a> " : ""]<a href='?src=\ref[src];marking_remove=[M]'>-</a> <a href='?src=\ref[src];marking_color=[M]'>Color</a>"
		. += "<font face='fixedsys' size='3' color='[pref.body_markings[M]]'><table style='display:inline;' bgcolor='[pref.body_markings[M]]'><tr><td>__</td></tr></table></font>"
		. += "<br>"



	. += "</td><td style = 'text-align:center;' width = 35%><b>Preview</b><br>"
	. += "<div style ='padding-bottom:-2px;' class='statusDisplay'><img src=previewicon.png width=[pref.preview_icon.Width()] height=[pref.preview_icon.Height()]></div>"
	. += "<br><a href='?src=\ref[src];cycle_bg=1'>Cycle background</a>"
	. += "<br><a href='?src=\ref[src];toggle_preview_value=[EQUIP_PREVIEW_LOADOUT]'>[pref.equip_preview_mob & EQUIP_PREVIEW_LOADOUT ? "Hide loadout" : "Show loadout"]</a>"
	. += "<br><a href='?src=\ref[src];toggle_preview_value=[EQUIP_PREVIEW_JOB]'>[pref.equip_preview_mob & EQUIP_PREVIEW_JOB ? "Hide job gear" : "Show job gear"]</a>"
	. += "</td></tr></table>"


/datum/category_item/player_setup_item/physical/body/OnTopic(var/href, var/list/href_list, var/mob/user)

	var/datum/species/mob_species = all_species[pref.species]

	if(href_list["blood_color"])
		var/color = input(user, "Choose your character's blood color:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.blood_color) as color|null
		if(color && CanUseTopic(user))
			pref.blood_color = color
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["blood_reset"])
		if(CanUseTopic(user))
			pref.blood_color = (mob_species && mob_species.blood_color) ? mob_species.blood_color : "A10808"
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["show_species"])
		var/choice = input("Which species would you like to look at?") as null|anything in playable_species
		if(choice)
			var/datum/species/current_species = all_species[choice]
			user << browse(current_species.get_description(), "window=species;size=700x400")
			return TOPIC_HANDLED

	else if(href_list["set_species"])

		var/list/species_to_pick = list()
		for(var/species in playable_species)
			if(!check_rights(R_ADMIN, 0) && config.usealienwhitelist)
				var/datum/species/current_species = all_species[species]
				if(!(current_species.spawn_flags & CAN_JOIN))
					continue
				else if((current_species.spawn_flags & IS_WHITELISTED) && !is_alien_whitelisted(preference_mob(),current_species))
					continue
			species_to_pick += species

		var/choice = input("Select a species to play as.") as null|anything in species_to_pick
		if(!choice || !(choice in all_species))
			return

		var/prev_species = pref.species
		pref.species = choice
		if(prev_species != pref.species)
			mob_species = all_species[pref.species]
			if(!(pref.gender in mob_species.genders))
				pref.gender = mob_species.genders[1]

			ResetAllHair()

			//reset hair colour and skin colour
			pref.hair_color = "#000000"
			pref.skin_color = "#000000"
			pref.age = max(min(pref.age, mob_species.max_age), mob_species.min_age)

			pref.body_markings.Cut()

			return TOPIC_REFRESH_UPDATE_PREVIEW

	return ..()
