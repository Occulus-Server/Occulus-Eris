/datum/power/occultist
	var/madnesscost = 5 // Cost for the occultist to evolve this power.
	var/activecost = 0
	var/verbpath //the verb we add if we add a verb

/datum/power/occultist/proc/addPower(var/mob/living/carbon/human/themaster)
	to_chat(themaster, "You focus your mind and discover [src]!")

// T1 Powers

//This first power is how we fix people bitching about how hard it is to get madness. Hope this helps! - Sigma
//Made 0 cost on okay of Jamini for the above purpose- Sigma
/datum/power/occultist/shrine
	name = "Shrine"
	desc = "Summons a totem that will slowly drain the sanity of all who observe it."
	madnesscost = 0
	activecost = 0 //3 Commenting this out for balance testing, see what happens. Make this 4-5 if we run into issues with it, currently trying something to make madness gain a little easier
	//The idea is that it doesn't cost any madness to make the totem but you need some roaches and a candle.
	verbpath = /mob/living/carbon/human/proc/Shrine

/mob/living/carbon/human/proc/Shrine()
	set category = "Occultist"
	set desc = "Craft a totem from five small roaches and a candle that shows the truth."

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot construct things while unconsious.")
		return
	if(spendpoints(0)) //Free, but needs stuff.
		var/list/stuff = src.loc.contents
		var/list/roaches = list() //Needs one roach of MOB_MEDIUM or higher or five roaches of MOB_SMALL or lower.
		var/large_roach = FALSE //For storing if we have a large roach or not
		var/obj/item/flame/candle/candle = null //Checking if we have a candle
		for(var/subject in stuff) //Check for roach
			if(istype(subject, /mob/living/carbon/superior_animal/roach))
				var/mob/living/carbon/superior_animal/roach/R = subject
				if(R.mob_size <= MOB_SMALL) //MOB_SMALL is 10, this checks for anything smaller than MOB_MEDIUM.
					roaches += R
				else if(R.mob_size >= MOB_MEDIUM) //MOB_MEDIUM is 20, this checks for anything MOB_MEDIUM or larger.
					roaches += R
					large_roach = TRUE
			if(istype(subject, /obj/item/flame/candle))
				candle = subject
		if(!large_roach && roaches.len < 5) //If we don't have 5 small or one large roach
			to_chat(src, "You need more roaches!") //Tell them they need more roaches.
			return
		if(!candle)
			to_chat(src, "You have the roaches, but need a candle!")
			return
		for(var/R in roaches)
			qdel(R)
		for(candle in stuff)
			qdel(candle)
		new /obj/machinery/occultist/totem(loc, usr) //If we have roaches and a candle, spawn it.
			//maker = usr //For claiming the madness points if a totem sees a breakdown.
		return
	else to_chat(src, "You lack the madness to craft a totem.")

/datum/power/occultist/voidmother_embrace
	name = "Embrace of the Voidmother"
	desc = "Permanently boosts your positive breakdown chance by 20%"

/datum/power/occultist/voidmother_embrace/addPower(var/mob/living/carbon/human/themaster)
	themaster.sanity.positive_prob += 20
	..()

/datum/power/occultist/riteofhealing
	name = "Rite of Healing"
	desc = "Heals you fully, at cost of a great deal of pain."
	verbpath = /mob/living/carbon/human/proc/RiteofHealing

/mob/living/carbon/human/proc/RiteofHealing()
	set category = "Occultist"
	set desc = "Recover our mortal coil"

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return

	heal_overall_damage(40,40)
	stun_effect_act(0, 150, BP_CHEST)
	visible_message(
		SPAN_DANGER("[src]'s flesh begins to hiss and bubble as their wounds mend!"),
		SPAN_DANGER("A wave of agony envelops you as your wounds begin to close!")
		)
	var/datum/effect/effect/system/smoke_spread/bad/smoke
	smoke = new
	smoke.attach(src)

	playsound(loc, 'sound/effects/smoke.ogg', 50, 1, -3)
	smoke.set_up(3, 0, src.loc)
	spawn(0)
		smoke.start()
		sleep(10)
		smoke.start()
		sleep(10)
		smoke.start()
		sleep(10)
		smoke.start()


/datum/power/occultist/horrifying
	name = "Horrifying Visage"
	desc = "Infuses you with the aspect of the ship itself, causing you to drain sanity from anyone that observes you."

/datum/power/occultist/horrifying/addPower(var/mob/living/carbon/human/themaster)
	themaster.sanity_damage += 5
	..()

/datum/power/occultist/vblade
	name = "Blade of the Voidmother"
	desc = "Transforms an oddity into a weapon for our cause."
	verbpath = /mob/living/carbon/human/proc/BladeoftheVoidmother

/mob/living/carbon/human/proc/BladeoftheVoidmother()
	set category = "Occultist"
	set desc = "Construct a weapon"

	var/obj/item/oddity/active = null
	if(get_active_hand())
		if(istype(get_active_hand(), /obj/item/oddity))
			active = get_active_hand()
			if(!active.oddity_stats)
				to_chat(src, "This oddity has no aspects to build a weapon from!")
				return
			var/list/LStats = active.oddity_stats
			var/obj/item/cultweaponchoice = pickweight(list(
				/obj/item/tool/sword/cult = (1 + LStats[STAT_ROB]),
				/obj/item/gun/projectile/automatic/sol/cult = (1 + LStats[STAT_VIG]),
				/obj/item/gun/energy/laser/cult = (1 + LStats[STAT_COG]),
				/obj/item/tool/hammer/homewrecker/cult= (1 + LStats[STAT_TGH]),
				/obj/item/gun/energy/plasma/cassad/cult = (1 + LStats[STAT_BIO]),
				/obj/item/tool/saw/chain/cult = (1 + LStats[STAT_MEC])))
			playsound(src.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 50, 1, -3)
			var/turf/T = get_turf(src)
			var/obj/effect/decal/cleanable/blood/writing/sign = new /obj/effect/decal/cleanable/blood/writing(T)
			sign.message = sanity.pick_quote_20()
			do_sparks(8, 0, T)
			cultweaponchoice = new cultweaponchoice(T)
			visible_message(
				SPAN_DANGER("[src] molds and twists the [active] like clay, transforming it into a [cultweaponchoice]!"),
				SPAN_DANGER("You mold and twist the [active] like clay, transforming it into a [cultweaponchoice]!")
				)
			drop_item()
			put_in_active_hand(cultweaponchoice)
			qdel(active)

		else
			to_chat(src, "You must hold an oddity in your active hand.")
	else
		to_chat(src, "You must hold an oddity in your active hand.")

/datum/power/occultist/amoung
	name = "Among Them"
	desc = "Causes roaches to see you as one of their own."

/datum/power/occultist/amoung/addPower(var/mob/living/carbon/human/themaster)
	themaster.faction = "roach"
	..()

// T2 Powers

/mob/living/carbon/human/proc/spendpoints(var/amount)
	for(var/obj/item/organ/internal/brain/occultist/O in src.contents)
		if(O.spendpoints(amount))
			return TRUE
		else
			return FALSE

/datum/power/occultist/tranquility
	name = "Tranquility"
	desc = "End a breakdown immediately"
	verbpath = /mob/living/carbon/human/proc/Tranquility
	activecost = 1

/mob/living/carbon/human/proc/Tranquility()
	set category = "Occultist"
	set desc = "Ends a Breakdown"

	if(sanity.breakdowns.len > 0)
		if(spendpoints(1))
			for(var/datum/breakdown/B in sanity.breakdowns)
				B.conclude()
				to_chat(src, "You excise some madness from yourself and end your breakdown.")
		else
			to_chat(src, "You lack enough madness to end your breakdown.")
	else
		to_chat(src, "You are currently sane...fix that.")

/datum/power/occultist/callswarm
	name = "Call Swarm"
	desc = "Calls a swarm of roaches to your location. They are not friendly to you."
	activecost = 1
	verbpath = /mob/living/carbon/human/proc/Call_Swarm

/mob/living/carbon/human/proc/Call_Swarm()
	set category = "Occultist"
	set desc = "Call a swarm to your location."

	if(spendpoints(1))
		playsound(src.loc, 'sound/voice/shriek1.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/voice/shriek1.ogg', 75, 1, 8, 8)
		//Playing the sound twice will make it sound really horrible
		visible_message(SPAN_DANGER("[src] emits a horrifying wail as nearby burrows stir to life!"))
		for (var/obj/structure/burrow/B in find_nearby_burrows())
			B.distress(TRUE)
	else
		to_chat(src, "You lack enough madness to summon a swarm.")

/datum/power/occultist/banish
	name = "Banish Swarm"
	desc = "Banishes all roaches within 15 tiles of you to the nearest burrow."
	activecost = 1
	verbpath = /mob/living/carbon/human/proc/Banish_Swarm

/mob/living/carbon/human/proc/Banish_Swarm()
	set category = "Occultist"
	set desc = "Banish nearby roaches from your location"

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return
	if(spendpoints(1))
		playsound(src.loc, 'sound/voice/hiss6.ogg', 75, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/voice/hiss6.ogg', 75, 1, 8, 8)
		//Playing the sound twice will make it sound really horrible
		visible_message(SPAN_DANGER("[src] emits a haunting scream as it turns to flee, taking the nearby horde with it...."))
		for (var/obj/structure/burrow/B in find_nearby_burrows())
			B.evacuate()
	else
		to_chat(src, "You lack enough madness to banish a swarm.")

/datum/power/occultist/vfaith
	name = "Faith of the Voidmother"
	desc = "Restores your sanity to full"
	activecost = 1
	verbpath = /mob/living/carbon/human/proc/Faith_of_the_Voidmother

/mob/living/carbon/human/proc/Faith_of_the_Voidmother()
	set category = "Occultist"
	set desc = "Steel your mind against the madness tugging at the back of your eyes. Not yet, not yet."

	if(spendpoints(1))
		src.sanity.level = 100
		to_chat(src, "You steel your mind against the dangers of the ship. This is not the path.")
	else
		to_chat(src, "You lack enough madness to restore your mind.")

/datum/power/occultist/wail
	name = "Unearthly Wail"
	desc = "Allows you to unleash a blood-curdling wail, draining sanity."
	activecost = 1
	verbpath = /mob/living/carbon/human/proc/Unearthly_Wail


/mob/living/carbon/human/proc/Unearthly_Wail()
	set category = "Occultist"
	set desc = "Channel the raw energies of the universe for a brief time."

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return
	if(spendpoints(1))
		playsound(src.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 75, 1, 8, 8)
		sleep(2)
		playsound(src.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 75, 1, 8, 8)
		sleep(2)
		playsound(src.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 75, 1, 8, 8)
		for(var/mob/living/carbon/human/targets in view(src))
			if(targets == src)
				continue
			else
				targets.sanity.level -= 25
				to_chat(targets, SPAN_DANGER("As [src] howls something claws at the edge of your mind!"))
				targets.hallucination(30,50)
	else
		to_chat(src, "You lack enough madness to channel this!")

/datum/power/occultist/darkness
	name = "Bring Darkness"
	desc = "Breaks all lights around you."
	activecost = 1
	verbpath = /mob/living/carbon/human/proc/Bring_Darkness

/mob/living/carbon/human/proc/Bring_Darkness()
	set category = "Occultist"
	set desc = "Remove the false safety of the light."

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return
	if(spendpoints(1))
		playsound(src.loc, 'sound/hallucinations/growl1.ogg', 25,1,8,8)
		var/area/A = get_area(src)
		for(var/obj/machinery/power/apc/apc in A)
			apc.overload_lighting()
		for(var/turf/T in A)
			if(prob(1))
				var/obj/effect/decal/cleanable/blood/writing/sign = new /obj/effect/decal/cleanable/blood/writing(T)
				sign.message = sanity.pick_quote_20()
			if(prob(5))
				var/obj/effect/decal/cleanable/blood/writing/sign = new /obj/effect/decal/cleanable/blood/writing(T)
				sign.message = sanity.pick_quote_40()
	else
		to_chat(src, "You lack enough madness to banish the light!")

/datum/power/occultist/rust
	name = "Rust"
	desc = "Causes one object in your hand to rust and become useless."
	activecost = 1
	verbpath = /mob/living/carbon/human/proc/Rust

/mob/living/carbon/human/proc/Rust()
	set category = "Occultist"
	set desc = "Diminish their tools."

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return
	if(spendpoints(1))
		if(src.get_active_hand())
			var/obj/A = src.get_active_hand()
			A.make_old()
		else
			to_chat(src, "You must hold an item in your active hand to destroy it.")
	else
		to_chat(src, "You lack the madness to destroy this item.")

/* //Commented out until I can figure out how the fuck walls work --Sigma 9/17/21 Update: Walls still a fuck. Someone else is going to have to decipher that.-Sigma 10/3/21 -- Update2: Can't figure this out 12-3-21
   //Materials are still the big fucking stupid. We're gonna need another way to get this to work. Maybe a tool that spawns walls on click?
/datum/power/occultist/builder
	name = "Unearthly Construction"
	desc = "Summons material to craft strange walls and floors."
	activecost = 2 //maybe make 1?
	verbpath = /mob/living/carbon/human/proc/Builder

/mob/living/carbon/human/proc/Builder()
	set category = "Occultist"
	set desc == "Construct a lair worthy of your madness."

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
	if(spendpoints(2))
		if(src.get_active_hand())
			//spawn strange material stack here, 120 should do it?
*/

//T3 Powers

/datum/power/occultist/kingofbeasts
	name = "King of Beasts"
	desc = "Sacrifice much of yourself to summon a kaiser roach and his escort to your location."
	activecost = 4
	madnesscost = 20
	verbpath = /mob/living/carbon/human/proc/King_of_Beasts

/mob/living/carbon/human/proc/King_of_Beasts()
	set category = "Occultist"
	set desc = "Bring forth an Emperor!"

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return
	if(spendpoints(4))
		src.stats.changeStat(STAT_TGH, -20)
		src.stats.changeStat(STAT_VIG, -20)
		src.stats.changeStat(STAT_ROB, -20)
		src.stats.changeStat(STAT_COG, -20)
		src.stats.changeStat(STAT_BIO, -20)
		src.stats.changeStat(STAT_MEC, -20)
		visible_message(
			SPAN_DANGER("[src] lets out a blood-curdling wail and drops to their knees as the ground quakes!"),
			SPAN_DANGER("You let out a cry to the bowls of the ship, sacrificing your skills to summon the emperor himself")
		)
		sleep(9)
		for(var/mob/M in range(10, src))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(src.loc, 'sound/voice/shriek1.ogg', 20, 1, 8, 8)
		sleep(9)
		for(var/mob/M in range(10, src))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(src.loc, 'sound/voice/shriek1.ogg', 60, 1, 8, 8)
		sleep(9)
		for(var/mob/M in range(10, src))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(src.loc, 'sound/voice/shriek1.ogg', 80, 1, 8, 8)
		sleep(9)
		for(var/mob/M in range(10, src))
			if(!M.stat && !isAI(M))
				shake_camera(M, 3, 1)
		playsound(src.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
		new /mob/living/carbon/superior_animal/roach/kaiser(src.loc)
		new /obj/spawner/mob/roaches/cluster(src.loc)
		new /obj/spawner/mob/roaches/cluster(src.loc)
		new /obj/spawner/mob/roaches/cluster(src.loc)
		return
	else
		to_chat(src, "You lack the four madness required to summon a Kaiser.")

/datum/power/occultist/truthinblood
	name = "Truth in Blood"
	desc = "Covers the ground around you in blood and gore."
	activecost = 1
	madnesscost = 20
	verbpath = /mob/living/carbon/human/proc/Truth_in_Blood

/mob/living/carbon/human/proc/Truth_in_Blood()
	set category = "Occultist"
	set desc = "Thin the veil, here!"

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return
	if(spendpoints(1))
		var/datum/effect/effect/system/smoke_spread/bad/smoke
		smoke = new
		playsound(loc, 'sound/effects/smoke.ogg', 50, 1, -3)
		new /obj/effect/gibspawner/human(src.loc, src.dna, src.species.flesh_color, src.species.blood_color)
		new /obj/effect/gibspawner/human(src.loc, src.dna, src.species.flesh_color, src.species.blood_color)
		new /obj/effect/gibspawner/human(src.loc, src.dna, src.species.flesh_color, src.species.blood_color)
		for(var/turf/simulated/floor/T in orange(5, src))
			if(prob(20))
				new /obj/effect/gibspawner/human(T, src.dna, src.species.flesh_color, src.species.blood_color)
				new /obj/effect/gibspawner/human(T, src.dna, src.species.flesh_color, src.species.blood_color)
				var/datum/effect/effect/system/smoke_spread/bad/smoke2
				smoke2 = new
				smoke2.set_up(3, 0, T)
				smoke2.attach(T)
				spawn(0)
					smoke.start()
		for(var/turf/simulated/floor/T in orange(7, src))
			if(prob(1))
				var/obj/effect/decal/cleanable/blood/writing/sign = new /obj/effect/decal/cleanable/blood/writing(T)
				sign.message = sanity.pick_quote_20()
				sign.color = src.species.blood_color
		smoke.set_up(3, 0, src.loc)
		smoke.attach(src)
		spawn(0)
			smoke.start()
			sleep(3)
			smoke.start()
			sleep(3)
			smoke.start()
			sleep(3)
			smoke.start()
	else
		to_chat(src, "You lack the four madness required to do this.")


/datum/power/occultist/embracecorruption
	name = "Embrace Corruption"
	desc = "Sacrifice yourself to bring about a true fusion of man and machine. This ability will activate as soon as you select it."
	madnesscost = 20

/datum/power/occultist/embracecorruption/addPower(var/mob/living/carbon/human/themaster)
	new /obj/machinery/hivemind_machine/node(themaster.loc)
	themaster.gib()

/datum/power/occultist/theskies
	name = "The Skies are Buried Deep"
	desc = "Reveals the truth to everyone who can see you."
	activecost = 4
	madnesscost = 20
	verbpath = /mob/living/carbon/human/proc/The_Skies


/mob/living/carbon/human/proc/The_Skies()
	set category = "Occultist"
	set desc = "Destroy the sanity of all around you."

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return
	if(spendpoints(4))
		playsound(src.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 75, 1, 8, 8)
		sleep(2)
		playsound(src.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 75, 1, 8, 8)
		sleep(2)
		playsound(src.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 75, 1, 8, 8)
		for(var/mob/living/carbon/human/targets in view(src))
			if(targets == src)
				continue
			else
				targets.sanity.level = 0
				to_chat(targets, SPAN_DANGER("Your vision blurs as [src] screams incomprehensibly!"))
				targets.hallucination(80,120)
	else
		to_chat(src, "You lack enough madness to channel this!")


/datum/power/occultist/bringdecay
	name = "Decay"
	desc = "Makes all objects on your person and in the inventory of your grabbed target rust and become useless."
	activecost = 1
	madnesscost = 20
	verbpath = /mob/living/carbon/human/proc/Bring_Decay

/mob/living/carbon/human/proc/Bring_Decay()
	set category = "Occultist"
	set desc = "Rust all the items in your grabbed target's inventory!"

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return
	if(get_grabbed_mob(src))
		if(spendpoints(1))
			var/mob/living/L
			L = get_grabbed_mob(src)
			for(var/obj/objects in L.contents)
				if(istype(objects, /obj/item/organ))
					continue
				if(istype(objects, /obj/parallax))
					continue
				if(istype(objects, /obj/item/grab))
					continue
				else
					objects.make_old()
					visible_message(
						SPAN_DANGER("[objects] rusts and decays!"),
					)
		else
			to_chat(src, "You lack the four madness required to do this.")
	else
		to_chat(src, "You must grab your target!")

/datum/power/occultist/underworld
	name = "Path to the Underworld"
	desc = "Teleport yourself and anyone grabbed by you to the under-tunnels."
	activecost = 1
	madnesscost = 20
	verbpath = /mob/living/carbon/human/proc/Path_to_the_Underworld

/mob/living/carbon/human/proc/Path_to_the_Underworld()
	set category = "Occultist"
	set desc = "Teleport to the under tunnels."

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return
	var/mob/living/L = get_grabbed_mob(src)			//Grab anyone we have grabbed
	var/turf/simulated/floor/target					//this is where we are teleporting
	var/list/validtargets = list()					//list of valid tiles to teleport to

	for(var/area/A in world)						//Clumbsy, but less intensive than iterating every tile
		if(istype(A, /area/deepmaint))				//First find our deepmaint areas
			for(var/turf/simulated/floor/T in A)	//Pull a list of valid floor tiles from deepmaint
				validtargets += T					//Add them to the list
	target = pick(validtargets)						//Now we pick a target

	do_sparks(1, 0, src)							//Visual feedback before the teleport
	src.forceMove(target)							//Moves the caster
	if(L)											//If we have a grabbed target
		do_sparks(1, 0, target)						//Visual feeback before the teleport
		L.forceMove(target)							//Moves the target
		do_sparks(1, 0, target)						//Visual feedback after the teleport
	do_sparks(1, 0, src)							//Visual feedback after the teleport
	src.weakened += 10								//Moving like this is stressful and stuns you for a time.

/datum/power/occultist/initiate
	name = "Rite of Initiation"
	desc = "Induct a new Occultist to our ranks."
	activecost = 4
	madnesscost = 20
	verbpath = /mob/living/carbon/human/proc/Rite_of_Initiation

/mob/living/carbon/human/proc/Rite_of_Initiation()
	set category = "Occultist"
	set desc = "Induct a new cultist."

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return
	if(get_front_mob(src))
		var/mob/living/carbon/human/L = get_front_mob(src)
		if(istype(L, /mob/living/carbon/human) && L.stat == CONSCIOUS)
			if(L.ckey)
				if(alert(L, "An alien presence touches your mind, offering you power and insight into the very fabric of reality. Do you accept its offer and become an Occultist?",
					"Become Occultist", "No", "Yes") != "Yes")
					to_chat(src, "The target refuses your gift!")
					return
				else
					if(spendpoints(4))
						visible_message(
							SPAN_WARNING("[src] grabs [L]! Old wounds rip open on [src] and begin pouring a dark liquid over [L] !"),
							SPAN_WARNING("You open your wounds, pouring your life essance over [L]")
						)
						if(do_after(src, 150 , incapacitation_flags = INCAPACITATION_DEFAULT))
							L.make_occultist()
							src.take_overall_damage(90)
							to_chat(src, "You sink down as the ritual completes.")
							to_chat(L, "Your mind is aflame with possibilities! You can see, you can SEE, YOU CAN SEE IT ALL!")
						else
							to_chat(src, "You must not move while performing the ritual. Madness lost!")
					else
						to_chat(src, "You lack the required four madness to initiate another.")


	else
		to_chat(src, "You must face your target!")

/datum/power/occultist/occarmor
	name = "Occult Garb"
	desc = "Summons a set of armor from somewhere that does not exist. It cannot be taken off. Worn non-uniform equipment will be lost."
	activecost = 1
	madnesscost = 15
	verbpath = /mob/living/carbon/human/proc/Occult_Garb

/mob/living/carbon/human/proc/Occult_Garb() //Replaces the current clothing and armor with the occult armor set.
	set category = "Occultist"
	set desc = "Don the Occult Armor set."

	if(stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(stat == UNCONSCIOUS)
		to_chat(src, "You cannot perform the rite while unconsious.")
		return

	//var/mob/carbon/human/living/occultist/O //Define the occultist using the power for message and replacement purposes.

	//This is not a pleasant process.
	playsound(src.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 50, 1, -3) //Same sound as the scream.
	visible_message(
		SPAN_DANGER("[src]'s flesh and clothing contort and shimmer, reforming into flowing, black and bronze robes!"),
		SPAN_DANGER("Your flesh and clothing meld painfully, shimmering out of this reality as they are replaced with a set of armored robes!")
		)
	//Start the replacement.
	//Feet
	to_chat(usr, SPAN_DANGER("Your feet and legs slough away, replaced with something stronger. Can you hear it underneath you?"))
	usr.replace_in_slot(new /obj/item/clothing/shoes/occultgreaves, slot_shoes, skip_covering_check = TRUE)

	//Chestpiece
	to_chat(usr, SPAN_DANGER("Your chest turns in on itself and expands. It needs to get out. Let it out."))
	usr.replace_in_slot(new /obj/item/clothing/suit/space/occultist, slot_wear_suit, skip_covering_check = TRUE)

	//Gloves
	to_chat(usr, SPAN_DANGER("Your fingers bend backwards until they pierce through the back of your hands. Can you feel it tugging at the corners of your brain?"))
	usr.replace_in_slot(new /obj/item/clothing/gloves/occultgloves, slot_gloves, skip_covering_check = TRUE)

	//Hood
	to_chat(usr, SPAN_DANGER("Your eyes have melted, now you can see. Tear open reality and release what is underneath."))
	usr.replace_in_slot(new /obj/item/clothing/head/space/occulthood, slot_head, skip_covering_check = TRUE)

/datum/power/occultist/monolith
	name = "Unnatural Sculpting"
	desc = "Craft a monolith to your madness and show others the truth."
	activecost = 0
	madnesscost = 10

/datum/power/occultist/monolith/addPower(var/mob/living/carbon/human/themaster)
	set category = "Occultist"
	set desc = "Summons a Monolith at your location."
	new /obj/machinery/occultist/monolith(themaster.loc)