/datum/species
	genders = list(MALE, FEMALE)

/datum/species/get_facial_hair_styles() // removes gender restrictions for facial hair
	var/list/facial_hair_styles_by_species = LAZYACCESS(facial_hair_styles, type)
	if(!facial_hair_styles_by_species)
		facial_hair_styles_by_species = list()
		LAZYSET(facial_hair_styles, type, facial_hair_styles_by_species)

		for(var/facialhairstyle in GLOB.facial_hair_styles_list)
			var/datum/sprite_accessory/S = GLOB.facial_hair_styles_list[facialhairstyle]
			if(!(get_bodytype() in S.species_allowed))
				continue
			ADD_SORTED(facial_hair_styles_by_species, facialhairstyle, /proc/cmp_text_asc)
			facial_hair_styles_by_species[facialhairstyle] = S

	return facial_hair_styles_by_species