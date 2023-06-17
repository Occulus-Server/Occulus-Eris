#define GET_TARGETS_FROM(who) (who.targets_from ? who.get_targets_from() : who)

/mob/living/simple_animal/hostile/siren/nemesis
	name = "nemesis assault strider"
	desc = "A heavily armored and armed bio-mechanical beast of war. Armed with cannons and razor sharp scythe blades, very few are lucky enough to see it and survive."
	icon = 'zzzz_modular_occulus/icons/mob/siren/nemesis.dmi'
	icon_state = "nemesis"
	icon_living = "nemesis"
	icon_dead = "dead_purple"
	icon_gib = "syndicate_gib"
	mouse_opacity = MOUSE_OPACITY_OPAQUE
	move_to_delay = 3
	ranged = 1
	rapid = 20
	rapid_fire_delay = 0.15 SECONDS
	projectiletype = /obj/item/projectile/beam/siren/rapidlaser
	vision_range = 15
	aggro_vision_range = 20
	maxHealth = 2000
	health = 2000
	harm_intent_damage = 50
	melee_damage_lower = 40
	melee_damage_upper = 50
	attacktext = "slashes out with it's scythe-like blades at"
	throw_message = "falls right through the strange body of the"
	environment_smash = ENVIRONMENT_SMASH_RWALLS
	agony_coefficient = 0.3
	move_to_delay = 7
	retreat_distance = 0
	minimum_distance = 0
	pass_flags = PASSTABLE
	ranged_cooldown_time = 5 SECONDS
	var/phase_change = 25 SECONDS
	var/phase_change_time
	status_flags = 0 //No pushing, no stunning, no paralyze and no weaken.
	layer = LARGE_MOB_LAYER
	var/charging = FALSE
	var/phase = 1
	var/recovery_time = 0
	var/recoverystate = 0
	mob_inaccuracy = 15			//% chance for a shot to have some variance.
	var/list/masterphases = list(1,2,3,4)	//phase 1 is lasers, phase 2 plasma, phase 3 melee, phase 4 heal
	var/list/allowedphases = list(1,2,3,4)
	var/previousphase
	sirenspeechlist = list("aɪ ɡɛt səʊ ˈtaɪəd ɒv ˈwɒʧɪŋ. aɪ wɒnt tuː stɑːt ˈduːɪŋ.", "ɪt ɪz taɪm fɔː sʌm məʊts tuː tɜːn dɑːk.", "juː hæv siːn θɪŋz juː ʃʊdnt.")

/mob/living/simple_animal/hostile/siren/nemesis/New()
	..()
	set_light(3, 3, "#007fff")
	ranged_cooldown = world.time + ranged_cooldown_time
	playsound(src, 'sound/effects/meteorimpact.ogg', 100, 1)


/mob/living/simple_animal/hostile/siren/nemesis/Life()
	. = ..()
	if(recoverystate == 1 && phase ==4)
		src.adjustBruteLoss(-25)
		src.adjustFireLoss(-25)
		src.health += 50


/mob/living/simple_animal/hostile/siren/nemesis/proc/phasepick()	//picks phases. Allows repeating a phase only /twice/
	if(phase == previousphase)
		allowedphases -= phase
	previousphase = phase
	if(!(src.health <= (0.75* src.maxHealth)))	//removes healing phase if health is not below 75%
		allowedphases -= 4
	phase = pick(allowedphases)
	set_light(3, 3, "#8B0000")
	addtimer(CALLBACK(src, .proc/normallight), 2 SECONDS)
	allowedphases |= masterphases
	if(phase == 1)	//laser storm phase
		projectiletype = /obj/item/projectile/beam/siren
		ranged_cooldown_time = 5 SECONDS
		rapid_fire_delay = 0.15 SECONDS
		rapid = 20
		retreat_distance = 3
		minimum_distance = 2
		if(ranged != 1)
			ranged = 1
		visible_message("<span class='userdanger'>[src] primes it's advanced laser repeater!</span>", 1)

	if(phase == 2)	//Plasma storm phase
		ranged_cooldown_time = 8 SECONDS
		ranged_cooldown = world.time + ranged_cooldown_time
		rapid_fire_delay = 0.5 SECONDS
		rapid = 3
		retreat_distance = 5
		minimum_distance = 4
		projectiletype = /obj/item/projectile/plasma/blast
		if(ranged != 1)
			ranged = 1
		visible_message("<span class='userdanger'>[src] primes it's heavy plasma cannons!</span>", 1)

	if(phase == 3)	//Charge melee phase
		visible_message("<span class='userdanger'>[src] lifts it's scythe-like armblades and prepares to charge!</span>", 1)
		retreat_distance = 0
		minimum_distance = 0
		if(ranged == 1)
			ranged = 0

/mob/living/simple_animal/hostile/siren/nemesis/proc/callforbackup()
	var/list/spawnLists = list(/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator, /mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/replicant)
	var/reinforcement_count = 3
	while(reinforcement_count > 0)
		var/turf/picked = get_random_secure_turf_in_range(src, 1, 3)
		var/spawnTypes = pick_n_take(spawnLists)
		new spawnTypes(picked)
		reinforcement_count--
		continue

/mob/living/simple_animal/hostile/siren/nemesis/MoveToTarget()		//Custom pathing! attemptto maintain distance if ranged,
	stop_automated_movement = TRUE
	if(!target_mob || SA_attackable(target_mob))
		stance = HOSTILE_STANCE_IDLE
	if(world.time >= phase_change_time)	//rotate phases ever 10 seconds
		src.phasepick()
		phase_change_time = world.time + phase_change
	if(phase == 4)	//Recovery phase
		if(recoverystate == 0)
			callforbackup()
			shieldcharge = 80
			updateicon()
			recoverystate = 1
			visible_message("<span class='userdanger'>[src] locks up in place as it's shield flares and repair nanites run across it's form!</span>", 1)
			return

		if(recoverystate == 1)
			if(shieldcharge <= 20)
				recoverystate = 0
				phase = rand(1,3)
				phase_change_time = world.time + phase_change

			else
				return

	if(world.time >= retarget_time)	//Retargetting code. Allows siren mobs to target closest mobs every 10 seconds.
		src.FindTarget()
		retarget_time = world.time + retarget_cooldown_time

	if(target_mob != null)
		var/target_distance = get_dist(src,target_mob)
		if(isturf(loc) && target_mob.Adjacent(src))	//If they're next to us, attack
			AttackingTarget()
		if(ranged && target_distance >= 1 && world.time >= ranged_cooldown)//We ranged? Shoot at em. Make sure they're a tile away at least, and our range attack is off cooldown
			OpenFire(target_mob)
			ranged_cooldown = world.time + ranged_cooldown_time
		if(phase == 3 && world.time >= recovery_time)
			charge(1)
		if(isturf(loc) && target_mob.Adjacent(src))	//If they're next to us, attack
			AttackingTarget()
		if(retreat_distance && target_distance <= retreat_distance) //If we have a retreat distance, check if we need to run from our target
			walk_away(src, target_mob, retreat_distance, move_to_delay)
			playsound(src.loc, 'zzzz_modular_occulus/sound/effects/striderwalk.wav', 100, 1, 8, 8)
		else
			walk_to(src, target_mob, minimum_distance, move_to_delay)//Otherwise, get to our minimum distance so we chase them
			playsound(src.loc, 'zzzz_modular_occulus/sound/effects/striderwalk.wav', 100, 1, 8, 8)
		return
	if(environment_smash)
		if(target.loc != null && get_dist(src, target.loc) <= vision_range) //We can't see our target, but he's in our vision range still
			if(ranged_ignores_vision && ranged_cooldown <= world.time) //we can't see our target... but we can fire at them!
				OpenFire(target)
			if((environment_smash & ENVIRONMENT_SMASH_WALLS) || (environment_smash & ENVIRONMENT_SMASH_RWALLS)) //If we're capable of smashing through walls, forget about vision completely after finding our target
				walk_to(src, target_mob, minimum_distance,  move_to_delay)
				FindHidden()
				return 1
			else
				if(FindHidden())
					return 1
	return 0


/mob/living/simple_animal/hostile/siren/nemesis/GiveTarget(var/new_target) //Step IV, give us our selected target
	target = new_target
	if(!target)
		return
	vision_range = aggro_vision_range
	stance = HOSTILE_STANCE_ATTACK
	playsound(src.loc, 'zzzz_modular_occulus/sound/effects/stridergrowl.ogg', 100, 1, 8, 8)

/mob/living/simple_animal/hostile/siren/nemesis/AttackingTarget()
	if(!Adjacent(target_mob))
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


/obj/effect/temp_visual/nemesis_charge
	name = "impact zone"
	desc = "Don't just stand there, move!"
	icon = 'icons/effects/96x96.dmi'
	icon_state = "emfield_s3"
	layer = BELOW_MOB_LAYER
	plane = GAME_PLANE
	pixel_x = -32
	pixel_y = -32
	color = "#0080ff"
	duration = 25

/obj/effect/temp_visual/decoy/Initialize(mapload, atom/mimiced_atom)
	. = ..()
	alpha = initial(alpha)
	if(mimiced_atom)
		name = mimiced_atom.name
		appearance = mimiced_atom.appearance
		set_dir(mimiced_atom.dir)
		mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/mob/living/simple_animal/hostile/siren/nemesis/proc/charge(bonus_charges)
	var/turf/T = get_turf(target_mob)
	if(!T || T == loc)
		return
	new /obj/effect/temp_visual/nemesis_charge(T)
	charging = TRUE
	DestroySurroundings()
	walk(src, 0)
	message_admins("charge")
	var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(loc,src)
	sleep(20)
	animate(D, alpha = 0, color = "#0080ff", transform = matrix()*2, time = 3)
	allow_spin = FALSE
	src.throw_at(T, get_dist(src, T), 2, src)
	addtimer(CALLBACK(src, .proc/charge_end, bonus_charges), 0.05 SECONDS)
	allow_spin = TRUE

/mob/living/simple_animal/hostile/siren/nemesis/proc/charge_end(bonus_charges, list/effects_to_destroy)
	charging = FALSE
	message_admins("charge-end")
	for(var/mob/living/T in (in_view(src.loc)-src))
		if(T.Adjacent(src))
			var/mob/living/L = T
			L.visible_message("<span class='danger'>[src] flings [L] backwards with a swipe of it's scythes!</span>", "<span class='userdanger'>[src] flings you backwards!</span>")
			L.apply_damage(20, BRUTE)
			playsound(get_turf(L), 'sound/effects/meteorimpact.ogg', 100, 1)
			shake_camera(L, 4, 3)
			shake_camera(src, 2, 3)
			var/throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(L, src)))
			L.throw_at(throwtarget, 3, 5)

	if(target)
		if(bonus_charges)
			bonus_charges--
			charge(bonus_charges)
			message_admins("bonus charge")
		else
			message_admins("walk to, recovery")
			walk_to(src, target, minimum_distance, move_to_delay)
			SetRecoveryTime(50)

/mob/living/simple_animal/hostile/siren/nemesis/Bump(atom/A)
	if(charging)
		if(isliving(A))
			var/mob/living/L = A
			L.visible_message("<span class='danger'>[src] slams into [L]!</span>", "<span class='userdanger'>[src] slams into you!</span>")
			L.apply_damage(40, BRUTE)
			playsound(get_turf(L), 'sound/effects/meteorimpact.ogg', 100, 1)
			shake_camera(L, 4, 3)
			shake_camera(src, 2, 3)
			var/throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(L, src)))
			L.throw_at(throwtarget, 3, 5)
	..()

/mob/living/simple_animal/hostile/siren/nemesis/proc/SetRecoveryTime(buffer_time)
	recovery_time = world.time + buffer_time

/mob/living/simple_animal/hostile/siren/nemesis/throw_impact(atom/A, var/speed = 5)
	message_admins("throw impact")
	if(!charging)
		message_admins("throw_impacts !charging")
		return ..()

		message_admins("bumped and charging")
	if(isturf(A) || isobj(A) && A.density)
		A.ex_act(2)
		DestroySurroundings()
		playsound(get_turf(A), 'sound/effects/meteorimpact.ogg', 100, 1)
	charging = FALSE

