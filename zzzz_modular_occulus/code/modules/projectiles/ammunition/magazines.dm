/obj/item/ammo_magazine/a75
	icon = 'zzzz_modular_occulus/icons/obj/magazines.dmi'
	multiple_sprites = 1

//Rubbershot

/obj/item/weapon/storage/box/shotgunammo/rubbershot
	name = "box of rubbershot shells"

/obj/item/weapon/storage/box/shotgunammo/rubbershot/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/pellet/rubber/prespawned(src)

/datum/design/autolathe/ammo/shotgun_rubbershot
	name = "shotgun shells (rubbershot)"
	build_path = /obj/item/ammo_casing/shotgun/pellet/rubber/prespawned

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nonlethal_ammo/Initialize()	//modular override to add rubbershot to the nonlethal ammo disk
	designs += list(/datum/design/autolathe/ammo/shotgun_rubbershot)	// add the designs we want on the disk
	. = ..()	// then let it install the data onto the disk properly


// white nail wells
/obj/item/ammo_magazine/nail
	name = "white nail ammo well"
	icon = 'zzzz_modular_occulus/icons/obj/magazines.dmi'
	icon_state = "whitenail_mag"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = "nail"
	matter = list(MATERIAL_STEEL = 1)
	ammo_type = /obj/item/ammo_casing/clrifle // caseless is used to prevent tons of casing litter
	max_ammo = 10
	initial_ammo = 0
	multiple_sprites = 1

/obj/item/ammo_magazine/nail/rubber
	name = "white nail rubber ammo well"
	icon_state = "whitenail_mag"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = "nail"
	matter = list(MATERIAL_STEEL = 1)
	ammo_type = /obj/item/ammo_casing/clrifle/rubber
	max_ammo = 10
	initial_ammo = 0
	multiple_sprites = 1