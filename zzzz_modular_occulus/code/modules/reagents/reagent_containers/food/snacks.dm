//Occulus' modular overrides and additions for snacks and junkfood goes here

/obj/item/reagent_containers/food/snacks/tastybread
	icon = 'zzzz_modular_occulus/icons/obj/food.dmi'
	open = FALSE

/obj/item/reagent_containers/food/snacks/liquidfood
	icon = 'zzzz_modular_occulus/icons/obj/food.dmi'
	open = FALSE

/obj/item/reagent_containers/food/snacks/spacetwinkie
	desc = "Guaranteed to survive longer then you will. Now comes in a double pack for twice the fun!"
	bitesize = 3
	preloaded_reagents = list("sugar" = 6)
	icon = 'zzzz_modular_occulus/icons/obj/food.dmi'
	open = FALSE
	trash = /obj/item/trash/spacetwinkie

/obj/item/reagent_containers/food/snacks/no_raisin
	icon = 'zzzz_modular_occulus/icons/obj/food.dmi'
	open = FALSE

/obj/item/reagent_containers/food/snacks/wok
	desc = "This box of noodles feature an extra spicy neo-soy sauce that's guaranteed to nourish your body as long as you can handle the heat!"
	nutriment_desc = list("noodles" = 3, "hellish spice" = 1)
	preloaded_reagents = list("capsaicin" = 2, "doctorsdelight" = 5)

/obj/item/reagent_containers/food/snacks/syndicake
	name = "Syndi-Cakes"
	icon_state = "syndi_cakes"
	desc = "An extremely moist snack cake that tastes just as good after being nuked. Now comes with an all-new formula with more potency and the same great taste! Warning: Do not consume more than one serving per hour."
	filling_color = "#FF5D05"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("sweetness" = 3, "cake" = 1)
	nutriment_amt = 4
	trash = /obj/item/trash/syndi_cakes
	preloaded_reagents = list("rezadone" = 5)
	taste_tag = list(SWEET_FOOD)
	icon = 'zzzz_modular_occulus/icons/obj/food.dmi'
	open = FALSE
