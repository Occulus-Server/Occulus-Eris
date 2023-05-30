/mob/living/simple_animal/hostile/siren/nemesis
	name = "nemsis assault strider"
	desc = "A heavily armored and armed bio-mechanical beast of war. Armed with cannons and razor sharp scythe blades, very few are lucky enough to see it and survive."
	icon = 'zzzz_modular_occulus/icons/mob/siren/nemesis.dmi'
	icon_state = "Nemesis"
	icon_living = "Nemesis"
	icon_aggro = "Replicant_alert"
	icon_dead = "dead_purple"
	icon_gib = "syndicate_gib"
	mouse_opacity = MOUSE_OPACITY_OPAQUE
	move_to_delay = 3
	ranged = 1
	rapid = 20
	projectiletype = /obj/item/projectile/beam/siren
	vision_range = 15
	aggro_vision_range = 20
	speed = 5
	maxHealth = 4000
	health = 4000
	harm_intent_damage = 70
	attacktext = "lashes out at"
	throw_message = "falls right through the strange body of the"
	environment_smash = ENVIRONMENT_SMASH_RWALLS
	retreat_distance = 0
	minimum_distance = 0
	pass_flags = PASSTABLE
	ranged_cooldown_time = 0
	status_flags = 0 //No pushing, no stunning, no paralyze and no weaken.
	layer = LARGE_MOB_LAYER
	var/charging = FALSE
	var/phase = 1

/mob/living/simple_animal/hostile/siren/nemesis/MoveToTarget()		//Custom pathing! attemptto maintain distance if ranged,
	stop_automated_movement = TRUE
	if(!target_mob || SA_attackable(target_mob))
		stance = HOSTILE_STANCE_IDLE
	if(phase == 1)
		projectiletype = /obj/item/projectile/beam/siren
		rapid = 20

	if(phase == 2)
		ranged_cooldown_time = 8 SECONDS
		rapid = 3
		projectiletype = /obj/item/projectile/plasma/blast

	if(phase == 3)
		//charge mode here

	if(phase == 4)

	if(istype(src, /mob/living/simple_animal/hostile/siren/nemesis))
		//LegendaryActions()
		return
	if(world.time >= retarget_time)	//Retargetting code. Allows siren mobs to target closest mobs every 10 seconds.
		src.FindTarget()
		retarget_time = world.time + retarget_cooldown_time

	var/atom/target_from = GET_TARGETS_FROM(src)
	if(target_mob in ListTargets(10))
		var/target_distance = get_dist(src,target_mob)
		if(ranged && target_distance >= 1 && world.time >= ranged_cooldown)//We ranged? Shoot at em. Make sure they're a tile away at least, and our range attack is off cooldown
			OpenFire(target_mob)
			ranged_cooldown = world.time + ranged_cooldown_time

		if(isturf(loc) && target_mob.Adjacent(src))	//If they're next to us, attack
			AttackingTarget()

		if(retreat_distance && target_distance <= retreat_distance) //If we have a retreat distance, check if we need to run from our target
			walk_away(src, target_mob, retreat_distance, move_to_delay)
		else
			walk_to(src, target_mob, minimum_distance, move_to_delay)//Otherwise, get to our minimum distance so we chase them
		return
	if(environment_smash)
		if(target.loc != null && get_dist(target_from, target.loc) <= vision_range) //We can't see our target, but he's in our vision range still
			if(ranged_ignores_vision && ranged_cooldown <= world.time) //we can't see our target... but we can fire at them!
				OpenFire(target)
			if((environment_smash & ENVIRONMENT_SMASH_WALLS) || (environment_smash & ENVIRONMENT_SMASH_RWALLS)) //If we're capable of smashing through walls, forget about vision completely after finding our target
				walk_to(src, target_mob, minimum_distance,  move_to_delay)
				FindHidden()
				return 1
			else
				if(FindHidden())
					return 1
	LoseTarget()
	return 0

/mob/living/simple_animal/hostile/siren/bossmob/nemesis/proc/phaseA
	projectiletype = /obj/item/projectile/plasma/blast
	rapid = 3
	//Will set minimum distance as 1, retreat distance as 2.
/mob/living/simple_animal/hostile/siren/bossmob/nemesis/proc/phaseB
	projectiletype = /obj/item/projectile/beam/siren
	rapid = 20
	//minimum distance 0, restreat 0
/mob/living/simple_animal/hostile/siren/bossmob/nemesis/proc/phaseC
	charge

/mob/living/simple_animal/hostile/siren/bossmob/nemesis/proc/phaseD
//	heal+shield+summon mobs
	shield = 50







/obj/effect/temp_visual/nemesis_charge
	name = "impact zone"
	desc = "Don't just stand there, move!"
	icon = 'icons/effects/96x96.dmi'
	icon_state = "landing"
	layer = BELOW_MOB_LAYER
	plane = GAME_PLANE
	pixel_x = -32
	pixel_y = -32
	color = "#FF0000"
	duration = 10

/obj/effect/temp_visual/decoy/Initialize(mapload, atom/mimiced_atom)
	. = ..()
	alpha = initial(alpha)
	if(mimiced_atom)
		name = mimiced_atom.name
		appearance = mimiced_atom.appearance
		setDir(mimiced_atom.dir)
		mouse_opacity = MOUSE_OPACITY_TRANSPARENT





/mob/living/simple_animal/hostile/siren/bossmob/nemeis/proc/charge(bonus_charges)
	var/turf/T = get_turf(target)
	if(!T || T == loc)
		return
	new /obj/effect/temp_visual/nemesis_charge(T)
	charging = TRUE
	DestroySurroundings()
	walk(src, 0)
	var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(loc,src)
	animate(D, alpha = 0, color = "#FF0000", transform = matrix()*2, time = 3)
	sleep(5)
	throw_at(T, get_dist(src, T), 1, src, 0, callback = CALLBACK(src, .charge_end, bonus_charges))

/mob/living/simple_animal/hostile/siren/bossmob/nemeis/proc/charge_end(bonus_charges, list/effects_to_destroy)
	charging = FALSE
	try_bloodattack()
	if(target)
		if(bonus_charges)
			bonus_charges--
			charge(bonus_charges)
		else
			Goto(target, move_to_delay, minimum_distance)
			SetRecoveryTime(MEGAFAUNA_DEFAULT_RECOVERY_TIME)


/mob/living/simple_animal/hostile/siren/bossmob/nemeis/Collide(atom/A)
	if(charging)
		if(isturf(A) || isobj(A) && A.density)
			A.ex_act(EXPLODE_HEAVY)
		DestroySurroundings()
	..()

/mob/living/simple_animal/hostile/siren/bossmob/nemeis/throw_impact(atom/A)
	if(!charging)
		return ..()

	else if(isliving(A))
		var/mob/living/L = A
		L.visible_message("<span class='danger'>[src] slams into [L]!</span>", "<span class='userdanger'>[src] slams into you!</span>")
		L.apply_damage(40, BRUTE)
		playsound(get_turf(L), 'sound/effects/meteorimpact.ogg', 100, 1)
		shake_camera(L, 4, 3)
		shake_camera(src, 2, 3)
		var/throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(L, src)))
		L.throw_at(throwtarget, 3)

	charging = FALSE