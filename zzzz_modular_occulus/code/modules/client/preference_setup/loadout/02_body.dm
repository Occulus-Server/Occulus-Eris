datum/preferences
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
		. += "<a href='?src=\ref[src];hair_color=1'>Change Color</a> <font face='fixedsys' size='3' color='#[num2hex(pref.r_hair, 2)][num2hex(pref.g_hair, 2)][num2hex(pref.b_hair, 2)]'><table style='display:inline;' bgcolor='#[num2hex(pref.r_hair, 2)][num2hex(pref.g_hair, 2)][num2hex(pref.b_hair)]'><tr><td>__</td></tr></table></font> "

	. += "<br><b>Facial Style: </b><br>"
	. += "<a href='?src=\ref[src];cycle_facial_hair=right'>&lt;&lt;</a><a href='?src=\ref[src];cycle_facial_hair=left'>&gt;&gt;</a><a href='?src=\ref[src];facial_style=1'>[pref.f_style]</a>"
	if(has_flag(mob_species, HAS_HAIR_COLOR))
		. += "<a href='?src=\ref[src];facial_color=1'>Change Color</a> <font face='fixedsys' size='3' color='#[num2hex(pref.r_facial, 2)][num2hex(pref.g_facial, 2)][num2hex(pref.b_facial, 2)]'><table  style='display:inline;' bgcolor='#[num2hex(pref.r_facial, 2)][num2hex(pref.g_facial, 2)][num2hex(pref.b_facial)]'><tr><td>__</td></tr></table></font> "

	if(has_flag(mob_species, HAS_EYE_COLOR))
		. += "<br><b>Eyes:</b><br>"
		. += "<a href='?src=\ref[src];eye_color=1'>Change Color</a> <font face='fixedsys' size='3' color='#[num2hex(pref.r_eyes, 2)][num2hex(pref.g_eyes, 2)][num2hex(pref.b_eyes, 2)]'><table  style='display:inline;' bgcolor='#[num2hex(pref.r_eyes, 2)][num2hex(pref.g_eyes, 2)][num2hex(pref.b_eyes)]'><tr><td>__</td></tr></table></font><br>"

	if(has_flag(mob_species, HAS_SKIN_COLOR))
		. += "<br><b>Body Color:</b><br>"
		. += "<a href='?src=\ref[src];skin_color=1'>Change Color</a> <font face='fixedsys' size='3' color='#[num2hex(pref.r_skin, 2)][num2hex(pref.g_skin, 2)][num2hex(pref.b_skin, 2)]'><table style='display:inline;' bgcolor='#[num2hex(pref.r_skin, 2)][num2hex(pref.g_skin, 2)][num2hex(pref.b_skin)]'><tr><td>__</td></tr></table></font><br>"

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


/datum/category_item/player_setup_item/physical/body/OnTopic(var/href,var/list/href_list, var/mob/user)

	var/datum/species/S = all_species[pref.species]

	if (href_list["blood_color"])
		var/color = input(user, "Choose your character's blood color:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.blood_color) as color|null
		if(color && CanUseTopic(user))
			pref.blood_color = color
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["blood_reset"])
		if(CanUseTopic(user))
			pref.blood_color = (S && S.blood_color) ? S.blood_color : "A10808"
		return TOPIC_REFRESH_UPDATE_PREVIEW
	return ..()