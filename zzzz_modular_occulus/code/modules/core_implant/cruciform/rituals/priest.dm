// Dump Priest Litanies exclusive to Occulus here!

/*
A copypasta of Convalescence, but with half the effects and no pain removal. Also costs 10 more power.
*/
/datum/ritual/cruciform/priest/selfheal
	name = "Recuperation"
	phrase = "In tempore necessitatis illius, quae consolantur me quaeso mihi dolet"
	desc = "Recover from minor wounds."
	cooldown = TRUE
	cooldown_time = 120
	power = 35

/datum/ritual/cruciform/priest/selfheal/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C,list/targets)
	to_chat(H, "<span class='info'>A sensation of relief bathes you, washing away your pain.</span>")
	log_and_message_admins("healed himself with the Recuperation litany.")
	H.adjustBruteLoss(-10)
	H.adjustFireLoss(-10)
	H.adjustOxyLoss(-20)
	H.updatehealth()
	set_personal_cooldown(H)
	return TRUE

/*
Ditto but for Succour
*/

/datum/ritual/cruciform/priest/heal_other
	name = "Invigorate"
	phrase = "Et inclinaveris cor tuum in capite sunt in caelo, et suscipe benedictionem"
	desc = "Heal a nearby disciple's wounds."
	cooldown = TRUE
	cooldown_time = 120
	power = 45

/datum/ritual/cruciform/priest/heal_other/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C,list/targets)
	var/obj/item/weapon/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform)

	if(!CI || !CI.active || !CI.wearer)
		fail("Cruciform not found.", user, C)
		return FALSE

	var/mob/living/carbon/human/H = CI.wearer

	if(!istype(H))
		fail("Target not found.",user,C,targets)
		return FALSE

	//Checking turfs allows this to be done in unusual circumstances
	var/turf/T = get_turf(user)
	if (!(T.Adjacent(get_turf(H))))
		to_chat(user, SPAN_DANGER("[H] is beyond your reach."))
		return

	user.visible_message("[user] places their hands upon [H] and utters a prayer.", "You lay your hands upon [H] and begin speaking the words of recuperation.")
	if (do_after(user, 40, H, TRUE))
		T = get_turf(user)
		if (!(T.Adjacent(get_turf(H))))
			to_chat(user, SPAN_DANGER("[H] is beyond your reach.."))
			return
		log_and_message_admins("healed [CI.wearer] with Invigorate litany")
		to_chat(H, "<span class='info'>A sensation of relief bathes you, soothing your wounds a little</span>")
		H.adjustBruteLoss(-10)
		H.adjustFireLoss(-10)
		H.adjustOxyLoss(-20)
		H.updatehealth()
		set_personal_cooldown(user)
		return TRUE

/*
A big universal AOE heal
*/

/datum/ritual/cruciform/priest/mass_heal
	name = "Amelioration"
	phrase = "Nos, hodierno die conuenistis desperans, obsecro, quia omnia potes subsidio intra quorum nos consortium"
	desc = "This litany will heal and soothe the pain of everyone who hears you, even if they're not a disciple. Places an incredible strain on your body if succesful."
	cooldown = TRUE
	cooldown_time = 5 MINUTES
	cooldown_category = "mass_heal"
	power = 80	//Can only be performed with the Red Light upgrade.

/datum/ritual/cruciform/priest/mass_heal/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	user.visible_message("[user] gets on their knees, arms outstretched torwards the ceiling, as they utter some prayers.", "You kneel down, arms outstretched torwards the ceiling, and begin reciting several incantations of healing.")
	if (do_after(user, 50, user, TRUE))
		var/list/people_around = list()
		for(var/mob/living/carbon/human/H in view(user))
			if(H != user && !isdeaf(H))
				people_around.Add(H)

		if(people_around.len > 0)
			to_chat(user, SPAN_DANGER("You collapse to the ground, exhausted."))
			user.Weaken(10)
			user.nutrition -= 200
			user.adjustToxLoss(10)
			playsound(user.loc, 'sound/machines/signal.ogg', 50, 1)
			for(var/mob/living/carbon/human/participant in people_around)
				to_chat(participant, SPAN_NOTICE("You feel the air thrum with an inaudible vibration, followed by an incredibly soothing sensation."))
				participant.add_chemical_effect(CE_PAINKILLER, 10)
				participant.adjustBruteLoss(-10)
				participant.adjustFireLoss(-10)
				participant.adjustOxyLoss(-20)
				participant.updatehealth()
			set_personal_cooldown(user)
			return TRUE
		else
			fail("Your cruciform sings, alone, unto the void.", user, C)
			return FALSE


/*
Call all church members to wherever you are. Basically Entreaty but it isn't a cry for help.
*/

/datum/ritual/cruciform/priest/liturgy
	name = "Liturgy"
	phrase = "Kyrie eleison et hic antiquitus fuisse acclamatum est misericordiae Dei"
	desc = "Call all cruciform bearers to wherever you happen to be. Great for holding events or important meetings."
	power = 25

/datum/ritual/cruciform/priest/liturgy/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)
	for(var/mob/living/carbon/human/target in disciples)
		var/area/t = get_area(H)
		to_chat(target, SPAN_DANGER("[H]'s cry echoes out into the void! The presence of all cruciform bearers is requested at [t.name]!"))

	return TRUE
