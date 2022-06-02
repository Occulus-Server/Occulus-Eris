/obj/item/stack/unrefinedsilk
	name = "raw silk strands"
	desc = "Some loose strands of still-sticky spider silk. Can be refined."
	icon = 'icons/obj/stack/items.dmi'
	singular_name = "silk glob"
	icon_state = "rods"
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
	icon = 'icons/obj/stack/items.dmi'
	singular_name = "silk strand"
	icon_state = "rods"
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
	icon_state = "drying_rack"
	icon_on = "drying_rack_on"
	icon_off = "drying_rack"

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
		S.dryness += drying_power * (rand(0.85, 1.15))
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
