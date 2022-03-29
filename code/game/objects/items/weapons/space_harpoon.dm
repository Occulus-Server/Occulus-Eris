#define MODE_RECEIVE 0
#define MODE_TRANSMIT 1

/obj/item/bluespace_harpoon
	name = "NT BSD \"Harpoon\""
	desc = "The pride of Nanotrasen's Bluespace research efforts, this 'harpoon' serves as a tool for short and accurate teleportation of both cargo and personnel through Bluespace." // OCCULUS EDIT - Better description
	icon_state = "harpoon-1"
	icon = 'icons/obj/items.dmi'
	w_class = ITEM_SIZE_NORMAL
	throw_speed = 4
	throw_range = 20
	origin_tech = list(TECH_BLUESPACE = 5)
	price_tag = 4000
	matter = list(MATERIAL_SILVER = 10, MATERIAL_GOLD = 5, MATERIAL_PHORON = 20, MATERIAL_PLASTIC = 20)
	spawn_blacklisted = TRUE
	var/entropy_value = 2
	var/mode = MODE_TRANSMIT
	var/transforming = FALSE	// mode changing takes some time
	var/offset_chance = 10		//chance to teleport things in wrong place	// OCCULUS EDIT - Doubled since COG now affects it
	var/teleport_offset = 8		//radius of wrong place
	var/obj/item/cell/cell
	var/suitable_cell = /obj/item/cell/medium
	var/Using = FALSE				//If its being used
	var/range = 14 //OCCULUS EDIT - allow for more z-level traversal
	slot_flags = SLOT_BACK //OCCULUS EDIT

/obj/item/bluespace_harpoon/Initialize()
	. = ..()
	if(!cell && suitable_cell)
		cell = new suitable_cell(src)

/obj/item/bluespace_harpoon/get_cell()
	return cell

/obj/item/bluespace_harpoon/handle_atom_del(atom/A)
	..()
	if(A == cell)
		cell = null
		update_icon()

/obj/item/bluespace_harpoon/afterattack(atom/A, mob/user)
	if(get_dist(A, user) > range)
		return ..()
//	if(!(A in view(user))) // OCCULUS EDIT - This prevents z-level traversal somehow, so eh.
//		return ..()
	if(istype(A, /obj/item/storage/))
		return ..()
	else if(istype(A, /obj/structure/table/) && (get_dist(A, user) <= 1))
		return ..()

	var/turf/AtomTurf = get_turf(A)
	var/turf/UserTurf = get_turf(user)
	var/dense_check
	switch(mode)
		if(MODE_TRANSMIT)
			if(istype(AtomTurf, /turf/simulated/open) && !AtomTurf.is_solid_structure()) //OCCULUS EDIT - now gracefully lands you when traversing Zs
				AtomTurf = GetBelow(AtomTurf)
			dense_check = iswall(AtomTurf) //OCCULUS EDIT
		if(MODE_RECEIVE)
			dense_check = iswall(UserTurf) //OCCULUS EDIT - Dense objects includes a lot of things such as yourself, which breaks receiving mode
	if(dense_check)
		to_chat(user, SPAN_WARNING("Wall detected on receiving terrain. Safety interlocks engaged.")) //OCCULUS EDIT
		return //No actual telefragging, wasn't allowed to do that at the time
	if(!Using)
		Using = TRUE
		user.visible_message(SPAN_WARNING("\The [user] holds \the [src] steady, preparing to fire it!")) //OCCULUS EDIT - Notify us
		to_chat(user,SPAN_WARNING("You hold \the [src] steady, preparing to fire it!")) //OCCULUS EDIT
		if(do_after(user, 1 SECONDS + 3 SECONDS * user.stats.getMult(STAT_COG, STAT_LEVEL_GODLIKE), src)) //OCCULUS EDIT - Fixing up this statcheck, adds a minimum 1 second firing time
			Using = FALSE
			if(!cell || !cell.checked_use(100))
				to_chat(user, SPAN_WARNING("\The [src]'s battery is dead or missing."))
				return
			if(!user || !A || user.machine)
				return
			if(transforming)
				to_chat(user, SPAN_WARNING("You can't fire \the [src] while it is transforming!"))
				return

			playsound(user, 'sound/weapons/wave.ogg', 60, 1)

			user.visible_message(SPAN_WARNING("\The [user] fires \the [src]!"))
			to_chat(user,SPAN_WARNING("You fire \the [src]"))
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(4, 1, A)
			s.start()

			switch(mode)
				if(MODE_TRANSMIT)
					teleport(UserTurf, AtomTurf, user) //OCCULUS EDIT - parse the user's info into here
				if(MODE_RECEIVE)
					teleport(AtomTurf, UserTurf, user) //OCCULUS EDIT - parse the user's info into here
		else
			to_chat(user, SPAN_WARNING("Error, user movement detected. Cancelling lock-on!")) //OCCULUS EDIT - Was too vague, now its descriptive.
			Using = FALSE
	else
		to_chat(user, SPAN_WARNING("Error, unable to lock-on to more than a single location at a time!")) //OCCULUS EDIT - Was too vague, now its descriptive.


/obj/item/bluespace_harpoon/proc/teleport(turf/source, turf/target, mob/living/user as mob) //OCCULUS EDIT - parse the user's info into here
	for(var/atom/movable/AM in source)
		if(istype(AM, /mob/shadow))
			continue
		if(!AM.anchored)
			if(prob(offset_chance * user.stats.getMult(STAT_COG, STAT_LEVEL_GODLIKE))) // OCCULUS  EDIT - Make it less likely to offset you with better stats
				go_to_bluespace(source, entropy_value, TRUE, AM, get_turf(pick(orange(teleport_offset,source))))
			else
				go_to_bluespace(source, entropy_value, TRUE, AM, target)

/obj/item/bluespace_harpoon/attack_self(mob/living/user as mob)
	return change_fire_mode(user)

/obj/item/bluespace_harpoon/verb/change_fire_mode(mob/user)
	set name = "Change fire mode"
	set category = "Object"
	set src in oview(1)
	if(transforming)
		return
	mode = !mode
	transforming = TRUE
	to_chat(user, SPAN_NOTICE("You change [src] mode to [mode ? "transmiting" : "receiving"]."))
	update_icon()
	FLICK("harpoon-[mode]-change", src)
	spawn(6)	//Average length of transforming animation //OCCULUS EDIT - Updated to new sprite's values
		transforming = FALSE

/obj/item/bluespace_harpoon/on_update_icon()
	icon_state = "harpoon-[mode]"

/obj/item/bluespace_harpoon/examine(var/mob/user, var/dist = -1)
	..(user, dist)
	to_chat(user, SPAN_NOTICE("Mode set to [mode ? "transmiting" : "receiving"]."))

/obj/item/bluespace_harpoon/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, usr))
		cell = null

/obj/item/bluespace_harpoon/attackby(obj/item/C, mob/living/user)
	if(istype(C, suitable_cell) && !cell && insert_item(C, user))
		src.cell = C

/obj/item/bluespace_harpoon/mounted
	spawn_tags = null
	var/charge_cost = 100
	var/charge_tick = 0
	var/recharge_time = 4

/obj/item/bluespace_harpoon/mounted/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/bluespace_harpoon/mounted/Process()
	charge_tick++
	if(charge_tick < recharge_time)
		return

	charge_tick = 0

	if(!cell || cell.charge >= cell.maxcharge)
		return

	var/obj/item/cell/large/external = get_external_cell()
	if(!external || !external.use(charge_cost))
		return

	cell.give(charge_cost)
	update_icon()

/obj/item/bluespace_harpoon/mounted/proc/get_external_cell()
	return loc.get_cell()

/obj/item/bluespace_harpoon/mounted/on_update_icon()
	icon_state = "harpoon-mounted-[mode]"

/obj/item/bluespace_harpoon/mounted/blitz
	name = "OR BSD \"Blauerraumharpune\""
	desc = "Reverse engineered version of harpoon developed by old Nanotrasen, remounted for robotic use only by Oberth Republic."
	icon_state = "harpoon-mounted-blitz-1"
	spawn_tags = null

/obj/item/bluespace_harpoon/mounted/blitz/on_update_icon()
	icon_state = "harpoon-mounted-blitz-[mode]"
