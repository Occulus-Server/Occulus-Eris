// see code/datums/recipe.dm
/datum/recipe/hotdog
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/sausage
	)
	result = /obj/item/reagent_containers/food/snacks/hotdog
/*
/datum/recipe/classichotdog
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat/corgi
	)
	result = /obj/item/reagent_containers/food/snacks/classichotdog
*/
/datum/recipe/humanburger
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/human,
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/human/burger

/datum/recipe/plainburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat //do not place this recipe before /datum/recipe/humanburger
	)
	result = /obj/item/reagent_containers/food/snacks/burger

/datum/recipe/brainburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/organ/internal/brain
	)
	result = /obj/item/reagent_containers/food/snacks/brainburger

/datum/recipe/xenoburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat/xenomeat
	)
	result = /obj/item/reagent_containers/food/snacks/xenoburger	

/datum/recipe/fishburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat/carp
	)
	result = /obj/item/reagent_containers/food/snacks/fishburger

/datum/recipe/tofuburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/tofu
	)
	result = /obj/item/reagent_containers/food/snacks/tofuburger

/datum/recipe/humankabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat/human,
		/obj/item/reagent_containers/food/snacks/meat/human
	)
	result = /obj/item/reagent_containers/food/snacks/human/kabob

/datum/recipe/monkeykabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat
	)
	result = /obj/item/reagent_containers/food/snacks/monkeykabob

/datum/recipe/syntikabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh
	)
	result = /obj/item/reagent_containers/food/snacks/monkeykabob

/datum/recipe/tofukabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/tofu
	)
	result = /obj/item/reagent_containers/food/snacks/tofukabob

/datum/recipe/bigbiteburger
	items = list(
		/obj/item/reagent_containers/food/snacks/burger,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat
	)
	reagents = list(/datum/reagent/organic/nutriment/protein/egg = 3)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/bigbiteburger

/datum/recipe/sandwich
	items = list(
		/obj/item/reagent_containers/food/snacks/meatsteak,
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/sandwich

/*
/datum/recipe/bunbun
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/bunbun
*/
/datum/recipe/reubensandwich
	reagents = list(/datum/reagent/organic/nutriment/mayonnaise = 5, /datum/reagent/organic/nutriment/ketchup = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/toast,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/sauerkraut,
		/obj/item/reagent_containers/food/snacks/cutlet,
		/obj/item/reagent_containers/food/snacks/toast
	)
	reagent_mix = RECIPE_REAGENT_MIN
	result = /obj/item/reagent_containers/food/snacks/reubensandwich

/datum/recipe/superbiteburger
	fruit = list("tomato" = 1)
	reagents = list(/datum/reagent/other/sodiumchloride = 5, /datum/reagent/organic/blackpepper = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bigbiteburger,
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/boiledegg
	)
	result = /obj/item/reagent_containers/food/snacks/superbiteburger

/datum/recipe/candiedapple
	fruit = list("apple" = 1)
	reagents = list(/datum/reagent/water = 5, /datum/reagent/organic/sugar = 5)
	result = /obj/item/reagent_containers/food/snacks/candiedapple

/datum/recipe/slimeburger
	reagents = list(/datum/reagent/medicine/slimejelly = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/slime

/datum/recipe/jellyburger
	reagents = list(/datum/reagent/organic/nutriment/cherryjelly = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/cherry

/datum/recipe/twobread
	appliance = SKILLET | MIX
	reagents = list(/datum/reagent/alcohol/wine = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice
	)
	result = /obj/item/reagent_containers/food/snacks/twobread

/datum/recipe/slimesandwich
	reagents = list(/datum/reagent/medicine/slimejelly = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/slime

/datum/recipe/cherrysandwich
	reagents = list(/datum/reagent/organic/nutriment/cherryjelly = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/cherry

/datum/recipe/pbjsandwich
	reagents = list(/datum/reagent/organic/nutriment/cherryjelly = 5, /datum/reagent/organic/nutriment/peanutbutter = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice
	)
	result = /obj/item/reagent_containers/food/snacks/pbjsandwich

/datum/recipe/tossedsalad
	fruit = list("cabbage" = 2, "tomato" = 1, "carrot" = 1, "apple" = 1)
	result = /obj/item/reagent_containers/food/snacks/tossedsalad

/datum/recipe/aesirsalad
	fruit = list("goldapple" = 1, "ambrosiadeus" = 1)
	result = /obj/item/reagent_containers/food/snacks/aesirsalad
/*
/datum/recipe/validsalad
	fruit = list("potato" = 1, "ambrosia" = 3)
	items = list(/obj/item/reagent_containers/food/snacks/meatball)
	result = /obj/item/reagent_containers/food/snacks/salad/validsalad
	make_food(var/obj/container as obj)

		. = ..(container)
		for (var/obj/item/reagent_containers/food/snacks/salad/validsalad/being_cooked in .)
			being_cooked.reagents.del_reagent(/datum/reagent/toxin)
*/
/*
/datum/recipe/neuralbroke
	items = list(/obj/item/organ/vaurca/neuralsocket)
	result = /obj/item/neuralbroke
*/

/////////////////////////////////////////////////////////////
//Synnono Meme Foods
//
//Most recipes replace reagents with RECIPE_REAGENT_REPLACE
//to simplify the end product and balance the amount of reagents
//in some foods. Many require the space spice reagent/condiment
//to reduce the risk of future recipe conflicts.
/////////////////////////////////////////////////////////////
/*	//Occulus edit: Removed because space bears are deprecated.
/datum/recipe/bearburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/bearmeat
	)
	result = /obj/item/reagent_containers/food/snacks/burger/bear
*/
/datum/recipe/chickenfillet //Also just combinable, like burgers and hot dogs.
	items = list(
		/obj/item/reagent_containers/food/snacks/chickenkatsu,
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/chickenfillet

/datum/recipe/chilicheesefries
	appliance = SKILLET | SAUCEPAN | MIX // you can reheat it if you'd like
	items = list(
		/obj/item/reagent_containers/food/snacks/fries,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/hotchili
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/chilicheesefries

/datum/recipe/donerkebab
	fruit = list("tomato" = 1, "cabbage" = 1)
	reagents = list(/datum/reagent/other/sodiumchloride = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/meatsteak,
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough
	)
	result = /obj/item/reagent_containers/food/snacks/donerkebab

/datum/recipe/sashimi
	reagents = list(/datum/reagent/organic/nutriment/soysauce = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/carp
	)
	result = /obj/item/reagent_containers/food/snacks/sashimi


// Chip update

/datum/recipe/cheese_cracker
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	reagents = list(/datum/reagent/organic/nutriment/spacespice = 1)
	result = /obj/item/reagent_containers/food/snacks/cheese_cracker
	result_quantity = 4

/datum/recipe/baconburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/bacon,
		/obj/item/reagent_containers/food/snacks/bacon
	)
	result = /obj/item/reagent_containers/food/snacks/burger/bacon

/datum/recipe/blt
	fruit = list("tomato" = 1, "cabbage" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/bacon,
		/obj/item/reagent_containers/food/snacks/bacon
	)
	result = /obj/item/reagent_containers/food/snacks/blt

/datum/recipe/fish_taco
	appliance = MIX | SKILLET
	fruit = list("chili" = 1, "lemon" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/carp,
		/obj/item/reagent_containers/food/snacks/tortilla
	)
	result = /obj/item/reagent_containers/food/snacks/fish_taco

/datum/recipe/mashedpotato
	fruit = list("potato" = 1)
	result = /obj/item/reagent_containers/food/snacks/mashedpotato

/datum/recipe/icecreamsandwich
	reagents = list(/datum/reagent/drink/milk = 5, /datum/reagent/drink/ice = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/icecream
	)
	result = /obj/item/reagent_containers/food/snacks/icecreamsandwich

/datum/recipe/banana_split
	fruit = list("banana" = 1)
	reagents = list(/datum/reagent/drink/milk = 5, /datum/reagent/drink/ice = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/icecream
	)
	result = /obj/item/reagent_containers/food/snacks/banana_split

/datum/recipe/sauerkraut
	appliance = MIX
	fruit = list("cabbage" = 1)
	reagents = list(/datum/reagent/organic/enzyme = 5)
	result = /obj/item/reagent_containers/food/snacks/sauerkraut
	reagent_mix = RECIPE_REAGENT_REPLACE

//
//Mixer recipes
//

/datum/recipe/dough
	appliance = MIX
	reagents = list (/datum/reagent/other/sodiumchloride = 1, /datum/reagent/water = 10, /datum/reagent/organic/nutriment/flour = 10)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/dough
	result_quantity = 3

