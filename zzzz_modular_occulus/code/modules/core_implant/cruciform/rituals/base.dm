// Dump general Litanies exclusive to Occulus here!

//OVERRIDES: Let's just buff some of the basic litanies by reducing their cost

/datum/ritual/cruciform/base/relief
	power = 35

/datum/ritual/cruciform/base/soul_hunger
	power = 35

//NEW STUFF: New shiny litanies! (haha who am i kidding its just going to be copypasta)

// This pain relief works on ANYONE!

/datum/ritual/cruciform/base/relief_other
	name = "Reprieve"
	phrase = "Domine, da mihi potestatem iis doloribus"
	desc = "Relief an adjacent person of their agony, even if they are not a disciple."
	power = 50

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
		to_chat(H, "<span class='info'>A numbing sensation bathes you, soothing your agony a little.</span>")
		H.add_chemical_effect(CE_PAINKILLER, 15)	// Just a bit more than the base effect, so you can more effectively treat others than yourself.
		return TRUE

/*
Soul hunger except it works on anyone!
*/

/datum/ritual/cruciform/base/saturation
	name = "Saturation"
	phrase = "Honoribus eos persequi, quod panem et vinum fides nostra"
	desc = "Stave off the hunger of an adjacent person, even if they are not a disciple."
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
		user.adjustToxLoss(5) //Toxloss is borne by the caster!
		return TRUE

/*
Let there be light! Makes you glow for 5 minutes at a time.
*/

/datum/ritual/cruciform/base/enkindle
	name = "Enkindle"
	phrase = "Domine salva nos de tenebris lucem in perditis rebus fiat"
	desc = "Causes you, and if present, someone grabbed by you, to start profusely glowing. Lasts five minutes."	//Contact a doctor if glow persists for more than 4 hours.
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	effect_time = 5 MINUTES
	cooldown_category = "glow"
	power = 50

/datum/ritual/cruciform/base/enkindle/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/list/glowy_doods = list()	// Initialize a list of who's getting affected!
	glowy_doods.Add(user)	// Add the caster to the list

	var/mob/living/carbon/human/H = get_victim(user)	// See if we have a lucky victim (someone who's being grabbed or is directly in front of the caster)

	if(istype(H))	// Check if we found a victim, and if they're actually a human!
		glowy_doods.Add(H)	// If they are, add them to the list!

	for(var/mob/living/carbon/human/participant in glowy_doods)	// Time to do the thingy!
		to_chat(participant, SPAN_NOTICE("You feel a comforting warmth..."))
		give_glow(participant)	// Handled in a separate proc so it's not sooper confusing!
	set_personal_cooldown(user)
	return TRUE

/datum/ritual/cruciform/base/enkindle/proc/give_glow(mob/living/carbon/human/participant)
	participant.set_light(l_range = 4.5, l_power = 2.5, l_color = COLOR_YELLOW)	// Slightly better than a flare, same color as the Sword of Truth's glow
	addtimer(CALLBACK(src, .proc/take_glow, participant), effect_time)
	to_chat(participant, SPAN_NOTICE("A bright golden light seems to start emanating from your chest."))

/datum/ritual/cruciform/base/enkindle/proc/take_glow(mob/living/carbon/human/participant)
	if (participant) // check if participant still exists
		participant.set_light(l_range = 0, l_power = 0, l_color = COLOR_YELLOW)
		to_chat(participant, SPAN_NOTICE("The bright golden light flickers and fades from your chest."))
