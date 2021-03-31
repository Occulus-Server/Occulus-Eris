/datum/craft_recipe/furniture/curtain
	name = "white curtain"
	result = /obj/structure/curtain
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTIC),
        list(QUALITY_WIRE_CUTTING, 10, 20, "time" = 30),
        list(/obj/item/stack/rods, 4, "time" = 20),
        list(QUALITY_WELDING, 10, 20),
        list(QUALITY_SCREW_DRIVING, 10, 20)
	)
	name_craft_menu = "Curtain Selection"

/datum/craft_recipe/furniture/curtain/black
	name = "black curtain"
	result = /obj/structure/curtain/black2
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/curtain/darkblue
	name = "dark blue curtain"
	result = /obj/structure/curtain/darkblue
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/curtain/blue
	name = "blue curtain"
	result = /obj/structure/curtain/blue
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/curtain/red
	name = "red curtain"
	result = /obj/structure/curtain/red
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/curtain/green
	name = "green curtain"
	result = /obj/structure/curtain/green
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/curtain/yellow
	name = "yellow curtain"
	result = /obj/structure/curtain/yellow
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/curtain/orange
	name = "orange curtain"
	result = /obj/structure/curtain/orange
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/curtain/purple
	name = "purple curtain"
	result = /obj/structure/curtain/purple
	variation_type = CRAFT_VARIATION