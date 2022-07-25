/obj/item/stack/unrefinedsilk
	name = "raw silk strands"
	desc = "Some loose strands of still-sticky spider silk. Can be refined."
	icon = 'zzzz_modular_occulus/icons/obj/silkwork.dmi'
	singular_name = "silk glob"
	icon_state = "rawsilk"
	novariants = FALSE
	flags = CONDUCT
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	var/dryness = 0 //stealing an existing var to fast-track some stuff
	var/dried_type = /obj/item/stack/refinedsilk
	var/dry = FALSE
	throw_speed = 5
	throw_range = 20
	max_amount = 60
	spawn_blacklisted = TRUE
	attack_verb = list("hit", "slapped", "smacked")
	price_tag = 1

/obj/item/stack/unrefinedsilk/attack_self(mob/user)
	if(!(locate(/obj/effect/spider/stickyweb) in get_turf(src)))
		to_chat(user, SPAN_NOTICE("You start creating a webby mess"))
		if(do_after(user, 40, src))
			new /obj/effect/spider/stickyweb(user.loc)
			update_openspace()
			use(3)

/obj/item/stack/refinedsilk
	name = "silk strands"
	desc = "Some lightly-wound strands of refined spider silk."
	icon = 'zzzz_modular_occulus/icons/obj/silkwork.dmi'
	singular_name = "silk strand"
	icon_state = "silk"
	novariants = FALSE
	flags = CONDUCT
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	var/dry
	throw_speed = 5
	throw_range = 20
	max_amount = 60
	spawn_blacklisted = TRUE
	attack_verb = list("hit", "slapped", "smacked")
	price_tag = 2

/obj/item/stack/webcloth
	name = "web cloth"
	desc = "Some still sticky webs bound into a workable cloth."
	icon = 'zzzz_modular_occulus/icons/obj/silkwork.dmi'
	singular_name = "web bundle"
	icon_state = "webcloth"
	novariants = FALSE
	flags = CONDUCT
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	var/dry
	throw_speed = 5
	throw_range = 20
	max_amount = 60
	spawn_blacklisted = TRUE
	attack_verb = list("hit", "slapped", "smacked")
	price_tag = 5

/obj/item/stack/webcloth/attack(mob/living/carbon/human/H, mob/user)
	if(istype(H))
		if(user.targeted_organ == BP_EYES)

			if(!H.organs_by_name[BP_HEAD])
				to_chat(user, SPAN_WARNING("\The [H] doesn't have a head."))
				return
			if(!H.has_eyes())
				to_chat(user, SPAN_WARNING("\The [H] doesn't have any eyes."))
				return
			if(H.glasses)
				to_chat(user, SPAN_WARNING("\The [H] is already wearing somethign on their eyes."))
				return
			if(H.head && (H.head.body_parts_covered & FACE))
				to_chat(user, SPAN_WARNING("Remove their [H.head] first."))
				return
			user.visible_message(SPAN_DANGER("\The [user] begins taping over \the [H]'s eyes!"))

			if(!do_after(user, 15, src) && !use(1))
				return

			// Repeat failure checks.
			if(!H || !src || !H.organs_by_name[BP_HEAD] || !H.has_eyes() || H.glasses || (H.head && (H.head.body_parts_covered & FACE)))
				return

			user.visible_message(SPAN_DANGER("\The [user] has taped up \the [H]'s eyes!"))
			H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/blindfold/tape(H), slot_glasses)

		else if(user.targeted_organ == BP_MOUTH || user.targeted_organ == BP_HEAD)
			if(!H.organs_by_name[BP_HEAD])
				to_chat(user, SPAN_WARNING("\The [H] doesn't have a head."))
				return
			if(!H.check_has_mouth())
				to_chat(user, SPAN_WARNING("\The [H] doesn't have a mouth."))
				return
			if(H.wear_mask)
				to_chat(user, SPAN_WARNING("\The [H] is already wearing a mask."))
				return
			if(H.head && (H.head.body_parts_covered & FACE))
				to_chat(user, SPAN_WARNING("Remove their [H.head] first."))
				return
			user.visible_message(SPAN_DANGER("\The [user] begins taping up \the [H]'s mouth!"))

			if(!do_after(user, 15, src) && !use(1))
				return

			// Repeat failure checks.
			if(!H || !src || !H.organs_by_name[BP_HEAD] || !H.check_has_mouth() || H.wear_mask || (H.head && (H.head.body_parts_covered & FACE)))
				return

			user.visible_message(SPAN_DANGER("\The [user] has taped up \the [H]'s mouth!"))
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/muzzle/tape(H), slot_wear_mask)

		else if(user.targeted_organ == BP_R_ARM || user.targeted_organ == BP_L_ARM)
			if(use(1) && do_after(user, 15, src))
				var/obj/item/handcuffs/cable/tape/T = new(user)
				if(!T.place_handcuffs(H, user))
					user.unEquip(T)
					qdel(T)
		else
			return ..()
		return 1
		
/obj/item/stack/silkcloth
	name = "silk cloth"
	desc = "Some smooth spider-silk made cloth. Its near-indistinguishable from normal silk."
	icon = 'zzzz_modular_occulus/icons/obj/silkwork.dmi'
	singular_name = "silk cloth"
	icon_state = "silkcloth"
	novariants = FALSE
	flags = CONDUCT
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	var/dry
	throw_speed = 5
	throw_range = 20
	max_amount = 60
	spawn_blacklisted = TRUE
	attack_verb = list("hit", "slapped", "smacked")
	price_tag = 10

/material/silk
	name = "silk"
	display_name ="silk"
	stack_type = /obj/item/stack/silkcloth
	icon_colour = "#E4E7EA"
	flags = MATERIAL_PADDING
	ignition_point = T0C+232
	melting_point = T0C+300

/obj/machinery/smartfridge/drying_rack/silk
	name = "\improper Silk Dryer"
	desc = "A machine for drying and refining silk."
	icon = 'zzzz_modular_occulus/icons/obj/silkwork.dmi'
	icon_state = "silkdryer"
	icon_on = "silkdryer_on"
	icon_off = "silkdryer"
	drying_power = 0.2

/obj/machinery/smartfridge/drying_rack/silk/accept_check(var/obj/item/O as obj)
	if(istype(O, /obj/item/stack/unrefinedsilk))
		var/obj/item/stack/unrefinedsilk/S = O
		if (S.dried_type)
			return 1
	return 0

/obj/machinery/smartfridge/drying_rack/silk/dry()
	var/drying_something = FALSE //While we're here, check if anything is undried and still processing
	for(var/obj/item/stack/unrefinedsilk/S in contents)
		if(S.dry)
			continue
		S.dryness += drying_power * ((rand(0.85, 1.15))*(2/S.amount))
		if (S.dryness >= 1)
			var/D = S.dried_type
			D = new D(src)
			if (istype(D, /obj/item/stack/refinedsilk))
				var/obj/item/stack/refinedsilk/SD = D
				SD.amount = S.amount
				SD.dry = TRUE //So we dont get stuck in an endless loop of drying, transforming and drying again
			qdel(S)
			update_contents()
		else
			drying_something = TRUE

	if (drying_something != currently_drying)
		currently_drying = drying_something
		update_icon() //Only update the icon if we have to
	currently_drying = drying_something
	return

/obj/item/handloom
	name = "Hand Cloth Loom"
	desc = "A loom for turning twines and strings into cloth, Now in a small, baggable size"
	icon = 'zzzz_modular_occulus/icons/obj/silkwork.dmi'
	icon_state = "handloom"
	matter = list(MATERIAL_WOOD = 5, MATERIAL_PLASTIC = 2)
	w_class = ITEM_SIZE_NORMAL

/obj/item/handloom/attackby(obj/item/I, mob/living/user, params)
	var/obj/item/stack/loominput = null
	var/obj/item/stack/loomoutput = null
	if(istype(I, /obj/item/stack/unrefinedsilk))
		loominput = I
		loomoutput = /obj/item/stack/webcloth
	if(istype(I, /obj/item/stack/refinedsilk))
		loominput = I
		loomoutput = /obj/item/stack/silkcloth
	if(!loominput)
		to_chat(user, SPAN_NOTICE("This doesn't seem to fit in here."))
		return 0
	if(do_after(user, 10))
		if(loominput.amount < 5)
			to_chat(user, SPAN_NOTICE("You dont think you have enough silk"))
			return 0
		if(loominput.use(5))
			new loomoutput(user.loc)
			to_chat(user, SPAN_NOTICE("You weave the fabric together"))
			return