#define RIG_WAIT_INJECT 60
#define WAIT_INJECT 25
#define SELF_INJECT 15

#define DELUXE_WAIT_INJECT 5
#define DELUXE_SELF_INJECT 10

#define COMBAT_WAIT_INJECT 0
#define COMBAT_SELF_INJECT 0


//A vial-loaded hypospray. Cartridge-based!
/obj/item/hypospray/mkii
	name = "hypospray mk.II"
	icon_state = "hypo2"
	icon = 'zzzz_modular_occulus/icons/obj/syringe.dmi'
	item_icons = list(slot_l_hand_str = 'zzzz_modular_occulus/icons/mob/left_hand.dmi', slot_r_hand_str = 'zzzz_modular_occulus/icons/mob/right_hand.dmi')
	desc = "A new development from a newly acquired Nanotrasen subsidiary, this hypospray takes 30-unit vial cartridges as the drug supply for easy swapping."
	w_class = ITEM_SIZE_TINY
	var/amount_per_transfer_from_this
	var/emagged = FALSE
	var/list/allowed_containers = list(/obj/item/weapon/reagent_containers/glass/beaker/hypovial/tiny, /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small)
	var/obj/item/weapon/reagent_containers/glass/beaker/hypovial/vial
	var/start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small
	var/spawnwithvial = TRUE
	var/inject_wait = WAIT_INJECT
	var/inject_self = SELF_INJECT
	var/quickload = FALSE
	var/penetrates = FALSE

/obj/item/hypospray/mkii/brute
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/bicaridine

/obj/item/hypospray/mkii/toxin
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/antitoxin

/obj/item/hypospray/mkii/oxygen
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/dexalin

/obj/item/hypospray/mkii/burn
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/kelotane

/obj/item/hypospray/mkii/tricord
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/tricord

/obj/item/hypospray/mkii/CMO
	name = "hypospray mk.II deluxe prototype"
	allowed_containers = list(/obj/item/weapon/reagent_containers/glass/beaker/hypovial/tiny, /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small, /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large)
	icon_state = "cmo2"
	desc = "The Mk.II Prototype hypospray can take larger-size vials. It also acts faster and delivers more reagents per spray.Official patent pending."
	unacidable = 1
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/CMO
	inject_wait = DELUXE_WAIT_INJECT
	inject_self = DELUXE_SELF_INJECT

/obj/item/hypospray/mkii/CMO/combat
	name = " hypospray mk.II combat prototype"
	desc = "A combat-ready deluxe hypospray that acts almost instantly. It can be tactically reloaded by using a vial on it. Designed for military engagements. Official patent pending."
	icon_state = "combat2"
	start_vial = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/combat
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
	icon_state = "[initial(icon_state)][vial ? "" : "-e"]"

/obj/item/hypospray/mkii/examine(mob/user)
	. = ..()
	if(vial)
		to_chat(user, "[vial] has [vial.reagents.total_volume]u remaining.")
	else
		to_chat(user, "It has no vial loaded in.")

/obj/item/hypospray/mkii/proc/unload_hypo(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/reagent_containers/glass/beaker/hypovial)))
		var/obj/item/weapon/reagent_containers/glass/beaker/hypovial/V = I
		V.forceMove(user.loc)
		user.put_in_hands(V)
		to_chat(user, "<span class='notice'>You remove [vial] from [src].</span>")
		vial = null
		update_icon()
		playsound(loc, 'sound/weapons/empty.ogg', 50, 1)
	else
		to_chat(user, "<span class='notice'>This hypo isn't loaded!</span>")
		return

/obj/item/hypospray/mkii/attackby(obj/item/I, mob/living/user)
	if((istype(I, /obj/item/weapon/reagent_containers/glass/beaker/hypovial) && vial != null))
		if(!quickload)
			to_chat(user, "<span class='warning'>[src] can not hold more than one vial!</span>")
			return FALSE
		unload_hypo(vial, user)
	if((istype(I, /obj/item/weapon/reagent_containers/glass/beaker/hypovial)))
		var/obj/item/weapon/reagent_containers/glass/beaker/hypovial/V = I
		if(!is_type_in_list(V, allowed_containers))
			to_chat(user, "<span class='notice'>[src] doesn't accept this type of vial.</span>")
			return FALSE
//		if(!user.transferItemToLoc(V,src)) -Not sure what this is tbh. Looks like a sanity check, but I'm not sure what for.
//			return FALSE
		user.drop_item()
		V.loc = src
		vial = V
		user.visible_message("<span class='notice'>[user] has loaded a vial into [src].</span>","<span class='notice'>You have loaded [vial] into [src].</span>")
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
		to_chat(user, "<span class='notice'>[src] doesn't have any vial installed!</span>")
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
					to_chat(user, SPAN_NOTICE("[trans] units injected. [vial.reagents.total_volume] units remaining in \the [src].")) //May need to switch this to vial.reagents.total_volum
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
		if(injtime) //checks for rig from prior check above, overrides inject wait for RIG inject because rig.
			user.visible_message(SPAN_WARNING("[user] begins hunting for an injection port on [M]'s suit!"), SPAN_WARNING("You begins hunting for an injection port on [M]'s suit!"))
			if(do_mob(user, M, RIG_WAIT_INJECT))
				user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
		else //Check for what type of injectwait if not rig
			if(do_mob(user, M, inject_wait))
				user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
			else
				return
	// handling actual injection
	// on this stage we are sure that everything is alright
	var/contained = vial.reagents.log_list()
	vial.reagents.trans_to_mob(M, vial.amount_per_transfer_from_this, CHEM_BLOOD)
	admin_inject_log(user, M, src, contained, vial.amount_per_transfer_from_this)
	var/long_sound = vial.amount_per_transfer_from_this >= 15
	playsound(loc, long_sound ? 'zzzz_modular_occulus/sound/items/hypospray_long.ogg' : pick('zzzz_modular_occulus/sound/items/hypospray.ogg','zzzz_modular_occulus/sound/items/hypospray2.ogg'), 50, 1, -1)
	to_chat(user, "<span class='notice'>You inject [vial.amount_per_transfer_from_this] units of the solution. The hypospray's cartridge now contains [vial.reagents.total_volume] units.</span>")

	return




/obj/item/hypospray/mkii/attack_self(mob/living/user)
	if(user)
		if(user.incapacitated())
			return
		else if(!vial)
			to_chat(user, "This Hypo needs to be loaded first!")
			return
		else
			unload_hypo(vial,user)

