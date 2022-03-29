/obj/item/guncore
	name = "Inert Catalyst"
	desc = "An inert device of some kind. Looks like it could use some more parts."
	icon = 'zzzz_modular_occulus/icons/obj/catacraft.dmi'
	icon_state = "catacore"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 5)
	w_class = ITEM_SIZE_NORMAL
	spawn_blacklisted = TRUE
	price_tag = 300
	var/req_parts = 15
	var/core_type = 1
	var/part_type = /obj/item/stock_parts/manipulator
	var/complete = FALSE

/obj/item/guncore/examine(user, distance)
	. = ..()
	if(.)
		if(req_parts > 0)
			to_chat(user, SPAN_NOTICE("Requires [req_parts] parts to be complete."))
			if(req_parts == 15)
				to_chat(user, SPAN_NOTICE("You can move the wires in place to accept different parts with a multitool"))
		else
			to_chat(user, SPAN_NOTICE("[src] is complete."))
	if(core_type == 1)
		to_chat(user, SPAN_NOTICE("This core will produce Shrapnel and needs manipulators"))
	if(core_type == 2)
		to_chat(user, SPAN_NOTICE("This core will produce Rubber and needs matter bins"))
	if(core_type == 3)
		to_chat(user, SPAN_NOTICE("This core will produce Plasma and needs capacitors"))
	if(core_type == 4)
		to_chat(user, SPAN_NOTICE("This core will produce Lasers and needs micro lasers"))

/obj/item/guncore/attackby(obj/item/I, mob/living/user, params)
	if(I.has_quality(QUALITY_PULSING))
		if(req_parts <= 14)
			to_chat(user, SPAN_WARNING("[src] already has parts attached"))
			return
		if(core_type == 1)
			core_type = 2
			part_type = /obj/item/stock_parts/matter_bin
			to_chat(user, SPAN_WARNING("[src] is attuned to Rubber"))
			return
		if(core_type == 2)
			core_type = 3
			part_type = /obj/item/stock_parts/capacitor
			to_chat(user, SPAN_WARNING("[src] is attuned to Plasma"))
			return
		if(core_type == 3)
			core_type = 4
			part_type = /obj/item/stock_parts/micro_laser
			to_chat(user, SPAN_WARNING("[src] is attuned to Lasers"))
			return
		if(core_type == 4)
			core_type = 1
			part_type = /obj/item/stock_parts/manipulator
			to_chat(user, SPAN_WARNING("[src] is attuned to Shrapnel"))
			return
	if(istype(I, part_type))
		if(complete)
			to_chat(user, SPAN_WARNING("[src] is complete"))
			return
		else if(insert_item(I, user))
			req_parts--
			if(req_parts <= 0)
				complete = TRUE
				to_chat(user, SPAN_NOTICE("You have completed [src]."))
			return
	return ..()

/obj/item/guncore/attack_self(mob/user)
	if(!complete)
		to_chat(user, SPAN_NOTICE("The core is missing parts!"))
		return
	if(do_after(user, 10))
		if(core_type == 1)
			new /obj/item/guncore/shrapnel(user.loc)
			to_chat(user, SPAN_NOTICE("You've constructed a Shrapnel Core!"))
			qdel(src)
		if(core_type == 2)
			new /obj/item/guncore/rubber(user.loc)
			to_chat(user, SPAN_NOTICE("You've constructed a Rubber Core!"))
			qdel(src)
		if(core_type == 3)
			new /obj/item/guncore/plasma(user.loc)
			to_chat(user, SPAN_NOTICE("You've constructed a Plasma Core!"))
			qdel(src)
		if(core_type == 4)
			new /obj/item/guncore/laser(user.loc)
			to_chat(user, SPAN_NOTICE("You've constructed a Laser Core!"))
			qdel(src)

/obj/item/guncore/shrapnel
	name = "Shrapnel Core"
	desc = "An electronic core constructed with Manipulators, Designed to produce Shrapnel."
	icon_state = "shrapcore"
	req_parts = 0
	part_type = null
	core_type = 1

/obj/item/guncore/rubber
	name = "Rubber Core"
	desc = "An electronic core constructed with Matter bins, Designed to produce Rubber."
	icon_state = "rubbcore"
	req_parts = 0
	part_type = null
	core_type = 2

/obj/item/guncore/plasma
	name = "Plasma Core"
	desc = "An electronic core constructed with Capacitors, Designed to produce Plasma."
	icon_state = "plascore"
	req_parts = 0
	part_type = null
	core_type = 3

/obj/item/guncore/laser
	name = "Laser Core"
	desc = "An electronic core constructed with Micro lasers, Designed to produce Lasers."
	icon_state = "lascore"
	req_parts = 0
	part_type = null
	core_type = 4

/obj/item/gunchassis
	name = "Experimental Stock"
	desc = "An odd machine chassis vaguely resembling a gun stock."
	icon = 'icons/obj/oddities.dmi'
	icon_state = "artwork_3"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 5)
	w_class = ITEM_SIZE_NORMAL
	spawn_blacklisted = TRUE
	price_tag = 300
	var/req_parts = 5
	var/gun_result = null
	var/core = /obj/item/guncore
	var/coreinstalled = FALSE
	var/part_type = /obj/item/part/gun
	var/complete = FALSE

/obj/item/gunchassis/proc/generate_gun()
	if(istype(core, /obj/item/guncore/shrapnel))
		gun_result = /obj/item/gun/energy/shrapnel/corsair
	if(istype(core, /obj/item/guncore/rubber))
		gun_result = /obj/item/gun/energy/shrapnel/corsair/enforcer
	if(istype(core, /obj/item/guncore/plasma))
		gun_result = /obj/item/gun/energy/plasma/didact
	if(istype(core, /obj/item/guncore/laser))
		gun_result = /obj/item/gun/energy/laser/sentinel

/obj/item/gunchassis/examine(user, distance)
	. = ..()
	if(.)
		if(req_parts > 0)
			to_chat(user, SPAN_NOTICE("Requires [req_parts] parts to be complete."))
		else
			to_chat(user, SPAN_NOTICE("[src] is complete, and just needs its screws tightened."))

		if(!coreinstalled)
			to_chat(user, SPAN_NOTICE("[src] does not have a core installed."))
		else
			to_chat(user, SPAN_NOTICE("The core has been installed."))

/obj/item/gunchassis/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, core))
		if(coreinstalled)
			to_chat(user, SPAN_NOTICE("Theres already a core inside"))
			return
		if(!istype(I, /obj/item/guncore/shrapnel) && !istype(I, /obj/item/guncore/rubber) && !istype(I, /obj/item/guncore/plasma) && !istype(I, /obj/item/guncore/laser))
			to_chat(user, SPAN_NOTICE("The core is not complete!"))
			return
		if(insert_item(I, user))
			core = I
			generate_gun()
			coreinstalled = TRUE
			to_chat(user, SPAN_NOTICE("You've slotted the core inside"))
	if(istype(I, part_type))
		if(complete)
			to_chat(user, SPAN_WARNING("[src] is complete"))
			return
		else if(insert_item(I, user))
			req_parts--
			if(req_parts <= 0)
				complete = TRUE
				to_chat(user, SPAN_NOTICE("You have completed [src]."))
			return
	if(I.has_quality(QUALITY_SCREW_DRIVING))
		if(!complete)
			to_chat(user, SPAN_NOTICE("The gun is not complete and needs more parts"))
			return
		if(!coreinstalled)
			to_chat(user, SPAN_NOTICE("The gun requires a core"))
			return
		if(do_after(user, 5))
			new gun_result(user.loc)
			qdel(src)
	return ..()

