/datum/species/human
	base_color = "#a1665e"

/datum/species/tajaran
	icobase = 'zzzz_modular_occulus/icons/mob/human_races/r_tajaran_white.dmi'

/datum/species/fl_zorren
	spawn_flags = SPECIES_IS_RESTRICTED

/datum/species/hi_zoxxen
	blurb = "The Zorren are a species native to Virgo Prime, the planet in which the CEV Northern Light crash-landed. \
	Vaugely fox-like, this species was the first client species of Solgov, and humanity as a whole. \
	Possessing many unique and highly desirable genetic traits, they were rapidly integrated into \
	The United Terran Systems over the course of the last century. With the rapid expansion of genemodding and the incoporation of \
	Zorren genetics into most of the popular genemods availible commercially, the Zorren culture is functionally extinct and Zorren baseline \
	individuals can be found scattered across human space."

/datum/species/teshari
	name = SPECIES_TESHARI
	name_plural = "Teshari"
	icobase = 'zzzz_modular_occulus/icons/mob/human_races/r_teshari_white.dmi'
	deform = 'zzzz_modular_occulus/icons/mob/human_races/r_teshari_white.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)

	min_age = 18
	max_age = 80


	blurb = "Teshari are a diminutive raptor-like species which evolved on Shekha, a tentatively habitable world in the Mecati system. \
	Historically a pack-hunting predator, Teshari society values cooperation and success through teamwork. \
	The average Teshari is a highly social and inquisitive creature, whose quickness to adapt to galactic society and long cultural legacy \
	of community and communality has served them well as crew aboard starships."

	body_temperature = 320.15	//Even more cold resistant, even more flammable

	cold_level_1 = 200 //Default 260
	cold_level_2 = 140 //Default 200
	cold_level_3 = 80  //Default 120



	heat_level_1 = 330 //Default 360
	heat_level_2 = 380 //Default 400
	heat_level_3 = 800 //Default 1000


	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#333333"

	heat_discomfort_level = 303
	heat_discomfort_strings = list(
		"Your feathers prickle in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

	cold_discomfort_level = 275
	blood_color = "#D514F7"

//slime

/datum/species/slime/roundstart
	name = SPECIES_SLIMEPERSON
	name_plural = "lesser slimepeople"
	mob_size = MOB_MEDIUM
	flags = 0 //no special abilities
	total_health = 125 //Unathi level
	brute_mod = 1.1 //Normalized to .1 delta
	burn_mod = 0.9 // ditto
	spawn_flags = CAN_JOIN | NO_SLIP //duh
	siemens_coefficient = 3 //conductive | left untouched from regular slimes
	darksight = 3
	blood_volume = SPECIES_BLOOD_DEFAULT * 1.25
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite) // no free super stungloves

	color_mult = 1
	icobase = 'icons/mob/human_races/r_human_vr.dmi'
	deform = 'icons/mob/human_races/r_def_human_vr.dmi'

	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	breath_type = "oxygen"
	poison_type = "phoron"
	exhale_type = "carbon_dioxide"

	blurb = "A slime species originating from nullspace. \
	Relies on aerobic respiration in stark contrast to the slimes more often found on the ship."

	has_process = list(
		OP_HEART =    /obj/item/organ/internal/heart/slime,
		BP_BRAIN = /obj/item/organ/internal/brain/slime,
		OP_EYES =     /obj/item/organ/internal/eyes/slime,
		OP_STOMACH = /obj/item/organ/internal/stomach/slime
		)

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/slime,
		BP_GROIN =  new /datum/organ_description/groin/slime,
		BP_HEAD =   new /datum/organ_description/head/slime,
		BP_L_ARM =  new /datum/organ_description/arm/left/slime,
		BP_R_ARM =  new /datum/organ_description/arm/right/slime,
		BP_L_LEG =  new /datum/organ_description/leg/left/slime,
		BP_R_LEG =  new /datum/organ_description/leg/right/slime,
		BP_L_HAND = new /datum/organ_description/hand/left/slime,
		BP_R_HAND = new /datum/organ_description/hand/right/slime,
		BP_L_FOOT = new /datum/organ_description/foot/left/slime,
		BP_R_FOOT = new /datum/organ_description/foot/right/slime
	)

	body_alpha = 120
	hair_alpha = 160

/obj/item/organ/internal/heart/slime
	name = "slime vascular system"
	desc = "A complex, organic knot of pulsating jelly and crystalline particles."
	icon = 'icons/mob/slimes.dmi'
	icon_state = "bluespace baby slime eat"
	dead_icon = "bluespace baby slime dead-nocore"

/obj/item/organ/internal/eyes/slime
	name = "slime photoreceptors"
	desc = "A pulsating complex of jelly-like orbs."

/obj/item/organ/internal/stomach/slime
	name = "slime digestive sack"
	desc = "a pulsating sack that contains especially heavy acids and sand."

/datum/species // Instead of using snowflake slime sprites, we just tweak their alpha down
	var/body_alpha = 255
	var/hair_alpha = 255
