/mob/living/carbon/superior_animal/roach/kaiser/kaiserin
	name = "Kaiserin Roach"
	desc = "The empress herself. A weapon to surpass metal gear."
	icon = 'zzzz_modular_occulus/icons/mob/kaiserin.dmi'
	icon_state = "kaiserin_roach"
	icon_living = "kaiserin_roach"
	icon_dead = "kaiserin_roach_dead"
	density = TRUE
	spawn_blacklisted = TRUE
	rarity_value = 100
	maxHealth = 2000
	health = 2000
	mob_size = MOB_HUGE
	pixel_x = -16
	ranged = TRUE
	move_to_delay = 12
	break_stuff_probability = 95
	stop_automated_movement = 1

	melee_damage_lower = 30
	melee_damage_upper = 40


	wander = FALSE //No more sleepwalking
	projectilesound = 'zzzz_modular_occulus/sound/weapons/guns/fire/minigun_fire.ogg'
	projectiletype = /obj/item/projectile/bullet/srifle/nomuzzle

/mob/living/carbon/superior_animal/roach/kaiser/kaiserin/OpenFire()
	ranged_cooldown = world.time + 120
	if(prob(50))
		visible_message(SPAN_DANGER(" [src] minigun turret starts to spin up!"))
		spawn(5)
		visible_message(SPAN_DANGER(" [src] minigun turret fires a hail of bullets around it!"))
		spiral_shoot()
		move_to_delay = initial(move_to_delay)
		return
	else
		visible_message(SPAN_DANGER(" [src] minigun turret starts to spin up!"))
		spawn(5)
		visible_message(SPAN_DANGER(" [src] minigun turret unleashes a torrent of bullets in front of it!"))
		wave_shots()
		move_to_delay = initial(move_to_delay)
		shoot_projectile(target_mob.loc, rand(0,90))
	move_to_delay = initial(move_to_delay)

/mob/living/carbon/superior_animal/roach/kaiser/kaiserin/proc/wave_shots()
	ranged_cooldown = world.time + 30
	var/turf/U = get_turf(src)
	for(var/T in RANGE_TURFS(12, U) - U)
		set_dir(get_dir(T, target_mob))
		if(get_dir(T, U) == get_dir(T, target_mob))
			if(prob(15))
				sleep(rand(0,1))
				shoot_projectile(T)

/mob/living/carbon/superior_animal/roach/kaiser/kaiserin/proc/shoot_projectile(turf/marker)
	if(!marker || marker == loc)
		return
	var/turf/startloc = get_turf(src)
	var/obj/item/projectile/P = new projectiletype(startloc)
	playsound(usr, projectilesound, 100, 1)
	P.firer = src
	if(target_mob)
		P.original = target_mob
	P.launch( get_step(marker, pick(SOUTH, NORTH, WEST, EAST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)) )

/mob/living/carbon/superior_animal/roach/kaiser/kaiserin/proc/spiral_shoot(negative = pick(TRUE, FALSE), counter_start = 8)
	var/turf/start_turf = get_step(src, pick(GLOB.alldirs))
	var/counter = counter_start
	for(var/i in 1 to 80)
		if(prob(35))
			sleep(rand(1,3))
		if(negative)
			counter--
		else
			counter++
		if(counter > 16)
			counter = 1
		if(counter < 1)
			counter = 16
		shoot_projectile(start_turf, counter * 22.5)