/obj/item/weapon/gun/projectile/automatic/white_nail
	name = "NT Prototype .20 \"White Nail\""
	desc = "A bleeding-edge development in kinetic weaponry. This gun has an internal magazine that generates ammunition over time. Uses Nail™ ammunition."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/whitenail.dmi'
	icon_state = "whitenail"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = "nail"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK|SLOT_POCKET
	load_method = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	magazine_type = /obj/item/ammo_magazine/nail
	auto_eject = FALSE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 10)
	matter_reagents = list("uncap nanites" = 25)
	price_tag = 3500
	rarity_value = 48
	fire_sound = 'zzzz_modular_occulus/sound/weapons/guns/fire/nail_fire.ogg'
	unload_sound 	= 'zzzz_modular_occulus/sound/weapons/guns/interact/nail_out.ogg'
	reload_sound 	= 'zzzz_modular_occulus/sound/weapons/guns/interact/nail_in.ogg'
	var/refill_sound = 'zzzz_modular_occulus/sound/weapons/guns/misc/nail_refill.ogg'
	zoom_factor = 0.6
	recoil_buildup = 4
	one_hand_penalty = 15 //automatic rifle level

	var/rebuild_tick = 0
	var/rebuild_time = 4

	init_firemodes = list(
		BURST_3_ROUND
		)


/obj/item/weapon/gun/projectile/automatic/white_nail/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	update_icon()


/obj/item/weapon/gun/projectile/automatic/white_nail/Process() // generates ammo in the loaded mag
	var/current_ammo = src.get_ammo()

	rebuild_tick++
	if(rebuild_tick < rebuild_time) return FALSE
	rebuild_tick = 0

	if(current_ammo >=  ammo_magazine.max_ammo) // do we actually need to regenerate ammo?
		return FALSE
	
	for(var/i in 1 to 3)
		ammo_magazine.stored_ammo += new ammo_magazine.ammo_type(src)

	update_icon()

	if(ammo_magazine.stored_ammo.len >=  ammo_magazine.max_ammo) 
		src.visible_message("\ The White Nail chimes, indicating the magazine is full.", 1)
		playsound(src.loc, refill_sound, 50, 1)


/obj/item/weapon/gun/projectile/automatic/white_nail/Destroy()
	STOP_PROCESSING(SSobj, src)

/obj/item/weapon/gun/projectile/automatic/white_nail/load_ammo(obj/item/A, mob/user)
	.=..()

/obj/item/weapon/gun/projectile/automatic/white_nail/unload_ammo(mob/user, var/allow_dump=1) // empties mag on eject
	if(ammo_magazine)
		for(var/i=1 to ammo_magazine.stored_ammo.len)
			ammo_magazine.stored_ammo.Cut()
		to_chat(user, SPAN_WARNING("The magazine rattles as you remove it, any nanites inside returning to the rifle."))
	.=..()

/obj/item/weapon/gun/projectile/automatic/white_nail/on_update_icon()
	..()

	if (ammo_magazine)
		switch(length(ammo_magazine.stored_ammo))
			if(0)
				icon_state = "whitenail_0"
			if(3)
				icon_state = "whitenail_25"
			if(6)
				icon_state = "whitenail_50"
			if(9)
				icon_state = "whitenail_75"
			if(12)
				icon_state = "whitenail_100"	

	if (!ammo_magazine)
		icon_state = "whitenail"