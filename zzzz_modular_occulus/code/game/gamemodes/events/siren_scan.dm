/*
	Radiation storm is a really severe event that forces everyone to flee into maintenance or a similar
	shielded area. Anyone caught outside a shielded area will recieve lethal doses of radiation,
	and will die without medical attention
*/
/datum/storyevent/siren_scan
	id = "siren_scan"
	name = "siren_scan"


	event_type = /datum/event/siren_scan
	event_pools = list(EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE)

	tags = list(TAG_SCARY, TAG_COMMUNAL)



/datum/event/siren_scan
	var/const/enterBelt		= 20
	var/const/radIntervall 	= 5
	var/const/leaveBelt		= 60
	var/const/revokeAccess	= 70
	startWhen				= 2
	announceWhen			= 1
	endWhen					= revokeAccess
	var/postStartTicks 		= 0
	//two_part = 1
	//ic_name = "radiation"

/datum/event/siren_scan/announce()
	command_announcement.Announce("Anomalous electromagnetic interference detected approaching ship. Interference expected to bypass shields, effects unknown.", "Anomaly Alert", new_sound = 'sound/misc/interference.ogg')

/datum/event/siren_scan/start()
	SSweather.run_weather(/datum/weather/siren_scan)

/datum/event/siren_scan/tick()
	if(activeFor == enterBelt)
		command_announcement.Announce("The Anomalous electromagnetic interference has reached the ship. Unable to determine source.", "Anomaly Alert", new_sound = 'zzzz_modular_occulus/sound/effects/The_Siren.wav')
		scanning()
		for(var/datum/weather/siren_scan/R in SSweather.processing)
			R.start()

	if(activeFor >= enterBelt && activeFor <= leaveBelt)
		postStartTicks++

	if(postStartTicks == radIntervall)
		postStartTicks = 0
		scanning()

	else if(activeFor == leaveBelt)
		for(var/datum/weather/siren_scan/R in SSweather.processing)
			R.wind_down()
		command_announcement.Announce("The Anomalous electromagnetic interference has ceased. Engineering inspections reccomended.", "Anomaly Alert", new_sound = 'zzzz_modular_occulus/sound/effects/The_Siren.wav')

/datum/event/siren_scan/proc/scanning()	//this proc will eventually be made to locate any players, and spawn a cluster of siren mobs out of view on the ship. Not needed for the event tho.
/*	for(var/mob/living/carbon/C in GLOB.living_mob_list)
		var/area/A = get_area(C)
		if(!A)
			continue
		if(!(A.z in GLOB.maps_data.station_levels))
			continue
		if(A.flags & AREA_FLAG_RAD_SHIELDED)
			continue

		if(istype(C,/mob/living/carbon/human))
			var/mob/living/carbon/human/H = C
			H.apply_effect((rand(15,30)),IRRADIATE)
			if(prob(4))
				H.apply_effect((rand(20,60)),IRRADIATE)
				if (prob(max(0, 100 - H.getarmor(null, ARMOR_RAD))))
					if (prob(75))
						randmutb(H) // Applies bad mutation
					else
						randmutg(H) // Applies good mutation
					domutcheck(H,null,MUTCHK_FORCED)
*/
/datum/event/siren_scan/end()

