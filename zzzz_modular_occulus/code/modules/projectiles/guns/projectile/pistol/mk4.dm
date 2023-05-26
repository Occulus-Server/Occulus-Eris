/obj/item/gun/projectile/mk4
	name = "HG .35 Auto \"Mk4\""
	desc = "The Mk4 is a generic specification for a integrally silenced handgun, originally developed by a long since defunct company. Uses standard .35 and high capacity magazines."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/mk4.dmi'
	icon_state = "mk4"
	item_state = "mk4"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 5, MATERIAL_WOOD = 2)
	price_tag = 1000
	can_dual = 1
	silenced = TRUE
	caliber = CAL_PISTOL
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_H_PISTOL
	magazine_type = /obj/item/ammo_magazine/pistol
	damage_multiplier = 1.4
	penetration_multiplier = 0.8
	init_recoil = HANDGUN_RECOIL(2)
	rarity_value = 9.6

/obj/item/gun/projectile/mk4/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring

/obj/item/gun/projectile/mk4/Initialize()
	. = ..()
	update_icon()
