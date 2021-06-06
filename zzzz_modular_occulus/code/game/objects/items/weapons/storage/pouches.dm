/obj/item/weapon/storage/pouch/small_generic
	desc = "Can hold a handful of objects."

/obj/item/weapon/storage/pouch/medium_generic
	desc = "Can hold a fair number of small objects."

/obj/item/weapon/storage/pouch/baton_holster
	can_hold = list(
		/obj/item/weapon/melee,
		/obj/item/weapon/tool/crowbar,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/weapon/tool/shovel/spade,
		/obj/item/stack/rods
		)

/obj/item/clothing/suit
	allowed = list(
		/obj/item/weapon/clipboard,
		/obj/item/weapon/storage/pouch,
		/obj/item/weapon/gun,
		/obj/item/weapon/melee,
		/obj/item/weapon/material,
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/weapon/handcuffs,
		/obj/item/weapon/tank,
		/obj/item/device/suit_cooling_unit,
		/obj/item/weapon/cell,
		/obj/item/weapon/storage/fancy,
		/obj/item/weapon/flamethrower,
		/obj/item/device/lighting,
		/obj/item/device/scanner,
		/obj/item/weapon/reagent_containers/spray,
		/obj/item/device/radio,
		/obj/item/clothing/mask,
		/obj/item/weapon/storage/sheath)

/obj/item/weapon/storage/sheath
	can_hold = list(
		/obj/item/weapon/tool/sword/,
		/obj/item/weapon/tool/knife/)
	cant_hold = list()
	slot_flags = SLOT_BELT | SLOT_POCKET | SLOT_BACK

/obj/item/weapon/tool/sword
	w_class = ITEM_SIZE_BULKY
