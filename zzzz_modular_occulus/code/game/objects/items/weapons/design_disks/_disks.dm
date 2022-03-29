/datum/design/autolathe/tool/fibertape
	name = "fiber tape"
	build_path = /obj/item/tool/tape_roll/fiber

/obj/item/tool/tape_roll/fiber
	matter = list(MATERIAL_PLASTEEL = 1, MATERIAL_PLASTIC = 20)

/obj/item/computer_hardware/hard_drive/portable/design/guns/fs_cheap_guns/generic
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

/obj/item/computer_hardware/hard_drive/portable/design/fabkits
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

/obj/item/computer_hardware/hard_drive/portable/design/coins
	disk_name = "FTU Coinpress Disk"
	icon_state = "guild"
	rarity_value = 247
	designs = list(
		/datum/design/autolathe/coin,
		/datum/design/autolathe/coin/silver,
		/datum/design/autolathe/coin/gold,
		/datum/design/autolathe/coin/platinum,
		/datum/design/autolathe/coin/diamond
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/retro
	disk_name = "FS LG \"Cog\""
