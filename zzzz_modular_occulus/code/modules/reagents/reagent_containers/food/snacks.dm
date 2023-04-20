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


/obj/item/reagent_containers/food/snacks/candiedapple/mordant
	name = "oddly-preserved Candied Apple"
	desc = "An apple coated in what looks like caramel but smells like nothing. It's disturbingly well-preserved, with a thin layer of dust covering the stick stuck on it...but none on the \"candied\" apple itself. Do you dare...?"
	nutriment_desc = list("plastic" = 20, "dust" = 10, "raw onion" = 15)
	preloaded_reagents = list("stoxin" = 3,"plasticide" = 4)

/obj/item/reagent_containers/food/snacks/sliceable/applecake/mordant
	name = "Perfectly Preserved Apple-Cake"
	desc = "A cake centered with apples. It's covered in dust, but looks entirely fresh and ready to eat. Do you dare...?"
	icon_state = "applecake"
	slice_path = /obj/item/reagent_containers/food/snacks/applecakeslice/mordant
	slices_num = 5
	filling_color = "#EBF5B8"
	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("death" = 10, "dust" = 10, "regret" = 15)
	nutriment_amt = 15
	taste_tag = list(SWEET_FOOD,FLOURY_FOOD)
	preloaded_reagents = list("stoxin" = 10)

/obj/item/reagent_containers/food/snacks/applecakeslice/mordant
	nutriment_desc = list("death" = 10, "dust" = 10, "regret" = 15)
	preloaded_reagents = list("stoxin" = 2)