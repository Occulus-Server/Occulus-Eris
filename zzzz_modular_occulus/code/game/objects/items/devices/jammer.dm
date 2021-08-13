var/global/list/active_radio_jammers = list()

/proc/is_jammed(var/obj/radio)
	var/turf/Tr = get_turf(radio)
	if(!Tr) return 0 //Nullspace radios don't get jammed.

	for(var/jammer in active_radio_jammers)
		var/obj/item/device/radio_jammer/J = jammer
		var/turf/Tj = get_turf(J)

		if(J.on && Tj.z == Tr.z) //If we're on the same Z, it's worth checking.
			var/dist = get_dist(Tj,Tr)
			if(dist <= J.jam_range)
				return list("jammer" = J, "distance" = dist)

/obj/item/device/radio_jammer
	name = "subspace jammer"
	desc = "Primarily for blocking subspace communications, preventing the use of headsets, PDAs, and communicators. Also masks suit sensors."	// Added suit sensor jamming
	icon = 'zzzz_modular_occulus/icons/obj/device.dmi'
	icon_state = "jammer0"
	slot_flags = SLOT_BELT
	suitable_cell = /obj/item/weapon/cell/medium
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	spawn_blacklisted = TRUE
	var/active_state = "jammer1"
	var/on = 0
	var/jam_range = 7
	var/tick_cost = 1
	origin_tech = list(TECH_ILLEGAL = 4, TECH_BLUESPACE = 4) //Such technology! Subspace jamming!


/obj/item/device/radio_jammer/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/device/radio_jammer/Destroy()
	if(on)
		turn_off()
	QDEL_NULL(cell)
	return ..()

/obj/item/device/radio_jammer/proc/turn_off(mob/user)
	if(user)
		to_chat(user,"<span class='warning'>\The [src] deactivates.</span>")
	STOP_PROCESSING(SSobj, src)
	active_radio_jammers -= src
	on = FALSE
	update_icon()

/obj/item/device/radio_jammer/proc/turn_on(mob/user)
	if(user)
		to_chat(user,"<span class='notice'>\The [src] is now active.</span>")
	START_PROCESSING(SSobj, src)
	active_radio_jammers += src
	on = TRUE
	update_icon()

/obj/item/device/radio_jammer/Process()
	if(!on)
		return

	if(!cell || cell.is_empty())
		turn_off()
		return

	if(!cell || !cell_use_check(tick_cost))
		var/mob/living/notify
		if(isliving(loc))
			notify = loc
		turn_off(notify)
	else
		cell.use(tick_cost)
		update_icon()


/obj/item/device/radio_jammer/attack_self(mob/user)
	if(on)
		turn_off(user)
	else
		if(cell)
			turn_on(user)
		else
			to_chat(user,"<span class='warning'>\The [src] has no power source!</span>")

/obj/item/device/radio_jammer/update_icon()
	if(on)
		icon_state = active_state
	else
		icon_state = initial(icon_state)

