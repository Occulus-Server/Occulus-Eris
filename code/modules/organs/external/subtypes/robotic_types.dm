//Charachter setup prostheses

/obj/item/organ/external/robotic/asters
	name = "Asters \"Movement Lock\""
	desc = "Generic gray prostesis for everyday use."
	force_icon = 'icons/mob/human_races/cyberlimbs/asters.dmi'
	model = "asters"
	price_tag = 300
	bad_type = /obj/item/organ/external/robotic/asters

/obj/item/organ/external/robotic/serbian
	name = "\"Serbain Arms\""
	desc = "Battle hardened green and brown prostesis rebranded several times."
	force_icon = 'icons/mob/human_races/cyberlimbs/serbian.dmi'
	model = "serbian"
	price_tag = 600
	bad_type = /obj/item/organ/external/robotic/serbian

//In game prostheses

/obj/item/organ/external/robotic/frozen_star
	name = "\"Frozen Star\""
	desc = "Tactical \"Frozen Star\" blue and gray prosthesis for dangerous enviroment."
	force_icon = 'icons/mob/human_races/cyberlimbs/frozen_star.dmi'
	model = "frozen_star"
	price_tag = 450
	bad_type = /obj/item/organ/external/robotic/frozen_star

/obj/item/organ/external/robotic/frozen_star/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/frozen_star/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/frozen_star/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/frozen_star/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/technomancer
	name = "Technomancer \"Homebrew\""
	desc = "Technomancer \"branded\" \"functional\" prosthesis."
	force_icon = 'icons/mob/human_races/cyberlimbs/technomancer.dmi'
	model = "technomancer"
	price_tag = 700
	bad_type = /obj/item/organ/external/robotic/technomancer

/obj/item/organ/external/robotic/technomancer/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/technomancer/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/technomancer/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/technomancer/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/moebius
	name = "\"Moebius\""
	desc = "Reinforced purple and white prosthesis designed for space exploration and light combat."
	force_icon = 'icons/mob/human_races/cyberlimbs/moebius.dmi'
	model = "moebius"
	armor = list(melee = 35, bullet = 35, energy = 35, bomb = 35, bio = 0, rad = 100)
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1)
	max_damage = 60
	min_broken_damage = 40
	price_tag = 300
	bad_type = /obj/item/organ/external/robotic/moebius

/obj/item/organ/external/robotic/moebius/l_arm
	default_description = /datum/organ_description/arm/left
	icon_state = "l_arm"

/obj/item/organ/external/robotic/moebius/r_arm
	default_description = /datum/organ_description/arm/right
	icon_state = "r_arm"

/obj/item/organ/external/robotic/moebius/l_leg
	default_description = /datum/organ_description/leg/left
	icon_state = "l_leg"

/obj/item/organ/external/robotic/moebius/r_leg
	default_description = /datum/organ_description/leg/right
	icon_state = "r_leg"

/obj/item/organ/external/robotic/moebius/groin
	default_description = /datum/organ_description/groin
	icon_state = "groin_m"

/obj/item/organ/external/robotic/excelsior
	name = "Excelsior"
	desc = "Plasma reinforced black prothsesis designed for heavy combat."
	force_icon = 'icons/mob/human_races/cyberlimbs/excelsior.dmi'
	model = "excelsior"
	armor = list(melee = 50, bullet = 50, energy = 50, bomb = 50, bio = 0, rad = 100)
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTEEL = 1, MATERIAL_PHORON = 0.5) //Plasma needed as a material that excelsiors can't teleport in
	max_damage = 65
	min_broken_damage = 45
	price_tag = 600
	spawn_blacklisted = TRUE
	bad_type = /obj/item/organ/external/robotic/excelsior

/obj/item/organ/external/robotic/excelsior/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/excelsior/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/excelsior/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/excelsior/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/one_star
	name = "One star"
	desc = "Advanced, extremly resileant and mobile prosthetic. Inscribed with \"Made in\" followed by giberish, must have been lost to time."
	force_icon = 'icons/mob/human_races/cyberlimbs/one_star.dmi'
	model = "one_star"
	armor = list(melee = 65, bullet = 65, energy = 65, bomb = 65, bio = 0, rad = 100)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 4, MATERIAL_GOLD = 2)
	max_damage = 70
	min_broken_damage = 45
	spawn_blacklisted = TRUE
	rarity_value = 10
	spawn_frequency = 10
	spawn_tags = SPAWN_TAG_PROSTHETIC_OS
	bad_type = /obj/item/organ/external/robotic/one_star
	price_tag = 900

/obj/item/organ/external/robotic/one_star/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/one_star/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/one_star/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/one_star/r_leg
	default_description = /datum/organ_description/leg/right
