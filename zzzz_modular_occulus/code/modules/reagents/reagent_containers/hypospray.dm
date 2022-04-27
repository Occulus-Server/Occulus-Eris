#define RIG_WAIT_INJECT 60
#define WAIT_INJECT 25
#define SELF_INJECT 15

#define DELUXE_WAIT_INJECT 5
#define DELUXE_SELF_INJECT 10

#define COMBAT_WAIT_INJECT 0
#define COMBAT_SELF_INJECT 0

/obj/item/storage/pouch/medical_supply
	can_hold = list(
		/obj/item/device/scanner/health,
		/obj/item/dnainjector,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/syringe,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/hypospray/mkii,
		)

/obj/item/reagent_containers/hypospray
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
	var/list/allowed_containers = list(/obj/item/reagent_containers/glass/beaker/hypocartridge/tiny,
		/obj/item/reagent_containers/glass/beaker/hypocartridge/small)
	var/obj/item/reagent_containers/glass/beaker/hypocartridge/vial
	var/start_vial = /obj/item/reagent_containers/glass/beaker/hypocartridge/small
	var/spawnwithvial = TRUE
	var/inject_wait = WAIT_INJECT
	var/inject_self = SELF_INJECT
	var/quickload = FALSE
	var/penetrates = FALSE
	var/is_scanning = FALSE
	var/window_width = 400
	var/window_height = 200
	var/scan_title
	var/scan_data

/obj/item/hypospray/mkii/brute
	start_vial = /obj/item/reagent_containers/glass/beaker/hypocartridge/small/polystem

/obj/item/hypospray/mkii/toxin
	start_vial = /obj/item/reagent_containers/glass/beaker/hypocartridge/small/antitoxin

/obj/item/hypospray/mkii/oxygen
	start_vial = /obj/item/reagent_containers/glass/beaker/hypocartridge/small/dexalin

/obj/item/hypospray/mkii/burn
	start_vial = /obj/item/reagent_containers/glass/beaker/hypocartridge/small/kelotane

/obj/item/hypospray/mkii/tricord
	start_vial = /obj/item/reagent_containers/glass/beaker/hypocartridge/small/tricord

/obj/item/hypospray/mkii/CMO
	name = "MID 'Hecate'"
	allowed_containers = list(/obj/item/reagent_containers/glass/beaker/hypocartridge/tiny, /obj/item/reagent_containers/glass/beaker/hypocartridge/small, /obj/item/reagent_containers/glass/beaker/hypocartridge/large)
	icon_state = "cmohypo"
	desc = "The  original Medical Injection Device 'Hecate'. It was found onboard the Northern Light, and its origins are unknown. It can take 90-unit cartridges, acts faster and delivers more reagents per spray then its copied counterparts. The Hecate has a built in scanner to check patients current reagents and prevent overdoses. It seems to have anomalous properties."
	unacidable = 1
	start_vial = /obj/item/reagent_containers/glass/beaker/hypocartridge/large/CMO
	inject_wait = DELUXE_WAIT_INJECT
	inject_self = DELUXE_SELF_INJECT

/obj/item/hypospray/mkii/combat
	name = "MID 'Ares'"
	desc = "A combat-ready copy of the MID 'Hecate', the Ares has had it's safety protocals torn out, allowing it to act almost instantly. It can be tactically reloaded by using a vial on it. Designed for military engagements, patent pending."
	icon_state = "combathypo"
	allowed_containers = list(/obj/item/reagent_containers/glass/beaker/hypocartridge/tiny, /obj/item/reagent_containers/glass/beaker/hypocartridge/small,/obj/item/reagent_containers/glass/beaker/hypocartridge/small/combat)
	start_vial = /obj/item/reagent_containers/glass/beaker/hypocartridge/small/combat
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

/obj/item/hypospray/mkii/update_icon()
	icon_state = "[initial(icon_state)][is_scanning ? "-d" : ""][vial ? "" : "-e"]"

/obj/item/hypospray/mkii/verb/toggle_mode()
	set name = "Toggle Display"
	set category = "Object"

	is_scanning = !is_scanning
	to_chat(usr, "You [is_scanning ? "open up" : "close"] the [src]'s data tab.")
	update_icon()

/obj/item/hypospray/mkii/examine(mob/user)
	. = ..()
	if(vial)
		to_chat(user, "[vial] has [vial.reagents.total_volume]u remaining.")
	else
		to_chat(user, "It has no cartridge loaded in.")

/obj/item/hypospray/mkii/proc/unload_hypo(mob/user)
	if(vial)
		vial.forceMove(user.loc)
		user.put_in_hands(vial)
		to_chat(user, SPAN_NOTICE("You remove [vial] from [src].</span>"))
		vial = null
		update_icon()
		playsound(loc, 'sound/weapons/empty.ogg', 50, 1)
	else
		to_chat(user, SPAN_NOTICE("This [src] isn't loaded!</span>"))
		return

/obj/item/hypospray/mkii/attackby(obj/item/reagent_containers/glass/beaker/B, mob/living/user)
	var/obj/item/reagent_containers/glass/beaker/hypocartridge/H = B
	if(!istype(H))
		to_chat(user, SPAN_NOTICE("This doesn't fit in [src].</span>"))
		return FALSE
	if(!is_type_in_list(H, allowed_containers))
		to_chat(user, SPAN_NOTICE("[src] doesn't accept this type of cartridge.</span>"))
		return FALSE
	if(vial != null && !quickload)
		to_chat(user, SPAN_WARNING("You have to remove the existing cartridge first!"))
		return FALSE

	user.drop_item()
	unload_hypo(user) // This allows quickloading hypos to put the cartridge into the user's hand
	H.loc = src
	vial = H
	user.visible_message(SPAN_NOTICE("[user] loads a cartridge into \the [src].</span>"), SPAN_NOTICE("You load \a [vial] into \the [src].</span>"))
	update_icon()
	playsound(loc, 'sound/weapons/guns/interact/sfrifle_magin.ogg', 35, 1)
	return TRUE

/obj/item/hypospray/mkii/AltClick(mob/user)
	. = ..()
	toggle_mode()

/obj/item/hypospray/mkii/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		to_chat(user, "You overcharge [src]'s control circuit.")
		emagged = TRUE
		inject_wait = COMBAT_WAIT_INJECT
		inject_self = COMBAT_SELF_INJECT
		penetrates = TRUE
		return TRUE
	else
		to_chat(user, SPAN_WARNING("[src] is already overcharged."))
		return

/obj/item/hypospray/mkii/attack_hand(mob/user)
	. = ..() //Don't bother changing this or removing it from containers will break.

/obj/item/hypospray/mkii/attack(mob/living/M as mob, mob/user as mob)
	if (!istype(M))
		return
	if(is_scanning)
		scan(M, user)
		return
	if(!vial)
		to_chat(user, SPAN_NOTICE("[src] doesn't have a cartridge installed!"))
		return
	if(!vial.reagents.total_volume)
		to_chat(user, SPAN_WARNING("[src] is empty."))
		return

	var/injtime //Injecting through a hardsuit takes long time due to needing to find a port.
				// Handling errors and injection duration
	var/mob/living/carbon/human/H = M
	if(istype(H))
		var/obj/item/clothing/suit/space/SS = H.get_equipped_item(slot_wear_suit)
		var/obj/item/rig/RIG = H.get_equipped_item(slot_back)
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
			if(!emagged && check_overdose(M, user))	//OD check for injecting rigs.
				return
			if(do_mob(user, M, RIG_WAIT_INJECT))
				user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))

		else //Check for what type of injectwait if not rig or if penetrates.
			user.visible_message(SPAN_WARNING("[user] begins scanning [M] with [src]!"))
			if(!emagged && check_overdose(M, user))	//OD check for injecting normal patient
				return
			if(do_mob(user, M, inject_wait))
				user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))

	if(M == user)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		user.do_attack_animation(M)
		user.visible_message(SPAN_WARNING("[user] begins scanning themself with [src]!"))
		if(!emagged && check_overdose(M, user))	//OD check for self injection, derpy user
			return
		user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))	// No injection delay for self.

	// handling actual injection
	// on this stage we are sure that everything is alright
	var/contained = vial.reagents.log_list()
	vial.reagents.trans_to_mob(M, vial.amount_per_transfer_from_this, CHEM_BLOOD)
	admin_inject_log(user, M, src, contained, vial.amount_per_transfer_from_this)
	var/long_sound = vial.amount_per_transfer_from_this >= 15
	playsound(loc, long_sound ? 'zzzz_modular_occulus/sound/items/hypospray_long.ogg' : pick('zzzz_modular_occulus/sound/items/hypospray.ogg','zzzz_modular_occulus/sound/items/hypospray2.ogg'), 50, 1, -1)
	to_chat(user, SPAN_NOTICE("You inject [vial.amount_per_transfer_from_this] units of the solution. The Apollo's cartridge now contains [vial.reagents.total_volume] units."))
	return

/obj/item/hypospray/mkii/proc/check_overdose(mob/living/carbon/human/patient, mob/living/carbon/human/doctor)

	/* check_overdose(M)

	The intention of this proc is to check if the target (M) would be overdosing
	from any of the hypospray's vial's contents.

	If this proc returns TRUE, there will be an overdose.
	If this proc returns FALSE, there will not be an overdose.

	*/


	var/list/hypo_reagents = vial.reagents.reagent_list
	var/overdosing = FALSE
	var/list/od_list = list() // Holds all reagents which would cause an OD.

	if(!hypo_reagents.len)	// Nothing in the hypo
		return FALSE

	for(var/datum/reagent/drug in hypo_reagents)// Loop through all reagents in the hypo
		if(drug.overdose == 0)					// There's no OD, so we can ignore this reagent
			continue

		// How much of the current reagent is in the patient?
		var/existing_volume = patient.reagents.get_reagent_amount(drug.id)

		if(existing_volume + min(drug.volume, vial.amount_per_transfer_from_this) > drug.overdose)	// if it is over the OD limit...
			od_list += drug		// Create a list with all drugs which would OD.
			overdosing = TRUE	// We don't return now in the event of multiple ODs.

	if(overdosing)					// We check this AFTER all drug checks are performed.
		var/ODs = od_list.Join(", ")// Join the list of ODing chems, seperated with commas.
		to_chat(doctor, SPAN_WARNING("The [src] beeps indignantly. 'Injection refused -- this would cause an overdose of: [ODs].'"))
		return TRUE

	return FALSE	// There's no overdose, so return FALSE.


/obj/item/hypospray/mkii/proc/is_valid_scan_target(atom/O)
	return istype(O, /mob/living) || istype(O, /obj/structure/closet/body_bag)

/obj/item/hypospray/mkii/proc/scan(atom/A, mob/user)
	scan_data = hypo_scan_action(A, user)
	scan_title = "Hypo scan - [A]"
	show_results(user)
	flick("health2", src)

/obj/item/hypospray/mkii/proc/show_results(mob/user)
	var/datum/browser/popup = new(user, "hypospray", scan_title, window_width, window_height)
	popup.set_content("[scan_data]")
	popup.open()

/obj/item/hypospray/mkii/proc/hypo_scan_action(atom/target, mob/living/user)

	var/mob/living/carbon/human/scan_subject = target
	if(istype(target))
		scan_subject = target

	else if(istype(target, /obj/structure/closet/body_bag))
		var/obj/structure/closet/body_bag/B = target
		if(B.opened)
			return

		var/list/scan_content = list()
		for(var/mob/living/carbon/human/H in B.contents)
			scan_content.Add(H)
		if(scan_content.len == 1)
			scan_subject = scan_content[1]
		else if(scan_content.len > 1)
			to_chat(user, SPAN_WARNING("\The [src] picks up multiple readings inside \the [target], too close together to scan properly."))
			return
		else
			to_chat(user, "\The [src] does not detect anyone inside \the [target].")
			return

	if(!scan_subject)
		return

	if(scan_subject.isSynthetic())
		to_chat(user, SPAN_WARNING("\The [src] is designed for organic humanoid patients only."))
		return

	user.visible_message(SPAN_NOTICE("[user] has scanned [target]'s vitals."), SPAN_NOTICE("You have analyzed [target]'s vitals."))
	. = hypo_scan_results(scan_subject)

/obj/item/hypospray/mkii/proc/hypo_scan_results(var/mob/living/M)
	. = list()
	var/dat = list()

	var/mob/living/carbon/C = M
	if(!istype(C))
		return
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
	if(!dat)
		dat = "No reagents detected in subject."
	. = jointext(dat, "<br>")

/obj/item/hypospray/mkii/attack_self(mob/living/user)
	if(!user)
		return
	if(user.incapacitated())
		return
	if(!vial)
		to_chat(user, "The [src] needs to be loaded first!")
		return
	unload_hypo(user)
