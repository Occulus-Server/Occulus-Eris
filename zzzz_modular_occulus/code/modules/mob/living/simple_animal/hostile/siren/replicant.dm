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
	agony_coefficient = 0.8 //Hard to shoot whip-like tendrils effectively

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
