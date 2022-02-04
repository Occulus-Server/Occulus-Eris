/obj/spawner/instructional
	name = "Random instructional spawner"
	rarity_value = 100//So our truerandom spawns don't get flooded with this.
	spawn_frequency = 1
	icon = 'zzzz_modular_occulus/icons/obj/spawners/instructional.dmi'
	icon_state = "instructional_base"
	tags_to_spawn = list(
		SPAWN_INSTRUCTIONAL_BIO,
		SPAWN_INSTRUCTIONAL_COG,
		SPAWN_INSTRUCTIONAL_MEC,
		SPAWN_INSTRUCTIONAL_ROB,
		SPAWN_INSTRUCTIONAL_TGH,
		SPAWN_INSTRUCTIONAL_VIG)
	allow_blacklist = TRUE //We don't want the instructional manuals to spawn in other spawners, but we do want it to spawn in ours.

/obj/spawner/instructional/low
	name = "Random instructional spawn low chance"
	icon_state = "instructional_base_low"
	spawn_nothing_percentage = 70

/obj/spawner/instructional/bio
	name = "Random instructional bio spawn"
	icon_state = "instructional_bio"
	tags_to_spawn = list(SPAWN_INSTRUCTIONAL_BIO)

/obj/spawner/instructional/bio/low_chance
	name = "Random instructional bio spawn low chance"
	icon_state = "instructional_bio_low"
	spawn_nothing_percentage = 70

/obj/spawner/instructional/cog
	name = "Random instructional cog spawn"
	icon_state = "instructional_cog"
	tags_to_spawn = list(SPAWN_INSTRUCTIONAL_COG)

/obj/spawner/instructional/cog/low_chance
	name = "Random instructional cog spawn low chance"
	icon_state = "instructional_cog_low"
	spawn_nothing_percentage = 70

/obj/spawner/instructional/mec
	name = "Random instructional mec spawn"
	icon_state = "instructional_mec"
	tags_to_spawn = list(SPAWN_INSTRUCTIONAL_MEC)

/obj/spawner/instructional/mec/low_chance
	name = "Random instructional mec spawn low chance"
	icon_state = "instructional_mec_low"
	spawn_nothing_percentage = 70

/obj/spawner/instructional/rob
	name = "Random instructional rob spawn"
	icon_state = "instructional_rob"
	tags_to_spawn = list(SPAWN_INSTRUCTIONAL_ROB)

/obj/spawner/instructional/rob/low_chance
	name = "Random instructional rob spawn low chance"
	icon_state = "instructional_rob_low"
	spawn_nothing_percentage = 70

/obj/spawner/instructional/tgh
	name = "Random instructional tgh spawn"
	icon_state = "instructional_tgh"
	tags_to_spawn = list(SPAWN_INSTRUCTIONAL_TGH)

/obj/spawner/instructional/tgh/low_chance
	name = "Random instructional tgh spawn low chance"
	icon_state = "instructional_tgh_low"
	spawn_nothing_percentage = 70

/obj/spawner/instructional/vig
	name = "Random instructional vig spawn"
	icon_state = "instructional_vig"
	tags_to_spawn = list(SPAWN_INSTRUCTIONAL_VIG)

/obj/spawner/instructional/vig/low_chance
	name = "Random instructional vig spawn low chance"
	icon_state = "instructional_vig_low"
	spawn_nothing_percentage = 70
