/obj/machinery/occultist/totem
	name = "improper totem"
	desc = "A basic totem of an outer god. Ahelp if you see this."
	icon = 'zzzz_modular_occulus/icons/turf/occult/totems.dmi'
	icon_state = "totem1"
	density = TRUE
	use_power = NO_POWER_USE
	unacidable = 1
	anchored = TRUE
	var/maker = /mob/living/carbon/human
	var/builder //for holding the builder of the totem for seeing sanity later?
	var/sanrestore = 10 //How much sanity is restored to non-occultists who watch this thing getting taken apart?
	var/desclore //For holding the lore portion of the description
	var/decontime //For holding the time that the totem takes to be deconstructed
	var/descdecon //Holding the decon portion of the description
	var/list/timelist = list(\
		WORKTIME_NEAR_INSTANT,
		WORKTIME_FAST,
		WORKTIME_NORMAL,
		WORKTIME_SLOW\
		)//Randomly chosen on New how long it takes to take it down. Some are harder than others.
	var/deconqual //The quality required to be able to deconstruct the totem.
	var/list/deconlist = list(\
		QUALITY_BOLT_TURNING,
		QUALITY_CUTTING,
		QUALITY_DRILLING,
		QUALITY_HAMMERING,
		QUALITY_PRYING,
		QUALITY_PULSING,
		QUALITY_SAWING,
		QUALITY_SCREW_DRIVING,
		QUALITY_WELDING,
		QUALITY_WIRE_CUTTING\
		)//A list of qualities for random deconstruction requirements. These things are WEIRD so they should have strange things like pulsing.
	var/partsamount
	var/list/blacklist = list(/material/resin, /material/voxalloy, /material/plastic/holographic, /material/wood/holographic)//A blacklist of materials we don't want spawning, minus the padding because that's handled on deconstruction
	var/list/partslist //A list of parts for random choosing when it's time to deconstruct.

/obj/machinery/occultist/totem/New(mob/living/carbon/human/creator)
	maker = creator //Set the owner for remote madness generation
	//Pick a name!
	name = pick(\
		"\proper the unsettling question",
		"\proper the unbound sky",
		"\proper the thing in the corner of your eye",
		"\proper the shadow standing behind you",
		"\proper the smallest infinity",
		"\proper the greatest nothingness"
		"\proper the blood-blister upon spacetime",
		"\proper the melody of a blue space",
		"\proper the scent of water on smoke"\
		)

	//The next thing we need to do is pick the tool quality that can deconstruct it.
	deconqual = pick(deconlist)
	if(deconqual == QUALITY_BOLT_TURNING)
		descdecon = "It looks like it's haphazardly bolted together."
	if(deconqual == QUALITY_CUTTING)
		descdecon = "It's bound together by some thick cord."
	if(deconqual == QUALITY_DRILLING)
		descdecon = "You might need to drill the joins apart."
	if(deconqual == QUALITY_HAMMERING)
		descdecon = "The joins look particularly weak. Smashing them might help."
	if(deconqual == QUALITY_PRYING)
		descdecon = "A prybar might be able to pop this apart."
	if(deconqual == QUALITY_PULSING)
		descdecon = "It's held together by some electronic mechanism."
	if(deconqual == QUALITY_SAWING)
		descdecon = "The frame looks thin. A saw might help."
	if(deconqual == QUALITY_SCREW_DRIVING)
		descdecon = "There are very obvious screws holding the whole thing together."
	if(deconqual == QUALITY_WELDING)
		descdecon = "It's poorly welded together."
	if(deconqual == QUALITY_WIRE_CUTTING)
		descdecon = "Wire holds the structure together."

	//Pick a lore blurb for the desc. The rest of the desc will be settled later.
	desclore = pick(\
		"Are you the real you? Or are you someone else?",
		"Sometimes the mind is too free.",
		"This wasn't here a second ago.",
		"It shimmers and contorts unnaturally.",
		"How do you cure someone of their madness without curing them of their identity?",
		"The first step towards freedom is death.",
		"Your bones hum in harmony with the rumbling of the ship. Let them out.",
		"It moves when it thinks you aren't looking at it.",
		"There is a hole in your head where your mind should be, but you don't feel any different.",
		"Is belief the key? It- no, it's too late for it to matter."\
		)
	//Now we slap the description together. First the lore then how to take it apart.
	desc = "[desclore] [descdecon]"

//Set the look. Put these in zzzz_modular_occulus/icons/turf/occultist/misc.dmi
	icon_state = pick(\
		"totem",
		"totem2",
		"totem3",
		"totem4",
		"totem5",
		"totem6"\
		)
	decontime = pick(timelist)

// This block is supposed to spawn random materials on deconstruction but I can't get the place_sheet proc to work. If someone can get it to work, comment out the above block.
/*
//Now we set what happens when it'll be dismantled, picking a few random materials and amounts of them.
	partslist = subtypesof(/material) //Now we set up the list of parts that it can drop.
	partslist -= blacklist //remove everything on the blacklist
	for(var/material/part in partslist)//This removes things like carpet and padding shards.
		if(part.flags && part.flags & MATERIAL_PADDING)
			partslist -= part
	partsamount = rand(1, 3) //Randomize the number of types of parts that we drop
	for(var/i = 0, i < partsamount, i++)
		var/material/material = pick(partslist) //Pick something from parts list
		var/number = rand(1,3)
		component_parts += material.place_sheet(src, amount=(rand(1,3))) //Add the stack of the material that we just made to the list of parts
		component_parts += pick(partslist)
*/

	//Now the processing object that allows them to damage sanity below environmental sanity cap. These aren't things you get used to. This gets destroyed on deconstruction.
	START_PROCESSING(SSmachines, src)
	return ..(init)

/obj/machinery/occultist/totem/attackby(obj/item/I, mob/user)
	var/tool_type = I.get_tool_type(user, list(deconqual), src) //Get the tooltypes on the tool used to dismantle it
	if(tool_type == deconqual) //Check to see if we're using the right tooltype. Need target.deconqual?
		if(I.use_tool(user, src, decontime, tool_type, FAILCHANCE_ZERO))
			to_chat(user, SPAN_NOTICE("You dismantle the strange totem."))
			STOP_PROCESSING(SSmachines, src) //Destroy the associated processing object to stop the san damage.
			for(var/mob/living/carbon/human/viewer in view(src))
				if(viewer.mind && player_is_antag_id(viewer.mind, ROLE_OCCULTIST))//does not have an occultist organ, they shouldn't heal from their own totems being destroyed
					return
				else viewer.sanity.changeLevel(sanrestore) //Add sanity for taking apart that monstrosity.
			/* This block is to be reenabled when we get actual randomized scrap working.
			for(var/obj/P in component_parts)
				P.forceMove(loc)
				component_parts -= P
				*/
			qdel(src)
			return
	else to_chat(user, SPAN_NOTICE("Your tool bends away from the totem unnaturally."))

//The processing object to handle sanity lowering below the environmental cap.
/obj/machinery/occultist/totem/Process()
	for(var/mob/living/carbon/human/H in view(src.loc))
		H.sanity.insight += 0.05 //Insight yes-yes
		H.sanity.level -= 5
		H.sanity.environment_cap_coeff = 0 //No environmental cap
		//todo: add creepy muttering and other spoopy sound effects that play at random?


/obj/machinery/occultist/monolith //A massive grandiose centerpiece to an occultist's lair.
	name = "improper monolith"
	desc = "A basic monolith to something that never existed. Ahelp if you see this."
	icon = 'zzzz_modular_occulus/icons/turf/occult/totems.dmi'
	icon_state = "kubrick"
	density = TRUE	//no walking through this
	use_power = NO_POWER_USE //not a machine proper, like the nuke
	unacidable = 1 //yeah we don't want it getting eaten, only one spawnable per occultist per round
	anchored = TRUE
	var/cooldown = 20 MINUTES //For the touch verb. 20 minutes in ticks is 20,000
	var/recharge = 0 //for storing recharge times
	var/charge = 1
	var/chargemax = 1 //max number of charges stores
	var/chargerate = 1 //number of charges gained per charging process

/obj/machinery/occultist/monolith/New() //hooboy, these are gonna get complicated.
	..()
	//First we handle names.
	var/namelist = list( //Here, we define a list of random kinda creepy names. If you wanna add one, follow the "a/an strange oxymoron thing" formula, or as close as you can for consistency
		"\proper a thing a quiet madness made",
		"\proper a beautiful oblivion",
		"\proper a question thirty AU deep",
		"\proper an answer without a question",
		"\proper a curiosity of a lonely god",
		"\proper a slow and sudden death",
		"\proper a periscope into a deeper reality",
		"\proper an echo of a forgotten truth",
		"\proper a fearful memory of a pleasant day"
		)
	var/namelist_lore = list( //Then define a list of names that have lore significance to the server. We do this so we can attach proper lore in the desc later.
		"\proper a vessel-shaped hole",
		"Avimelech",
		"THE SKIES",
		"OBJECT/NAME"
		)
	var/masterlist = list(namelist, namelist_lore)

	var/namepick = pick(masterlist) //Roll a name! Then store this in a var so we can get the proper descriptions later.
	if(namepick == namelist) //If we rolled a random, nonlore name, cool. We just attach a random generic description.
		name = pick(namelist)
	if(namepick == namelist_lore) //If we rolled a lore name, we'll need this, which is why we've stored it in a var.
		name = pick(namelist_lore)

	//Now we handle descriptions.
	var/desc_gen = list( //Generic descriptions. If the name is on the lore list, we instead use a set one. Add to these if you want, but keep the eye/seeing theme that Occultist has developed
		"What is left after the end.",
		"Useless. Everything and everyone is useless in the grand scheme. Especially you.",
		"It feels wrong. All of this is wrong. You should not be here.",
		"It is inevitable, and that doesn't make you feel any better.",
		"Your eyes see only what you want them to see. Peel them away and look beneath.",
		"Your senses protect you from what reality really is. Embrace nothingness and become whole."
		)
	if(namepick == namelist) //If we've got a generic name, get a generic description.
		desc = pick(desc_gen)
	if(namepick == namelist_lore) //If we have a lore-important name, give it the lore-accurate description. Thank you Aerodynamique/Bear!
		if(name == "\proper a vessel-shaped hole")
			desc = "A pool-shaped hole where your life will arrive and disappear. Despite the fact there is nothing here, it doesn't matter; \
			 the objects matter much less than the holes they occupy. This would be comforting, if only you understood."
		if(name == "Avimelech")
			desc = "It was so beautiful, once. It believed so strongly in the idealism that rested in all living things; it was your greatest ally. \
			And this is how you repay a lost soul trying to get home?"
		if(name == "THE SKIES")
			desc = "THE SKIES ARE BURIED DEEP, AND WHAT IS ABOVE AWAITS BELOW, IF ONLY YOU COULD DRILL THROUGH HELL."
		if(name == "OBJECT/NAME")
			desc = "As the world closes and opens again, the only thing you will carry is the knowledge of death and dreams."

	icon_state = pick(\
		"kubrick",
		"orb",
		"hellraiser",
		"kozilekeye",
		"eye"\
		) //Set the look. Put these in zzzz_modular_occulus/icons/turf/occultist/misc.dmi. Readd poduim when it doesn't look like a blob -Sigma

//Can't make this find the owner of the sanity thing where the breakdown spawns. It's giving a "can't find owner" runtime on click. Undefined var in breakdowns.dm, 407, 307, 47, 53
//The above is still current as of 10/14/21, why does nothing make sense here -Sigma
//Todo: add sound effects!

/obj/machinery/occultist/monolith/attack_hand(mob/user as mob)
	if(charge > 0) //Can we activate?
		charge-- //Subtract the charge
		for(var/mob/living/carbon/human/viewer in view(src.loc)) //Track all things looking at it.
			if(viewer.mind) //If they have a brain
				if(player_is_antag_id(viewer.mind, ROLE_OCCULTIST)) //And are not an antag
					to_chat(user, SPAN_DANGER("Your touch causes occult energies to flare to life, stabbing into the minds of others!")) //Occultist won't break down from this, it's their madness.

				//Delete the following block if you're able to get the negative breakdown to work.
				else
					viewer.sanity.level -= viewer.sanity.level //This should set sanity to 0 on click regardless of amount. I hate this. There is a better way to do this but I don't know how.

				/*The following block is not actually causing the breakdown to affect the person. I don't know how to solve this. It only ever creates an unknown owner error or
				  the beakdown doesn't happen at all. If someone can fix this, please do so. -Sigma, 10/08/21 -- Update: Still broken as of 11/19/21
				  Update: still broken as of 12/3/21
				//The following is causing two breakdowns, not one. Not sure why. I think this is okay though because it can only happen once every twenty minutes?
				else
					var/list/possible_results = subtypesof(/datum/breakdown/negative) //We want only negatives here. Maybe have it remove the absolute most hated?
					to_chat(user, SPAN_DANGER("As [user] touches the object, your mind is assaulted by occult energies!"))

					while(possible_results.len)//Now we loop through every negative and hit the first applicable one we come across
						var/datum/breakdown/B = pick_n_take(possible_results) //We pull it from the list
						var/datum/breakdown/K = new B(viewer) //Make a new breakdown of type we picked.
						if(!K.can_occur()) //If it can't occur, kill the new breakdown we made
							qdel(K)
							continue
						if(K.occur()) //If it can, hit the poor sod with it and stop //Maybe rewrite this block so that it actually works?
							break
					*/

		recharge = (world.time + cooldown) //Set recharge. It'll be 12000 ticks from when it's activated.
		START_PROCESSING(SSmachines, src) //Add this to the processing objects to check for later.
	else if(charge == 0) //Working, but sec is coming out the same as min for some reason.
		var/min //Storage for the use message: minutes.
		//var/sec //Storage for the use message: seconds. Currently defaults to the value of var/min and I don't know why.
		var/time //Use this to figure out min and sec

		time = ((recharge - world.time)/10) //Determine how long is actually left on the recharge and turn it into seconds.
		min = (FLOOR((time/60), 1)) //Turn the time var into minutes. We don't round this because it's just for display, the seconds come later.
		//sec = (round((min % time), 0.1)) //seconds are stupid, figure this out later.

		to_chat(user, SPAN_NOTICE("Even an insane mind realizes the danger in delving too deep too quickly. Wait [min] minutes for your mind to steel itself once more."))
			//Todo: add "and [sec] seconds" after "minutes" in the description once it's checking seconds correctly. Currently it's just outputting minutes again. -Sigma 10-4-21

	else if(charge < 0) //debug in case this breaks.
		to_chat(user, SPAN_NOTICE("This shouldn't happen, you've got fewer than 0 charges in the monolith, ahelp."))

/obj/machinery/occultist/monolith/Process()
	if((recharge < world.time) && (charge < chargemax)) //Is the recharge delay lapsed and do we have fewer than max charges?
		charge = CLAMP((charge + chargerate), 0, chargemax) //Make sure we don't recharge past 1 charge (chargemax) by accident
		if(charge == chargemax)
			STOP_PROCESSING(SSmachines, src) //remove it from processing when it's done