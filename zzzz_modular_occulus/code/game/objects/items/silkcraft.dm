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
	attack_verb = list("hit", "slapped", "smacked")
	price_tag = 1

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
	attack_verb = list("hit", "slapped", "smacked")
	price_tag = 10

/obj/item/stack/webcloth
	name = "web bundle"
	desc = "Some still sticky webs bound into a workable bundle."
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
	attack_verb = list("hit", "slapped", "smacked")
	price_tag = 10

/obj/item/stack/silkcloth
	name = "silk cloth"
	desc = "Some smooth spider-silk made cloth. Its near-indistinguishable from normal silk."
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
	attack_verb = list("hit", "slapped", "smacked")
	price_tag = 10

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