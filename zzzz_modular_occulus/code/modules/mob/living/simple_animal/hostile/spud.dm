/mob/living/simple_animal/hostile/spud
	name = "\improper SPUD unit"
	desc = "A popular product from Bosstown Dynamics Incorporated, the Synchronized Pseudopodal Utility Demonstrator unit is a modular robot capable of fufilling all manner of tasks."
	icon = 'zzzz_modular_occulus/icons/mob/spud.dmi'
	icon_state = "spud"
	speak_chance = 5
	turns_per_move = 3
	speed = 4
	maxHealth = 125
	health = 125
	speak = list(
				"New target acquired.",
				"Warning, incoming hostile."
				)
	harm_intent_damage = 8
	melee_damage_lower = 10
	melee_damage_upper = 20
	sanity_damage = -0.1

	attacktext = "pounced on"
	attack_sound = 'sound/mechs/mechmove01.ogg'

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	environment_smash = 1

	agony_coefficient = 0.5 // armored unit, doesn't take much damage from non-lethals.

	faction = "neutral"

	light_range = 3
	light_color = COLOR_LIGHTING_CYAN_BRIGHT

	mob_classification = CLASSIFICATION_SYNTHETIC

	spawn_tags = SPAWN_SPUD
	rarity_value = 5

/mob/living/simple_animal/hostile/spud/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/simple_animal/hostile/spud/syndi //Infiltrator unit designed to synergize with local hostile fauna
	name = "\improper blood-red SPUD unit"
	desc = "A popular product from Bosstown Dynamics Incorporated, the Synchronized Pseudopodal Utility Demonstrator unit is a modular robot capable of fufilling all manner of tasks. This one has a snazzy blood-red paintjob and also has a very distinct roach-like odor."
	icon_state = "syndi"
	melee_damage_lower = 15
	melee_damage_upper = 30
	faction = "roach" //something something roach pheromones
	can_burrow = TRUE
	light_color = COLOR_LIGHTING_GREEN_BRIGHT
	spawn_tags = SPAWN_TAG_ROACH
	rarity_value = 100 // 10 rarer than a fuhrer
	sanity_damage = 0.5

/mob/living/simple_animal/hostile/spud/frozenstar
	name = "\improper FS SPUD unit"
	desc = "A popular product from Bosstown Dynamics Incorporated, the Synchronized Pseudopodal Utility Demonstrator unit is a modular robot capable of fufilling all manner of tasks. This one has a cool Frozen Star paintjob."
	icon_state = "frozen"
	melee_damage_lower = 15
	melee_damage_upper = 30
	light_color = COLOR_LIGHTING_RED_BRIGHT
	rarity_value = 10
