/obj/item/weapon/gun/projectile/ec9
	name = "SMG .35 Auto \"EC9\""
	desc = "The EC9 is a generic replica of an old and infamous SMG. An extremely cheap design made to look more intimidating than it actually is. \
			It is incapable of firing in full auto due to its excessively simplified trigger mechanism. Uses .35 Auto Hi-Cap Magazines."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/ec9.dmi'
	icon_state = "ec9"
	item_state = "ec9"
	w_class = ITEM_SIZE_NORMAL
	can_dual = 1
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = "/obj/item/ammo_casing/pistol"
	load_method = MAGAZINE
	mag_well = MAG_WELL_H_PISTOL
	magazine_type = /obj/item/ammo_magazine/hpistol
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 5, MATERIAL_WOOD = 2)
	price_tag = 800
	rarity_value = 10.1
	damage_multiplier = 1
	penetration_multiplier = 1
	recoil_buildup = 4
	one_hand_penalty = 3

	init_firemodes = list(
		BURST_5_ROUND,
		SEMI_AUTO_NODELAY,
		)

/obj/item/weapon/gun/projectile/ec9/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/ec9/Initialize()
	. = ..()
	update_icon()
