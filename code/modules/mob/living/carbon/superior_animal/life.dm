/mob/living/carbon/superior_animal/proc/check_AI_act()
	if ((stat != CONSCIOUS) || !canmove || resting || lying || stasis || AI_inactive || client || grabbed_by_friend)
		stance = HOSTILE_STANCE_IDLE
		target_mob = null
		walk(src, 0)
		return

	return 1

/*

/mob/living/carbon/superior_animal/Life()
	. = ..()

	objectsInView = null

	if(client || AI_inactive)
		return

	//CONSCIOUS UNCONSCIOUS DEAD

	if (!check_AI_act())
		return

	if (!check_gravity() && !allow_spacemove())	// OCCULUS EDIT: if there is no gravity and spacemove is disallowed...
		walk(src, 0)							// 				 stop movement.

	switch(stance)
		if(HOSTILE_STANCE_IDLE)
			if (!busy) // if not busy with a special task
				stop_automated_movement = 0
			target_mob = findTarget()
			if (target_mob)
				stance = HOSTILE_STANCE_ATTACK

		if(HOSTILE_STANCE_ATTACK)
			if(destroy_surroundings)
				destroySurroundings()

			stop_automated_movement = 1
			stance = HOSTILE_STANCE_ATTACKING
			set_glide_size(DELAY2GLIDESIZE(move_to_delay))
			if(!kept_distance)
				handle_walk_to(target_mob) // OCCULUS EDIT: Move to shared function
			else
				step_to(src, target_mob, kept_distance)

		if(HOSTILE_STANCE_ATTACKING)

			handle_walk_to(target_mob) // OCCULUS EDIT: Move to shared function

			if(destroy_surroundings)
				destroySurroundings()

			prepareAttackOnTarget()

	//random movement
	if(wander && !stop_automated_movement && !anchored)
		if(isturf(src.loc) && !resting && !buckled && canmove)
			// OCCULUS EDIT: Make superior animals obey gravity
			if (check_gravity())
				handle_wander()
			else
				if (allow_spacemove())
					handle_wander()
			// OCCULUS EDIT END

	//Speaking
	if(speak_chance && prob(speak_chance))
		visible_emote(emote_see)
*/

// OCCULUS EDIT: Make angry superior animals obey gravity. avoids repeating code
/mob/living/carbon/superior_animal/proc/handle_walk_to(target_mob)
	if (check_gravity())	// yes gravity
		walk_to(src, target_mob, 1, move_to_delay)
	else	// no gravity
		if (allow_spacemove())
			walk_to(src, target_mob, 1, move_to_delay)

// OCCULUS EDIT: handle_wander() in a separate function so as to avoid repeating code
/mob/living/carbon/superior_animal/proc/handle_wander()
	turns_since_move++
	if(turns_since_move >= turns_per_move)
		if(!(stop_automated_movement_when_pulled && pulledby))
			var/moving_to = pick(cardinal)
			set_dir(moving_to)
			step_glide(src, moving_to, DELAY2GLIDESIZE(0.5 SECONDS))
			turns_since_move = 0
// OCCULUS EDIT END

/mob/living/carbon/superior_animal/handle_chemicals_in_body()
	if(reagents)
		chem_effects.Cut()
		analgesic = 0

		if(touching) touching.metabolize()
		if(ingested) ingested.metabolize()
		if(bloodstr) bloodstr.metabolize()
		metabolism_effects.process()

		if(CE_PAINKILLER in chem_effects)
			analgesic = chem_effects[CE_PAINKILLER]

	if(status_flags & GODMODE)
		return 0

	if(light_dam)
		var/light_amount = 0
		if(isturf(loc))
			var/turf/T = loc
			light_amount = round((T.get_lumcount()*10)-5)

		if(light_amount > light_dam) //if there's enough light, start dying
			take_overall_damage(1,1)
		else //heal in the dark
			heal_overall_damage(1,1)

	// nutrition decrease
	if (hunger_factor && (nutrition > 0) && (stat != DEAD))
		nutrition = max (0, nutrition - hunger_factor)

	updatehealth()
