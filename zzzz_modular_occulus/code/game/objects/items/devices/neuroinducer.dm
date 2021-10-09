//Halcyonic NeuroInducer
// Designed to interrupt sanity break downs, fix max sanity, and restore sanity to 25.

/obj/item/device/neuroinducer
	name = "halcyonic neuroinducer"
	desc = "The peak of Nanotrasen's biochemical brain research, this device has become renown for halting fits of madness and hysteria by inducing alpha waves."
	icon = 'zzzz_modular_occulus/icons/obj/device.dmi'
	icon_state = "neuroinducer"
	suitable_cell = /obj/item/weapon/cell/medium
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_BIO = 5, TECH_COVERT = 2)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_GLASS = 2)
	matter_reagents = list("uncap nanites" = 10)
	spawn_blacklisted = TRUE
	var/charge_per_use = 600

/obj/item/device/neuroinducer/update_icon()
	if(cell.charge < charge_per_use)
		src.icon_state = "neuroinducer_nocharge"
	else src.icon_state = "neuroinducer"

/obj/item/device/neuroinducer/proc/halcyon(mob/living/carbon/human/M, mob/user)
	if(user.incapacitated() || user.get_active_hand() != src)
		to_world("user is incapacitated")
		return
	to_chat(user, SPAN_DANGER("[user] begins to run the [src] over [M]'s Limbic cortex!"))
	if (do_mob(user, M, 20))
		if(!cell_use_check(charge_per_use, user))	//I hate this proc -radiantflash
			update_icon()
			to_world("updated icon")	//Inducer charge empty
			return
		update_icon()
		var/mob/living/carbon/human/affected = M
		for(var/datum/breakdown/B in affected.sanity.breakdowns)
			B.finished = TRUE
		if(M.sanity.level < 25)
			M.sanity.level = 25
			to_world("sanity level now 25")
		to_chat(M, SPAN_NOTICE("You have a warm fuzzy feeling, as if you were remembering a pleasant memory."))

		if(M.stats.getPerk(PERK_LOWBORN) && M.sanity.max_level <110)
			M.sanity.max_level = 110

		else if(M.stats.getPerk(PERK_RAT))
			if(M.sanity.max_level < 90)
				M.sanity.max_level = 90

		else if(M.stats.getPerk(PERK_REJECTED_GENIUS))
			if(M.sanity.max_level < 80)
				M.sanity.max_level = 80

		else if(M.sanity.max_level < 100)
			M.sanity.max_level = 100
		else



/obj/item/device/neuroinducer/attack(mob/M, mob/living/carbon/human/user, target_zone)
	if(M == user)
		to_chat(user, SPAN_WARNING("You are unable to effectively use the Neuroinducer on yourself! Perhaps you should get some help?"))
		return ..()
	if(target_zone != BP_HEAD)
		to_chat(user, SPAN_WARNING("You have to use the Neuroinducer on the head!"))
		return ..()
	if(length(user.get_covering_equipped_items(HEAD)))
		to_chat(user, SPAN_WARNING("You need to remove the head covering first."))
		return ..()
	if(cell.charge < charge_per_use || !cell)	//This needs to be here because cell_use_check will use charge before do mob.
		to_chat(user, SPAN_WARNING("[src] battery lacks enough charge or missing."))
		update_icon()
		return
	halcyon(M, user)


/obj/item/device/neuroinducertraitor
	name = "jail broken neuroinducer"
	desc = "This device used to be Nanotrasen's top of the line in mental health, but has been perversely modified to fluctuate brain-waves wildly, causing severe mental distress."
	icon = 'zzzz_modular_occulus/icons/obj/device.dmi'
	icon_state = "evilneuroinducer"
	suitable_cell = /obj/item/weapon/cell/medium
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_BIO = 5, TECH_COVERT = 2)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_GLASS = 2)
	matter_reagents = list("uncap nanites" = 10)
	spawn_blacklisted = TRUE
//	var/TCharge = 1
	var/charge_per_use = 600

/obj/item/device/neuroinducertraitor/update_icon()
	if(cell.charge < charge_per_use)
		src.icon_state = "evilneuroinducer_nocharge"
	else src.icon_state = "evilneuroinducer"
/*
/obj/item/device/neuroinducertraitor/attackby(obj/item/I as obj, mob/user as mob)	//attempt to make the traitor one cost TCs per use. Beyond my coding skills.
	if(istype(I, /obj/item/stack/telecrystal))
		if(TCharge < 1)
			TCharge = 1
	...()*/


/obj/item/device/neuroinducertraitor/proc/turmoil(mob/living/carbon/human/M, mob/user)
	if(user.incapacitated() || user.get_active_hand() != src)
		return
	to_chat(user, SPAN_DANGER("[user] begins to run the [src] over [M]'s Limbic cortex!"))
	if (do_mob(user, M, 20))
		if(!cell_use_check(charge_per_use, user))	//I hate this proc -radiantflash
			update_icon()
			return
		update_icon()
		to_chat(M, SPAN_NOTICE("You feel a pounding pain in your head. Life seems bleak and hopeless."))
//		TCharge = 0
		if(M.sanity.max_level >= 50)
			M.sanity.max_level = 50
		if(M.sanity.level >= 0)	//if sanity is
			M.sanity.level = -1	//causes a breakdown!
		M.setBrainLoss(rand(0,10))	//Brain damage roulette!



/obj/item/device/neuroinducertraitor/attack(mob/M, mob/living/carbon/human/user, target_zone)
	if(M == user)
		to_chat(user, SPAN_WARNING("You are unable to effectively use the Neuroinducer on yourself! Perhaps you should get some help?"))
		return ..()
	if(target_zone != BP_HEAD)
		to_chat(user, SPAN_WARNING("You have to use the Neuroinducer on the head!"))
		return ..()
	if(length(user.get_covering_equipped_items(HEAD)))
		to_chat(user, SPAN_WARNING("You need to remove the head covering first."))
		return ..()
	if(cell.charge < charge_per_use || !cell)	//This needs to be here because cell_use_check will use charge before do mob.
		to_chat(user, SPAN_WARNING("[src] battery lacks enough charge or missing."))
		update_icon()
		return
/*	if(TCharge == 0)	//TC cost.
		to_chat(user, SPAN_WARNING("[src] requires a focusing telecrystal."))
		return*/
	turmoil(M, user)

