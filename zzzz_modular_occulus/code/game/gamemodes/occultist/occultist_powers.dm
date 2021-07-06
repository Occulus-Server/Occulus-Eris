/datum/power/occultist
	var/madnesscost = 10 // Cost for the occultist to evolve this power.
	var/activecost = 0
	var/verbpath //the verb we add if we add a verb

/datum/power/occultist/proc/addPower(var/mob/living/carbon/human/themaster)
	to_chat(themaster, "You focus your mind and discover [src]!")

// T1 Powers

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

	var/obj/item/weapon/oddity/active = null
	if(get_active_hand())
		if(istype(get_active_hand(), /obj/item/weapon/oddity))
			active = get_active_hand()
			if(!active.oddity_stats)
				to_chat(src, "This oddity has no aspects to build a weapon from!")
				return
			var/list/LStats = active.oddity_stats
			var/obj/item/weapon/cultweaponchoice = pickweight(list(
				/obj/item/weapon/tool/sword/cult = (1 + LStats[STAT_ROB]),
				/obj/item/weapon/gun/projectile/automatic/sol/cult = (1 + LStats[STAT_VIG]),
				/obj/item/weapon/gun/energy/laser/cult = (1 + LStats[STAT_COG]),
				/obj/item/weapon/tool/hammer/homewrecker/cult= (1 + LStats[STAT_TGH]),
				/obj/item/weapon/gun/energy/plasma/cassad/cult = (1 + LStats[STAT_BIO]),
				/obj/item/weapon/tool/saw/chain/cult = (1 + LStats[STAT_MEC])))
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
		playsound(src.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
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

	if(spendpoints(1))
		playsound(src.loc, 'sound/voice/hiss6.ogg', 100, 1, 8, 8)
		spawn(2)
		playsound(src.loc, 'sound/voice/hiss6.ogg', 100, 1, 8, 8)
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
	set desc = "Banish nearby roaches from your location"

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

	if(spendpoints(1))
		playsound(src.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 100, 1, 8, 8)
		sleep(2)
		playsound(src.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 100, 1, 8, 8)
		sleep(2)
		playsound(src.loc, pick('sound/hallucinations/wail.ogg','sound/hallucinations/veryfar_noise.ogg','sound/hallucinations/far_noise.ogg'), 100, 1, 8, 8)
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

	if(spendpoints(1))
		if(src.get_active_hand())
			var/obj/A = src.get_active_hand()
			A.make_old()
		else
			to_chat(src, "You must hold an item in your active hand to destroy it.")
	else
		to_chat(src, "You lack the madness to destroy this item.")


//T3 Powers

/datum/power/occultist/kingofbeasts
	name = "King of Beasts"
	desc = "Sacrifice much of yourself to summon a kaiser roach and his escort to your location."
	activecost = 4
	madnesscost = 40
	verbpath = /mob/living/carbon/human/proc/King_of_Beasts

/mob/living/carbon/human/proc/King_of_Beasts()
	set category = "Occultist"
	set desc = "Bring forth an Emperor!"

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
	activecost = 4
	madnesscost = 40
	verbpath = /mob/living/carbon/human/proc/Truth_in_Blood

/mob/living/carbon/human/proc/Truth_in_Blood()
	set category = "Occultist"
	set desc = "Thin the veil, here!"
	if(spendpoints(4))
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
	madnesscost = 40

/datum/power/occultist/embracecorruption/addPower(var/mob/living/carbon/human/themaster)
	new /obj/machinery/hivemind_machine/node(themaster.loc)
	themaster.gib()

/datum/power/occultist/underworld
	name = "Path to the Underworld"
	desc = "Teleport yourself and anyone grabbed by you to the under-tunnels."
	activecost = 4
	madnesscost = 40

/datum/power/occultist/theskies
	name = "The Skies are Buried Deep"
	desc = "Reveals the truth to everyone who can see you."
	activecost = 4
	madnesscost = 40

/datum/power/occultist/decay
	name = "Decay"
	desc = "Makes all objects on your person and in the inventory of your grabbed target rust and become useless."
	activecost = 4
	madnesscost = 40

/datum/power/occultist/initiate
	name = "Rite of Initiation"
	desc = "Induct a new Occultist to our ranks."
	activecost = 4
	madnesscost = 40