/*
	The 'Siren': A living creature-ship. Highly advanced technology and /old/. It species views space ships with indifference, but it does not like to be seen.
	There is a relatively young 'Siren' following the Light. While capable of destroying ships with relative ease, This one in particular enjoys 'playing',
	and seeks the data hidden of itself onboard the NL. It is akin to a kid who burns ants with a magnifying glass- only instead of a magnifying glass, it's devastating plasma weaponry.
*/
/datum/storyevent/siren_scan
	id = "siren_scan"
	name = "Siren scan"

	event_type = /datum/event/siren_scan
	event_pools = list(EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR*0.80)
	req_crew = 15
	weight = 0.5
	max_crew_diff_lower = 5
	tags = list(TAG_SCARY, TAG_COMMUNAL, TAG_COMBAT, TAG_NEGATIVE,)



/datum/event/siren_scan	//The siren calls
	var/const/enterBelt		= 40
	var/const/scanInterval 	= 5
	var/const/leaveBelt		= 80
	var/const/revokeAccess	= 90
	startWhen				= 2
	announceWhen			= 1
	endWhen					= revokeAccess
	var/postStartTicks 		= 0
	var/list/spawnLists
	var/list/used_candidates = list()
	var/siren_anger
	var/total_targets
	var/crew

/datum/event/siren_scan/announce()
	command_announcement.Announce("Anomalous electromagnetic interference detected approaching ship. Interference expected to bypass shields, effects unknown.", "Anomaly Alert", new_sound = 'sound/misc/interference.ogg')

/datum/event/siren_scan/proc/runThisOnEventStartup()
	spawnLists = list()
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/replicant, /mob/living/simple_animal/hostile/siren/replicant,/mob/living/simple_animal/hostile/siren/replicant,/mob/living/simple_animal/hostile/siren/conservator))
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/composer,/mob/living/simple_animal/hostile/siren/composer,/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator))
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/conservator, /mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator))
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/replicant, /mob/living/simple_animal/hostile/siren/replicant,/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator))
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/composer, /mob/living/simple_animal/hostile/siren/replicant,/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator))
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator, /mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/composer))
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/oracle,/mob/living/simple_animal/hostile/siren/conservator, /mob/living/simple_animal/hostile/siren/conservator))	//The miniboss really does not need extra help
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/intruder,/mob/living/simple_animal/hostile/siren/conservator, /mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/composer))
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/amalgamate,/mob/living/simple_animal/hostile/siren/amalgamate,/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator))
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/amalgamate,/mob/living/simple_animal/hostile/siren/replicant,/mob/living/simple_animal/hostile/siren/amalgamate,/mob/living/simple_animal/hostile/siren/replicant))
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/intruder,/mob/living/simple_animal/hostile/siren/intruder,/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator))
	spawnLists += list(list(/mob/living/simple_animal/hostile/siren/oracle, /mob/living/simple_animal/hostile/siren/augmentor,/mob/living/simple_animal/hostile/siren/replicant,/mob/living/simple_animal/hostile/siren/intruder))
	if(crew >= 17)
		spawnLists += list(list(/mob/living/simple_animal/hostile/siren/nemesis))

/datum/event/siren_scan/start()
	SSweather.run_weather(/datum/weather/siren_scan)
	siren_anger_calculate()
	runThisOnEventStartup()

/datum/event/siren_scan/proc/crewcount()
	for(var/mob/M in GLOB.player_list)
		if(M.client && (M.mind && !M.mind.antagonist.len) && M.stat != DEAD && (ishuman(M) || isrobot(M) || isAI(M)))
			var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
			if(job)
				crew++

/datum/event/siren_scan/proc/siren_anger_calculate()
	crewcount()
	var/siren_modifier
	if(crew >= 10 && crew <= 12)
		siren_modifier = 1
	if(crew >= 13 && crew <= 15)
		siren_modifier = 2
	if(crew >= 16)
		siren_modifier = 3
	siren_anger = rand(3, 6) + siren_modifier

/datum/event/siren_scan/tick()
	if(activeFor == enterBelt)
		command_announcement.Announce("The Anomalous electromagnetic interference has reached the ship. Unable to determine source.", "Anomaly Alert", new_sound = 'zzzz_modular_occulus/sound/effects/The_Siren.wav')
		scanning()
		for(var/datum/weather/siren_scan/R in SSweather.processing)
			R.start()

	if(activeFor >= enterBelt && activeFor <= leaveBelt)
		postStartTicks++

	if(postStartTicks == scanInterval)
		postStartTicks = 0
		scanning()

	else if(activeFor == leaveBelt)
		for(var/datum/weather/siren_scan/R in SSweather.processing)
			R.wind_down()
		command_announcement.Announce("The Anomalous electromagnetic interference has ceased. Engineering inspections reccomended.", "Anomaly Alert", new_sound = 'zzzz_modular_occulus/sound/effects/The_Siren.wav')

/datum/event/siren_scan/proc/scanning()	//this proc locates players, and spawns a cluster of siren mobs mostly out of view on the ship.
	var/list/candidates = list()	//list of candidate keys
	for(var/mob/living/carbon/human/G in GLOB.player_list)
		if(G.mind && G.stat != DEAD && G.is_client_active(5) && !player_is_antag(G.mind))
			if(isOnStationLevel(G))
				candidates += G
	if(!candidates.len)
		return
	candidates -= used_candidates

	while(siren_anger > 0 && candidates.len)
		var/chosen = pick(candidates)
		SpawnSirenPod(chosen)
		used_candidates += chosen
		candidates -= chosen
		siren_anger--

/datum/event/siren_scan/proc/SpawnSirenPod(atom/origin)
	var/list/spawnTypes = pick_n_take(spawnLists)	//picking random mob out of the siren pod list
	var/attempts = 5	//Number of attempts to pick a tile on selected candidate
	while(attempts > 0)	//if it still has attempts,
		var/turf/picked = get_random_secure_turf_in_range(origin, 10, 7)	//picks initial turf in 10-7 tile range from candidate
		if(!(/mob/living/carbon/human in view(6,picked)))						//checks for humans within 6 tiles. Continue if none
			for(var/type in spawnTypes)										//for as long as there is type in spawntypes
				type = pick_n_take(spawnTypes)								//pick and remove mob from list is now 'type'
				var/spawnloc = get_random_secure_turf_in_range(picked,3,0)	// second rng'd turf in 3-0 tile range from initial picked turf
				if(!(/mob/living/carbon/human in view(4,picked)))						//checks for humans within 4 tiles. Continue if none
					if(type == /mob/living/simple_animal/hostile/siren/nemesis)
						log_and_message_admins("Nemesis Assault Strider Selected. Spawning at: [jumplink(spawnloc)]")	//BOSS MOB CHOSEN. BEWARE
						sleep(19 SECONDS)	//just in case the sound bite from the siren isn't finished yet
						command_announcement.Announce("WARNING: CLASS VII ENERGY SIGNAL BYPASSING SHIELDS. EXERCISE EXTREME CAUTION.", "Anomaly Alert", new_sound = 'zzzz_modular_occulus/sound/effects/IT_arrives.wav')	//warning
						new /obj/effect/temp_visual/nemesis_charge(spawnloc)		//creates a charge visual for it's entry point.
						coolentry(spawnloc)
						sleep(2 SECONDS)											//allows the crew to react to said entry
						do_sparks(3,0,spawnloc)										//creates sparks on second slected tile,
						new type(spawnloc)											//spawn a mob from list of mobs onto second tile.
					else
						do_sparks(3,0,spawnloc)										//creates sparks on second slected tile,
						new type(spawnloc)											//spawn a mob from list of mobs onto second tile.
				else
					attempts--														//reduce attempts number by 1 due to proximity of spawn

			break															//stops proc now that spawntypes no longer has any mobs in it.
		else																//if human mob within view
			attempts--														//reduce attempts number by 1

	if(attempts == 0)														//if out of attempts to find a spawn location,
		siren_anger++														//refunds the point because it failed to spawn anything
		return

/datum/event/siren_scan/end()
	used_candidates = list()

/datum/event/siren_scan/proc/coolentry(var/location)
	var/entryspot = location
	var/entryarea = get_area(entryspot)

	for(var/obj/machinery/power/apc/apc in entryarea)
		apc.overload_lighting()