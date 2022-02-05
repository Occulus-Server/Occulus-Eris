/obj/item/device/propaganda_chip
	origin_tech = list(TECH_MAGNET = 3)

	/* Changes from original file: origin_tech was listed as TECH_MAGNETS,
	   which was a non-existent tech that broke the destructive analyzer.
	*/

/obj/item/device/spy_sensor
	origin_tech = list(TECH_MAGNET = 5, TECH_COVERT = 2)

	/* Changes from original file: origin_tech was listed as TECH_MAGNETS,
	   which was a non-existent tech that broke the destructive analyzer.
	*/
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


/obj/item/device/lighting/toggleable/flashlight/emp
	origin_tech = "magnets=3;syndicate=1"

	var/emp_max_charges = 4
	var/emp_cur_charges = 4
	var/charge_tick = 0


/obj/item/device/lighting/toggleable/flashlight/emp/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/device/lighting/toggleable/flashlight/emp/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/device/lighting/toggleable/flashlight/emp/Process()
	charge_tick++
	if(charge_tick < 10)
		return FALSE
	charge_tick = 0
	emp_cur_charges = min(emp_cur_charges+1, emp_max_charges)
	return TRUE

/obj/item/device/lighting/toggleable/flashlight/emp/attack(mob/living/M as mob, mob/living/user as mob)
	if(on && user.targeted_organ == BP_EYES) // call original attack proc only if aiming at the eyes
		..()
	return

/obj/item/device/lighting/toggleable/flashlight/emp/afterattack(atom/A as mob|obj, mob/user, proximity)
	if(!proximity) return
	if(emp_cur_charges > 0)
		emp_cur_charges -= 1
		A.visible_message("<span class='danger'>[user] blinks \the [src] at \the [A].", \
											"<span class='userdanger'>[user] blinks \the [src] at \the [A].")
		to_chat(user, "[src] now has [emp_cur_charges] charge\s.")
		A.emp_act(1)
	else
		to_chat(user, "<span class='warning'>\The [src] needs time to recharge!</span>")
	return

/obj/item/clothing/gloves/powerfist
	name = "'Stonecrash' mining gauntlets"
	desc = "An obsolete form of mining"
	icon = 'zzzz_modular_occulus/icons/obj/weapons.dmi'
	icon_state = "powerfist"
	item_state = "powerfist"
	flags = CONDUCT
	force = 20
	throwforce = 10
	throw_range = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = "combat=5;powerstorage=3;syndicate=3"
	var/click_delay = 1.5
	var/fisto_setting = 1
	var/gasperfist = 3
	var/obj/item/weapon/tank/tank  //Tank used for the gauntlet's piston-ram.
	price_tag = 5000
	rarity_value = 99
	var/stunforce = 2
	var/agonyforce = 0
/obj/item/clothing/gloves/powerfist/Destroy()
	QDEL_NULL(tank)
	return ..()

/obj/item/clothing/gloves/powerfist/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/weapon/tank))
		if(!tank)
			var/obj/item/weapon/tank/IT = W
			if(IT.volume <= 3)
				to_chat(user, "<span class='warning'>[IT] is too small for [src].</span>")
				return
			updateTank(W, 0, user)
			return
	if(QUALITY_BOLT_TURNING in W.tool_qualities)
		switch(fisto_setting)
			if(1)
				fisto_setting = 2
			if(2)
				fisto_setting = 3
			if(3)
				fisto_setting = 1
		to_chat(user, "<span class='notice'>You tweak [src]'s piston valve to [fisto_setting].</span>")

	if(QUALITY_SCREW_DRIVING in W.tool_qualities)
		if(!tank)
			return
		. = TRUE
		updateTank(tank, 1, user)
	return ..()

/obj/item/clothing/gloves/powerfist/proc/updateTank(var/obj/item/weapon/tank/thetank, removing = 0, mob/living/carbon/human/user)
	if(removing)
		if(!tank)
			to_chat(user, "<span class='notice'>[src] currently has no tank attached to it.</span>")
			return
		to_chat(user, "<span class='notice'>You detach [thetank] from [src].</span>")
		tank.forceMove(get_turf(user))
		user.put_in_hands(tank)
		tank = null
	if(!removing)
		if(tank)
			to_chat(user, "<span class='warning'>[src] already has a tank.</span>")
			return
		if(!user.unEquip(thetank))
			return
		to_chat(user, "<span class='notice'>You hook [thetank] up to [src].</span>")
		tank = thetank
		thetank.forceMove(src)


/obj/item/clothing/gloves/powerfist/examine(mob/user)
	. = ..()
	if(!in_range(user, src))
		to_chat(user, "<span class='notice'>You'll need to get closer to see any more.</span>")
	else if(tank)
		to_chat(user,"<span class='notice'> It has [tank] mounted onto it.</span>")



/obj/item/clothing/gloves/powerfist/Touch(mob/living/L, var/proximity)
	var/mob/living/user = loc
	if(!tank)
		to_chat(user, "<span class='warning'>[src] can't operate without a source of gas!</span>")
		return
	if(!istype(L) || !proximity)
		return ..()
	if(isrobot(L))
		return ..()
	if(tank && !tank.air_contents.remove(gasperfist * fisto_setting))
		to_chat(user, "<span class='warning'>[src]'s piston-ram lets out a weak hiss, it needs more gas!</span>")
		playsound(loc, 'sound/effects/refill.ogg', 50, 1)
		return


	var/agony = agonyforce
	var/stun = stunforce
	var/obj/item/organ/external/affecting = null
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		affecting = H.get_organ(user.targeted_organ)

	//stun effects
	if(affecting)
		visible_message("<span class='danger'>[user]'s powerfist lets out a loud hiss as they punch [L] in the [affecting] !</span>")
		to_chat(L, "<span class='userdanger'>You cry out in pain as [user]'s punch flings you backwards!</span>")
	else
		visible_message(SPAN_DANGER("[L] has been power punched with [src] by [user]!"))
		to_chat(L, "<span class='userdanger'>You cry out in pain as [user]'s punch flings you backwards!</span>")
	playsound(loc, 'zzzz_modular_occulus/sound/weapons/resonator_blast.ogg', 50, 1)
	playsound(loc, 'sound/weapons/genhit2.ogg', 50, 1)
	user.do_attack_animation(L)

	L.apply_damage(force * fisto_setting, BRUTE)
	new /obj/effect/temp_visual/kinetic_blast(L.loc)

	var/atom/throw_target = get_edge_target_turf(L, get_dir(src, get_step_away(L, src)))
	L.throw_at(throw_target, 5 * fisto_setting, 0.2)
	L.stun_effect_act(stun, agony, user.targeted_organ, src)
	msg_admin_attack("[key_name(user)] punched [key_name(L)] with the [src].")
	user.attack_log += "\[[time_stamp()]\] <font color='red'>punched [key_name(L)] with [src]</font>"
	L.attack_log += "\[[time_stamp()]\] <font color='orange'>Was punched by [key_name(L)] with [src]</font>"

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.forcesay(hit_appends)
