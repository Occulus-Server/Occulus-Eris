/mob/living/simple_animal/hostile/siren/augmentor
	name = "augmentor"
	desc = "A truly alien creature, it is a mesh of organic and synthetic material, constantly fluctuating. When attacking, pieces of it split off and attack in tandem with the original."
	icon = 'zzzz_modular_occulus/icons/mob/siren/replicant.dmi'
	icon_state = "Replicant"
	icon_living = "Replicant"
	icon_aggro = "Replicant_alert"
	icon_dead = "Replicant_dead"
	icon_gib = "syndicate_gib"
	mouse_opacity = 2
	move_to_delay = 5
	ranged = 1
	vision_range = 5
	aggro_vision_range = 11
	idle_vision_range = 9
	speed = 3
	maxHealth = 300
	health = 300
	harm_intent_damage = 25
	melee_damage_lower = 0
	melee_damage_upper = 0
	attacktext = "lashes out at"
	throw_message = "falls right through the strange body of the"
	environment_smash = 0
	retreat_distance = 6
	minimum_distance = 5
	pass_flags = PASSTABLE

/obj/item/weapon/holo/esword/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(active && default_parry_check(user, attacker, damage_source) && prob(50))
		user.visible_message(SPAN_DANGER("\The [user] parries [attack_text] with \the [src]!"))

		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		playsound(user.loc, 'sound/weapons/blade1.ogg', 50, 1)
		return 1
	return 0

//	if(type/