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