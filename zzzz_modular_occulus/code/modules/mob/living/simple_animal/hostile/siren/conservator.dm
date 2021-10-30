/mob/living/simple_animal/hostile/siren/conservators
	name = "conservator"
	desc = "A little salvage and repair droid.  It seems skittish."
	icon = 'zzzz_modular_occulus/icons/mob/siren/composer.dmi'
	icon_state = "sixleg"
	attacktext = "slice"
	density = FALSE
	mob_size = MOB_SMALL
	pass_flags = PASSTABLE
	move_to_delay = 2
	ranged = 1
	var/loot_table = list(/obj/spawner/material/building,
						/obj/spawner/tool_upgrade/rare,
						/obj/spawner/material/resources/rare)

/mob/living/simple_animal/hostile/siren/composer/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	gibs(loc, null, /obj/effect/gibspawner/robot)
	var/lootdrop = pick(loot_table)
	new lootdrop(get_turf(src))
	if(lootdrop)
		visible_message("Something tumbles out of \the [src]'s remains!")
	qdel(src)