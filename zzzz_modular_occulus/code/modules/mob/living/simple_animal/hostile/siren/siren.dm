#define GET_TARGETS_FROM(who) (who.targets_from ? who.get_targets_from() : who)


/mob/living/simple_animal/hostile	//Basically hostile mob, but not because I need to edit hostile mobs life proc, without it affecting other hostile mobs for customAI
	var/idle_vision_range = 9 //If a mob is just idling around, it's vision range is limited to this. Defaults to 9 to keep in line with original simple mob aggro radius
	var/ranged_cooldown_cap = 3 //What ranged attacks, after being used are set to, to go back on cooldown, defaults to 3 life() ticks
	var/retreat_distance = null //If our mob runs from players when they're too close, set in tile distance. By default, mobs do not retreat.
	var/search_objects = 0 //If we want to consider objects when searching around, set this to 1. If you want to search for objects while also ignoring mobs until hurt, set it to 2. To completely ignore mobs, even when attacked, set it to 3
	var/ranged_cooldown_time = 15 SECONDS
	var/retarget_cooldown_time = 10 SECONDS
	var/retarget_time
//Proper Siren mob data stuff and things

/mob/living/simple_animal/hostile/siren			//Some things go bump in the dark
	vision_range = 2
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	agony_coefficient = 0.5		//Gotta use lethals to put em down effectively
	unsuitable_atoms_damage = 15
	faction = "siren"
	environment_smash = TRUE
	destroy_surroundings = TRUE
	minbodytemp = 0
	can_burrow = FALSE
	heat_damage_per_tick = 20
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "strikes"
	vision_range = 9
	var/shieldcharge = 0
	var/chargedelay = 150
	var/maxshieldcharge = 3
	var/chargerate = 0
	var/throw_message = "bounces off of"
	var/icon_aggro = null // for swapping to when we get aggressive
	var/atom/target // :  Removed type specification so spiders can target doors.
	var/rapid_fire_delay = 2 //Time between rapid fire shots
	var/check_friendly_fire = 0
	var/attack_all_objects = FALSE
	var/list/possible_targets = list()
	var/list/current_targets = list()
	var/mob_inaccuracy = 0		//percent chance for a ranged mob's shot to go wide.
	var/shot_variance = 0		//degree of shot widening.
	var/list/sirenspeechlist = list()

/mob/living/simple_animal/hostile/siren/Life()	//This shall be our AI holy grail.
	. = ..()
	if(AI_inactive)
		for(var/mob/living/L in (view(src, vision_range)-src)) //Sucks to put this here, but otherwise mobs will ignore others in practice
			if(L.faction != "siren")
				src.try_activate_ai()
	if(!AI_inactive)
		for(var/mob/living/simple_animal/hostile/siren/S in (view(7)-src)) // should re-activate all siren mobs if able in view.
			S.try_activate_ai()
	/* For Reference only. Exists in parent hostile mob.
	if(!stasis && !AI_inactive)
		if(!.)
			walk(src, 0)
			return 0
		if(client)
			return 0

		if(!stat)
			switch(stance)
				if(HOSTILE_STANCE_IDLE)
					target_mob = FindTarget()

				if(HOSTILE_STANCE_ATTACK)
					if(destroy_surroundings)
						DestroySurroundings()
					MoveToTarget()

				if(HOSTILE_STANCE_ATTACKING)
					if(destroy_surroundings)
						DestroySurroundings()
					AttackTarget()
					*/ //For Reference only. Exists in parent hostile mob.

	for(var/mob/living/simple_animal/hostile/siren/augmentor/A in view(src, 3))
		if(health <= 0)
			return
		if(shieldcharge < maxshieldcharge && chargerate <= world.time)
			shieldcharge++
			chargerate = world.time + 5 SECONDS
			updateicon()

////// TARGETTING AND ATTACK CODE BELOW//////

/mob/living/simple_animal/hostile/siren/FindTarget()// Find our possible targets
	var/list/new_targets = (ListTargets(vision_range)-src)	//get targets in vision range
	for(var/atom/target in new_targets)
		possible_targets |= target	//add targets in vision range-self to possible target list.

	for(var/pos_targ in possible_targets)
		var/atom/A = pos_targ
		if(Found(A))	//Just in case people want to override targetting
			return A

		if(A == src)
			continue

		if(CanAttack(A))	//checks if possible targets can actually be attacked
			current_targets[A] = addtimer(CALLBACK(src, .proc/ForgetTarget, A), 20 SECONDS, TIMER_UNIQUE|TIMER_OVERRIDE)	//Adds timer to forget target, if not in view for 20 seconds
			continue
		else
			possible_targets -= A	//clear possible target list of targets that can not be attacked.
			continue
	var/Target = PickTarget(current_targets)	//selects
	GiveTarget(Target)
	return Target //We now have a target


/mob/living/simple_animal/hostile/siren/MoveToTarget()		//Custom pathing! attemptto maintain distance if ranged,
	stop_automated_movement = TRUE
	if(!target_mob || SA_attackable(target_mob))
		stance = HOSTILE_STANCE_IDLE
	if(world.time >= retarget_time)	//Retargetting code. Allows siren mobs to target closest mobs every 10 seconds.
		possible_targets = ListTargets(vision_range)
		src.FindTarget()
		retarget_time = world.time + retarget_cooldown_time

	if(target_mob != null)
		var/target_distance = get_dist(src,target_mob)
		if(ranged && target_distance >= 1 && world.time >= ranged_cooldown)//We ranged? Shoot at em. Make sure they're a tile away at least, and our range attack is off cooldown
			OpenFire(target_mob)
			ranged_cooldown = world.time + ranged_cooldown_time

		if(istype(src, /mob/living/simple_animal/hostile/siren/turret))
			return

		if(isturf(loc) && target_mob.Adjacent(src))	//If they're next to us, attack
			AttackingTarget()

		if(retreat_distance && target_distance <= retreat_distance) //If we have a retreat distance, check if we need to run from our target
			walk_away(src, target_mob, retreat_distance, move_to_delay)
		else
			walk_to(src, target_mob, minimum_distance, move_to_delay)//Otherwise, get to our minimum distance so we chase them

	if(environment_smash)
		if(target_mob != null)
			if(target_mob.loc != null && get_dist(src, target_mob.loc) <= vision_range) //We can't see our target, but he's in our vision range still
				if(ranged_ignores_vision && ranged_cooldown <= world.time) //we can't see our target... but we can fire at them!
					OpenFire(target_mob)
					possible_targets |= target_mob
				if(ranged == 0)
					walk_to(src, target_mob, minimum_distance,  move_to_delay)
					FindHidden()
				if((environment_smash & ENVIRONMENT_SMASH_WALLS) || (environment_smash & ENVIRONMENT_SMASH_RWALLS)) //If we're capable of smashing through walls, forget about vision completely after finding our target
					walk_to(src, target_mob, minimum_distance,  move_to_delay)
					FindHidden()
					return 1
				else
					if(FindHidden())
						return 1
	return 0


/mob/living/simple_animal/hostile/siren/ListTargets(var/dist = 7)	//creates list of targets in hearing distance
	var/list/L = (hearers(src) - src)

	for (var/mob/living/exosuit/M in GLOB.mechas_list)
		if (M.z == z && get_dist(src, M) <= dist)
			L += M

	return L

/mob/living/simple_animal/hostile/siren/proc/CanAttack(atom/target)//Can we actually attack a possible target?
	var/mob/living/the_target = target
	if(isturf(the_target) || !the_target) // bail out on invalids
		return FALSE

	if(see_invisible < the_target.invisibility)//Target's invisible to us, forget it
		return FALSE

	if(the_target.stat >= 1)	//Do not attack unconscious people
		return FALSE

	if(isliving(the_target))	//Do attack living only.
		var/mob/living/L = the_target
		if(L.faction == src.faction)
			return FALSE
		else
			return TRUE

	if(isobj(the_target))		//Do attack objects!
		if(attack_all_objects)
			return TRUE

	else
		return FALSE

/mob/living/simple_animal/hostile/siren/proc/ForgetTarget(atom/T)
	current_targets -= T	//removes target mob from current_targets list
	if(T == src.target_mob)	//if mob is currently the immediate target, lose target
		LoseTarget()

/mob/living/simple_animal/hostile/siren/LoseTarget()
	stance = HOSTILE_STANCE_IDLE	//set stance to idle. Must retarget again.
	target_mob = null				//set current targeted mob to null.
	walk(src, 0)



/mob/living/simple_animal/hostile/siren/proc/PickTarget(list/Targets)	//Step III, pick amongst the possible, attackable targets
	if(target != null)//If we already have a target, but are told to pick again, calculate the lowest distance between all possible, and pick from the lowest distance targets
		var/atom/target_from = src
		for(var/pos_targ in Targets)
			var/atom/A = pos_targ
			var/target_dist = get_dist(target_from, target)
			var/possible_target_distance = get_dist(target_from, A)
			if(target_dist < possible_target_distance)
				Targets -= A
	if(prob(5))
		var/sirenwords = safepick(sirenspeechlist)
		say("[sirenwords]")
	if(isemptylist(Targets))
		return
	var/chosen_target = safepick(Targets)//Pick the remaining targets (if any) at random
	return chosen_target


/mob/living/simple_animal/hostile/siren/proc/GiveTarget(var/new_target) //Step IV, give us our selected target
	target = new_target
	if(!target)
		return
	vision_range = aggro_vision_range
	stance = HOSTILE_STANCE_ATTACK



/mob/living/simple_animal/hostile/siren/AttackingTarget()
	if(!Adjacent(target_mob))
		return

	if(!isliving(target_mob))
		current_targets -= target_mob
		FindTarget()
		return

	if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return L
	if(istype(target_mob,/mob/living/exosuit))
		var/mob/living/exosuit/M = target_mob
		M.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return M
	if(istype(target_mob,/obj/machinery/bot))
		var/obj/machinery/bot/B = target_mob
		B.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return B



/mob/living/simple_animal/hostile/siren/OpenFire(atom/A)
	if(CheckFriendlyFire(A))
		return

	if(!isliving(A))			//If is not living, do not shoot.
		current_targets -= target_mob	//remove target from current list
		FindTarget()					//find new target
		return

	if(rapid > 1)
		shot_variance = 0
		var/datum/callback/cb = CALLBACK(src, .proc/Shoot, A, loc, src)  //addtimer(CALLBACK(src, .proc/check_delete, animation), 15)
		visible_message("\red <b>[src]</b> [fire_verb] at [A]!", 1)
		for(var/i in 1 to rapid)
			addtimer(cb, (i - 1)*rapid_fire_delay)
	else
		shot_variance = 0
		Shoot(A, loc, src)
		visible_message("\red <b>[src]</b> [fire_verb] at [A]!", 1)
	stance = HOSTILE_STANCE_ATTACK
	ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/siren/Shoot(var/target, var/start, var/user, var/bullet = 0)
	if(target == start)
		return
	if(prob(mob_inaccuracy))		//Mob Recoil code. bob_inaccuracy = chance to deviate
		shot_variance += pick(15, -15)	//Random picks 15, -15 every time an inaccurate shot is fired. All other shots fire the same innacruate shot after, till it varies.
	var/obj/item/projectile/A = new projectiletype(user:loc)
	playsound(user, projectilesound, 100, 1)
	if(!A)	return
	var/def_zone = get_exposed_defense_zone(target)
	A.launch(target, def_zone, 0, 0,shot_variance)


/mob/living/simple_animal/hostile/siren/proc/CheckFriendlyFire(atom/A)
	if(check_friendly_fire)
		for(var/turf/T in get_line(src,A)) // Not 100% reliable but this is faster than simulating actual trajectory
			for(var/mob/living/L in T)
				if(L == src || L == A)
					continue
				if(L.faction != src.faction)
					return TRUE



/mob/living/simple_animal/hostile/siren/DestroySurroundings()
	if(istype(src, /mob/living/simple_animal/hostile/siren/nemesis))
		set_dir(get_dir(src,target_mob))
		for(var/turf/simulated/wall/obstacle in get_step(src, dir))
			if(prob(35))
				obstacle.dismantle_wall(1)
		for(var/obj/machinery/obstacle in get_step(src, dir))
			if(prob(65))
				obstacle.Destroy()
		for(var/obj/structure/window/obstacle in get_step(src, dir))
			if(prob(95))
				qdel(obstacle)
		for(var/obj/structure/closet/obstacle  in get_step(src, dir))
			if(prob(95))
				qdel(obstacle)
		for(var/obj/structure/table/obstacle  in get_step(src, dir))
			if(prob(95))
				qdel(obstacle)

	if(prob(break_stuff_probability))
		for(var/dir in cardinal) // North, South, East, West
			for(var/obj/machinery/obstacle in get_step(src, dir))
				if((obstacle.dir == reverse_dir[dir])) // So that windows get smashed in the right order
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return
			for(var/turf/simulated/wall/obstacle in get_step(src, dir))
				if((obstacle.dir == reverse_dir[dir])) // So that windows get smashed in the right order
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return
			for(var/obj/structure/window/obstacle in get_step(src, dir))
				if((obstacle.dir == reverse_dir[dir]) || obstacle.is_fulltile()) // So that windows get smashed in the right order
					obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
					return
			var/obj/structure/obstacle = locate(/obj/structure, get_step(src, dir))
			if(istype(obstacle, /obj/structure/window) || istype(obstacle, /obj/structure/closet) || istype(obstacle, /obj/structure/table) || istype(obstacle, /obj/structure/grille))
				obstacle.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)


/mob/living/simple_animal/hostile/siren/death()
	..()
	shieldcharge = 0
	stop_automated_movement = 0
	vision_range = idle_vision_range

/mob/living/simple_animal/hostile/siren/updateicon()
	..()
	cut_overlays()
	if(shieldcharge >= 1)
		add_overlay("shield")

/mob/living/simple_animal/hostile/siren/proc/FindHidden()
	if(target_mob)
		if(istype(target_mob.loc, /obj/structure/closet) || istype(target_mob.loc, /obj/machinery/disposal) || istype(target_mob.loc, /obj/machinery/sleeper))
			var/atom/A = target_mob.loc
			walk_to(src, A, minimum_distance, move_to_delay)
			if(A.Adjacent(src))
				A.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
			return 1

/mob/living/simple_animal/hostile/siren/bullet_act(obj/item/projectile/P, def_zone)
	if(shieldcharge >= 1)
		visible_message(SPAN_DANGER("\The [src] repells \the [P] with it's shield!"))

		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, src.loc)
		spark_system.start()
		playsound(src.loc, 'sound/weapons/blade1.ogg', 50, 1)
		shieldcharge--
		updateicon()
		chargerate = world.time + chargedelay
		return PROJECTILE_FORCE_MISS
	..()

/proc/get_line(atom/starting_atom, atom/ending_atom)
	var/current_x_step = starting_atom.x//start at x and y, then add 1 or -1 to these to get every turf from starting_atom to ending_atom
	var/current_y_step = starting_atom.y
	var/starting_z = starting_atom.z

	var/list/line = list(get_turf(starting_atom))//get_turf(atom) is faster than locate(x, y, z)

	var/x_distance = ending_atom.x - current_x_step //x distance
	var/y_distance = ending_atom.y - current_y_step

	var/abs_x_distance = abs(x_distance)//Absolute value of x distance
	var/abs_y_distance = abs(y_distance)

	var/x_distance_sign = SIGN(x_distance) //Sign of x distance (+ or -)
	var/y_distance_sign = SIGN(y_distance)

	var/x = abs_x_distance >> 1 //Counters for steps taken, setting to distance/2
	var/y = abs_y_distance >> 1 //Bit-shifting makes me l33t.  It also makes get_line() unnessecarrily fast.

	if(abs_x_distance >= abs_y_distance) //x distance is greater than y
		for(var/distance_counter in 0 to (abs_x_distance - 1))//It'll take abs_x_distance steps to get there
			y += abs_y_distance

			if(y >= abs_x_distance) //Every abs_y_distance steps, step once in y direction
				y -= abs_x_distance
				current_y_step += y_distance_sign

			current_x_step += x_distance_sign //Step on in x direction
			line += locate(current_x_step, current_y_step, starting_z)//Add the turf to the list
	else
		for(var/distance_counter in 0 to (abs_y_distance - 1))
			x += abs_x_distance

			if(x >= abs_y_distance)
				x -= abs_y_distance
				current_x_step += x_distance_sign

			current_y_step += y_distance_sign
			line += locate(current_x_step, current_y_step, starting_z)
	return line

/mob/living/simple_animal/hostile/siren/proc/normallight()
	set_light(3, 3, "#007fff")
