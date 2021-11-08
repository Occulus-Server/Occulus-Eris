/obj/item/weapon/gun/projectile/automatic/whitenail
	name = "NT Prototype \"White Nail\""
	desc = "A bleeding-edge development in kinetic weaponry. This gun regenerates ammunition slowly over time using advanced nanite technology. The rifle's body feels similar to very sturdy ceramic. Fires three round bursts."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/whitenail.dmi'
	icon_state = "whitenail"
	var/icon_name = "whitenail"
	w_class = ITEM_SIZE_HUGE
	caliber = CAL_NAIL
	origin_tech = list(TECH_COMBAT = 7, TECH_ENGINEERING = 3, TECH_MAGNET = 3)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	magazine_type = /obj/item/ammo_magazine/whitenail
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 5)
	matter_reagents = list("uncap nanites" = 25)
	price_tag = 3000
	fire_sound = 'zzzz_modular_occulus/sound/weapons/guns/fire/nail_fire.ogg'
	unload_sound 	= 'zzzz_modular_occulus/sound/weapons/guns/interact/nail_out.ogg'
	reload_sound 	= 'zzzz_modular_occulus/sound/weapons/guns/interact/nail_in.ogg'
	var/refill_sound = 'zzzz_modular_occulus/sound/weapons/guns/misc/nail_refill.ogg'
	zoom_factor = 0.9 
	recoil_buildup = 5
	one_hand_penalty = 20 
	damage_multiplier = 1.2 // Effective mult of 1.1 due to forced 3 burst round applying -0.1
	spawn_blacklisted = TRUE
	var/rebuild_tick = 0
	var/rebuild_time = 4
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
	var/rebuilt_bullets = CEILING(ammo_magazine.max_ammo / 4, 1) 
	if(src.get_ammo() >=  ammo_magazine.max_ammo) 
		return FALSE
	
	for(var/i in 1 to rebuilt_bullets)
		ammo_magazine.stored_ammo += new ammo_magazine.ammo_type()

	update_icon()

	if(src.get_ammo() >=  ammo_magazine.max_ammo) 
		src.audible_message("The [src.name] chimes, indicating the magazine is full.")
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
		to_chat(user, SPAN_WARNING("The magazine rattles as you remove it, the ammunition unable to sustain itself outside of the gun."))
	.=..()

/obj/item/weapon/gun/projectile/automatic/whitenail/on_update_icon()
	..()

	if (ammo_magazine)
		var/ammo_percent = round(src.get_ammo() / ammo_magazine.max_ammo, 0.25) * 100
		icon_state = "[src.icon_name]_[ammo_percent]"

	if (!ammo_magazine)
		icon_state = "[src.icon_name]"

/obj/item/weapon/gun/projectile/automatic/whitenail/blacktalon
	name = "NT Prototype \"Black Talon\""
	desc = "A bleeding-edge development in kinetic weaponry. This gun regenerates ammunition slowly over time using advanced nanite technology. The pistol's grip feels natural and well fitted. Fires two round bursts."	
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/blacktalon.dmi'
	icon_state = "blacktalon"
	icon_name = "blacktalon"
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 5, TECH_ENGINEERING = 2, TECH_MAGNET = 2)
	slot_flags = SLOT_POCKET | SLOT_HOLSTER
	mag_well = MAG_WELL_PISTOL
	magazine_type = /obj/item/ammo_magazine/blacktalon
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 5)
	matter_reagents = list("uncap nanites" = 15)
	price_tag = 1900
	fire_sound = 'zzzz_modular_occulus/sound/weapons/guns/fire/talon_fire.ogg'
	one_hand_penalty = 0 // Matches Olivaw 
	zoom_factor = 0
	damage_multiplier = 0.9 
	rebuild_time = 3
	init_firemodes = list(
		list(mode_name="2-round bursts", burst=2, fire_delay=0.2, move_delay=4, icon="burst"),
		)

/obj/item/weapon/gun/projectile/automatic/whitenail/greyclaw // REMINDER TO ADD NEW GUNS TO R&D CONSOLE SO PEOPLE CAN USE THEM
	name = "NT Prototype \"Grey Claw\""
	desc = "A bleeding-edge development in kinetic weaponry. This gun regenerates ammunition slowly over time using advanced nanite technology. The shotgun's rigid frame makes up for its bulk. Offers alternate slug/pellet firing modes."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/greyclaw.dmi'
	icon_state = "greyclaw"
	icon_name = "greyclaw"
	magazine_type = /obj/item/ammo_magazine/greyclaw
	matter_reagents = list("uncap nanites" = 30)
	price_tag = 8000
	fire_sound = 'zzzz_modular_occulus/sound/weapons/guns/fire/claw_fire.ogg'
	zoom_factor = 0
	recoil_buildup = 15
	one_hand_penalty = 15 
	damage_multiplier = 1
	spawn_blacklisted = TRUE
	rebuild_time = 5
	init_firemodes = list(
		list(mode_name="pellet", burst=1, fire_delay=6, move_delay=4, icon="pellet"),
		list(mode_name="slug", burst=1, fire_delay=6, move_delay=4, icon="slug")
		)

/obj/item/weapon/gun/projectile/automatic/whitenail/greyclaw/load_ammo(obj/item/A, mob/user)
	.=..()
	greyclaw_swap(ammo_magazine)

/obj/item/weapon/gun/projectile/automatic/whitenail/greyclaw/toggle_firemode()
	..()
	if(ammo_magazine)
		greyclaw_swap(ammo_magazine)

/obj/item/weapon/gun/projectile/automatic/whitenail/greyclaw/proc/greyclaw_swap(var/obj/item/ammo_magazine/greyclaw/M)
	var/current_ammo = src.get_ammo()
	for(var/i=1 to src.get_ammo()) // get amount of ammo currently in mag before deleting so you can refil the mag and pretend like the ammo was just converted
		ammo_magazine.stored_ammo.Cut()
	
	if(sel_mode == 1) // depending on the mode selected, switch between buckshot and slugs being loaded
		ammo_magazine.ammo_type = M.pellet_mode
		proj_step_multiplier = 1
		damage_multiplier = 1
	else
		ammo_magazine.ammo_type = M.slug_mode
		proj_step_multiplier = 1.15
		damage_multiplier = 1.2

	for(var/i=1 to current_ammo)
		ammo_magazine.stored_ammo += new ammo_magazine.ammo_type()

		
