/obj/item/computer_hardware/hard_drive/portable/design/fake_ammo
	disk_name = "Frozen Star Practice Magazines Pack"
	icon_state = "frozenstar"
	spawn_tags = SPAWN_TAG_DESIGN_COMMON
	designs = list(
		//please, maintain general order (pistol>speedloaders>smg>other>shells)+(smaller/less damaging caliber>bigger/more damaging caliber)
		//pistol mags
		/datum/design/autolathe/ammo/magazine_pistol/practice,
		/datum/design/autolathe/ammo/mg_magnum/practice,
		/datum/design/autolathe/ammo/cspistol/practice,
		//speed loaders
		/datum/design/autolathe/ammo/sl_pistol/practice,
		/datum/design/autolathe/ammo/sl_magnum/practice,
		//smg mags
		/datum/design/autolathe/ammo/smg/practice,
		//magnum smg mags
		/datum/design/autolathe/ammo/msmg/practice,
		//rifles
		/datum/design/autolathe/ammo/srifle/practice,
		/datum/design/autolathe/ammo/ihclrifle/practice,
		/datum/design/autolathe/ammo/lrifle/practice,
		//shells
		/datum/design/autolathe/ammo/shotgun_blanks,
	)

/obj/item/computer_hardware/hard_drive/portable/design/ammo_boxes_shotgun
	disk_name = "Frozen Star Shotgun Ammunition"
	icon_state = "frozenstar"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED_COMMON
	license = 20
	designs = list(
		/datum/design/autolathe/ammo/shotgunbox,
		/datum/design/autolathe/ammo/shotgunbox_buckshot,
		/datum/design/autolathe/ammo/shotgunbox_beanbag,
		/datum/design/autolathe/ammo/shotgunbox_rubbershot,
		/datum/design/autolathe/ammo/shotgunbox_flash,
		/datum/design/autolathe/ammo/shotgunbox_blanks = 0,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_regulator
	disk_name = "Frozen Star - .50 Regulator Shotgun"