/obj/item/ammo_magazine/a75
	icon = 'zzzz_modular_occulus/icons/obj/magazines.dmi'
	multiple_sprites = 1

//Rubbershot

/obj/item/storage/box/shotgunammo/rubbershot
	name = "box of rubbershot shells"

/obj/item/storage/box/shotgunammo/rubbershot/populate_contents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/pellet/rubber/prespawned(src)

/datum/design/autolathe/ammo/shotgun_rubbershot
	name = "shotgun shells (rubbershot)"
	build_path = /obj/item/ammo_casing/shotgun/pellet/rubber/prespawned

/obj/item/ammo_magazine/ammobox/shotgun
	matter = list(MATERIAL_CARDBOARD = 1)

/obj/item/ammo_magazine/ammobox/shotgun/rubbershot
	name = "ammunition box (rubbershot shell)"
	icon_state = "shot_r"
	ammo_type = /obj/item/ammo_casing/shotgun/pellet/rubber
	rarity_value = 10

// S5 Mags: 5 shot Shotgun magazines

/obj/item/ammo_magazine/s5mag
	name = "short magazine (.50)"
	desc = "A small, 5 shot magazine designed for shotgun shells."
	icon = 'zzzz_modular_occulus/icons/obj/magazines.dmi'
	icon_state = "s5mag_l"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_SMG
	caliber = CAL_SHOTGUN
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	matter = list(MATERIAL_STEEL = 6)
	max_ammo = 5
	ammo_color = "-l"
	initial_ammo = 5

/obj/item/ammo_magazine/s5mag/on_update_icon()
	cut_overlays()
	if(stored_ammo.len)
		var/obj/item/ammo_casing/AC = stored_ammo[1] //look at next casing.
		overlays += "s5mag_shell_[AC.shell_color]" //look and display the overlay for the ammo

/obj/item/ammo_magazine/s5mag/Initialize()
	. = ..()
	update_icon()

/obj/item/ammo_magazine/s5mag/beanbag
	name = "short magazine (.50 beanbag)"
	icon_state = "s5mag_r"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	ammo_color = "-r"

/obj/item/ammo_magazine/s5mag/rubbershot
	name = "short magazine (.50 rubbershot)"
	icon_state = "s5mag_r"
	ammo_type = /obj/item/ammo_casing/shotgun/pellet/rubber
	ammo_color = "-r"

/obj/item/ammo_magazine/s5mag/slug
	name = "short magazine (.50 slug)"
	icon_state = "s5mag_hv"
	ammo_type = /obj/item/ammo_casing/shotgun
	ammo_color = "-hv"

/obj/item/ammo_magazine/s5mag/empty
	name = "short magazine (.50)"
	icon_state = "s5mag"
	matter = list(MATERIAL_STEEL = 1)
	initial_ammo = 0
	ammo_color = ""

/obj/item/ammo_magazine/s5mag/practice
	name = "short magazine (.50 practice)"
	icon_state = "s5mag_p"
	ammo_type = /obj/item/ammo_casing/shotgun/practice
	ammo_color = "-p"

// nail magazines

/obj/item/ammo_magazine/whitenail
	name = "white nail magazine"
	icon = 'zzzz_modular_occulus/icons/obj/magazines.dmi'
	icon_state = "whitenail_mag"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = CAL_NAIL
	matter = list(MATERIAL_STEEL = 5, MATERIAL_GLASS = 2)
	ammo_type = /obj/item/ammo_casing/whitenail
	max_ammo = 12
	initial_ammo = 0

/obj/item/ammo_magazine/whitenail/rubber
	name = "white nail rubber magazine"
	icon_state = "whitenail_mag_rubber"
	ammo_type = /obj/item/ammo_casing/whitenail/rubber

/obj/item/ammo_magazine/blacktalon
	name = "black talon magazine"
	icon = 'zzzz_modular_occulus/icons/obj/magazines.dmi'
	icon_state = "blacktalon_mag"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	caliber = CAL_NAIL
	matter = list(MATERIAL_STEEL = 3, MATERIAL_GLASS = 1)
	ammo_type = /obj/item/ammo_casing/whitenail
	max_ammo = 8
	initial_ammo = 0

/obj/item/ammo_magazine/blacktalon/rubber
	name = "black talon rubber magazine"
	icon = 'zzzz_modular_occulus/icons/obj/magazines.dmi'
	icon_state = "blacktalon_mag_rubber"
	ammo_type = /obj/item/ammo_casing/whitenail/rubber


/obj/item/ammo_magazine/greyclaw
	name = "grey claw magazine"
	icon = 'zzzz_modular_occulus/icons/obj/magazines.dmi'
	icon_state = "greyclaw_mag"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = CAL_NAIL
	matter = list(MATERIAL_STEEL = 3, MATERIAL_GLASS = 1)
	var/pellet_mode = /obj/item/ammo_casing/shotgun/pellet/greyclaw
	var/slug_mode = /obj/item/ammo_casing/whitenail/greyclaw
	ammo_type = /obj/item/ammo_casing/shotgun/pellet/greyclaw
	max_ammo = 2
	initial_ammo = 0

/obj/item/ammo_magazine/greyclaw/rubber
	name = "grey claw rubber magazine"
	icon = 'zzzz_modular_occulus/icons/obj/magazines.dmi'
	icon_state = "greyclaw_mag_rubber"
	pellet_mode = /obj/item/ammo_casing/shotgun/pellet/greyclaw/rubber
	slug_mode = /obj/item/ammo_casing/whitenail/greyclaw/rubber
	ammo_type = /obj/item/ammo_casing/shotgun/pellet/greyclaw/rubber
