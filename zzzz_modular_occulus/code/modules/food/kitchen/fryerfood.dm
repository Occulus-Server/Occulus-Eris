//Nothing that goes in the fryer can be vegan food considering that batter is made with eggs
/obj/item/reagent_containers/food/snacks/jalapeno_poppers
	name = "chili popper"
	desc = "A battered, deep-fried chili pepper"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "popper"
	filling_color = "#00AA00"
	do_coating_prefix = 0
	nutriment_amt = 2
	nutriment_desc = list("chili pepper" = 5, "batter" = 1)
	preloaded_reagents = list("batter" = 2, "triglyceride" = 2)
	bitesize = 1
	coating = /datum/reagent/nutriment/coating/batter
	taste_tag = list(SPICY_FOOD, SALTY_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/risottoballs
	name = "arancini"
	gender = PLURAL
	desc = "Mushroom risotto that has been battered and deep fried. The best use of leftovers!"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "risottoballs"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#edd7d7"
	center_of_mass = list("x"=15, "y"=9)
	nutriment_amt = 2
	nutriment_desc = list("spices" = 1, "mushroom" = 10, "fried risotto" = 5)
	preloaded_reagents = list("sodiumchloride" = 1, "blackpepper" = 1, "rice" = 4)
	bitesize = 3
	taste_tag = list(SPICY_FOOD, VEGETARIAN_FOOD, UMAMI_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/onionrings
	name = "onion rings"
	desc = "Like circular fries but better."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "onionrings"
	trash = /obj/item/trash/plate
	filling_color = "#eddd00"
	center_of_mass = "x=16;y=11"
	nutriment_amt = 5
	nutriment_desc = list("fried onions" = 5)
	bitesize = 2
	taste_tag = list(SALTY_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/friedmushroom
	name = "fried mushroom"
	desc = "A tender, beer-battered mushroom of some kind, fried to crispy perfection."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "friedmushroom"
	filling_color = "#EDDD00"
	center_of_mass = list("x"=16, "y"=11)
	nutriment_amt = 4
	nutriment_desc = list("fried mushroom" = 10)
	preloaded_reagents = list("protein" = 2)
	bitesize = 5
	taste_tag = list(SALTY_FOOD, UMAMI_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chickenkatsu
	name = "chicken katsu"
	desc = "A Solarian delicacy consisting of chicken fried in a light beer batter"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "katsu"
	trash = /obj/item/trash/plate
	filling_color = "#E9ADFF"
	center_of_mass = list("x"=16, "y"=16)
	nutriment_amt = 3
	nutriment_desc = list("chicken" = 5, "fried breadcrumbs" = 5)
	preloaded_reagents = list("protein" = 6, "batter" = 2, "triglyceride" = 1)
	do_coating_prefix = 0
	bitesize = 1.5
	taste_tag = list(SALTY_FOOD, MEAT_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/sliceable/pizza/crunch
	name = "pizza crunch"
	desc = "Contains approximately as many calories as you'll need for the rest of your life."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "pizzacrunch"
	slice_path = /obj/item/reagent_containers/food/snacks/pizzacrunchslice
	slices_num = 6
	center_of_mass = list("x"=16, "y"=11)
	nutriment_amt = 24
	nutriment_desc = list("grease" = 10, "pizza" = 5, "your arteries clogging" = 5)
	preloaded_reagents = list("batter" = 6)
	bitesize = 2
	taste_tag = list(SALTY_FOOD, CHEESE_FOOD, MEAT_FOOD, UMAMI_FOOD)   //there's no MISTAKE_FOOD tag or it'd be here.
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/pizzacrunchslice
	name = "pizza crunch slice"
	desc = "A little piece of a heart attack. NanoTrasen's Medical division highly advises not to eat this, but someone will anyway."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "pizzacrunchslice"
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	nutriment_amt = 24
	nutriment_desc = list("grease" = 10, "pizza" = 5, "your arteries clogging" = 5)
	preloaded_reagents = list("batter" = 1)
	bitesize = 2
	taste_tag = list(SALTY_FOOD, CHEESE_FOOD, MEAT_FOOD, UMAMI_FOOD)   //there's no MISTAKE_FOOD tag or it'd be here.
	cooked = TRUE
	coating = /datum/reagent/nutriment/coating/batter

/obj/item/reagent_containers/food/snacks/fishfingers
	name = "fish fingers"
	desc = "If fish don't have fingers, what are these?"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "fishfingers"
	filling_color = "#FFDEFE"
	nutriment_amt = 7
	nutriment_desc = list("fish" = 10, "breading" = 1)
	bitesize = 3
	preloaded_reagents = list("batter" = 3, "protein" = 7)
	taste_tag = list(SALTY_FOOD, MEAT_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/funnelcake
	name = "funnel cake"
	desc = "A fried pile of donut-like batter. Funnel cakes rule!"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "funnelcake"
	filling_color = "#Ef1479"
	do_coating_prefix = 0
	bitesize = 2
	nutriment_amt = 5
	nutriment_desc = list("fried batter" = 10, "childhood whimsy" = 1)
	preloaded_reagents = list("batter" = 10, "sugar" = 5)
	taste_tag = list(SALTY_FOOD, VEGETARIAN_FOOD, FLOURY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/pisanggoreng
	name = "pisang goreng"
	gender = PLURAL
	desc = "Crispy, starchy, sweet banana fritters. Popular street food in parts of Sol."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "pisanggoreng"
	trash = /obj/item/trash/plate
	filling_color = "#301301"
	center_of_mass = list("x"=16, "y"=11)
	nutriment_amt = 8
	nutriment_desc = list("fried banana" = 10)
	bitesize = 3
	taste_tag = list(SALTY_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/corn_dog
	name = "corn dog"
	desc = "A cornbread covered sausage deepfried in oil."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "corndog"
	nutriment_amt = 4
	nutriment_desc = list("batter-coated sausage" = 10, "...carnies?" = 1)
	preloaded_reagents = list("protein" = 3, "batter" = 4)
	filling_color = "#FFF97D"
	taste_tag = list(SALTY_FOOD, MEAT_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/sweet_and_sour
	name = "sweet and sour meat"
	desc = "A bastardized Solarian recipie with a few liberties taken with meat selection."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "sweet_and_sour"
	nutriment_amt = 6
	nutriment_desc = list("meat" = 10, "sweet and sour sauce" = 5)
	preloaded_reagents = list("protein" = 3, "batter" = 1)
	trash = /obj/item/trash/plate
	filling_color = "#FC5647"
	taste_tag = list(SALTY_FOOD, MEAT_FOOD, SWEET_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/sour_roach
	name = "sour roach bits"
	desc = "Did someone seriously put roach meat in the fryer?"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "wingfangchu"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#43DE18"
	center_of_mass = list("x"=17, "y"=9)
	bitesize = 2
	nutriment_amt = 4
	nutriment_desc = list("meat" = 5, "strong burning sensation" = 10, "disgust" = 1)
	preloaded_reagents = list("protein" = 6)
	taste_tag = list(SALTY_FOOD, MEAT_FOOD)
	cooked = TRUE