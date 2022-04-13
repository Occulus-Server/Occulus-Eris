/obj/item/storage/pouch/engineering_tools
	spawn_tags = SPAWN_TAG_BELT_UTILITY
	storage_slots = 4
	desc = "Can hold small engineering tools. But only about four pieces of them."
	max_w_class = ITEM_SIZE_NORMAL

/obj/item/storage/pouch/engineering_supply
	spawn_tags = SPAWN_TAG_BELT_UTILITY

///// Additional items that can be fitted in the tubular pouch belt /////

/obj/item/storage/pouch/tubular/New()
	..()
	can_hold += list(
		/obj/item/cell/medium,
		/obj/item/cell/small,
		/obj/item/tool/screwdriver,
		/obj/item/melee/telebaton,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/reagent_containers/spray/luminol,
		/obj/item/reagent_containers/spray/cleaner,
		/obj/item/reagent_containers/spray/plantbgone,
		/obj/item/reagent_containers/spray/sterilizine,
		/obj/item/plantspray/pests,
		/obj/item/device/flash,
		/obj/item/tank/emergency_oxygen,
		/obj/item/reagent_containers/food/drinks/cans,
		/obj/item/extinguisher/mini,
		/obj/item/reagent_containers/food/drinks/drinkingglass,
		/obj/item/device/robotanalyzer,
		/obj/item/tool_upgrade/augment/fuel_tank,
		/obj/item/tool_upgrade/productivity/oxyjet,
		/obj/item/tool_upgrade/refinement/ported_barrel,
		/obj/item/light/tube,
		/obj/item/implanter,
		/obj/item/tool/cautery,
		/obj/item/tool/scalpel,
		/obj/item/tool/hemostat,
		/obj/item/tool/retractor,
		/obj/item/tool/bonesetter,
		/obj/item/grenade
		)
