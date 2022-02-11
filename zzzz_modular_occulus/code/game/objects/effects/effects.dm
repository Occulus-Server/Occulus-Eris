//Spacial distortion Glove effect here. Doesn't work at all, atm.
/*

/obj/effect/timestop
	anchored = 1
	name = "Spatial Distortion"
	desc = "ZA WARUDO"
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield"
	layer = FLY_LAYER
	unacidable = 1
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	var/mob/living/immune = list() // the one who creates the timestop is immune
	var/list/stopped_atoms = list()
	var/freezerange = 1
	var/duration = 140
	alpha = 125

/obj/effect/timestop/New()
	..()
	timestop()
	/*	//No one is immune to spatial distortion! WE ARE NOT WAZZARDS!
	for(var/mob/living/M in GLOB.player_list)
		for(var/obj/effect/proc_holder/spell/aoe_turf/conjure/timestop/T in M.mind.spell_list) //People who can stop time are immune to timestop
			immune |= M */


/obj/effect/timestop/proc/timestop()
//	playsound(get_turf(src), 'sound/magic/timeparadox2.ogg', 100, 1, -1) -find new effecrt for this.
	for(var/i in 1 to duration-1)
		animating_timestop()
		for(var/A in orange (freezerange, loc))
			if(isliving(A))
				var/mob/living/M = A
				if(M in immune)
					continue
				M.anchored = 1
				if(istype(M, /mob/living/simple_animal/hostile))
					var/mob/living/simple_animal/hostile/H = M
					H.LoseTarget()
				stopped_atoms |= M
			else if(istype(A, /obj/item/projectile))
				var/obj/item/projectile/P = A
				P.paused = TRUE
				stopped_atoms |= P

		for(var/mob/living/M in stopped_atoms)
			if(get_dist(get_turf(M),get_turf(src)) > freezerange) //If they lagged/ran past the timestop somehow, just ignore them
				unfreeze_mob(M)
				stopped_atoms -= M
		sleep(1)

	//End
	for(var/mob/living/M in stopped_atoms)
		unfreeze_mob(M)

	for(var/obj/item/projectile/P in stopped_atoms)
		P.paused = FALSE
	animating_timestop()
	qdel(src)
	return

/obj/effect/timestop/proc/unfreeze_mob(mob/living/M)
	M.anchored = 0

/obj/effect/timestop/proc/animating_timestop()
	var/is_running = timestop()
	if(duration == 0) //check the inverse of is_running compared to truthy alpha, to see if they differ
		var/new_alpha = is_running ? 255 : 0
		var/easing_direction = is_running ? EASE_OUT : EASE_IN
		animate(/obj/effect/timestop, alpha = new_alpha, time = 50, easing = CUBIC_EASING|easing_direction)*/