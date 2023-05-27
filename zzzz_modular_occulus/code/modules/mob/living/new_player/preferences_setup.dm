#define ASSIGN_LIST_TO_COLORS(L, R, G, B) if(L) { R = L[1]; G = L[2]; B = L[3]; }

/datum/preferences
	//The mob should have a gender you want before running this proc. Will run fine without H
	randomize_appearance_and_body_for(var/mob/living/carbon/human/H)
		var/datum/species/current_species = all_species[species ? species : "Human"]
		set_biological_gender(pick(current_species.genders))

		h_style = random_hair_style(biological_gender, species)
		f_style = random_facial_hair_style(biological_gender, species)
		if(current_species)
			s_tone = random_skin_tone()
			if(current_species.appearance_flags & HAS_EYE_COLOR)
				randomize_eyes_color()
			if(current_species.appearance_flags & HAS_SKIN_COLOR)
				randomize_skin_color()
			if(current_species.appearance_flags & HAS_HAIR_COLOR)
				randomize_hair_color("hair")
				randomize_hair_color("facial")

		if(current_species.appearance_flags & HAS_UNDERWEAR)
			if(all_underwear)
				all_underwear.Cut()
			for(var/datum/category_group/underwear/WRC in GLOB.underwear.categories)
				var/datum/category_item/underwear/WRI = pick(WRC.items)
				all_underwear[WRC.name] = WRI.name

		backpack = decls_repository.get_decl(pick(subtypesof(/decl/backpack_outfit)))
		age = rand(current_species.min_age, current_species.max_age)
		b_type = RANDOM_BLOOD_TYPE
		if(H)
			copy_to(H)

#undef ASSIGN_LIST_TO_COLORS