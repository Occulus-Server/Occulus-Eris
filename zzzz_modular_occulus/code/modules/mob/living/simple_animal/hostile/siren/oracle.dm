/mob/living/simple_animal/hostile/siren/oracle	//siren miniboss
	name = "oracle"
	desc = "An almost ethereal, floating white construct that looks vaguely humanoid. None of it's 'limbs' physically connect to it's body"
	icon = 'zzzz_modular_occulus/icons/mob/siren/general.dmi'
	icon_state = "oracle"
	icon_living = "oracle"
	icon_aggro = "oracle"
	icon_dead = "oracle-dead"	//turns to ash on death
	icon_gib = "syndicate_gib"
	mouse_opacity = 2
	move_to_delay = 3
	vision_range = 5
	aggro_vision_range = 11
	agony_coefficient = 0.3
	ranged = TRUE
	ranged_cooldown_time = 10 SECONDS
	speed = 4
	maxHealth = 600
	health = 600
	harm_intent_damage = 15
	melee_damage_lower = 10
	melee_damage_upper = 20
	attacktext = "slammed it's energized 'arm' into"
	environment_smash = ENVIRONMENT_SMASH_NONE
	projectiletype = /obj/item/projectile/oracle
	projectilesound = 'sound/weapons/energy/incinerate.ogg'
	var/sounddelay = 0
	var/phase_change = 15 SECONDS
	var/phase_change_time
	var/prob_tele = 34
	var/transcended = 0
	var/transcend_change = 13 SECONDS
	var/transcend_change_time
	var/phase = 1
	var/list/soundlist = list('zzzz_modular_occulus/sound/effects/oraclespeak.ogg', 'zzzz_modular_occulus/sound/effects/oraclespeak2.ogg', 'zzzz_modular_occulus/sound/effects/oraclespeak3.ogg')

	sirenspeechlist = list("ðə ˈbraɪtə juː ɡləʊ ˈlɪtl məʊts, ðə mɔː ðə lɒŋ dɑːk ˈsɜːklz", "ðeər ɑː θɪŋz mɔː ˈdeɪnʤrəs ðɛn aɪ, ˈlɪtl məʊts.", "ɡəʊ həʊm, bɪˈfɔː ðə lɒŋ dɑːk stirrs.")

/mob/living/simple_animal/hostile/siren/oracle/Initialize(mapload)
	. = ..()
	do_sparks(3, 0, src.loc)

/mob/living/simple_animal/hostile/siren/oracle/Life()
	soundloop()
	if(prob(prob_tele/2))
		var/source = src
		if(target_mob)
			source = target_mob
		var/turf/T = get_random_secure_turf_in_range(source, 4, 2)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)
	. = ..()

/mob/living/simple_animal/hostile/siren/oracle/death()
	. = ..()
	do_sparks(3, 0, src.loc)
	empulse(get_turf(src), 3, 3, TRUE)
	visible_message("<span class='danger'>[src] emits an vaguely apologetic tone and collapses into non-existance!</span>", 1)
	qdel(src)

/mob/living/simple_animal/hostile/siren/oracle/MoveToTarget()
	if(transcended == 0 && world.time >= transcend_change_time)
		transcend()

	if(world.time >= phase_change_time)	//rotate phases ever 10 seconds
		src.phasepick()
		phase_change_time = world.time + phase_change
	. = ..()

/mob/living/simple_animal/hostile/siren/oracle/proc/transcend()
	visible_message("<span class='danger'>[src] dematerializes!</span>", 1)
	icon_state = "oracle_transition"
	sleep(2 SECONDS)
	transcended = 1
	icon_state = "oracle_Intangible"
	transcend_change_time = world.time + transcend_change
	addtimer(CALLBACK(src, .proc/descend), 3 SECONDS)

/mob/living/simple_animal/hostile/siren/oracle/proc/descend()
	icon_state = "oracle_transition"
	sleep(2 SECONDS)
	transcended = 0
	visible_message("<span class='danger'>[src] rematerializes!</span>", 1)
	icon_state = "oracle"

/mob/living/simple_animal/hostile/siren/oracle/proc/phasepick()
	set_light(3, 3, "#8B0000")
	phase = pick(1,2)
	if(phase == 1)	//teleport energy attack phase
		ranged = TRUE
		retreat_distance = 3
		minimum_distance = 3
		visible_message("<span class='userdanger'>[src] primes is strange 'arm'-cannon!</span>", 1)

	if(phase == 2)	//melee phase
		ranged = FALSE
		retreat_distance = 0
		minimum_distance = 0
		visible_message("<span class='userdanger'>[src] raises it's floating 'arm' and a burst of energy covers the end of it!</span>", 1)

/mob/living/simple_animal/hostile/siren/oracle/proc/soundloop()
	if(sounddelay == 0)
		visible_emote("intones a strange sound!")
		playsound(src.loc, pick(soundlist), 100, 1, 8, 8)
		sounddelay = 30
	else
		sounddelay--

/mob/living/simple_animal/hostile/siren/oracle/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	if(transcended == 1)
		return
	if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		if(phase == 2)
			playsound(get_turf(L), 'sound/effects/meteorimpact.ogg', 100, 1)
			shake_camera(L, 4, 3)
			shake_camera(src, 2, 3)
			var/throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(L, src)))
			L.throw_at(throwtarget, 3, 5)
		return L
	if(istype(target_mob,/mob/living/exosuit))
		var/mob/living/exosuit/M = target_mob
		M.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return M
	if(istype(target_mob,/obj/machinery/bot))
		var/obj/machinery/bot/B = target_mob
		B.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return B


/mob/living/simple_animal/hostile/siren/oracle/OpenFire(atom/A)
	if(transcended == 1)
		return
	. = ..()

/mob/living/simple_animal/hostile/siren/oracle/attack_generic(mob/user, damage, attack_message)
	if(!damage || !istype(user))
		return FALSE
	if(transcended == 1)
		return FALSE
	if(prob(prob_tele))
		var/source = src
		if(target_mob)
			source = target_mob
		var/turf/T = get_random_secure_turf_in_range(source, 4, 2)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)
		return FALSE
	. = ..()

/mob/living/simple_animal/hostile/siren/oracle/attackby(obj/item/W, mob/user, params)
	if(transcended == 1)
		return FALSE
	if(prob(prob_tele))
		var/source = src
		if(target_mob)
			source = target_mob
		var/turf/T = get_random_secure_turf_in_range(source, 4, 2)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)
		return FALSE
	. = ..()

/mob/living/simple_animal/hostile/siren/oracle/attack_hand(mob/living/carbon/M)
	if(transcended == 1)
		return FALSE
	if(M.a_intent != I_HELP && prob(prob_tele))
		var/source = src
		if(target_mob)
			source = target_mob
		var/turf/T = get_random_secure_turf_in_range(source, 4, 2)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)
		return FALSE
	. = ..()

/mob/living/simple_animal/hostile/siren/oracle/bullet_act(obj/item/projectile/P, def_zone)
	if(transcended == 1)
		visible_message("<span class='danger'>[P] goes right through the intangible [src]!</span>", 1)
		return PROJECTILE_FORCE_MISS

	if(prob(prob_tele))
		var/source = src
		if(target_mob)
			source = target_mob
		var/turf/T = get_random_secure_turf_in_range(source, 4, 2)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)
		return FALSE
	. = ..()
