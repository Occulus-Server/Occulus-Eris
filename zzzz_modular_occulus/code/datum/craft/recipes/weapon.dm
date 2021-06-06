/datum/craft_recipe/weapon/stungloves
	name = "stun gloves"
	result = /obj/item/clothing/gloves/stungloves/makeshift
	steps = list(
		list(/obj/item/clothing/gloves/insulated, 1), //SACRIFICE YOUR GLOVES, MAINT GREMLIN!
		list(QUALITY_ADHESIVE, 30, "time" = 15), //prepping gloves.
		list(/obj/item/stack/cable_coil, 20, "time" = 10), //Wire it up
		list(QUALITY_WIRE_CUTTING, 30, "time" = 50), //Fix the wires
		list(/obj/item/weapon/cell/medium, 1),
		list(QUALITY_SCREW_DRIVING, 10, "time" = 50), //Secure cell to stungloves.
			)
