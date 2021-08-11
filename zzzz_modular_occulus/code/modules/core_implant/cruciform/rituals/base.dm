// Dump general Litanies exclusive to Occulus here!

//OVERRIDES: Let's just buff some of the basic litanies by reducing their cost

/datum/ritual/cruciform/base/relief
	power = 25

/datum/ritual/cruciform/base/soul_hunger
	power = 35
	desc = "Litany of piligrims, helps stave off hunger by generating nutrition at the cost of generating considerable amounts of toxins in the user's bloodstream."

//NEW STUFF: New shiny litanies! (haha who am i kidding its just going to be copypasta)

/datum/ritual/cruciform/occulus
	name = "utility litanies"
	phrase = null
	desc = ""
	category = "Utility"

// Literally just a port of the agrolyte litany from upstream, but made general. Placed here for sorting reasons.

/datum/ritual/cruciform/base/absolution
	name = "Eternal Gasp"
	phrase = "Surge et ambula"
	desc = "Stabilizes the health of a person in front of you. Equivalent to Inaprovaline autoinjectors. Works instantly so long as the target is directly in front of you."
	power = 35

/datum/ritual/cruciform/base/absolution/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)
	var/mob/living/carbon/human/T = get_front_human_in_range(user, 1)
	if(!T)
		fail("No target in front of you.", user, C)
		return FALSE

	to_chat(T, SPAN_NOTICE("You feel a soothing sensation in your veins."))
	to_chat(user, SPAN_NOTICE("You stabilize [T.name]'s health."))

	var/datum/reagents/R = new /datum/reagents(20, null)
	R.add_reagent("inaprovaline", 10)
	R.add_reagent("dexalin", 10)
	R.trans_to_mob(T, 20, CHEM_BLOOD)

	return TRUE

// This pain relief works on ANYONE!

/datum/ritual/cruciform/base/relief_other
	name = "Reprieve"
	phrase = "Domine, da mihi potestatem iis doloribus"
	desc = "Relieve a person of their agony, even if they are not a disciple. Requires the user to touch the target. Drastically more effective than Relief, about equivalent to one dose of Tramadol. Consumes nutrition when performed."
	power = 40

/datum/ritual/cruciform/base/relief_other/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)

	var/mob/living/carbon/human/H = get_victim(user)

	if(!istype(H))
		fail("Target not found.",user,C,targets)
		return FALSE

	//Checking turfs allows this to be done in unusual circumstances
	var/turf/T = get_turf(user)
	if (!(T.Adjacent(get_turf(H))))
		to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
		return

	user.visible_message("[user] places their hands upon [H] and utters a prayer.", "You lay your hands upon [H] and begin speaking the words of Relief.")
	if (do_after(user, 40, H, TRUE))
		T = get_turf(user)
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return
		log_and_message_admins("soothed [H]'s pain with the Reprieve litany")
		to_chat(H, "<span class='info'>A numbing sensation bathes you, soothing your agony.</span>")
		user.nutrition -= 50
		H.add_chemical_effect(CE_PAINKILLER, 50)	// Fuggit, lets make it a lot more effective. Basically doesn't do jack otherwise.
		return TRUE

/*
Soul hunger except it works on anyone!
*/

/datum/ritual/cruciform/base/saturation
	name = "Saturation"
	phrase = "Honoribus eos persequi, quod panem et vinum fides nostra"
	desc = "Stave off the hunger of an adjacent person, even if they are not a disciple. Requires the user to touch the target. The user will experience some mild toxicity."
	power = 50

/datum/ritual/cruciform/base/saturation/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)

	var/mob/living/carbon/human/H = get_victim(user)

	if(!istype(H))
		fail("Target not found.",user,C,targets)
		return FALSE

	//Checking turfs allows this to be done in unusual circumstances
	var/turf/T = get_turf(user)
	if (!(T.Adjacent(get_turf(H))))
		to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
		return

	user.visible_message("[user] places their hands upon [H] and utters a prayer", "You lay your hands upon [H] and begin speaking the words of Soul Hunger.")
	if (do_after(user, 40, H, TRUE))
		T = get_turf(user)
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach."))
			return
		log_and_message_admins("soothed [H]'s pain with the Reprieve litany")
		to_chat(H, "<span class='info'>A warm sensation washes over you, and you feel less malnourished!</span>")
		H.nutrition += 125	//Sliiightly more gain than regular soul hunger
		user.adjustToxLoss(10) //Toxloss is borne by the caster!
		return TRUE

/*
Let there be light! Makes you glow for 5 minutes at a time.
*/

/datum/ritual/cruciform/occulus/enkindle
	name = "Enkindle"
	phrase = "Domine salva nos de tenebris lucem in perditis rebus fiat"
	desc = "Causes you, and if present, someone grabbed by you, to start profusely glowing. Lasts five minutes. Consumes nutrition and is mildly toxic to the user."	//Contact a doctor if glow persists for more than 4 hours.
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	effect_time = 5 MINUTES
	cooldown_category = "glow"
	power = 50

/datum/ritual/cruciform/occulus/enkindle/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/list/glowy_doods = list()	// Initialize a list of who's getting affected!
	glowy_doods.Add(user)	// Add the caster to the list
	user.nutrition -= 25

	var/mob/living/carbon/human/H = get_victim(user)	// See if we have a lucky victim (someone who's being grabbed or is directly in front of the caster)

	if(istype(H))	// Check if we found a victim, and if they're actually a human!
		glowy_doods.Add(H)	// If they are, add them to the list!

	for(var/mob/living/carbon/human/participant in glowy_doods)	// Time to do the thingy!
		to_chat(participant, SPAN_NOTICE("You feel a comforting warmth..."))
		give_glow(participant)	// Handled in a separate proc so it's not sooper confusing!
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/cruciform/occulus/enkindle/proc/give_glow(mob/living/carbon/human/participant)
	participant.set_light(l_range = 4.5, l_power = 2.5, l_color = COLOR_YELLOW)	// Slightly better than a flare, same color as the Sword of Truth's glow
	addtimer(CALLBACK(src, .proc/take_glow, participant), effect_time)
	to_chat(participant, SPAN_NOTICE("A bright golden light seems to start emanating from your chest."))

/datum/ritual/cruciform/occulus/enkindle/proc/take_glow(mob/living/carbon/human/participant)
	if (participant) // check if participant still exists
		participant.set_light(l_range = 0, l_power = 0, l_color = COLOR_YELLOW)
		to_chat(participant, SPAN_NOTICE("The bright golden light flickers and fades from your chest."))


/datum/ritual/cruciform/crusader/freeedagger
	name = "Immolate"
	phrase = "Deo indignus acrior exurat"
	desc = "Unleashes the latent power hidden within a Mekhanite dagger held within your hands, augmenting its offensive capabilities and also turning it into a dangerous projectile when thrown. An unleashed dagger will burn the user's hand when used to attack, and will also disintegrate in 10 hits, or upon being thrown."
	power = 50

/datum/ritual/cruciform/crusader/freeedagger/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)
	var/success = FALSE
	if(user.l_hand)
		var/obj/item/weapon/tool/knife/dagger/nt/pls = user.l_hand
		if(istype(pls, /obj/item/weapon/tool/knife/dagger/nt))
			qdel(user.l_hand)
			var/obj/item/weapon/tool/knife/dagger/nt/energy/created = new /obj/item/weapon/tool/knife/dagger/nt/energy(usr.loc)
			user.put_in_l_hand(created)
			success = TRUE
	if(user.r_hand)
		var/obj/item/weapon/tool/knife/dagger/nt/pls = user.r_hand
		if(istype(pls, /obj/item/weapon/tool/knife/dagger/nt))
			qdel(user.r_hand)
			var/obj/item/weapon/tool/knife/dagger/nt/energy/created = new /obj/item/weapon/tool/knife/dagger/nt/energy(usr.loc)
			user.put_in_r_hand(created)
			success = TRUE
	if(!success)
		fail("No daggers found in hands.", user, C)
		return FALSE
	else
		return TRUE

// haha lets put the weapon define here because why not | okay this was a horrible idea this is the most spaghetti and overworked thing I have seen in months
/obj/item/weapon/tool/knife/dagger/nt/energy
	name = "unleashed Mekhanite dagger"
	desc = "It seems to burn intensely with an otherwordly energy of some sort. It's already falling apart, and you're likely to hurt yourself using this. Can be thrown for a crowd controlling detonation."
	icon = 'zzzz_modular_occulus/icons/obj/weapons.dmi'
	icon_state = "edagger"
	item_icons = list(
		slot_l_hand_str = 'zzzz_modular_occulus/icons/obj/weapons.dmi',
		slot_r_hand_str = 'zzzz_modular_occulus/icons/obj/weapons.dmi',
		)
	item_state_slots = list(
		slot_l_hand_str = "edagger_left",
		slot_r_hand_str = "edagger_right"
		)
	force = WEAPON_FORCE_BRUTAL //becomes equal to a longsword for just 10 hits
	throwforce = WEAPON_FORCE_ROBUST
	throw_speed = 0.5
	throw_range = 10
	heat = 3800
	price_tag = 0 //no one wants to buy a volatile knife that's more likely to hurt you than your target
	origin_tech = list(TECH_BIO = 3, TECH_COMBAT = 5, TECH_POWER = 5) // Tech because this is kind of a weird anomaly I guess???
	var/uses_left = 10

/obj/item/weapon/tool/knife/dagger/nt/energy/New()
	..()
	set_light(l_range = 2, l_power = 2, l_color = COLOR_YELLOW) //make it glow

/obj/item/weapon/tool/knife/dagger/nt/energy/afterattack(obj/target, mob/living/carbon/human/user, proximity)
	..()
	if(proximity && target && istype(target,/mob/living)) //only works on adjacent mobs so you don't get burnt for clicking on a mouse 7 tiles away
		user.get_active_hand_organ().take_damage(0,5) //0 brute 5 burn
		to_chat(user, SPAN_DANGER("\The [src] scorches your hand as you land a hit with it!"))
		if(uses_left-- <1)
			visible_message(SPAN_DANGER("\The [src] disintegrates!"))
			qdel(src)

/obj/item/weapon/tool/knife/dagger/nt/energy/throw_impact(atom/hit_atom)
	..()
	for(var/mob/living/carbon/M in hear(3, get_turf(src))) //half the range of what the SoT does
		var/obj/item/weapon/implant/core_implant/I = M.get_core_implant(/obj/item/weapon/implant/core_implant/cruciform)
		if(I && I.active && I.wearer)
			continue
		bang(get_turf(src), M)

	for(var/obj/effect/blob/B in hear(5,get_turf(src)))       		//Blob damage here, range reduced as well
		var/damage = round(30/(get_dist(B,get_turf(src))+1))
		B.health -= damage
		B.update_icon()

	new/obj/effect/sparks(loc)
	new/obj/effect/effect/smoke/illumination(loc, brightness=15)
	if(src)
		visible_message(SPAN_DANGER("\The [src] conflagarates in a bright flash of light!."))
		qdel(src)

//Holy copypasta, batman! This is bad. Real bad. But whatever.

/obj/item/weapon/tool/knife/dagger/nt/energy/proc/bang(var/turf/T , var/mob/living/carbon/M)					// Added a new proc called 'bang' that takes a location and a person to be banged.
	to_chat(M, SPAN_DANGER(pick("HOLY LIGHT!", "GOD HAVE MERCY!", "HOLY HAVEN!", "YOU SEE THE LIGHT!")))								// Called during the loop that bangs people in lockers/containers and when banging
	playsound(loc, 'sound/effects/bang.ogg', 50, 1, 5)		// people in normal view.  Could theroetically be called during other explosions.
																// -- Polymorph

//Checking for protections
	var/eye_safety = 0
	var/ear_safety = 0
	if(iscarbon(M))
		eye_safety = M.eyecheck()
		if(ishuman(M))
			if(istype(M:l_ear, /obj/item/clothing/ears/earmuffs) || istype(M:r_ear, /obj/item/clothing/ears/earmuffs))
				ear_safety += 2
			if(HULK in M.mutations)
				ear_safety += 1
			if(istype(M:head, /obj/item/clothing/head/armor/helmet))
				ear_safety += 1

//Flashing everyone
	if(eye_safety < FLASH_PROTECTION_MODERATE)
		if (M.HUDtech.Find("flash"))
			flick("e_flash", M.HUDtech["flash"])
		M.Weaken(4)



//Now applying sound
	if((get_dist(M, T) <= 2 || loc == M.loc || loc == M))
		if(ear_safety > 0)
			M.Stun(2)
		else
			M.Stun(10)
			M.Weaken(1)
			if ((prob(14) || (M == loc && prob(70))))
				M.ear_damage += rand(1, 10)
			else
				M.ear_damage += rand(0, 5)
				M.ear_deaf = max(M.ear_deaf,15)

	else if(get_dist(M, T) <= 5)
		if(!ear_safety)
			M.Stun(4)
			M.ear_damage += rand(0, 3)
			M.ear_deaf = max(M.ear_deaf,10)

	else if(!ear_safety)
		M.Stun(2)
		M.ear_damage += rand(0, 1)
		M.ear_deaf = max(M.ear_deaf,5)

	//This really should be in mob not every check
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/eyes/E = H.random_organ_by_process(OP_EYES)
		if (E && E.damage >= E.min_bruised_damage)
			to_chat(M, SPAN_DANGER("Your eyes start to burn badly!"))
	if (M.ear_damage >= 15)
		to_chat(M, SPAN_DANGER("Your ears start to ring badly!"))
	else
		if (M.ear_damage >= 5)
			to_chat(M, SPAN_DANGER("Your ears start to ring!"))
	M.update_icons()
