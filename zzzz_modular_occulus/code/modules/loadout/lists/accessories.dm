/datum/gear/accessory/skirt
	display_name = "attachable skirt"
	path = /obj/item/clothing/accessory/skirt

/datum/gear/accessory/skirt/New()
	..()
	var/skirts = list(
		"Loose"	=	/obj/item/clothing/accessory/skirt,
		"Pencil"		=	/obj/item/clothing/accessory/skirt/pencil,
		"Short"		=	/obj/item/clothing/accessory/skirt/short,
	)
	gear_tweaks += new/datum/gear_tweak/path(skirts)