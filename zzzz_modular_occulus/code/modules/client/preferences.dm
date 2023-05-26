/datum/preferences/setup()
//	if(!length(GLOB.skills))
//		decls_repository.get_decl(/decl/hierarchy/skill)
	player_setup = new(src)
	set_biological_gender(pick(MALE, FEMALE))
	family_name = random_last_name(species)									//Eclipse Edit
	real_name = random_first_name(identifying_gender,species) + " " + family_name		//Re-work surname into clanname
	b_type = RANDOM_BLOOD_TYPE

	if(client && !IsGuestKey(client.key))
		load_path(client.ckey)
		load_preferences()
		load_and_update_character()

	sanitize_preferences()
	if(client && istype(client.mob, /mob/new_player))
		var/mob/new_player/np = client.mob
		np.new_player_panel(TRUE)

/datum/preferences/copy_to(mob/living/carbon/human/character, is_preview_copy = FALSE)
	// Sanitizing rather than saving as someone might still be editing when copy_to occurs.
	player_setup.sanitize_setup()
	character.set_species(species)

// // // BEGIN ECLIPSE EDITS // // //
// Refactor full name system into family name system.
	if(be_random_name)
		family_name = random_last_name(identifying_gender, species)
		real_name = random_first_name(identifying_gender,species) + " " + family_name

	if(config.humans_need_surnames)
		var/firstspace = findtext(real_name, " ")
		var/name_length = length(real_name)
		if(!firstspace)	//we need a surname
			real_name += " [pick(GLOB.last_names)]"
		else if(firstspace == name_length)
			real_name += "[pick(GLOB.last_names)]"
	character.fully_replace_character_name(newname = real_name)
	character.family_name = family_name

// // // END ECLIPSE EDITS // // //

	character.gender = biological_gender
	character.identifying_gender = identifying_gender
	character.age = age
	character.b_type = b_type

	character.h_style = h_style
	character.f_style = f_style

	// Build mob body from prefs
	character.rebuild_organs(src)


	character.eyes_color

	character.h_style = h_style
	character.r_hair = r_hair
	character.g_hair = g_hair
	character.b_hair = b_hair

	character.f_style = f_style
	character.r_facial = r_facial
	character.g_facial = g_facial
	character.b_facial = b_facial
	character.r_skin = r_skin
	character.g_skin = g_skin
	character.b_skin = b_skin

	character.s_tone = s_tone

	character.ear_style			= ear_styles_list[ear_style]
	character.r_ears			= r_ears
	character.b_ears			= b_ears
	character.g_ears			= g_ears
	character.r_ears2			= r_ears2
	character.b_ears2			= b_ears2
	character.g_ears2			= g_ears2
	character.tail_style		= tail_styles_list[tail_style]
	character.r_tail			= r_tail
	character.b_tail			= b_tail
	character.g_tail			= g_tail
	character.r_tail2			= r_tail2
	character.b_tail2			= b_tail2
	character.g_tail2			= g_tail2
	character.wing_style		= wing_styles_list[wing_style]
	character.r_wing			= r_wing
	character.b_wing			= b_wing
	character.g_wing			= g_wing
	character.resize(size_multiplier, animate = FALSE)
	character.custom_species	= custom_species
	character.fuzzy				= fuzzy
	character.appearance_flags	-= fuzzy*PIXEL_SCALE

	character.body_markings = body_markings
	character.blood_color = blood_color ? blood_color : character.species.blood_color

	QDEL_LIST(character.worn_underwear)
	character.worn_underwear = list()

	for(var/underwear_category_name in all_underwear)
		var/datum/category_group/underwear/underwear_category = GLOB.underwear.categories_by_name[underwear_category_name]
		if(underwear_category)
			var/underwear_item_name = all_underwear[underwear_category_name]
			var/datum/category_item/underwear/UWD = underwear_category.items_by_name[underwear_item_name]
			var/metadata = all_underwear_metadata[underwear_category_name]
			var/obj/item/underwear/UW = UWD.create_underwear(character, metadata, 'icons/inventory/underwear/mob.dmi')
			if(UW)
				UW.ForceEquipUnderwear(character, FALSE)
		else
			all_underwear -= underwear_category_name

	for(var/N in character.organs_by_name)
		var/obj/item/organ/external/O = character.organs_by_name[N]
		O.markings.Cut()


	for(var/M in body_markings)
		var/datum/sprite_accessory/marking/mark_datum = body_marking_styles_list[M]
		var/mark_color = "[body_markings[M]]"

		for(var/BP in mark_datum.body_parts)
			var/obj/item/organ/external/O = character.organs_by_name[BP]
			if(O)
				O.markings[M] = list("color" = mark_color, "datum" = mark_datum)

	character.backpack_setup = new(backpack, backpack_metadata["[backpack]"])

	character.force_update_limbs()
	character.update_mutations(0)
	character.update_implants(0)


	character.update_body(0)
	character.update_underwear(0)

	character.update_hair(0)

	character.update_icons()

	if(is_preview_copy)
		return

	for(var/lang in alternate_languages)
		character.add_language(lang)

	character.med_record = med_record
	character.sec_record = sec_record
	character.gen_record = gen_record
	character.exploit_record = exploit_record
	if(!character.isSynthetic())
		character.nutrition = rand(250, 450)

	for(var/options_name in setup_options)
		get_option(options_name).apply(character)

	character.post_prefinit()
