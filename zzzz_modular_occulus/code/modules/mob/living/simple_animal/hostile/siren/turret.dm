	////Siren Turret////

#define TURRET_STATE_NEUTRAL 0
#define TURRET_STATE_AGGRO 1
#define TURRET_STATE_WARMUP 2
#define TURRET_STATE_ACTIVE 3
#define TURRET_STATE_RECOVERY 4

/mob/living/simple_animal/hostile/siren/turret
	name = "monitor"
	desc = "An innocious mellatic pod that floats in place. It seems to output a great deal of energy."
	maxHealth = 100
	health = 100
	melee_damage_lower = 50
	melee_damage_upper = 50
	icon = 'zzzz_modular_occulus/icons/mob/siren/general.dmi'
	icon_state = "passive"
	icon_living = "passive"
	minimum_distance = 0
	move_to_delay = 60
	vision_range = 12
	aggro_vision_range = 15
	ranged = TRUE
	ranged_cooldown_time = 10
	projectiletype = /obj/item/projectile/beam/sniper/siren
	projectilesound = 'zzzz_modular_occulus/sound/effects/beamfire.ogg'
	anchored = TRUE
	var/combatant_state = TURRET_STATE_NEUTRAL
	var/mob/living/beam_debuff_target
	var/targetting = 0
	var/loot_table = list(/obj/spawner/tool/advanced,
						/obj/spawner/tool_upgrade/rare,
						/obj/spawner/material/resources/rare)

/mob/living/simple_animal/hostile/siren/turret/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /datum/effect/effect/system/spark_spread
	gibs(loc, null, /obj/effect/gibspawner/robot)
	var/lootdrop = pick(loot_table)
	new lootdrop(get_turf(src))
	if(lootdrop)
		visible_message("Something tumbles out of \the [src]'s remains!")
	qdel(src)

/mob/living/simple_animal/hostile/siren/turret/GiveTarget(var/new_target) //Step IV, give us our selected target
	target = new_target
	set_light(1, 1, "#8B0000")
	if(!target)
		return
	vision_range = aggro_vision_range
	combatant_state = TURRET_STATE_AGGRO
	update_icons()
	stance = HOSTILE_STANCE_ATTACK

/mob/living/simple_animal/hostile/siren/turret/ForgetTarget(atom/T)
	current_targets -= T	//removes target mob from current_targets list
	if(T == src.target_mob)	//if mob is currently the immediate target, lose target
		if(targetting == 1)
			src.target_mob.remove_overlays(image('zzzz_modular_occulus/icons/mob/siren/general.dmi', "targetlocked_indicator"))
		else
			src.target_mob.remove_overlays(image('zzzz_modular_occulus/icons/mob/siren/general.dmi', "targetting_indicator"))
		LoseTarget()
		icon_state = "losttarget"
		sleep(14)
		icon_state = "passive"

/*
/obj/effect/overlay/temp/targeting_indicator
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	mouse_opacity = 0
	duration = 5 SECONDS
	icon = 'zzzz_modular_occulus/icons/mob/siren/general.dmi'
	icon_state = "targetlocked_indicator"

/obj/effect/overlay/temp/targetlocked_indicator
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	mouse_opacity = 0
	duration = 4 SECONDS
	icon = 'zzzz_modular_occulus/icons/mob/siren/general.dmi'
	icon_state = "targetting_indicator"
*/
/mob/living/simple_animal/hostile/siren/turret/OpenFire()
	WarmupAttack()

/mob/living/simple_animal/hostile/siren/turret/proc/WarmupAttack()
	if(combatant_state == TURRET_STATE_AGGRO|| combatant_state == TURRET_STATE_WARMUP)
		combatant_state = TURRET_STATE_WARMUP
		set_light(2, 2, "#8B0000")
		update_icons()
		var/target_dist = get_dist(src,target_mob)
		var/living_target_check = isliving(target_mob)
		if(living_target_check)
			if(target_dist >= 1)//Offscreen check
				BeamStartup(target)
				return

/mob/living/simple_animal/hostile/siren/turret/proc/BeamStartup(mob/living/living_target)//It's more like requiem than final spark
	if(combatant_state == TURRET_STATE_WARMUP && target_mob)
		sleep(2 SECONDS)
		update_icons()
		living_target.add_overlay(image('zzzz_modular_occulus/icons/mob/siren/general.dmi', "targetting_indicator"))
		targetting = 1
		playsound(src,'zzzz_modular_occulus/sound/effects/beamcharge.ogg', 100, 0)
		sleep(5 SECONDS)
		set_light(3, 3, "#8B0000")
		living_target.remove_overlays(image('zzzz_modular_occulus/icons/mob/siren/general.dmi', "targetting_indicator"))
		combatant_state = TURRET_STATE_ACTIVE
		living_target.update_icons()
		living_target.add_overlay(image('zzzz_modular_occulus/icons/mob/siren/general.dmi', "targetlocked_indicator"))
		targetting = 0
		sleep(2 SECONDS)
		if(get_dist(src,living_target) > 7)
			src.mob_inaccuracy = 70
			Shoot(living_target, src.loc, src)
			living_target.remove_overlays(image('zzzz_modular_occulus/icons/mob/siren/general.dmi', "targetlocked_indicator"))
			living_target.update_icons()
			AttackRecovery()
		else
			src.mob_inaccuracy = 0
			Shoot(living_target, loc, src)
			living_target.remove_overlays(image('zzzz_modular_occulus/icons/mob/siren/general.dmi', "targetlocked_indicator"))
			living_target.update_icons()
			AttackRecovery()

/mob/living/simple_animal/hostile/siren/turret/update_icons()
	. = ..()
	if(!stat)
		switch(combatant_state)
			if(TURRET_STATE_NEUTRAL)
				icon_state = "passive"
			if(TURRET_STATE_AGGRO)
				icon_state = "targetting"
			if(TURRET_STATE_WARMUP)
				icon_state = "charging"
			if(TURRET_STATE_ACTIVE)
				icon_state = "firing"
			if(TURRET_STATE_RECOVERY)
				icon_state = "recovery"


/mob/living/simple_animal/hostile/siren/turret/proc/AttackRecovery()
	if(combatant_state == TURRET_STATE_ACTIVE)
		combatant_state = TURRET_STATE_RECOVERY
		update_icons()
		set_light(0, 0, "#8B0000")
		ranged_cooldown = world.time + ranged_cooldown_time

		if(!target_mob)
			ResetNeutral()
		else
			combatant_state = TURRET_STATE_WARMUP

/mob/living/simple_animal/hostile/siren/turret/proc/ResetNeutral()
	combatant_state = TURRET_STATE_NEUTRAL
	if(!target_mob)
		icon_state = "passive"


#undef TURRET_STATE_NEUTRAL
#undef TURRET_STATE_AGGRO
#undef TURRET_STATE_WARMUP
#undef TURRET_STATE_ACTIVE
#undef TURRET_STATE_RECOVERY
