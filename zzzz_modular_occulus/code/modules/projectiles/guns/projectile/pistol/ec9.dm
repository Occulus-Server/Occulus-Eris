/obj/item/gun/projectile/ec9
	name = "SMG .35 Auto \"EC9\""
	desc = "The EC9 is a generic replica of an old and infamous SMG. An extremely cheap design made to look more intimidating than it actually is. \
			It is incapable of firing in full auto due to its excessively simplified trigger mechanism. Uses .35 Auto Hi-Cap and SMG magazines."
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
	mag_well = MAG_WELL_H_PISTOL|MAG_WELL_SMG
	magazine_type = /obj/item/ammo_magazine/smg
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 10, MATERIAL_WOOD = 2)
	price_tag = 800
	rarity_value = 18.5
	damage_multiplier = 0.9	// Sliiiightly higher than the atreides since this can't go full auto
	penetration_multiplier = 0.8
	init_recoil = SMG_RECOIL(4)

	init_firemodes = list(
		BURST_5_ROUND,
		SEMI_AUTO_300,
		)

/obj/item/gun/projectile/ec9/update_icon()
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

/obj/item/gun/projectile/ec9/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/automatic/slaught_o_matic
	name = "FS HG .35 Auto \"Liberator\""
