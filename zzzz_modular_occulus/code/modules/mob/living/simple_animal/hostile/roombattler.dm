/mob/living/simple_animal/hostile/roombattler
	name = "\improper RMB-A4 Schildkröte"
	desc = "A discontinued product from Frozen Star, the Room Maintenance Bot model A4 was purchased as a long-since defunct company's design. These were bought in surplus by EES to handle the roach problem. It's got kinks that need worked out still. The Schildkröte variant features extra heavy plating and shields and looks much too tough for rubber bullets to put a dent in."
	icon = 'zzzz_modular_occulus/icons/mob/roombattler.dmi'
	icon_state = "turtle"
	speak_chance = 5
	turns_per_move = 5
	move_to_delay = 7
	speed = 8
	maxHealth = 200
	health = 200
	speak = list(
				"New target acquired.",
				"Warning, incoming hostile."
				)
	harm_intent_damage = 8
	melee_damage_lower = 4
	melee_damage_upper = 8

	attacktext = "rammed into"
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

	agony_coefficient = 0 // super armored unit, doesn't take damage from non-lethals.

	faction = "bosstown"

	light_range = 3
	light_color = COLOR_LIGHTING_RED_BRIGHT

	mob_classification = CLASSIFICATION_SYNTHETIC

	spawn_tags = SPAWN_ROOMBATTLER
	rarity_value = 5

/mob/living/simple_animal/hostile/roombattler/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/simple_animal/hostile/roombattler/riot
	name = "\improper RMB-A4 Quasimodo"
	desc = "A discontinued product from Frozen Star, the Room Maintenance Bot model A4 was purchased as a long-since defunct company's design. These were bought in surplus by EES to handle the roach problem. It's got kinks that need worked out still. The Quasimodo variant features a mounted riot gun."
	icon_state = "riot"
	ranged = TRUE
	rapid = TRUE // Burst fire rubbers are... very painful.
	projectiletype = /obj/item/projectile/bullet/clrifle/rubber/weak
	projectilesound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	minimum_distance = 3
	ranged_cooldown = 5 SECONDS
	maxHealth = 100
	health = 100
	agony_coefficient = 0.5 // half shields, half health, half defense

	rarity_value = 10

/obj/item/projectile/bullet/clrifle/rubber/weak
	agony = 8
