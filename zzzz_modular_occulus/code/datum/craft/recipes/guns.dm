/datum/craft_recipe/gun/core
	name = "Inert Catalyst"
	result = /obj/item/guncore
	steps = list(
		list(/obj/item/weapon/cell/large, 1, "time" = 20), //start with a large cell
		list(QUALITY_SCREW_DRIVING, 10, 5), //opening the casing
		list(/obj/item/stack/cable_coil, 15, "time" = 20), //getting some wires ready
		list(QUALITY_WIRE_CUTTING, 10, 20), //adjusting and putting wires in place
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL), //making casing and stuff
		list(QUALITY_SCREW_DRIVING, 10, "time" = 20) //screwing it all together
	)

/datum/craft_recipe/gun/chassis
	name = "Experimental Chassis"
	result = /obj/item/gunchassis
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL), //Starting with sheet metal
		list(QUALITY_WELDING, 10, 20), //Cutting it to spec
		list(QUALITY_PRYING, 10, 15), //Getting it in place
		list(QUALITY_SCREW_DRIVING, 10, 20), //Screwing it in place
		list(/obj/item/stack/cable_coil, 15, 20), //Wires for other parts you add
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL), //Getting the external shroud ready 
		list(/obj/item/weapon/tool_upgrade/augment/cell_mount, 1, 10),
		list(QUALITY_PRYING, 10, 10), //getting shroud folded
		list(QUALITY_WELDING, 10, 20) //getting the whole thing welded for assembly
	)
		