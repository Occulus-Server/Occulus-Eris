/mob/living/simple_animal/hostile/siren/augmentor
	name = "augmentor"
	desc = "A crawling robot with deliberate movements. It seems less biological then it's companions, though no less deadly."
	icon = 'zzzz_modular_occulus/icons/mob/siren/augmentor.dmi'
	icon_state = "shieldbot"
	icon_living = "shieldbot"
	icon_aggro = "shieldbot"
	icon_dead = "Replicant_dead"
	icon_gib = "syndicate_gib"
	mouse_opacity = 2
	move_to_delay = 5
	ranged = 1
	vision_range = 5
	aggro_vision_range = 11
	fire_verb = "fires a blast of plasma" //reminder that the attack message is "\red <b>[src]</b> [fire_verb] at [target]!"
	projectilesound = 'sound/weapons/pulse.ogg'
	projectiletype = /obj/item/projectile/plasma/blast
	speed = 3
	ranged_cooldown = 8 SECONDS
	maxshieldcharge = 10
	shieldcharge = 10
	maxHealth = 50
	mob_bomb_defense = 25
	health = 50
	harm_intent_damage = 5
	attacktext = "lashes out at"
	throw_message = "falls right through the strange body of the"
	retreat_distance = 5
	minimum_distance = 4
	pass_flags = PASSTABLE
	mob_inaccuracy = 20
/mob/living/simple_animal/hostile/siren/augmentor/New()
	..()
	update_icon()

/mob/living/simple_animal/hostile/siren/augmentor/death()
	..()
	new /datum/effect/effect/system/spark_spread
	gibs(loc, null, /obj/effect/gibspawner/robot)
	qdel(src)