/datum/design/autolathe/tool/voidsuit/dss
	name = "DSS assault suit"
	build_path = /obj/item/clothing/suit/space/void/dss

/datum/design/autolathe/gun/stalwart
	name = "DSS Stalwart"
	build_path = /obj/item/weapon/gun/energy/stalwart

/datum/design/autolathe/gun/resolute
	name = "DSS Resolute"
	build_path = /obj/item/weapon/gun/energy/resolute

/datum/design/autolathe/gun/gemini
	name = "DSS Gemini"
	/obj/item/weapon/gun/energy/gun/gemini

/datum/design/autolathe/gun/glasgow
	name = "DSS Glasgow"
	/obj/item/weapon/gun/energy/gun/glasgow
/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/dss
	disk_name = "Deepflare Security - blank"
	icon = 'zzzz_modular_occulus/icons/obj/discs.dmi'
	icon_state = "DSSDisk"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	bad_type = /obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/dss
	rarity_value = 30
	designs = list(
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/dss/stalwart
	disk_name = "Deepflare Security - Stalwart Energy Scatter Gun"
	rarity_value = 20
	license = 12
	designs = list(
		/datum/design/autolathe/gun/stalwart =3,	// "DSS ESG \"Stalwart\""
		/datum/design/autolathe/cell/medium/high,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/dss/resolute
	disk_name = "Deepflare Security - Resolute Energy Carbine"
	rarity_value = 20
	license = 12
	designs = list(
		/datum/design/autolathe/gun/resolute = 3,	// "DSS ECAR \"Resolute\""
		/datum/design/autolathe/cell/medium/high,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/dss/assault
	disk_name = "Deepflare Security - Assault Voidsuit"
	rarity_value = 15
	license = 12
	designs = list(
		/datum/design/autolathe/tool/voidsuit/dss = 6, // "DSS assault suit"
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/dss/glasgow
	disk_name = "Deepflare Security - Glasgow Energy Personal Defense Weapon"
	icon_state = "frozenstar"
	rarity_value = 20
	license = 9
	designs = list(
		/datum/design/autolathe/gun/glasgow = 3	// "DSS PDW E \"Glasgow\""
		/datum/design/autolathe/cell/small,
		/datum/design/autolathe/cell/small/high = 2,
		)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/dss/gemini
	disk_name = "Deepflare Security - Gemini Energy personal Defense Weapon"
	icon_state = "frozenstar"
	rarity_value = 30
	license = 9
	designs = list(
		/datum/design/autolathe/gun/gemini =3,	// "DSS PDW E \"Gemini\""
		/datum/design/autolathe/cell/small,
		/datum/design/autolathe/cell/small/high = 2,
		)