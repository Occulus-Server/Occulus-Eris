/datum/craft_recipe/tool/blade_addon
	name = "Tool mod: Blade"
	result = /obj/item/weapon/tool_upgrade/augment/blade_addon
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 10, 150),
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
		list(QUALITY_HAMMERING, 10, 150),
		list(QUALITY_WELDING, 10, 150)
	)

/datum/craft_recipe/tool/wrench_addon
	name = "Tool mod: Wrench"
	result = /obj/item/weapon/tool_upgrade/augment/wrench_addon
	steps = list(
		list(/obj/item/weapon/tool/wrench, 1, "time" = 30),
		list(QUALITY_SAWING, 10, 150),
	)

/datum/craft_recipe/tool/multitool_addon
	name = "Tool mod: Multitool"
	result = /obj/item/weapon/tool_upgrade/augment/multitool_addon
	steps = list(
		list(/obj/item/weapon/tool/multitool, 1, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 10, 150),
		list(QUALITY_WIRE_CUTTING, 10, 150),
		list(QUALITY_SCREW_DRIVING, 10, 150),
		list(QUALITY_CUTTING, 10, 150),
		list(QUALITY_PRYING, 10, 150),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)

/datum/craft_recipe/tool/prying_addon
	name = "Tool mod: Prying"
	result = /obj/item/weapon/tool_upgrade/augment/prying_addon
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 10, 150),
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
		list(QUALITY_HAMMERING, 10, 150),
		list(QUALITY_WELDING, 10, 150)
	)

/datum/craft_recipe/tool/screw_addon
	name = "Tool mod: Prying"
	result = /obj/item/weapon/tool_upgrade/augment/screw_addon
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 10, 150),
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL),
		list(QUALITY_HAMMERING, 10, 150),
		list(QUALITY_WELDING, 10, 150)
	)

/datum/craft_recipe/tool/digging_addon
	name = "Tool mod: Adze"
	result = /obj/item/weapon/tool_upgrade/augment/digging_addon
	steps = list(
		list(/obj/item/weapon/tool/shovel/spade, 1, "time" = 30),
		list(QUALITY_SAWING, 10, 150),
	)