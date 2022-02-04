/mob/living/simple_animal/hostile/siren/conservator
	name = "conservator"
	desc = "A little salvage and repair biomechanical droid. It tends to biosynthetics every needs.  It seems skittish."
	icon = 'zzzz_modular_occulus/icons/mob/siren/conservator.dmi'
	icon_state = "repairbot"
	attacktext = "slice"
	density = FALSE
	mob_size = MOB_SMALL
	pass_flags = PASSTABLE
	speed = 3
	maxHealth = 5
	health = 5
	move_to_delay = 2
	agony_coefficient = 1.5
	ranged = 1
	retreat_distance = 6
	minimum_distance = 5
	fire_verb = "fires a bolt of electricity" //reminder that the attack message is "\red <b>[src]</b> [fire_verb] at [target]!"
	projectiletype = /obj/item/projectile/beam/stun
	var/loot_table = list(/obj/spawner/material/building,
						/obj/spawner/tool_upgrade/rare,
						/obj/spawner/material/resources/rare)

/mob/living/simple_animal/hostile/siren/conservator/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /datum/effect/effect/system/spark_spread
	gibs(loc, null, /obj/effect/gibspawner/robot)
	var/lootdrop = pick(loot_table)
	new lootdrop(get_turf(src))
	if(lootdrop)
		visible_message("Something tumbles out of \the [src]'s remains!")
	qdel(src)