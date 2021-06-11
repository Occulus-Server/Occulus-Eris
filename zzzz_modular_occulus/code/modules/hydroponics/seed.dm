//For occulus seed packets
/obj/item/seeds/joy
	seed_type = "joy"
	icon_state = "blank"

/datum/seed/joy
	name = "joyflower"
	seed_name = "joyflower"
	display_name = "Joy Flowers"
	chems = list("delight" = list(3,5), "nutriment" = list(1,25))
	mutants = null
	kitchen_tag = "joyflower"

/datum/seed/joy/New()
	..()
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCT_ICON,"flowers")
	set_trait(TRAIT_PRODUCT_COLOUR,"#FFFFFF")
	set_trait(TRAIT_PLANT_ICON,"flowers")
	set_trait(TRAIT_IDEAL_LIGHT, 7)
	set_trait(TRAIT_WATER_CONSUMPTION, 6)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.15)