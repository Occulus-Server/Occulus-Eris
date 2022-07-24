/datum/craft_recipe/gun/core
	name = "Inert Catalyst"
	result = /obj/item/guncore
	steps = list(
		list(/obj/item/cell/large, 1, "time" = 20), //start with a large cell
		list(QUALITY_SCREW_DRIVING, 10, 5), //opening the casing
		list(/obj/item/stack/cable_coil, 15, "time" = 20), //getting some wires ready
		list(QUALITY_WIRE_CUTTING, 10, 20), //adjusting and putting wires in place
		list(CRAFT_MATERIAL, 5, MATERIAL_GOLD),//adding conductors to the core
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL), //making casing and stuff
		list(QUALITY_SCREW_DRIVING, 10, "time" = 20) //screwing it all together
	)

/datum/craft_recipe/gun/chassis
	name = "Experimental Chassis"
	result = /obj/item/gunchassis
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL), //Starting with sheet metal
		list(QUALITY_WELDING, 10, 20), //Cutting it to spec
		list(QUALITY_PRYING, 10, 15), //Getting it in place
		list(CRAFT_MATERIAL, 3, MATERIAL_SILVER),//adding conductive material to the frame
		list(QUALITY_SCREW_DRIVING, 10, 20), //Screwing it in place
		list(/obj/item/stack/cable_coil, 15, 20), //Wires for other parts you add
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL), //Getting the external shroud ready
		list(/obj/item/tool_upgrade/augment/cell_mount, 1, 10),
		list(QUALITY_PRYING, 10, 10), //getting shroud folded
		list(QUALITY_WELDING, 10, 20) //getting the whole thing welded for assembly
	)


/datum/craft_recipe/gun/kalashbutworse
	name = "Modified AR .30 \"Kalamiti\""
	result = /obj/item/gun/projectile/automatic/ak47/cursed
	steps = list(
		list(/obj/item/gun/projectile/automatic/ak47/makeshift, 1),
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTIC),
		list(CRAFT_MATERIAL, 1, MATERIAL_GLASS),
		list(QUALITY_ADHESIVE, 15, 70),
		list(QUALITY_SAWING, 10, 70),
		list(QUALITY_SCREW_DRIVING, 10) 
	)
