/obj/item/gun/projectile/shotgun/leveraction/magnum
	name = ".40 lever-action rifle"
	desc = "A vintage USARC design. Old, yet reliable. Uses .40 Magnum Ammo."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/magnumlever.dmi'
	icon_state = "leveraction"
	max_shells = 9
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)
	load_method = SINGLE_CASING
	ammo_type = /obj/item/projectile/bullet/magnum/rubber
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	matter = list(MATERIAL_PLASTIC = 6, MATERIAL_STEEL = 18)
	price_tag = 600
	damage_multiplier = 1.2 //34 x 1.2 ~ 40 damage. Revolvers still beat it out, but this holds more rounds and is easier to reload.
	init_recoil = HANDGUN_RECOIL(20)
	sawn_result = /obj/item/gun/projectile/shotgun/leveraction/sawn/magnum
	cansaw = TRUE

/datum/design/autolathe/gun/leveraction/magnum
	name = "lever-action rifle"
	build_path = /obj/item/gun/projectile/shotgun/leveraction/magnum

/obj/item/computer_hardware/hard_drive/portable/design/guns/fs_leveraction_rifle
	disk_name = "Frozen Star - .40 Lever-Action Rifle"
	icon_state = "frozenstar"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/leveraction/magnum = 3,
		/datum/design/autolathe/ammo/magnum_ammobox,
		/datum/design/autolathe/ammo/magnum_ammobox/rubber,
		/datum/design/autolathe/ammo/magnum_ammobox/practice = 0,
		)
