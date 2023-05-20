/obj/item/gun/projectile/shotgun/stoat
	name = "FS SG \"Stoat\""
	desc = "Designed for power in a compact form, the \"Stoat\" is a shotgun perfect for pack storage. \
	Utilizing a short, 5 shot magazine, it is capable of semi-automatic fire for a short but terrifying barrage. \
	While it is perfectly handlable in one hand, it is still advised to use both hands while operating. \
	This weapon is not advised for stealth missions."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/stoat.dmi'
	icon_state = "stoat"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_NORMAL
	slot_flags = SLOT_BACK|SLOT_BELT
	caliber = CAL_SHOTGUN
	load_method = MAGAZINE
	mag_well = MAG_WELL_SMG
	magazine_type = /obj/item/ammo_magazine/s5mag
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_STEEL = 10)
	price_tag = 1600
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	twohanded = 0
	damage_multiplier = 0.8 //shorter barrel
	recoil_buildup = 20 // controllable when wielded
	one_hand_penalty = 15

	init_firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=8, move_delay=null, icon="semi")
		)

/obj/item/gun/projectile/shotgun/stoat/on_update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	cut_overlays()
	icon_state = "[initial(icon_state)]"
	if(ammo_magazine)
		add_overlays("mag[ammo_magazine.ammo_color]")
		itemstring += "_mag"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/shotgun/stoat/Initialize()
	. = ..()
	update_icon()
