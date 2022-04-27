//Stuff for the so-called bosstown dynamics update goes here, including the robot finder and stunning device

/obj/item/device/rodar //haha robot radar
	name = "\improper Mk.XIV Synthetic Entity Detector"
	desc = "This handy device emits a peculiar signal that pings various robots around the ship and forcibly reboots them, causing them to flock to certain areas that it can pinpoint.\
	Announces pinpointed locations over engineering comms."
	icon = 'zzzz_modular_occulus/icons/obj/device.dmi'
	icon_state = "dronelocatorv2"
	w_class = ITEM_SIZE_TINY
	price_tag = 20000 // One of a kind relic-tier price and tech levels
	origin_tech = list(TECH_DATA = 5, TECH_ENGINEERING = 5, TECH_MAGNET = 5)
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1, MATERIAL_STEEL = 5)
	spawn_blacklisted = TRUE
	var/cooldown = 20 MINUTES
	var/last_search = -20 MINUTES
	var/obj/item/device/radio/radio

/obj/item/device/rodar/New()
	..()
	//update_icon() //unused for the moment
	radio = new /obj/item/device/radio{channels=list("Engineering")}(src)

/obj/item/device/rodar/attack_self(mob/user)
	active_effect(user)

/obj/item/device/rodar/proc/active_effect(mob/user, alert = FALSE)
	if(world.time >= (last_search + cooldown))
		to_chat(user, SPAN_NOTICE("\The [src] starts searching the ship for unusual robotic signatures..."))
		last_search = world.time
		var/list/areanames = list() // list for storing the NAMES of the areas of spawnpoints
		var/num_areas = rand(3, 6) // how many areas should have spawn points?
		var/num_spawns_per_area = rand(1, 2) // how many spawnpoints should each area have?
		var/list/turf/targets = list() // list for storing the actual spawnpoints, the turfs they are in.
		var/list/coordinateslist = list() // list for storing the coordinate datums of the spawnpoints
		var/list/papertextoutput = list() // list for storing the human readable output of the coordinate datums
		for (var/i = 0; i < num_areas;i++) // while we still have num_areas to go through...
			var/area/A = random_maintenance_area(TRUE) // find a random area in maint
			var/turf/T = A.random_space() // find a random turf inside that random area that we just found
			targets.Add(T) // add that turf into our targets list
		for (var/turf/heck in targets) // for everything in our targets list...
			var/area/aaa = get_area(heck) // get the area of that turf
			areanames += strip_improper(aaa.name) // then get the name of the area of that turf
			coordinateslist.Add(new /datum/coords(heck)) // generate coordinate datums for the turf and add them to our coordinates list
			log_and_message_admins("EES SED sending hostile robots to [jumplink(heck)]") // admin log
			for(var/i = 1, i <= num_spawns_per_area,i++) // while we still have spawns to go through for this area...
				new /obj/spawner/mob/cluster/roombattler(heck) // spawn new spawners in the turf we chose
		radio.autosay("Synthetic entities detected at [english_list(areanames)]." , "Mk.XIV Synthetic Entity Detector", "Engineering")
		for (var/datum/coords/skree in coordinateslist) // while we still have stuff in our coordinates list...
			papertextoutput.Add(skree.get_text()) // convert the coordinates to a human readable format and add them to this handy dandy list
		new /obj/item/paper(user.loc, papertextoutput.Join("\n"), "SED Location Report") // finally, convert the list of human readable coordinates into a human readable form!
	else
		to_chat(user, SPAN_WARNING("The [src] needs time to recharge!"))

/proc/random_maintenance_area(var/filter_players = FALSE) //literally just random_ship_area but modified to only look for maintenance areas
	var/list/possible = list()
	for(var/Y in ship_areas)
		var/area/A = Y

		if (!A.is_maintenance)
			continue

		if(filter_players)
			var/should_continue = FALSE
			for(var/mob/living/carbon/human/H in GLOB.human_mob_list)
				if(!H.client)
					continue
				if(A == get_area(H))
					should_continue = TRUE
					break

			if(should_continue)
				continue

		possible += A

	return pick(possible)

/obj/item/paper/eessed
	name = "paper - 'EES Memorandum 1R-1574'"
	info = {"As per Memorandum 5A-8994, the robotic entities that have been procured by management are to be recovered or otherwise liquidated effective immediately.
	The usage of the Mk.XIV device will be instrumental in carrying out this task. The wherewithal to support any and all relevant staff that can assist in this endeavour may be freely dispensed."}
