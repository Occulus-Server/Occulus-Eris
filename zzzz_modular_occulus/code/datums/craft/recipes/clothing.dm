/datum/craft_recipe/clothing/webcov
	name = "web-spun covers"
	result = /obj/item/clothing/under/webcovs
	steps = list(
		list(/obj/item/stack/webcloth, 3),
		list(/obj/item/stack/unrefinedsilk, 2),
		list(QUALITY_WIRE_CUTTING, 15, 70)
	)

/datum/craft_recipe/clothing/webcov
	name = "silken covers"
	result = /obj/item/clothing/under/silkwear
	steps = list(
		list(/obj/item/stack/silkcloth, 3),
		list(/obj/item/stack/refinedsilk, 2),
		list(QUALITY_WIRE_CUTTING, 15, 70)
	)