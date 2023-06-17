/obj
	var/being_shocked = FALSE

/obj/proc/tesla_act(var/power)
	being_shocked = TRUE
	var/power_bounced = power / 2
	tesla_zap(src, 3, power_bounced)
	//addtimer(CALLBACK(src, .proc/reset_shocked), 10)
	//schedule_task_with_source_in(10, src, .proc/reset_shocked)
	spawn(10) reset_shocked()

/obj/proc/reset_shocked()
	being_shocked = FALSE

/obj/machinery/tesla_act(power, explosive = FALSE)
	..()
	if(prob(85) && explosive)
		explosion(loc, 0, 2, 4, /*flame_range = 2,*/ adminlog = FALSE/*, smoke = FALSE*/) // VOREStation Edit - No devastation range
	else if(prob(50))
		emp_act(2)
	else
		ex_act(2)

/obj/machinery/light/tesla_act(power, explosive = FALSE)
	if(explosive)
		explosion(loc, 0, 0, 0/*, flame_range = 5*/, adminlog = FALSE)
		qdel(src)
		return
	on = TRUE
	broken()

/obj/structure/closet/tesla_act(var/power)
	..() //extend the zap
	visible_message("<span class='danger'>[src] is blown apart by the bolt of electricity!</span>", "<span class='danger'>You hear a metallic screeching sound.</span>")
	dump_contents()
	qdel(src)

/obj/structure/reagent_dispensers/fueltank/tesla_act()
	..() //extend the zap
	explode()

/proc/tesla_zap(atom/source, zap_range = 3, power, explosive = FALSE, stun_mobs = TRUE)	//shameless port of tesla electric zaps
	if(!source) // Some mobs and maybe some objects delete themselves when they die.
		return
	. = source.dir
	if(power < 1000)
		return

	var/closest_dist = 0
	var/closest_atom
	var/mob/living/closest_mob
	var/obj/machinery/closest_machine
	var/obj/structure/closest_structure
	var/obj/effect/blob/closest_blob
	var/static/things_to_shock = typecacheof(list(/obj/machinery, /mob/living, /obj/structure))
	var/static/blacklisted_tesla_types = typecacheof(list(
										/obj/machinery/atmospherics,
										/obj/machinery/power/emitter,
										/obj/machinery/field_generator,
										/obj/machinery/door/blast,
										/obj/machinery/particle_accelerator/control_box,
										/obj/structure/particle_accelerator/fuel_chamber,
										/obj/structure/particle_accelerator/particle_emitter/center,
										/obj/structure/particle_accelerator/particle_emitter/left,
										/obj/structure/particle_accelerator/particle_emitter/right,
										/obj/structure/particle_accelerator/power_box,
										/obj/structure/particle_accelerator/end_cap,
										/obj/machinery/containment_field,
										/obj/structure/disposalpipe,
										/obj/structure/sign,
										/obj/structure/lattice,
										/obj/structure/grille))
	for(var/A in typecache_filter_multi_list_exclusion(oview(source, zap_range+2), things_to_shock, blacklisted_tesla_types))
		if(isliving(A))
			var/dist = get_dist(source, A)
			var/mob/living/L = A
			if(dist <= zap_range && (dist < closest_dist || !closest_mob) && L.stat != DEAD && !(L.status_flags & GODMODE))
				closest_mob = L
				closest_atom = A
				closest_dist = dist

		else if(closest_mob)
			continue

		else if(istype(A, /obj/machinery))
			var/obj/machinery/M = A
			var/dist = get_dist(source, A)
			if(dist <= zap_range && (dist < closest_dist || !closest_machine) && !M.being_shocked)
				closest_machine = M
				closest_atom = A
				closest_dist = dist

		else if(closest_machine)
			continue

		else if(istype(A, /obj/effect/blob))
			var/obj/effect/blob/B = A
			var/dist = get_dist(source, A)
			if(dist <= zap_range && (dist < closest_dist) && !B.being_shocked)
				closest_blob = B
				closest_atom = A
				closest_dist = dist

		else if(closest_blob)
			continue

		else if(istype(A, /obj/structure))
			var/obj/structure/S = A
			var/dist = get_dist(source, A)
			if(dist <= zap_range && (dist < closest_dist) && !S.being_shocked)
				closest_structure = S
				closest_atom = A
				closest_dist = dist

	//Alright, we've done our loop, now lets see if was anything interesting in range
	if(closest_atom)
		//common stuff
		var/atom/srcLoc = get_turf(source) // VOREStation Edit - Makes beams look nicer
		srcLoc.Beam(closest_atom, icon_state="lightning[rand(1,12)]",icon='zzzz_modular_occulus/icons/effects/beam.dmi', time=10, maxdistance = INFINITY)  // VOREStation Edit - Makes beams look nicer
		var/zapdir = get_dir(source, closest_atom)
		if(zapdir)
			. = zapdir

	var/drain_energy = FALSE // VOREStation Edit - Safety First! Drain Tesla fast when its loose

	//per type stuff:

	if(closest_mob)
		var/shock_damage = CLAMP(round(power/400), 10, 90) + rand(-5, 5)
		closest_mob.electrocute_act(shock_damage, source, 1 - closest_mob.get_shock_protection(), ran_zone())
		log_game("TESLA([source.x],[source.y],[source.z]) Shocked [key_name(closest_mob)] for [shock_damage]dmg.")
		if(issilicon(closest_mob))
			var/mob/living/silicon/S = closest_mob
			if(stun_mobs)
				S.emp_act(3 /*EMP_LIGHT*/)
			tesla_zap(closest_mob, 7, power / 1.5, explosive, stun_mobs) // metallic folks bounce it further
		else
			tesla_zap(closest_mob, 5, power / 1.5, explosive, stun_mobs)

	else if(closest_machine)
		drain_energy = TRUE
		closest_machine.tesla_act(power, explosive, stun_mobs)

	else if(closest_blob)
		drain_energy = TRUE
		closest_blob.tesla_act(power, explosive, stun_mobs)

	else if(closest_structure)
		drain_energy = TRUE
		closest_structure.tesla_act(power, explosive, stun_mobs)

	// VOREStation Edit Start - Safety First! Drain Tesla fast when its loose
	if(drain_energy && istype(source, /mob/living/simple_animal/hostile/siren/intruder))
		var/mob/living/simple_animal/hostile/siren/intruder/INT = source
		if (INT.energy > 0)
			INT.energy -= min(INT.energy, max(10, round(INT.energy * 0.05)))
	// VOREStation Edit End