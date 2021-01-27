/obj/item/weapon/gun/projectile/automatic/rx8
	name = "PCC .35 Auto \"RX8\""
	desc = "An experimental Pistol Caliber Carbine, designed as a low cost and easy to deploy alternative to full sized rifles. \
			Primarily employed in CQC scenarios or as a self defence tool. \
			Takes both highcap pistol and smg mags. Uses .35 Auto rounds."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/rx8.dmi'
	icon_state = "ex4"
	item_state = "ex4"
	w_class = ITEM_SIZE_BULKY
	can_dual = 1
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = "/obj/item/ammo_casing/pistol"
	load_method = MAGAZINE
	mag_well = MAG_WELL_H_PISTOL|MAG_WELL_SMG
	magazine_type = /obj/item/ammo_magazine/smg
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 10, MATERIAL_WOOD = 2)
	price_tag = 1400
	rarity_value = 12

	damage_multiplier = 0.85
	penetration_multiplier = 0.9
	recoil_buildup = 3
	one_hand_penalty = 5 //SMG level.

	init_firemodes = list(
		FULL_AUTO_400,
		SEMI_AUTO_NODELAY,
		)

/obj/item/weapon/gun/projectile/automatic/rx8/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring

/obj/item/weapon/gun/projectile/automatic/rx8/Initialize()
	. = ..()
	update_icon()
