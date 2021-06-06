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
