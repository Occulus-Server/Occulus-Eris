//For foods made by hand or in the mixer.
//
//BY HAND
//
/obj/item/reagent_containers/food/snacks/chickenfillet
	name = "chicken fillet sandwich"
	desc = "Fried chicken, in sandwich format. Beauty is simplicity."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "chickenfillet"
	filling_color = "#E9ADFF"
	center_of_mass = list("x"=16, "y"=16)
	nutriment_amt = 4
	nutriment_desc = list("breaded chicken" = 10, "bun" = 5)
	preloaded_reagents = list("protein" = 8)
	bitesize = 3
	taste_tag = list(MEAT_FOOD, BLAND_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chilicheesefries
	name = "chili cheese fries"
	gender = PLURAL
	desc = "A mighty plate of fries, drowned in hot chili and cheese sauce. Because your arteries are overrated."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "chilicheesefries"
	trash = /obj/item/trash/plate
	filling_color = "#EDDD00"
	center_of_mass = list("x"=18, "y"=14)
	nutriment_amt = 8
	nutriment_desc = list("cheesy fries" = 10, "spices" = 3)
	preloaded_reagents = list("protein" = 2, "capsaicin" = 2)
	bitesize = 4
	taste_tag = list(VEGETARIAN_FOOD, CHEESE_FOOD, SALTY_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/donerkebab
	name = "doner kebab"
	desc = "A delicious sandwich-like food from ancient Earth. The meat is typically cooked on a vertical rotisserie."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "doner_kebab"
	filling_color = "#D45D6B"
	nutriment_amt = 5
	nutriment_desc = list("dough" = 4, "grilled veggies" = 4, "spiced meat" = 5)
	preloaded_reagents = list("protein" = 4)
	bitesize = 3
	taste_tag = list(MEAT_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/burger/bacon
	name = "bacon burger"
	desc = "The cornerstone of every nutritious breakfast, now with bacon!"
	icon_state = "hburger"
	filling_color = "#D63C3C"
	center_of_mass = list("x"=16, "y"=11)
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 3
	nutriment_desc = list("bun" = 5, "bacon" = 3, "burger" = 5)
	preloaded_reagents = list("protein" = 4)
	bitesize = 2
	taste_tag = list(MEAT_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/blt
	name = "BLT"
	desc = "A sandwich made of bacon, lettuce, and tomato."
	icon_state = "blt"
	filling_color = "#D63C3C"
	center_of_mass = list("x"=16, "y"=16)
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 4
	nutriment_desc = list("protein" = 4)
	preloaded_reagents = list("crispt lettuce" = 1, "fresh tomato" = 3, "bacon" = 5)
	bitesize = 2
	taste_tag = list(MEAT_FOOD, BLAND_FOOD) //I love BLTs but they're not very flavorful - Sigma
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/fish_taco
	name = "fish taco"
	desc = "A fish taco with chili and lemon."
	icon_state = "fish_taco"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 3
	nutriment_desc = list("fish" = 5, "lemon and chili" = 1, "tortilla" = 3)
	preloaded_reagents = list("protein" = 3, "capsaicin" = 1)
	filling_color = "#FFF97D"
	taste_tag = list(SPICY_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/mashedpotato
	name = "mashed potato"
	desc = "Pillowy mounds of mashed potato."
	icon_state = "mashedpotato"
	trash = /obj/item/trash/plate
	filling_color = "#EDDD00"
	center_of_mass = list("x"=16, "y"=11)
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 4
	nutriment_desc = list("potato" = 5, "salt" = 1, "garlic" = 1)
	bitesize = 2
	taste_tag = list(VEGETARIAN_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/icecreamsandwich
	name = "ice cream sandwich"
	desc = "Portable ice cream in its own packaging."
	icon_state = "icecreamsandwich"
	filling_color = "#343834"
	center_of_mass = list("x"=15, "y"=4)
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 4
	nutriment_desc = list("soft cookie" = 1, "ice cream" = 5)
	preloaded_reagents = list("ice cream" = 4)
	taste_tag = list(VEGETARIAN_FOOD, SWEET_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/banana_split
	name = "banana split"
	desc = "A dessert made with ice cream and a banana."
	icon_state = "banana_split"
	bitesize = 2
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 5
	nutriment_desc = list("ice cream" = 5, "banana" = 5)
	preloaded_reagents = list("banana" = 5, "ice cream" = 2)
	trash = /obj/item/trash/snack_bowl
	filling_color = "#F7F786"
	taste_tag = list(VEGETARIAN_FOOD, SWEET_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/sauerkraut
	name = "sauerkraut"
	desc = "Finely cut and fermented cabbage. A light pickled delight!"
	icon_state = "sauerkraut"
	filling_color = "#EBE699"
	bitesize = 2
	trash = /obj/item/trash/plate
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 4
	nutriment_desc = list("pickled cabbage" = 10)
	taste_tag = list(VEGETARIAN_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/reubensandwich
	name = "reuben sandwich"
	desc = "A toasted sandwich packed with savory, meat and sour goodness!"
	icon_state = "reubensandwich"
	filling_color = "#BF8E60"
	bitesize = 3
	trash = /obj/item/trash/plate
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 8
	nutriment_desc = list("a savory blend of sweet and salty ingredients" = 10, "toasted bread" = 5)
	taste_tag = list(MEAT_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/sashimi
	name = "sashimi"
	desc = "Raw fish with a small amount of rice."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	filling_color = "#F896FF"
	icon_state = "sashimi"
	bitesize = 2
	nutriment_amt = 4
	nutriment_desc = list("raw fish" = 10, "soy sauce" = 5)
	taste_tag = list(MEAT_FOOD, SALTY_FOOD)
	cooked = FALSE	//if this ever ends up true the chef will be assassinated

/obj/item/reagent_containers/food/snacks/cheese_cracker
	name = "supreme cheese toast"
	desc = "A piece of toast lathered with butter, cheese, spices, and herbs."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "cheese_cracker"
	filling_color = "#FFF97D"
	nutriment_amt = 8
	nutriment_desc = list("cheesy toast" = 10, "herbs" = 5)
	taste_tag = list(CHEESE_FOOD, SALTY_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/pbjsandwich
	name = "pbj sandwich"
	desc = "A staple classic lunch of gooey jelly and peanut butter."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "pbjsandwich"
	trash = /obj/item/trash/plate
	filling_color = "#BB6A54"
	bitesize = 2
	nutriment_amt = 2
	nutriment_desc = list("bread" = 5)
	taste_tag = list(SWEET_FOOD, VEGETARIAN_FOOD, FLOURY_FOOD)
	cooked = TRUE