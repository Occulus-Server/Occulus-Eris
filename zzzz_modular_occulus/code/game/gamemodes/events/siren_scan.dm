/*
	Radiation storm is a really severe event that forces everyone to flee into maintenance or a similar
	shielded area. Anyone caught outside a shielded area will recieve lethal doses of radiation,
	and will die without medical attention
*/
/datum/storyevent/siren_scan
	id = "siren_scan"
	name = "Siren scan"


	event_type = /datum/event/siren_scan
	event_pools = list(EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE)

	tags = list(TAG_SCARY, TAG_COMMUNAL)



/datum/event/siren_scan	//The siren calls
	var/const/enterBelt		= 20
	var/const/scanInterval 	= 5
	var/const/leaveBelt		= 60
	var/const/revokeAccess	= 70
	startWhen				= 2
	announceWhen			= 1
	endWhen					= revokeAccess
	var/postStartTicks 		= 0
	var/list/spawnLists
	//two_part = 1
	//ic_name = "radiation"

/datum/event/siren_scan/announce()
	command_announcement.Announce("Anomalous electromagnetic interference detected approaching ship. Interference expected to bypass shields, effects unknown.", "Anomaly Alert", new_sound = 'sound/misc/interference.ogg')

/datum/event/siren_scan/proc/runThisOnEventStartup()
	spawnLists = list()
	spawnLists += list(/mob/living/simple_animal/hostile/siren/replicant, /mob/living/simple_animal/hostile/siren/replicant,/mob/living/simple_animal/hostile/siren/replicant)
	spawnLists += list(/mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/composer,/mob/living/simple_animal/hostile/siren/composer)
	spawnLists += list(/mob/living/simple_animal/hostile/siren/conservator, /mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator)
	spawnLists += list(/mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/replicant, /mob/living/simple_animal/hostile/siren/replicant)
	spawnLists += list(/mob/living/simple_animal/hostile/siren/composer, /mob/living/simple_animal/hostile/siren/replicant)
	spawnLists += list(/mob/living/simple_animal/hostile/siren/conservator,/mob/living/simple_animal/hostile/siren/conservator, mob/living/simple_animal/hostile/siren/augmentor, /mob/living/simple_animal/hostile/siren/composer)

/datum/event/siren_scan/start()
	SSweather.run_weather(/datum/weather/siren_scan)
	runThisOnEventStartup()

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










/datum/event/siren_scan/proc/PickSirenPod(var/mob/candidate)
	var/list/spawnTypes = spawnLists[rand(0,spawnLists.len-1)]
	SpawnSirenPodInRange(candidate,10,7,spawnTypes)








/datum/event/siren_scan/proc/SpawnSirenPodInRange(atom/origin,outer_range,inner_range,list/types)
	for(var/type in types)
		var/turf/picked = get_random_secure_turf_in_range(origin,10,7)
		type = spawnTypes
		new type(picked)

/datum/event/siren_scan/proc/scanning()	//this proc will eventually be made to locate any players, and spawn a cluster of siren mobs out of view on the ship. Not needed for the event tho.


	var/list/candidates = list()	//list of candidate keys
	for(var/mob/living/carbon/human/G in GLOB.player_list)
		if(G.mind && G.stat != DEAD && G.is_client_active(5) && !player_is_antag(G.mind))
			if(isOnStationLevel(G))
				candidates += G
	if(!candidates.len)
		return
	candidates = shuffle(candidates)//Incorporating Donkie's list shuffle

	var/list/used_sirenpod = list()
	var/list/used_candidates = list()
	var/siren_anger = rand(2, 4)
	while(siren_anger > 0 && candidates.len)

		PickSirenPod(candidates[1])
		used_candidates += candidates[1]
		candidates.Remove(candidates[1])
		siren_anger--

/datum/event/siren_scan/end()

