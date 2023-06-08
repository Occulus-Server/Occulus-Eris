/datum/craft_recipe/refined_scrap
    name = "refine scrap"
    result = /obj/item/stack/material/refined_scrap/random
    time = WORKTIME_SLOW
    steps = list(
        list(/obj/item/stack/rods, 2), 
		list(QUALITY_HAMMERING, 10, "time" = 10), // Cobble down
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL), // Reinforce it a little
    )
    flags = CRAFT_BATCH 