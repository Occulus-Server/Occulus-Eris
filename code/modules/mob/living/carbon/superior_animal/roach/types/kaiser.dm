/*
Boss of this maints.
Has ability of every roach.
*/

/mob/living/carbon/superior_animal/roach/kaiser
	name = "Kaiser Roach"
	desc = "A glorious emperor of roaches."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "kaiser_roach"
	icon_living = "kaiser_roach"
	icon_dead = "kaiser_roach_dead"
	density = TRUE
	spawn_blacklisted = TRUE
	rarity_value = 100

	turns_per_move = 4
	maxHealth = 2000
	health = 2000
	contaminant_immunity = TRUE

	var/datum/reagents/gas_sac

	melee_damage_lower = 10
	melee_damage_upper = 20
	move_to_delay = 8
	mob_size = MOB_HUGE

	blattedin_revives_left = 0

	// TODO: Add a special type of meat for Kaiser
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/roachmeat/fuhrer
	meat_amount = 15
	sanity_damage = 3

	var/distress_call_stage = 3

	var/health_marker_1 = 1500
	var/health_marker_2 = 1000
	var/health_marker_3 = 500
	var/list/nanite_swarms = list()//Occulus Edit
	var/maxswarms = 21 //Occulus Edit. 25 maximum swarms, as we release 5 clusters at once

/mob/living/carbon/superior_animal/roach/kaiser/New()
	..()
	gas_sac = new /datum/reagents(100, src)
	pixel_x = -16  // For some reason it doesn't work when I overload them in class definition, so here it is.
	pixel_y = -16


/mob/living/carbon/superior_animal/roach/kaiser/Life()
	. = ..()
	if(stat != CONSCIOUS)
		return

	if(stat != AI_inactive)
		return

	if(can_call_reinforcements())
		distress_call()

	gas_sac.add_reagent("blattedin", 1)
	if(prob(7))
		gas_attack()
	if(target_mob && prob(5) && nanite_swarms.len < max_swarms)//Occulus Edit Start - Kaiser Nanites
		var/sound/screech = pick('sound/machines/robots/robot_talk_light1.ogg','sound/machines/robots/robot_talk_light2.ogg','sound/machines/robots/robot_talk_heavy4.ogg')
		playsound(src, screech, 30, 1, -3)
		nanite_swarms.Add(new /mob/living/simple_animal/hostile/naniteswarm(get_turf(src), src))
		nanite_swarms.Add(new /mob/living/simple_animal/hostile/naniteswarm(get_turf(src), src))
		nanite_swarms.Add(new /mob/living/simple_animal/hostile/naniteswarm(get_turf(src), src))
		nanite_swarms.Add(new /mob/living/simple_animal/hostile/naniteswarm(get_turf(src), src))
		nanite_swarms.Add(new /mob/living/simple_animal/hostile/naniteswarm(get_turf(src), src))
		say("10101010011100010101")

/mob/living/carbon/superior_animal/roach/kaiser/death()
	for(var/mob/living/simple_animal/hostile/naniteswarm/NS in nanite_swarms)
		nanite_swarms.Remove(NS)
		NS.gib()
	..()

/mob/living/carbon/superior_animal/roach/kaiser/Destroy()
	for(var/mob/living/simple_animal/hostile/naniteswarm/NS in nanite_swarms)
		nanite_swarms.Remove(NS)
		NS.gib()
	.=..()//Occulus Edit nanites end

/mob/living/carbon/superior_animal/roach/kaiser/eyecheck()//Occulus Edit
	return 2//Flash immunity. Flashbang resist. Occulus Edit end

// TOXIC ABILITIES
/mob/living/carbon/superior_animal/roach/kaiser/UnarmedAttack(atom/A, proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(10))
			var/damage = rand(melee_damage_lower, melee_damage_upper)
			L.damage_through_armor(damage, TOX)
			playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)
			L.visible_message(SPAN_DANGER("\the [src] globs up some toxic bile all over \the [L]!"))

// SUPPORT ABILITIES
/mob/living/carbon/superior_animal/roach/kaiser/proc/gas_attack()
	if (!gas_sac.has_reagent("blattedin", 20) || stat != CONSCIOUS)
		return

	var/location = get_turf(src)
	var/datum/effect/effect/system/smoke_spread/chem/S = new

	S.attach(location)
	S.set_up(gas_sac, gas_sac.total_volume, 0, location)
	src.visible_message(SPAN_DANGER("\the [src] secretes strange vapors!"))

	spawn(0)
		S.start()

	gas_sac.clear_reagents()
	return TRUE

/mob/living/carbon/superior_animal/roach/support/findTarget()
	. = ..()
	if(. && gas_attack())
		visible_emote("charges at [.] in clouds of poison!")

// FUHRER ABILITIES
/mob/living/carbon/superior_animal/roach/kaiser/proc/distress_call()
	if (!distress_call_stage)
		return

	for (var/mob/living/carbon/human/H in view())
		if (H.stat != DEAD && H.client)
			break

	if (distress_call_stage)
		distress_call_stage--
		playsound(src.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
		spawn(2)
			playsound(src.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
		visible_message(SPAN_DANGER("[src] emits a horrifying wail as nearby burrows stir to life!"))
		for (var/obj/structure/burrow/B in find_nearby_burrows(src))
			B.distress(TRUE)


/mob/living/carbon/superior_animal/roach/kaiser/proc/can_call_reinforcements()
	if(health_marker_1 >= health && health > health_marker_2 && distress_call_stage == 3)
		return TRUE
	if(health_marker_2 >= health && health > health_marker_3 && distress_call_stage == 2)
		return TRUE
	if(health_marker_3 >= health && health > 0 && distress_call_stage == 1)
		return TRUE
	return FALSE

/mob/living/carbon/superior_animal/roach/kaiser/slip(var/slipped_on)
	return FALSE

//RIDING
/mob/living/carbon/superior_animal/roach/kaiser/try_tame(var/mob/living/carbon/user, var/obj/item/weapon/reagent_containers/food/snacks/grown/thefood)
	if(!istype(thefood))
		return FALSE
	if(prob(40))
		// TODO: Make Kaiser bite user's arm off here.
		visible_message("[src] hesitates for a moment... and then charges at [user]!")
		return FALSE //Sometimes roach just be like that
	//fruits and veggies are not there own type, they are all the grown type and contain certain reagents. This is why it didnt work before
	if(isnull(thefood.seed.chems["singulo"]))
		return FALSE
	visible_message("[src] scuttles towards [user], examining the [thefood] they have in their hand.")
	can_buckle = TRUE
	if(do_after(src, taming_window, src)) //Here's your window to climb onto it.
		if(!buckled_mob || user != buckled_mob) //They need to be riding us
			can_buckle = FALSE
			visible_message("[src] snaps out of its trance and rushes at [user]!")
			return FALSE
		visible_message("[src] bucks around wildly, trying to shake [user] off!") //YEEEHAW
		if(prob(60))
			visible_message("[src] thrashes around and, throws [user] clean off!")
			user.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(1,3),30)
			unbuckle_mob()
			can_buckle = FALSE
			return FALSE
		friends += user
		visible_message("[src] reluctantly stops thrashing around...")
		return TRUE
	visible_message("[src] snaps out of its trance and rushes at [user]!")
	return FALSE
