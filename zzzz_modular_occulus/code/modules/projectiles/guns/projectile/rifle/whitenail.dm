/obj/item/weapon/gun/projectile/automatic/whitenail
	name = "NT Prototype \"White Nail\""
	desc = "A bleeding-edge development in kinetic weaponry. This gun regenerates ammunition slowly over time using advanced nanite technology. The rifle's body feels similar to very sturdy ceramic. When all you have is a Nail..."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/whitenail.dmi'
	icon_state = "whitenail"
	w_class = ITEM_SIZE_HUGE
	caliber = CAL_NAIL
	origin_tech = list(TECH_COMBAT = 7, TECH_ENGINEERING = 3, TECH_MAGNET = 3)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	magazine_type = /obj/item/ammo_magazine/whitenail
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 5)
	matter_reagents = list("uncap nanites" = 25)
	price_tag = 6000
	fire_sound = 'zzzz_modular_occulus/sound/weapons/guns/fire/nail_fire.ogg'
	unload_sound 	= 'zzzz_modular_occulus/sound/weapons/guns/interact/nail_out.ogg'
	reload_sound 	= 'zzzz_modular_occulus/sound/weapons/guns/interact/nail_in.ogg'
	var/refill_sound = 'zzzz_modular_occulus/sound/weapons/guns/misc/nail_refill.ogg'
	zoom_factor = 0.9 
	recoil_buildup = 7
	one_hand_penalty = 20 
	damage_multiplier = 1.2
	spawn_blacklisted = TRUE
	var/rebuild_tick = 0
	var/rebuild_time = 3
	init_firemodes = list(
		BURST_3_ROUND
		)

/obj/item/weapon/gun/projectile/automatic/whitenail/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	update_icon()

/obj/item/weapon/gun/projectile/automatic/whitenail/Process() // increments counter by one per tick until it reaches 
	rebuild_tick++
	if(rebuild_tick < rebuild_time) return FALSE
	rebuild_tick = 0

	if(ammo_magazine)
		generate_ammo()

/obj/item/weapon/gun/projectile/automatic/whitenail/proc/generate_ammo() // generates ammo in the loaded mag
	if(src.get_ammo() >=  ammo_magazine.max_ammo) 
		return FALSE
	
	for(var/i in 1 to 3)
		ammo_magazine.stored_ammo += new ammo_magazine.ammo_type()

	update_icon()

	if(src.get_ammo() >=  ammo_magazine.max_ammo) 
		src.audible_message("The White Nail chimes, indicating the magazine is full.")
		playsound(src.loc, refill_sound, 50, 1)

/obj/item/weapon/gun/projectile/automatic/whitenail/Destroy()
	STOP_PROCESSING(SSobj, src)
	.=..()

/obj/item/weapon/gun/projectile/automatic/whitenail/load_ammo(obj/item/A, mob/user)
	.=..()

/obj/item/weapon/gun/projectile/automatic/whitenail/unload_ammo(mob/user, var/allow_dump=1) // empties mag on eject
	if(ammo_magazine)
		for(var/i=1 to src.get_ammo())
			ammo_magazine.stored_ammo.Cut()
		to_chat(user, SPAN_WARNING("The magazine rattles as you remove it, the ammunition unable to sustain itself outside of the rifle."))
	.=..()

/obj/item/weapon/gun/projectile/automatic/whitenail/on_update_icon()
	..()

	if (ammo_magazine)
		var/ammo_percent = (src.get_ammo() / ammo_magazine.max_ammo) * 100
		icon_state = "whitenail_[ammo_percent]"

	if (!ammo_magazine)
		icon_state = "whitenail"
