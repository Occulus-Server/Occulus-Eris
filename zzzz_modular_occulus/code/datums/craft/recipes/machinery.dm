/datum/craft_recipe/machinery/silkdryer
	name = "silk dryer"
	result = /obj/machinery/smartfridge/drying_rack/silk
	time = 50
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC),
		list(/obj/item/stack/cable_coil, 15, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 10, 120),
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 120),
		list(QUALITY_PRYING, 10, 120),
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTIC),
		list(QUALITY_WELDING, 10, 120),
		list(QUALITY_BOLT_TURNING, 10, 60)
	)