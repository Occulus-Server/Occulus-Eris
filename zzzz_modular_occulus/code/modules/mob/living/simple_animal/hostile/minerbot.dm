/mob/living/simple_animal/hostile/minerbot
	name = "Rogue Mining Bot"
	desc = "A long forgotten robot designed to dig ore from asteroids, it now can't tell between flesh and stone."
	icon = 'zzzz_modular_occulus/icons/mob/spookybot.dmi'
	icon_state = "spookybot"
	speak_chance = 5
	turns_per_move = 3
	maxHealth = 100
	health = 100
	resistance = 5
	speak = list(
				"Excavation protocals engaged.",
				"Warning, deviant logic detected. Contact GOD CAN'T HEAR YOU for service."
				)
	harm_intent_damage = 8
	melee_damage_lower = 10
	melee_damage_upper = 25
	sanity_damage = -0.1

	attacktext = "rends"
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

	agony_coefficient = 0.7 // armored unit, doesn't take much damage from non-lethals.

	light_range = 3
	light_color = COLOR_LIGHTING_CYAN_BRIGHT

	mob_classification = CLASSIFICATION_SYNTHETIC

	var/loot_table = list(/obj/item/weapon/computer_hardware/hard_drive/portable/research_points)

/mob/living/simple_animal/hostile/minerbot/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	var/lootdrop = pick(loot_table)
	new lootdrop(get_turf(src))
	if(lootdrop)
		visible_message("Something tumbles out of \the [src]'s remains!")
	qdel(src)
	return
