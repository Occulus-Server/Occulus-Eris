#define RIG_WAIT_INJECT 60
#define WAIT_INJECT 25
#define SELF_INJECT 15

#define DELUXE_WAIT_INJECT 5
#define DELUXE_SELF_INJECT 10

#define COMBAT_WAIT_INJECT 0
#define COMBAT_SELF_INJECT 0

/obj/item/weapon/storage/pouch/medical_supply
	can_hold = list(
		/obj/item/device/scanner/health,
		/obj/item/weapon/dnainjector,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/glass/bottle,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/weapon/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/hypospray/mkii,
		)

/obj/item/weapon/reagent_containers/hypospray
	slot_flags = SLOT_BELT|SLOT_HOLSTER

//A vial-loaded hypospray. Cartridge-based!
/obj/item/hypospray/mkii
	name = "MID 'Apollo'"
	icon_state = "hypo"
	icon = 'zzzz_modular_occulus/icons/obj/syringe.dmi'
	item_icons = list(slot_l_hand_str = 'zzzz_modular_occulus/icons/mob/left_hand.dmi', slot_r_hand_str = 'zzzz_modular_occulus/icons/mob/right_hand.dmi')
	desc = "The Medical Injection Device 'Apollo' is Nanotrasens best copy of the MID 'Hecate'. It takes 45-unit cartridges as the drug supply for easy swapping and has a built in scanner to check patients current reagents and prevent overdoses."
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	var/amount_per_transfer_from_this
	var/emagged = FALSE
	var/list/allowed_containers = list(/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/tiny, /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small)
	var/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/vial
	var/start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small
	var/spawnwithvial = TRUE
	var/inject_wait = WAIT_INJECT
	var/inject_self = SELF_INJECT
	var/quickload = FALSE
	var/penetrates = FALSE
	var/mode = 1
	var/window_width = 400
	var/window_height = 200
	var/scan_title
	var/scan_data

/obj/item/hypospray/mkii/brute
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/polystem

/obj/item/hypospray/mkii/toxin
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/antitoxin

/obj/item/hypospray/mkii/oxygen
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/dexalin

/obj/item/hypospray/mkii/burn
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/kelotane

/obj/item/hypospray/mkii/tricord
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/tricord

/obj/item/hypospray/mkii/CMO
	name = "MID 'Hecate'"
	allowed_containers = list(/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/tiny, /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small, /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large)
	icon_state = "cmohypo"
	desc = "The  original Medical Injection Device 'Hecate'. It was found onboard the Northern Light, and its origins are unknown. It can take 90-unit cartridges, acts faster and delivers more reagents per spray then its copied counterparts. The Hecate has a built in scanner to check patients current reagents and prevent overdoses. It seems to have anomalous properties."
	unacidable = 1
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/CMO
	inject_wait = DELUXE_WAIT_INJECT
	inject_self = DELUXE_SELF_INJECT

/obj/item/hypospray/mkii/combat
	name = "MID 'Ares'"
	desc = "A combat-ready copy of the MID 'Hecate', the Ares has had it's safety protocals torn out, allowing it to act almost instantly. It can be tactically reloaded by using a vial on it. Designed for military engagements, patent pending."
	icon_state = "combathypo"
	allowed_containers = list(/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/tiny, /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small,/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/combat)
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/combat
	emagged = TRUE
	inject_wait = COMBAT_WAIT_INJECT
	inject_self = COMBAT_SELF_INJECT
	quickload = TRUE
	penetrates = TRUE

/obj/item/hypospray/mkii/Initialize()
	. = ..()
	if(!spawnwithvial)
		update_icon()
		return
	if(start_vial)
		vial = new start_vial
	update_icon()

/obj/item/hypospray/mkii/proc/is_valid_scan_target(atom/O)
	return FALSE

/obj/item/hypospray/mkii/proc/scan(atom/A, mob/user)

/obj/item/hypospray/mkii/proc/show_results(mob/user)
	var/datum/browser/popup = new(user, "hypospray", scan_title, window_width, window_height)
	popup.set_content("[scan_data]")
	popup.open()

/obj/item/hypospray/mkii/update_icon()
	icon_state = "[initial(icon_state)][mode ? "" : "-d"][vial ? "" : "-e"]"

/obj/item/hypospray/mkii/verb/toggle_mode()
	set name = "toggle display"
	set category = "Object"

	mode = !mode
	switch (mode)
		if(0)
			to_chat(usr, "You open up the [src]'s data tab")
			update_icon()
		if(1)
			to_chat(usr, "You close the [src]'s data tab")
			update_icon()

/obj/item/hypospray/mkii/examine(mob/user)
	. = ..()
	if(vial)
		to_chat(user, "[vial] has [vial.reagents.total_volume]u remaining.")
	else
		to_chat(user, "It has no cartridge loaded in.")

/obj/item/hypospray/mkii/proc/unload_hypo(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge)))
		var/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/V = I
		V.forceMove(user.loc)
		user.put_in_hands(V)
		to_chat(user, "<span class='notice'>You remove [vial] from [src].</span>")
		vial = null
		update_icon()
		playsound(loc, 'sound/weapons/empty.ogg', 50, 1)
	else
		to_chat(user, "<span class='notice'>This [src] isn't loaded!</span>")
		return

/obj/item/hypospray/mkii/attackby(obj/item/I, mob/living/user)
	if((istype(I, /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge) && vial != null))
		if(!quickload)
			to_chat(user, "<span class='warning'>[src] can not hold more than one cartridge!</span>")
			return FALSE
		unload_hypo(vial, user)
	if((istype(I, /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge)))
		var/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/V = I
		if(!is_type_in_list(V, allowed_containers))
			to_chat(user, "<span class='notice'>[src] doesn't accept this type of cartridge.</span>")
			return FALSE
//		if(!user.transferItemToLoc(V,src)) -Not sure what this is tbh. Looks like a sanity check, but I'm not sure what for.
//			return FALSE
		user.drop_item()
		V.loc = src
		vial = V
		user.visible_message("<span class='notice'>[user] has loaded a cartridge into [src].</span>","<span class='notice'>You have loaded [vial] into [src].</span>")
		update_icon()
		playsound(loc, 'sound/weapons/guns/interact/sfrifle_magin.ogg', 35, 1)
		return TRUE
	else
		to_chat(user, "<span class='notice'>This doesn't fit in [src].</span>")
		return FALSE

/obj/item/hypospray/mkii/AltClick(mob/user)
	. = ..()
	if(vial)
		vial.attack_self(user)
		return TRUE

/obj/item/hypospray/mkii/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		to_chat(user, "You overcharge [src]'s control circuit.")
		emagged = TRUE
		inject_wait = COMBAT_WAIT_INJECT
		inject_self = COMBAT_SELF_INJECT
		penetrates = TRUE
		return TRUE
	else
		to_chat(user, SPAN_WARNING("[src] happens to be already overcharged."))
		return

/obj/item/hypospray/mkii/attack_hand(mob/user)
	. = ..() //Don't bother changing this or removing it from containers will break.

/obj/item/hypospray/mkii/attack(mob/living/M as mob, mob/user as mob)
	if(!vial.reagents.total_volume)
		to_chat(user, SPAN_WARNING("[src] is empty."))
		return
	if(!vial)
		to_chat(user, "<span class='notice'>[src] doesn't have any cartridge installed!</span>")
		return
	if (!istype(M))
		return
	var/injtime //Injecting through a hardsuit takes long time due to needing to find a port.
	// Handling errors and injection duration
	var/mob/living/carbon/human/H = M
	if(istype(H))
		var/obj/item/clothing/suit/space/SS = H.get_equipped_item(slot_wear_suit)
		var/obj/item/weapon/rig/RIG = H.get_equipped_item(slot_back)
		if((istype(RIG) && RIG.suit_is_deployed()) || istype(SS))
			injtime = RIG_WAIT_INJECT
			var/obj/item/organ/external/affected = H.get_organ(BP_CHEST)
			if(BP_IS_ROBOTIC(affected))
				to_chat(user, SPAN_WARNING("Injection port on [M]'s suit is refusing your [src]."))
				// I think rig is advanced enough for this, and people will learn what causes this error
				if(RIG)
					playsound(src.loc, 'sound/machines/buzz-two.ogg', 50, 1 -3)
					RIG.visible_message("\icon[RIG]\The [RIG] states \"Attention: User of this suit appears to be synthetic origin\".")
				return
		// check without message
		else if(!H.can_inject(user, FALSE))
			// lets check if user is easily fooled
			var/obj/item/organ/external/affected = H.get_organ(user.targeted_organ)
			if(BP_IS_LIFELIKE(affected) && user && user.stats.getStat(STAT_BIO) < STAT_LEVEL_BASIC)
				if(M.reagents)
					var/trans = vial.reagents.remove_any(amount_per_transfer_from_this)
					admin_inject_log(user, M, src, reagents.log_list(), trans)
					user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
					to_chat(user, SPAN_NOTICE("[trans] units injected. [vial.reagents.total_volume] units remaining in \the [src]."))
				return
			else
				// if he is not lets show him what actually happened
				H.can_inject(user, TRUE)
				return
	else if(!M.can_inject(user, TRUE))
		return
	// handling injection duration on others
	if(M != user)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		user.do_attack_animation(M)
		if(!penetrates && injtime) //checks for rig and for penetration var.
			user.visible_message(SPAN_WARNING("[user] begins hunting for an injection port on [M]'s suit!"), SPAN_WARNING("You begins hunting for an injection port on [M]'s suit!"))
			scan(M, user)
			if (!emagged)					//OD check for injecting rigs.
				if(check_overdose(M, user))	// If this will cause an overdose... (see line 248)
					return
			if(do_mob(user, M, RIG_WAIT_INJECT))
				user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
		else //Check for what type of injectwait if not rig or if penetrates.
			user.visible_message(SPAN_WARNING("[user] begins scanning [M]'s with [src]!"))
			scan(M, user)
			if (!emagged)					//OD check for injecting normal patient
				if(check_overdose(M, user))	// If this will cause an overdose... (see line 248)
					return						// Cancel the injection! Done!
			if(do_mob(user, M, inject_wait))
				user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
			else
				return
	if(M == user)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		user.do_attack_animation(M)
		user.visible_message(SPAN_WARNING("[user] begins scanning [M]'s with [src]!"))
		scan(M, user)
		if (!emagged)					//OD check for self injection, derpy user
			if(check_overdose(M, user))	// If this will cause an overdose... (see line 248)
				return
		user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))	// No injection delay for self.
	// handling actual injection
	// on this stage we are sure that everything is alright
	var/contained = vial.reagents.log_list()
	vial.reagents.trans_to_mob(M, vial.amount_per_transfer_from_this, CHEM_BLOOD)
	admin_inject_log(user, M, src, contained, vial.amount_per_transfer_from_this)
	var/long_sound = vial.amount_per_transfer_from_this >= 15
	playsound(loc, long_sound ? 'zzzz_modular_occulus/sound/items/hypospray_long.ogg' : pick('zzzz_modular_occulus/sound/items/hypospray.ogg','zzzz_modular_occulus/sound/items/hypospray2.ogg'), 50, 1, -1)
	to_chat(user, "<span class='notice'>You inject [vial.amount_per_transfer_from_this] units of the solution. The Apollo's cartridge now contains [vial.reagents.total_volume] units.</span>")

	return

obj/item/hypospray/mkii/proc/check_overdose(mob/living/carbon/human/patient, mob/living/carbon/human/doctor)

	/* check_overdose(M)

	The intention of this proc is to check if the target (M) would be overdosing
	from any of the hypospray's vial's contents.

	If this proc returns TRUE, there will be an overdose.
	If this proc returns FALSE, there will not be an overdose.

	*/

	var/list/hypo_reagents = vial.reagents.reagent_list	// Make an easy-to-refer list so we don't have to repeatedly type vial.reagents.reagent_list
	var/overdosing = FALSE							// This will be checked later if an overdose would happen or not.

	if (hypo_reagents.len)	// .len returns TRUE if the list has contents and FALSE if not. If it returns TRUE, we need to check what's inside.
		// .len returned TRUE -- there are things in the vial.
		// First, we need to find out what's in the vial. Using a for loop, we will check each reagent and compare it to the target (M).

		for (var/datum/reagent/hypo_drug in hypo_reagents)	// drug is a holder for /datum/reagent data. For each reagent in hypo_reagents, it will fill in its information.
			// First, check if the drug has an overdose limit.

			if (hypo_drug.overdose == 0)	// 0 means there is no limit or the limit is undefined.
				continue	// skip this iteration -- it won't overdose!

			// First, let's check if the target has any of the reagent, and if so, how much.
			var/existing_volume = patient.reagents.get_reagent_amount(hypo_drug.id)

			// /* Now, existing_volume has possibly been incremented, if any of it was in the target's system.
			// 	Check to see if existing_volume, when injected with more of the drug, will cause an overdose. */

			if (existing_volume + min(hypo_drug.volume, vial.amount_per_transfer_from_this) > hypo_drug.overdose)	// if it is over the overdose limit...
				to_chat(doctor, SPAN_WARNING("The [src] beeps indignantly. 'Injection refused -- this would cause an overdose of [hypo_drug.name].'"))
				overdosing = TRUE	// To be checked soon. We do not return now in the event of multiple overdoses.

		if (overdosing)	// We check this AFTER all drug checks are performed.
			return TRUE // This injection would cause an overdose. the to_chat line informs the doctor which drugs would cause it.

		return FALSE	// There's no overdose, so return FALSE.

	else	// .len returned FALSE -- that means no reagents are in the vial, so it will not cause an overdose.
		return FALSE	// FALSE means it will not cause an overdose.


/obj/item/hypospray/mkii/is_valid_scan_target(atom/O)
	return istype(O, /mob/living) || istype(O, /obj/structure/closet/body_bag)

/obj/item/hypospray/mkii/scan(atom/A, mob/user)
	scan_data = hypo_scan_action(A, user, src, mode)
	scan_title = "Hypo scan - [A]"
	if( mode == 0 )
		show_results(user)
	flick("health2", src)

/proc/hypo_scan_action(atom/target, mob/living/user, obj/scanner, var/mode)

	var/mob/living/carbon/human/scan_subject = null
	if (istype(target, /mob/living/carbon/human))
		scan_subject = target
	else if (istype(target, /obj/structure/closet/body_bag))
		var/obj/structure/closet/body_bag/B = target
		if(!B.opened)
			var/list/scan_content = list()
			for(var/mob/living/L in B.contents)
				scan_content.Add(L)

			if (scan_content.len == 1)
				for(var/mob/living/carbon/human/L in scan_content)
					scan_subject = L
			else if (scan_content.len > 1)
				to_chat(user, SPAN_WARNING("\The [scanner] picks up multiple readings inside \the [target], too close together to scan properly."))
				return
			else
				to_chat(user, "\The [scanner] does not detect anyone inside \the [target].")
				return

	if(!scan_subject)
		return

	if (scan_subject.isSynthetic())
		to_chat(user, SPAN_WARNING("\The [scanner] is designed for organic humanoid patients only."))
		return

	user.visible_message(SPAN_NOTICE("[user] has scanned [target]'s vitals."),SPAN_NOTICE("You have analyzed [target]'s vitals."))
	. = hypo_scan_results(scan_subject, mode)

/proc/hypo_scan_results(var/mob/living/M, var/mode)
	. = list()
	var/dat = list()
	if(ishuman(M) && mode == 1)
		return
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		if(C.reagents.total_volume)
			var/unknown = 0
			var/reagentdata[0]
			for(var/A in C.reagents.reagent_list)
				var/datum/reagent/R = A
				if(R.scannable)
					reagentdata["[R.id]"] = span("highlight", "    [round(C.reagents.get_reagent_amount(R.id), 1)]u [R.name]")
				else
					unknown++
			if(reagentdata.len)
				dat += span("highlight", "Beneficial reagents detected in subject's blood:")
				for(var/d in reagentdata)
					dat += reagentdata[d]
			if(unknown)
				dat += SPAN_WARNING("Warning: Unknown substance[(unknown>1)?"s":""] detected in subject's blood.")
		if(C.ingested && C.ingested.total_volume)
			var/unknown = 0
			for(var/datum/reagent/R in C.ingested.reagent_list)
				if(R.scannable)
					dat += span("highlight", "[R.name] found in subject's stomach.")
				else
					++unknown
			if(unknown)
				dat += SPAN_WARNING("Non-medical reagent[(unknown > 1)?"s":""] found in subject's stomach.")
	. = jointext(dat, "<br>")

/obj/item/hypospray/mkii/attack_self(mob/living/user)
	if(user)
		if(user.incapacitated())
			return
		else if(!vial)
			to_chat(user, "This Apollo needs to be loaded first!")
			return
		else
			unload_hypo(vial,user)
