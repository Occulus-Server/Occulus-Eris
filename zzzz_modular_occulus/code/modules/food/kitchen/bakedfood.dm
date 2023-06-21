/obj/item/reagent_containers/food/snacks/sliceable/pizza/pineapple
	name = "Pineapple Pizza"
	desc = "A pizza with a delicious, if contentious, topping."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "pineapple_pizza"
	slice_path = /obj/item/reagent_containers/food/snacks/pineapplepizzaslice
	slices_num = 6
	center_of_mass = list("x"=16, "y"=11)
	nutriment_desc = list("pizza crust" = 10, "tomato" = 10, "cheese" = 15, "pineapple" = 15)
	nutriment_amt = 10
	bitesize = 2
	cooked = TRUE
	preloaded_reagents = list("protein" = 34, "tomatojuice" = 6, "pineapplejuice" = 12)
	taste_tag = list(MEAT_FOOD, CHEESE_FOOD)

/*	//I'm not sure what this means but it's in here just in case. I don't know how to do this
/obj/item/pizzabox/pineapple
	pizza_type = /obj/item/reagent_containers/food/snacks/sliceable/pizza/pineapple
	boxtag = "Silversun Sunrise"
*/

/obj/item/reagent_containers/food/snacks/pineapplepizzaslice
	name = "pineapple pizza slice"
	desc = "A slice of pizza with a contentious topping."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "pineapple_pizza_slice"
	filling_color = "#BAA14C"
	bitesize = 2
	center_of_mass = list("x"=18, "y"=13)
	preloaded_reagents = list("protein" = 7, "tomatojuice" = 1, "pineapplejuice" = 2)
	taste_tag = list(MEAT_FOOD, CHEESE_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/bacon_flatbread
	name = "bacon cheese flatbread"
	desc = "Not a pizza, but looks like one."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "bacon_pizza"
	nutriment_desc = list("salty bacon" = 10, "flatbread" = 5, "cheese" = 1)
	nutriment_amt = 5
	preloaded_reagents = list("protein" = 5)
	filling_color = "#BD8939"
	taste_tag = list(MEAT_FOOD, CHEESE_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soywafers
	name = "Soy Wafers"
	desc = "Simple pressed soy wafers. Why they're not called soy waffles is a mystery."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "soylent_yellow"
	trash = /obj/item/trash/plate
	filling_color = "#E6FA61"
	nutriment_desc = list("bland, dry soy" = 5)
	center_of_mass = list("x"=15, "y"=11)
	preloaded_reagents = list("nutriment" = 10, "protein" = 5)
	bitesize = 2
	taste_tag = list(BLAND_FOOD, VEGAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/berryclafoutis
	name = "berry clafoutis"
	desc = "Some kind of berry pie. Smells great!"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "berryclafoutis"
	trash = /obj/item/trash/plate
	nutriment_amt = 4
	nutriment_desc = list("sweet berries" = 10, "pie crust" = 5)
	center_of_mass = list("x"=16, "y"=13)
	preloaded_reagents = list("nutriment" = 4, "berryjuice" = 5)
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/loadedbakedpotato
	name = "loaded baked potato"
	desc = "Totally baked."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "loadedbakedpotato"
	filling_color = "#9C7A68"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_amt = 3
	nutriment_desc = list("potato" = 10, "cheese" = 5, "chives" = 1)
	preloaded_reagents = list("protein" = 3)
	bitesize = 2
	taste_tag = list(CHEESE_FOOD, SALTY_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/ribplate
	name = "plate of ribs"
	desc = "A half-rack of ribs, brushed with some sort of honey-glaze. Napkins mandatory."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "ribplate"
	trash = /obj/item/trash/plate
	filling_color = "#7A3D11"
	nutriment_amt = 6
	nutriment_desc = list("ribs" = 10, "honey" = 5, "smoky barbecue" = 10)
	center_of_mass = list("x"=16, "y"=13)
	bitesize = 4
	preloaded_reagents = list("protein" = 6, "triglyceride" = 2, "blackpepper" = 1, "honey" = 5)
	taste_tag = list(MEAT_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/eggplantparm
	name = "eggplant parmigiana"
	desc = "The only good recipe for eggplant."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "eggplantparm"
	trash = /obj/item/trash/plate
	filling_color = "#4D2F5E"
	center_of_mass = list("x"=16, "y"=11)
	nutriment_amt = 6
	nutriment_desc = list("eggplant" = 10, "cheese" = 5, "salt" = 1)
	preloaded_reagents = list("protein" = 5)
	bitesize = 2
	taste_tag = list(CHEESE_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/meat_pocket
	name = "meat pocket"
	desc = "Meat and cheese stuffed in a flatbread pocket, grilled to perfection."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "meat_pocket"
	nutriment_desc = list("something meaty" = 10, "rich sauce" = 5, "cheese" = 5)
	nutriment_amt = 3
	preloaded_reagents = list("protein" = 3)
	filling_color = "#BD8939"
	bitesize = 2
	taste_tag = list(CHEESE_FOOD, MEAT_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit
	name = "plump helmet biscuit"
	desc = "This is a finely-prepared plump helmet biscuit. The ingredients are exceptionally minced plump helmet, and well-minced wheat flour."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "phelmbiscuit"
	filling_color = "#CFB4C4"
	center_of_mass = list("x"=16, "y"=13)
	nutriment_amt = 5
	nutriment_desc = list("mushroom" = 10, "baked goods" = 5)
	preloaded_reagents = list("protein" = 5)
	bitesize = 2
	taste_tag = list(UMAMI_FOOD, FLOURY_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/spacylibertyduff
	name = "spacy liberty duff"
	desc = "Jello gelatin, from Alfred Hubbard's cookbook."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "spacylibertyduff"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#42B873"
	center_of_mass = list("x"=16, "y"=8)
	nutriment_amt = 6
	nutriment_desc = list("mushroom" = 10, "good vibrations" = 1)
	preloaded_reagents = list("psilocybin" = 6)
	bitesize = 3
	taste_tag = list(UMAMI_FOOD, TASTE_STRONG, VEGAN_FOOD)	//CONTAINS VODKA
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/rofflewaffles
	name = "roffle waffles"
	desc = "Waffles, with a little bit of something extra."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "rofflewaffles"
	trash = /obj/item/trash/plate
	filling_color = "#FF00F7"
	center_of_mass = list("x"=15, "y"=11)
	nutriment_amt = 8
	nutriment_desc = list("waffles" = 10, "sweetness" = 5, "good vibrations" = 1)
	preloaded_reagents = list("nutriment" = 8, "psilocybin" = 8)
	bitesize = 4
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/toast
	name = "toasted bread"
	desc = "Plain, but consistent and reliable toast."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "toast"
	item_state = "toast"
	slot_flags = SLOT_MASK
	contained_sprite = TRUE
	trash = /obj/item/trash/plate
	filling_color = "#D9BE29"
	bitesize = 1
	nutriment_amt = 2
	nutriment_desc = list("toasted bread" = 5)
	taste_tag = list(FLOURY_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE