/obj/item/reagent_containers/food/snacks/friedegg/overeasy
    name = "over-easy fried egg"
    desc = "A fried egg with a touch of salt and pepper. The yolk is still runny."

/obj/item/reagent_containers/food/snacks/poachedegg
	name = "poached egg"
	desc = "A delicately poached egg with a runny yolk. Healthier than its fried counterpart."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "poachedegg"
	trash = /obj/item/trash/plate
	filling_color = "#FFDF78"
	center_of_mass = list("x"=16, "y"=14)
	nutriment_amt = 1
	nutriment_desc = list("egg" = 10, "pepper" = 1)
	preloaded_reagents = list("blackpepper" = 1)
	bitesize = 2
	taste_tag = list(BLAND_FOOD, VEGETARIAN_FOOD)

/obj/item/reagent_containers/food/snacks/honeytoast
	name = "piece of honeyed toast"
	desc = "For those who like their breakfast sweet."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "honeytoast"
	trash = /obj/item/trash/plate
	filling_color = "#EDE5AD"
	center_of_mass = list("x"=16, "y"=9)
	nutriment_amt = 1
	nutriment_desc = list("toasted bread" = 5, "honey" = 1)
	preloaded_reagents = list("honey" = 2)
	bitesize = 4
	taste_tag = list(FLOURY_FOOD, SWEET_FOOD, VEGETARIAN_FOOD)  //Not vegan, honey isn't vegan depending on the person

/obj/item/reagent_containers/food/snacks/bacon_and_eggs
	name = "bacon and eggs"
	desc = "A piece of bacon and two fried eggs."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "bacon_and_eggs"
	trash = /obj/item/trash/plate
	nutriment_amt = 5
	nutriment_desc = list("bacon" = 10, "egg" = 5)
	preloaded_reagents = list("protein" = 3, "egg" = 1)
	filling_color = "#FC5647"
	taste_tag = list(SALTY_FOOD, MEAT_FOOD)

/obj/item/reagent_containers/food/snacks/omelette
	name = "omelette du fromage"
	desc = "That's all you can say!"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "omelette"
	trash = /obj/item/trash/plate
	nutriment_amt = 4
	nutriment_desc = list("egg" = 5, "cheese" = 5)
	filling_color = "#FFF9A8"
	preloaded_reagents = list("protein" = 4, "egg" = 4)
	center_of_mass = list("x"=16, "y"=13)
	bitesize = 1
	taste_tag = list(CHEESE_FOOD, VEGETARIAN_FOOD)

/obj/item/reagent_containers/food/snacks/muffin
	name = "muffin"
	desc = "A delicious and spongy little cake."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "muffin"
	filling_color = "#E0CF9B"
	center_of_mass = list("x"=17, "y"=4)
	nutriment_amt = 6
	nutriment_desc = list("sweetness" = 5, "muffin" = 5)
	bitesize = 2
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD, VEGETARIAN_FOOD)

/obj/item/reagent_containers/food/snacks/muffin/berry
    name = "berry muffin"
    desc = "A muffin with some berries inside."
    icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
    icon_state = "berrymuffin"
    nutriment_desc = list("sweetness" = 5, "muffin" = 5, "berries" = 1)
    preloaded_reagents = list("berryjuice" = 5)
    taste_tag = list(SWEET_FOOD, FLOURY_FOOD, VEGETARIAN_FOOD)

/obj/item/reagent_containers/food/snacks/sliceable/quiche
	name = "quiche"
	desc = "A breakfast egg tart. Some say one of the Bone boys is still making these."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "quiche"
	slice_path = /obj/item/reagent_containers/food/snacks/quicheslice
	slices_num = 5
	filling_color = "#F5B951"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_amt = 10
	nutriment_desc = list("cheese" = 10, "egg" = 5, "pastry" = 1)
	preloaded_reagents = list("protein" = 10)
	taste_tag = list(FLOURY_FOOD, CHEESE_FOOD, VEGETARIAN_FOOD)

/obj/item/reagent_containers/food/snacks/quicheslice
	name = "slice of quiche"
	desc = "A slice of delicious quiche. Eggy, cheesy goodness."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "quicheslice"
	trash = /obj/item/trash/plate
	filling_color = "#F5B951"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=12)
	nutriment_amt = 2
	nutriment_desc = list("cheese" = 10, "egg" = 5, "pastry" = 1)
	preloaded_reagents = list("protein" = 2)
	taste_tag = list(FLOURY_FOOD, CHEESE_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/irem/reagent_containers/food/snacks/quicheslice/filled
    name = "filled quiche slice"
    desc = "A slice of delicious quiche. It's filled with something."

/obj/item/reagent_containers/food/snacks/pancakes
	name = "pancakes"
	desc = "Pancakes, delicious."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "pancakes"
	trash = /obj/item/trash/plate
	nutriment_amt = 8
	nutriment_desc = list("pancake" = 10)
	bitesize = 2
	filling_color = "#EDF291"
	taste_tag = list(FLOURY_FOOD, BLAND_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/pancakes/berry
	name = "berry pancakes"
	desc = "Pancakes with berries, delicious."
	icon_state = "berry_pancakes"
	nutriment_desc = list("pancakes" = 10, "berries" = 5)
	taste_tag = list(FLOURY_FOOD, SWEET_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/muffin_breakfast
	name = "full breakfast"
	desc = "A muffin, sausage, egg, and cheese."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "father_breakfast"
	trash = /obj/item/trash/plate
	nutriment_amt = 12
	nutriment_desc = list("sausage" = 10, "egg" = 5, "cheese" = 5)
	bitesize = 2
	filling_color = "#EDF291"
	taste_tag = list(FLOURY_FOOD, MEAT_FOOD, CHEESE_FOOD)
	cooked = TRUE