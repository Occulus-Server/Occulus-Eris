/obj/item/reagent_containers/food/snacks/rawcutlet
    slice_path = /obj/item/reagent_containers/food/snacks/rawbacon
    slices_num = 3

/obj/item/reagent_containers/food/snacks/rawbacon
	name = "raw bacon"
	desc = "A very thin piece of raw meat."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food_ingredients.dmi'
	icon_state = "rawbacon"
	bitesize = 1
	center_of_mass = list("x"=16, "y"=16)
	filling_color = "#FF3826"
	taste_tag = list(BLAND_FOOD, MEAT_FOOD)

/obj/item/reagent_containers/food/snacks/bacon
	name = "bacon"
	desc = "A tasty slice of bacon."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food_ingredients.dmi'
	icon_state = "bacon"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=16)
	nutriment_amt = 0.33
	nutriment_desc = list("salty bacon" = 5)
	preloaded_reagents = list("protein" = 1)
	filling_color = "#FC5647"
	taste_tag = list(MEAT_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/bacon/oven
	name = "oven-cooked bacon"
	desc = "A tasty meat slice. This one has been cooked in the oven, making it crispier."

/obj/item/reagent_containers/food/snacks/nugget
	name = "chicken nugget"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "nugget_lump"
	bitesize = 3
	nutriment_amt = 1
	preloaded_reagents = list("protein" = 4)
	filling_color = "#EDF291"
	taste_tag = list(MEAT_FOOD, BLAND_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/lasagna
	name = "lasagna"
	desc = "Multiple-layer lasagna. Dense enough to be used as a brick."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "lasagna"
	trash = /obj/item/trash/plate
	center_of_mass = list("x"=16, "y"=17)
	filling_color = "#EDF291"
	nutriment_amt = 12
	nutriment_desc = list("tomato sauce" = 5, "eggplant" = 5, "meaty pasta" = 10)
	preloaded_reagents = list("protein" = 12)
	bitesize = 6
	taste_tag = list(MEAT_FOOD, CHEESE_FOOD)
	cooked = TRUE