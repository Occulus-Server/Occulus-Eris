/datum/design/autolathe/tool/fibertape
	name = "fiber tape"
	build_path = /obj/item/weapon/tool/tape_roll/fiber

/obj/item/weapon/tool/tape_roll/fiber
	matter = list(MATERIAL_PLASTEEL = 1, MATERIAL_PLASTIC = 20)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/fs_cheap_guns/generic
	disk_name = "Generic - Alternate Civilian Pack"
	designs = list(
		/datum/design/autolathe/gun/mk4 = 3,
		/datum/design/autolathe/gun/ec9 = 3,
		/datum/design/autolathe/gun/rx8 = 3,
		/datum/design/autolathe/ammo/magazine_pistol/rubber,
		/datum/design/autolathe/ammo/magazine_hpistol/rubber,
		/datum/design/autolathe/ammo/smg/rubber,
		/datum/design/autolathe/ammo/pistol_ammobox/rubber
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/fabkits
	disk_name = "EES FabKit Designs"
	icon_state = "technomancers"
	rarity_value = 182
	designs = list(
		/datum/design/autolathe/fabkit,
		/datum/design/autolathe/fabkit/bench,
		/datum/design/autolathe/fabkit/bag,
		/datum/design/autolathe/fabkit/psych,
		/datum/design/autolathe/fabkit/dryrack
		)


/*
CHURCH DISKS
*/

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt
	disk_name = "Mekhane's Armory - Blank"

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/melee
	disk_name = "Mekhane's Armory - Basic Melee Weapons"

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/longsword
	disk_name = "Mekhane's Armory - Longsword"

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/scourge
	disk_name = "Mekhane's Armory - Scourge"

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/halberd
	disk_name = "Mekhane's Armory - Halberd"

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/shield
	disk_name = "Mekhane's Armory - Shield"

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/firstaid
	disk_name = "Mekhane's Armory - Mekhanite Medkit"

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_grenades
	disk_name = "Mekhane's Armory - Grenades"

/obj/item/weapon/computer_hardware/hard_drive/portable/design/armor/crusader
	disk_name = "Mekhane's Armory - Armor"

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter
	disk_name = "Mekhanite Bioprinter Products and Utilities"
	designs = list(
		/datum/design/bioprinter/cahor,
		/datum/design/bioprinter/meat,
		/datum/design/bioprinter/milk,
		/datum/design/bioprinter/soap,

		/datum/design/bioprinter/ez,
		/datum/design/bioprinter/l4z,
		/datum/design/bioprinter/rh,

		/datum/design/bioprinter/medical/bruise,
		/datum/design/bioprinter/medical/splints,
		/datum/design/bioprinter/medical/ointment,
		/datum/design/bioprinter/medical/advanced/bruise,
		/datum/design/bioprinter/medical/advanced/ointment,

		/datum/design/autolathe/gun/nt_sprayer,
		/datum/design/autolathe/device/grenade/nt_cleaner,
		/datum/design/autolathe/device/grenade/nt_weedkiller

	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter_clothes
	disk_name = "Mekhanite Bio-Fabric Designs"

/datum/design/bioprinter/cahor
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/ntcahors
	materials = list(MATERIAL_BIOMATTER = 10, MATERIAL_GLASS = 1)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/carpets
	disk_name = "Mekhanite Bio-Fabric Flooring"
	icon_state = "neotheology"
	license = -1
	spawn_blacklisted = TRUE
	designs = list(
		/datum/design/bioprinter/carpet,
		/datum/design/bioprinter/carpet/bcarpet,
		/datum/design/bioprinter/carpet/blucarpet,
		/datum/design/bioprinter/carpet/gaycarpet,
		/datum/design/bioprinter/carpet/oracarpet,
		/datum/design/bioprinter/carpet/purcarpet,
		/datum/design/bioprinter/carpet/sblucarpet,
		/datum/design/bioprinter/carpet/turcarpet
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/retro
	disk_name = "FS LG \"Cog\""