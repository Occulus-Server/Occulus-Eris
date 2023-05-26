/mob/living/simple_animal/hostile
	var/idle_vision_range = 9 //If a mob is just idling around, it's vision range is limited to this. Defaults to 9 to keep in line with original simple mob aggro radius
	var/ranged_cooldown_cap = 3 //What ranged attacks, after being used are set to, to go back on cooldown, defaults to 3 life() ticks
	var/retreat_distance = null //If our mob runs from players when they're too close, set in tile distance. By default, mobs do not retreat.
	var/search_objects = 0 //If we want to consider objects when searching around, set this to 1. If you want to search for objects while also ignoring mobs until hurt, set it to 2. To completely ignore mobs, even when attacked, set it to 3
	var/ranged_cooldown_time = 15 SECONDS

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
	unsuitable_atoms_damage = 15
	faction = "siren"
	environment_smash = 15
	minbodytemp = 0
	heat_damage_per_tick = 20
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "strikes"
	var/shieldcharge = 0
	var/chargedelay = 150
	var/maxshieldcharge = 3
	var/chargerate = 0
	var/throw_message = "bounces off of"
	var/icon_aggro = null // for swapping to when we get aggressive
	var/atom/target // :  Removed type specification so spiders can target doors.

/mob/living/simple_animal/hostile/siren/Life()
	..()
	for(var/mob/living/simple_animal/hostile/siren/augmentor/A in view(src, 3))
		if(health <= 0)
			return
		if(shieldcharge < maxshieldcharge && chargerate <= world.time)
			shieldcharge++
			chargerate = world.time + 5 SECONDS
			updateicon()

/mob/living/simple_animal/hostile/siren/death()
	..()
	shieldcharge = 0
	stop_automated_movement = 0
	vision_range = idle_vision_range

/mob/living/simple_animal/hostile/siren/updateicon()
	..()
	overlays.Cut()
	if(shieldcharge >= 1)
		add_overlay("shield")

/mob/living/simple_animal/hostile/siren/MoveToTarget()		//Custom pathing! attemptto maintain distance if ranged,
	stop_automated_movement = TRUE
	if(!target_mob || SA_attackable(target_mob))
		stance = HOSTILE_STANCE_IDLE
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
	LostTarget()

/mob/living/simple_animal/hostile/siren/proc/FindHidden(var/atom/hidden_target)	//THERE IS NO ESCAPE
	if(!hidden_target)
		return FALSE
	if(istype(target.loc, /obj/structure/closet) || istype(target.loc, /obj/machinery/disposal) || istype(target.loc, /obj/machinery/sleeper))
		return TRUE
	return FALSE

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
////////////////////////
////	Replicant
////

/mob/living/simple_animal/hostile/siren/replicant
	name = "replicant"
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
	speed = 3
	maxHealth = 300
	health = 300
	harm_intent_damage = 25
	attacktext = "lashes out at"
	throw_message = "falls right through the strange body of the"
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 6
	minimum_distance = 5
	pass_flags = PASSTABLE
	ranged_cooldown_time = 0
	var/sounddelay = 0
	var/emp_range = 5
	var/distress_level = 0

/mob/living/simple_animal/hostile/siren/replicant/New()
	..()
	set_light(2, 2, "#007fff")

/mob/living/simple_animal/hostile/siren/replicant/death()
	new /obj/item/replicant_core(src.loc)
	..()

/mob/living/simple_animal/hostile/siren/replicant/OpenFire(var/the_target)
	var/mob/living/simple_animal/hostile/siren/replicanttendril/A = new /mob/living/simple_animal/hostile/siren/replicanttendril(src.loc)
	A.GiveTarget(target)
	A.friends = friends
	A.faction = faction
	soundloop()

/mob/living/simple_animal/hostile/siren/proc/GiveTarget(var/new_target) //Step 4, give us our selected target
	target = new_target
	if(!target)
		return
	vision_range = aggro_vision_range
	stance = HOSTILE_STANCE_ATTACK

/mob/living/simple_animal/hostile/siren/replicant/proc/soundloop()
	if(sounddelay == 0)
		playsound(src.loc, 'zzzz_modular_occulus/sound/voice/replicanthum.wav', 100, 1, 8, 8)
		sounddelay = 15
	else
		sounddelay--

/////////////////Defensive EMP burst starts here///////////////////////
/mob/living/simple_animal/hostile/siren/replicant/bullet_act()
	..()
	defensive_burst()

/mob/living/simple_animal/hostile/siren/replicant/attackby()
	..()
	defensive_burst()

/mob/living/simple_animal/hostile/siren/replicant/proc/defensive_burst()
	distress_level++
	// In order to make it more likely that players will be around to witness it, lets add more distress if we can see a human player
	for(var/mob/living/carbon/human/H in view())
		if(H.stat != DEAD && H.client)
			distress_level += 2
			break

	if(distress_level > 0 && prob(distress_level))
		distress_level = -30	//Once a call is successfully triggered, set the chance negative
								//So it will be a while before this guy can send another call
		playsound(src.loc, 'zzzz_modular_occulus/sound/voice/roboticactivation.wav', 100, 1, 8, 8)
		visible_message(SPAN_DANGER("[src] emits a electromagnetic pulse, frying nearby electronics!"))
		empulse(get_turf(src), emp_range, emp_range, TRUE)
/////////////////Defensive EMP burst ENDS here///////////////////////

/obj/item/replicant_core
	name = "replicant core"
	desc = "All that remains of a creature, it seems to be what remains of it's core. It still seems to glow somewhat."
	icon = 'icons/obj/food.dmi'
	icon_state = "boiledrorocore"
	var/charges = 1
	var/active = FALSE
	var/det_time = 4 SECONDS

/obj/item/replicant_core/attack_self(mob/user as mob)
	if(!charges)
		to_chat(user, SPAN_NOTICE("\The [src] clicks, but doesn't activate. It must be out of charge."))
	activate(user)
	add_fingerprint(user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.throw_mode_on()

/obj/item/replicant_core/proc/activate(mob/user as mob)
	if(active)
		return
	if(user)
		log_and_message_admins("activates \a [src]")
		user.attack_log += "\[[time_stamp()]\] <font color='red'>primed \a [src]</font>"

	active = TRUE
	playsound(loc, 'sound/weapons/armbomb.ogg', 75, 1, -3)

	sleep(det_time)
	empulse(src, 4, 10, TRUE)
	active = FALSE

////////////////////////
////	Replicant Tendrils
////

/mob/living/simple_animal/hostile/siren/replicanttendril
	name = "replicant tendril"
	desc = "A thin cord-like tendril made of bio-synthetic mesh, broken off from a larger creature. There are stories of these cords pulling crew into the darkness to never be seen again..."
	icon = 'zzzz_modular_occulus/icons/mob/siren/replicant.dmi'
	icon_state = "Replicanttendril"
	icon_living = "Replicanttendril"
	icon_aggro = "Replicanttendril"
	icon_dead = "Replicanttendrildead"
	mouse_opacity = 2
	move_to_delay = 0
	friendly = "buzzes near"
	pass_flags = PASSTABLE | PASSGRILLE
	vision_range = 10
	speed = 3
	maxHealth = 35
	health = 35
	melee_damage_lower = 10
	melee_damage_upper = 18
	attacktext = "slices"
	throw_message = "falls right through the strange body of the"
	environment_smash = 4

/mob/living/simple_animal/hostile/siren/replicanttendril/New()
	..()
	addtimer(CALLBACK(src, .proc/return_tendril), 20 SECONDS)

/mob/living/simple_animal/hostile/siren/replicanttendril/proc/return_tendril()
	visible_message(SPAN_NOTICE("[src] recoils to its host Replicant!"))
	qdel(src)

/mob/living/simple_animal/hostile/siren/replicanttendril/death()
	..()
	visible_message(SPAN_NOTICE("[src] melts away into a pile of glittering ash!"))
	new /obj/effect/decal/cleanable/ash(loc)
	qdel(src)
