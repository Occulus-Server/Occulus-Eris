/datum/recipe/friedegg_easy
	appliance = SKILLET
	reagents = list(/datum/reagent/other/sodiumchloride = 1, /datum/reagent/organic/blackpepper = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/egg
	)
	result = /obj/item/reagent_containers/food/snacks/friedegg/overeasy

/datum/recipe/friedegg
	appliance = SKILLET
	items = list(
		/obj/item/reagent_containers/food/snacks/friedegg/overeasy
	)
	result = /obj/item/reagent_containers/food/snacks/friedegg

/datum/recipe/boiledegg
	appliance = SAUCEPAN | POT

/datum/recipe/poachedegg
	appliance = SKILLET | SAUCEPAN
	reagents = list(/datum/reagent/organic/nutriment/spacespice = 1, /datum/reagent/other/sodiumchloride = 1, /datum/reagent/organic/blackpepper = 1, /datum/reagent/water = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/egg
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Get that water outta here
	result = /obj/item/reagent_containers/food/snacks/poachedegg

/datum/recipe/honeytoast
	appliance = SKILLET
	reagents = list(/datum/reagent/organic/nutriment/honey = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/honeytoast

/datum/recipe/bacon_and_eggs
	appliance = SKILLET
	items = list(
		/obj/item/reagent_containers/food/snacks/bacon,
		/obj/item/reagent_containers/food/snacks/friedegg
	)
	result = /obj/item/reagent_containers/food/snacks/bacon_and_eggs

/datum/recipe/muffin_breakfast
	appliance = SKILLET
	items = list(
		/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit,
		/obj/item/reagent_containers/food/snacks/sausage,
		/obj/item/reagent_containers/food/snacks/friedegg,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/muffin_breakfast

/datum/recipe/boiledegg
	appliance = SAUCEPAN | POT
	reagents = list(/datum/reagent/water = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/egg
	)
	result = /obj/item/reagent_containers/food/snacks/boiledegg

/datum/recipe/omelette
	appliance = SKILLET
	items = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	reagents = list(/datum/reagent/organic/nutriment/protein/egg = 6)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/omelette

/datum/recipe/muffin
	appliance = OVEN
	reagents = list(/datum/reagent/drink/milk = 5, /datum/reagent/organic/sugar = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/dough
	)
	result = /obj/item/reagent_containers/food/snacks/muffin

/datum/recipe/muffin_berry
	appliance = OVEN
	reagents = list(/datum/reagent/drink/milk = 5, /datum/reagent/organic/sugar = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/dough
	)
	fruit = list("berries" = 1)
	result = /obj/item/reagent_containers/food/snacks/muffin_berry

/datum/recipe/quiche
	appliance = OVEN
	reagents = list(/datum/reagent/drink/milk = 5, /datum/reagent/organic/nutriment/protein/egg = 9, /datum/reagent/organic/nutriment/flour = 10)
	items = list(/obj/item/reagent_containers/food/snacks/cheesewedge)
	result = /obj/item/reagent_containers/food/snacks/sliceable/quiche
	reagent_mix = RECIPE_REAGENT_REPLACE //No raw egg in finished product, protein after cooking causes magic meatballs otherwise

/datum/recipe/pancakes
	appliance = SKILLET
	fruit = list("berries" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough
		)
	result = /obj/item/reagent_containers/food/snacks/pancakes
	result_quantity = 2

/datum/recipe/waffles
	appliance = SKILLET
	reagents = list(/datum/reagent/organic/sugar = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/dough
	)
	result = /obj/item/reagent_containers/food/snacks/waffles