/obj/item/storage/pouch/small_generic
	desc = "Can hold a handful of objects."
	price_tag = 500

/obj/item/storage/pouch/medium_generic
	desc = "Can hold a fair number of small objects."
	price_tag = 1000
	max_w_class = ITEM_SIZE_SMALL

/obj/item/storage/pouch/large_generic
	price_tag = 1500

/obj/item/storage/pouch/baton_holster
	price_tag = 200
	can_hold = list(
		/obj/item/tool/baton,
		/obj/item/melee,
		/obj/item/tool/crowbar,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/tool/shovel/spade,
		/obj/item/stack/rods
		)

/obj/item/clothing/suit
	allowed = list(
		/obj/item/clipboard,
		/obj/item/storage/pouch,
		/obj/item/gun,
		/obj/item/melee,
		/obj/item/material,
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/handcuffs,
		/obj/item/tank,
		/obj/item/device/suit_cooling_unit,
		/obj/item/cell,
		/obj/item/storage/fancy,
		/obj/item/flamethrower,
		/obj/item/device/lighting,
		/obj/item/device/scanner,
		/obj/item/reagent_containers/spray,
		/obj/item/device/radio,
		/obj/item/clothing/mask,
		/obj/item/tool/sword/katana,
		/obj/item/tool/hammer,
		/obj/item/tool/sword/improvised,
		/obj/item/storage/sheath)

/obj/item/storage/sheath
	price_tag = 200
	can_hold = list(
		/obj/item/tool/sword/)
	cant_hold = list(
		/obj/item/tool/sword/nt/halberd)
	slot_flags = SLOT_BELT | SLOT_POCKET | SLOT_BACK
	icon = 'zzzz_modular_occulus/icons/inventory/pockets/sheath.dmi'

/obj/item/tool/sword
	w_class = ITEM_SIZE_BULKY

/obj/item/storage/pouch/fanny
	name = "fannypack"
	desc = "An economical solution for general purpose belt-located storage. Holds less than a large pouch."
	icon = 'zzzz_modular_occulus/icons/inventory/pockets/icon.dmi'
	icon_state = "fanny"
	item_state = "large_generic" //Doesn't really exist AFAIK so irrelevant.
	matter = list(MATERIAL_BIOMATTER = 30, MATERIAL_STEEL = 8 )
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_SMALL_STORAGE * 1.25
	max_w_class = ITEM_SIZE_NORMAL
	rarity_value = 60
	price_tag = 1000

/obj/item/storage/pouch/medical_supply
	price_tag = 300
	storage_slots = 4

/obj/item/storage/pouch/engineering_tools
	price_tag = 300

/obj/item/storage/pouch/engineering_supply
	price_tag = 600

/obj/item/storage/pouch/ammo
	storage_slots = 5
	price_tag = 300

/obj/item/storage/pouch/tubular
	price_tag = 600
	can_hold = list(
		/obj/item/device/lighting/glowstick,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/glass/beaker/vial,
		/obj/item/reagent_containers/hypospray,
		/obj/item/pen,
		/obj/item/storage/pill_bottle,
		/obj/item/hatton_magazine,
		/obj/item/ammo_casing/rocket,
		/obj/item/ammo_casing/grenade,
		/obj/item/reagent_containers/glass/beaker/hypocartridge
		)

/obj/item/storage/pouch/pistol_holster
	price_tag = 200
	can_hold = list(
			/obj/item/gun/projectile/selfload,
		/obj/item/gun/projectile/colt,
		/obj/item/gun/projectile/avasarala,
		/obj/item/gun/projectile/giskard,
		/obj/item/gun/projectile/gyropistol,
		/obj/item/gun/projectile/handmade_pistol,
		/obj/item/gun/projectile/lamia,
		/obj/item/gun/projectile/automatic/modular/mk58/gray,
		/obj/item/gun/projectile/olivaw,
		/obj/item/gun/projectile/mandella,
		/obj/item/gun/energy/gun,
		/obj/item/gun/energy/chameleon,
		//obj/item/gun/energy/captain, //too unwieldy, use belt/suit slot or other storage
		/obj/item/gun/energy/stunrevolver,
		/obj/item/gun/projectile/revolver,
		/obj/item/gun/projectile/automatic/molly,
		/obj/item/gun/projectile/paco,
		/obj/item/gun/projectile/shotgun/doublebarrel/sawn, //short enough to fit in
		/obj/item/gun/launcher/syringe,
		/obj/item/gun/energy/plasma/brigador,
		/obj/item/gun/projectile/shotgun/pump/sawn,
		/obj/item/gun/projectile/boltgun/obrez,
		/obj/item/gun/energy/retro/sawn,
		/obj/item/gun/energy/nt_svalinn
	)
/obj/item/storage/pouch/holding
	price_tag = 3000

/obj/item/storage/pouch/gun_part
	price_tag = 300

/obj/item/storage/pouch/dpistol_holster
	name = "dual pistol holster"
	desc = "Can hold two handguns in."
	icon = 'zzzz_modular_occulus/icons/inventory/pockets/icon.dmi'
	icon_state = "dpistol_holster"
	item_state = "dpistol_holster"
	rarity_value = 60
	price_tag = 400
	matter = list(MATERIAL_BIOMATTER = 30, MATERIAL_STEEL = 8 )
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	storage_slots = 2
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_NORMAL

	can_hold = list(
		/obj/item/gun/projectile/selfload,
		/obj/item/gun/projectile/colt,
		/obj/item/gun/projectile/avasarala,
		/obj/item/gun/projectile/giskard,
		/obj/item/gun/projectile/gyropistol,
		/obj/item/gun/projectile/handmade_pistol,
		/obj/item/gun/projectile/lamia,
		/obj/item/gun/projectile/automatic/modular/mk58/gray,
		/obj/item/gun/projectile/olivaw,
		/obj/item/gun/projectile/mandella,
		/obj/item/gun/energy/gun,
		/obj/item/gun/energy/chameleon,
		//obj/item/gun/energy/captain, //too unwieldy, use belt/suit slot or other storage
		/obj/item/gun/energy/stunrevolver,
		/obj/item/gun/projectile/revolver,
		/obj/item/gun/projectile/automatic/molly,
		/obj/item/gun/projectile/paco,
		/obj/item/gun/projectile/shotgun/doublebarrel/sawn, //short enough to fit in
		/obj/item/gun/launcher/syringe,
		/obj/item/gun/energy/plasma/brigador,
		/obj/item/gun/projectile/shotgun/pump/sawn,
		/obj/item/gun/projectile/boltgun/obrez,
		/obj/item/gun/energy/retro/sawn,
		/obj/item/gun/energy/nt_svalinn
		)

	sliding_behavior = TRUE

/obj/item/storage/pouch/dpistol_holster/on_update_icon()
	..()
	overlays.Cut()
	if(contents.len)
		overlays += image('zzzz_modular_occulus/icons/inventory/pockets/icon.dmi', "dpistol_layer_[contents.len]")
