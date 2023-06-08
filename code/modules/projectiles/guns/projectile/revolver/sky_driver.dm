/obj/item/gun/projectile/revolver/sky_driver
	name = "S REV .35 Auto \"Sky Driver\""
	desc = "A prototype revolver, captured as a trophy from a raided Syndicate research base. Uses .35 Auto rounds." //Occulus Edit: Old unmarked Syzygy lore stuff
	icon = 'icons/obj/guns/projectile/sky_driver.dmi'
	icon_state = "sky_driver"
	item_state = "sky_driver"
	drawChargeMeter = FALSE
	origin_tech = list(TECH_COMBAT = 10, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/pistol
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	caliber = CAL_PISTOL
	max_shells = 5
	ammo_type = /obj/item/ammo_casing/pistol
	price_tag = 20000
	damage_multiplier = 1.1 //because pistol round
	penetration_multiplier = 20
	pierce_multiplier = 5
	recoil_buildup = 6
	spawn_frequency = 0
	spawn_blacklisted = TRUE
	gun_parts = list(/obj/item/gun_upgrade/barrel/gauss = 3, /obj/item/stack/material/plasteel = 2)

