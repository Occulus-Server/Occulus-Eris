// .35 Auto Hurricane.

/obj/item/gun/projectile/automatic/armsmg/hurricane
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/hurricane.dmi'
	icon_state = "hurricane"
	item_state = "hurricane"
	name = "DSS IDW .35 Auto Hurricane"
	desc = "An Integrated Defense Weapon Designated as the model Hurricane. Designed by Deepflare, It is chambered in .35 and its sleek design is a favourite for comfort, sitting perfectly in the hand, while its long recoil spring minimizes recoil"
	w_class = ITEM_SIZE_NORMAL
	can_dual = 1
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_COVERT = 3)
	ammo_type = "/obj/item/ammo_casing/pistol"
	load_method = MAGAZINE
	mag_well = MAG_WELL_SMG
	magazine_type = /obj/item/ammo_magazine/smg
	damage_multiplier = 0.9
	penetration_multiplier = 0.6
	gun_tags = list(GUN_SILENCABLE)
	recoil_buildup = 4
	one_hand_penalty = 1
	spawn_blacklisted = TRUE

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_5_ROUND,
		FULL_AUTO_400
		)

/obj/item/gun/projectile/automatic/armsmg/hurricane/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (!ammo_magazine)
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"

	icon_state = iconstring

/obj/item/organ_module/active/simple/armsmg/hurricane
	name = "embedded PDW"
	desc = "A Personal Defense Weapon chambered in .35 Auto, Designed to be implanted in the arm."
	verb_name = "Deploy embedded SMG"
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/hurricane.dmi'
	icon_state = "hurricane_slide"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/gun/projectile/automatic/armsmg/hurricane

// .40 Typhoon

/obj/item/gun/projectile/automatic/armsmg/typhoon
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/typhoon.dmi'
	icon_state = "typhoon"
	item_state = "typhoon"
	name = "DSS IAR .40 Magnum Typhoon"
	desc = "An Integrated Auto-Revolver Designated as the model Typhoon. Designed by Deepflare, It is chambered in .40 Magnum, and uses a revolutionary Mag-to-Cylinder design to allow it to shoot from the top and bottom barrel in quick succession."
	w_class = ITEM_SIZE_NORMAL
	can_dual = 1
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_COVERT = 4)
	ammo_type = "/obj/item/ammo_casing/magnum"
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	magazine_type = /obj/item/ammo_magazine/magnum
	damage_multiplier = 1.2
	penetration_multiplier = 0.6
	gun_tags = list(GUN_SILENCABLE)
	recoil_buildup = 5
	one_hand_penalty = 1
	spawn_blacklisted = TRUE

	init_firemodes = list(
		list(mode_name="semiauto",   burst=1, fire_delay=1.2, move_delay=null, 	icon="semi"),
		list(mode_name="Double Tap", burst=2, fire_delay=0.2, move_delay=4,    	icon="burst"),
		list(mode_name="full auto",  mode_type = /datum/firemode/automatic, fire_delay=3  , icon="auto")
		)

/obj/item/gun/projectile/automatic/armsmg/typhoon/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (!ammo_magazine)
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"

	icon_state = iconstring

/obj/item/organ_module/active/simple/armsmg/typhoon
	name = "embedded PDW"
	desc = "A Personal Defense Weapon chambered in .40 Magnum, Designed to be implanted in the arm."
	verb_name = "Deploy embedded SMG"
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/typhoon.dmi'
	icon_state = "typhoon_slide"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/gun/projectile/automatic/armsmg/typhoon

// .25 Caseless Tornado

/obj/item/gun/projectile/automatic/armsmg/tornado
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/tornado.dmi'
	icon_state = "tornado"
	item_state = "tornado"
	name = "DSS IDW .25 CL Tornado"
	desc = "An Integrated Defense Weapon Designated as the model Tornado. Designed by Deepflare, It is chambered in .25 Caseless. Its design seems to be borrowed from a popular station security design, using a flat-sitting magazine well that maximizes barrel length while minimizing gun size."
	w_class = ITEM_SIZE_NORMAL
	can_dual = 1
	caliber = CAL_CLRIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_COVERT = 3)
	ammo_type = "/obj/item/ammo_casing/clrifle"
	load_method = MAGAZINE
	mag_well = MAG_WELL_IH
	magazine_type = /obj/item/ammo_magazine/ihclrifle
	damage_multiplier = 1.1
	penetration_multiplier = 0.6
	gun_tags = list(GUN_SILENCABLE)
	recoil_buildup = 5
	one_hand_penalty = 1
	spawn_blacklisted = TRUE

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		FULL_AUTO_400
		)

/obj/item/gun/projectile/automatic/armsmg/tornado/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (!ammo_magazine)
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"

	icon_state = iconstring

/obj/item/organ_module/active/simple/armsmg/tornado
	name = "embedded PDW"
	desc = "A Personal Defense Weapon chambered in .25 Caseless, Designed to be implanted in the arm."
	verb_name = "Deploy embedded SMG"
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/tornado.dmi'
	icon_state = "tornado_slide"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/gun/projectile/automatic/armsmg/tornado