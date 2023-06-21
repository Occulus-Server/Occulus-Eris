/datum/recipe/popcorn
	appliance = SAUCEPAN
	fruit = list("corn" = 1)
	result = /obj/item/reagent_containers/food/snacks/popcorn

// Jellies
/datum/recipe/amanitajelly
	appliance = SAUCEPAN
	reagents = list(/datum/reagent/water = 5, /datum/reagent/alcohol/vodka = 5, /datum/reagent/toxin/amatoxin = 5)
	result = /obj/item/reagent_containers/food/snacks/amanitajelly
	make_food(var/obj/container as obj)

		. = ..(container)
		for (var/obj/item/reagent_containers/food/snacks/amanitajelly/being_cooked in .)
			being_cooked.reagents.del_reagent(/datum/reagent/toxin/amatoxin)

// Ports from the microwave... yeah

/datum/recipe/mint
	appliance = SAUCEPAN
	reagents = list(/datum/reagent/organic/sugar = 5, /datum/reagent/organic/frostoil = 5)
	result = /obj/item/reagent_containers/food/snacks/mint

/datum/recipe/porkbowl
	appliance = SAUCEPAN
	reagents = list(/datum/reagent/water = 5, /datum/reagent/organic/nutriment/rice = 10)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/cutlet
	)
	result = /obj/item/reagent_containers/food/snacks/porkbowl

/*	TODO: add when we have legs of some kind, maybe roach?
/datum/recipe/crab_legs
	appliance = SAUCEPAN | POT
	reagents = list(/datum/reagent/water = 10, /datum/reagent/other/sodiumchloride = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/crabmeat,
		/obj/item/reagent_containers/food/snacks/spreads
		)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/crab_legs
	*/