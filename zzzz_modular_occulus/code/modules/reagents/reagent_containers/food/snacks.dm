//Occulus' modular overrides and additions for snacks and junkfood goes here
//Called by cooking machines to set the properties on the food, determining if it's raw or cooked.
/obj/item/reagent_containers/food/snacks/proc/cook()
	if (coating)
		var/datum/reagent/nutriment/coating/our_coating = decls_repository.get_decl(coating)
		var/list/temp = overlays.Copy()
		for (var/i in temp)
			if (istype(i, /image))
				var/image/I = i
				if (I.tag == "coating")
					temp.Remove(I)
					break

		overlays = temp
		//Carefully removing the old raw-batter overlay

		if (!flat_icon)
			flat_icon = getFlatIcon(src)
		var/icon/I = flat_icon
		color = "#FFFFFF" //Some fruits use the color var
		I.Blend(new /icon('icons/obj/food_custom.dmi', rgb(255,255,255)),ICON_ADD)
		I.Blend(new /icon('icons/obj/food_custom.dmi', our_coating.icon_cooked),ICON_MULTIPLY)
		var/image/J = image(I)
		J.alpha = 200
		J.tag = "coating"
		add_overlay(J)

		if (do_coating_prefix == 1)
			name = "[our_coating.coated_adj] [name]"

	for (var/r in reagents.reagent_list)
		if (ispath(r, /datum/reagent/nutriment/coating))
			var/datum/reagent/nutriment/coating/C = new /datum/reagent/nutriment/coating
			LAZYINITLIST(reagents.reagent_list)
			LAZYSET(reagents.reagent_list[r], "cooked", TRUE)
			C.name = C.cooked_name

/obj/item/reagent_containers/food/snacks/meat/cook()
	if (!isnull(cooked_icon))
		icon_state = cooked_icon
		flat_icon = null //Force regenating the flat icon for coatings, since we've changed the icon of the thing being coated
	..()

	if (name == initial(name))
		name = "cooked [name]"

/obj/item/reagent_containers/food/snacks
//Used in the ported aurora cooking process
	var/coating = null
	var/flat_icon = null
	var/do_coating_prefix = TRUE
	var/cooked_icon = null
	var/cooked_name = null	//Set this to the name of the object. Somehow.
	var/cooked = FALSE

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

//
// MISC REAGENTS
//
/*
/datum/reagent/nutriment/cherryjelly
/datum/reagent/nutriment/soysauce
/datum/reagent/blackpepper
/datum/reagent/sodiumchloride
/datum/reagent/spacespice
*/
//
// BREAD/BAKED
//
/obj/item/reagent_containers/food/snacks/bacon_flatbread
/obj/item/reagent_containers/food/snacks/cheese_cracker
/obj/item/reagent_containers/food/snacks/donkpocket/warm
/obj/item/reagent_containers/food/snacks/honeybun
/obj/item/reagent_containers/food/snacks/honeytoast
/obj/item/reagent_containers/food/snacks/muffin
/obj/item/reagent_containers/food/snacks/muffin_berry
/obj/item/reagent_containers/food/snacks/muffin_breakfast
/obj/item/reagent_containers/food/snacks/pancakes
/obj/item/reagent_containers/food/snacks/soywafers
/obj/item/reagent_containers/food/snacks/toast
/obj/item/reagent_containers/food/snacks/tortilla

//
// BURGER (AND SANDWICHES)
//
/obj/item/reagent_containers/food/snacks/bunbun
/obj/item/reagent_containers/food/snacks/burger
/obj/item/reagent_containers/food/snacks/burger/bacon
/obj/item/reagent_containers/food/snacks/burger/bigbite
/obj/item/reagent_containers/food/snacks/burger/brain
/obj/item/reagent_containers/food/snacks/burger/fish
/obj/item/reagent_containers/food/snacks/burger/human
/obj/item/reagent_containers/food/snacks/burger/jelly/cherry
/obj/item/reagent_containers/food/snacks/burger/jelly/slime
/obj/item/reagent_containers/food/snacks/burger/mouse
/obj/item/reagent_containers/food/snacks/burger/superbite
/obj/item/reagent_containers/food/snacks/burger/tofu
/obj/item/reagent_containers/food/snacks/burger/xeno
/obj/item/reagent_containers/food/snacks/blt
/obj/item/reagent_containers/food/snacks/lardwich	//what the fuck aurora
/obj/item/reagent_containers/food/snacks/pbjsandwich
/obj/item/reagent_containers/food/snacks/reubensandwich

//
// CONDIMENTS
//
/datum/reagent/nutriment/cherryjelly
/datum/reagent/nutriment/soysauce
/datum/reagent/blackpepper
/datum/reagent/sodiumchloride
/datum/reagent/spacespice

//
// DESSERT
//
/datum/reagent/browniemix
/obj/item/reagent_containers/food/snacks/banana_split
/obj/item/reagent_containers/food/snacks/sliceable/cosmicbrownies
/obj/item/reagent_containers/food/snacks/sliceable/brownies
/obj/item/reagent_containers/food/snacks/sliceable/cake/apple
/obj/item/reagent_containers/food/snacks/sliceable/cake/birthday
/obj/item/reagent_containers/food/snacks/sliceable/cake/brain
/obj/item/reagent_containers/food/snacks/sliceable/cake/carrot
/obj/item/reagent_containers/food/snacks/sliceable/cake/cheese
/obj/item/reagent_containers/food/snacks/sliceable/cake/chocolate
/obj/item/reagent_containers/food/snacks/sliceable/cake/lemon
/obj/item/reagent_containers/food/snacks/sliceable/cake/lime
/obj/item/reagent_containers/food/snacks/sliceable/cake/orange
/obj/item/reagent_containers/food/snacks/sliceable/cake/plain
/obj/item/reagent_containers/food/snacks/sliceable/keylimepie
/obj/item/reagent_containers/food/snacks/icecreamsandwich
/obj/item/reagent_containers/food/snacks/truffle

//
// EGGS
//
/obj/item/reagent_containers/food/snacks/friedegg
/obj/item/reagent_containers/food/snacks/boiledegg
/obj/item/reagent_containers/food/snacks/friedegg/overeasy
/obj/item/reagent_containers/food/snacks/poachedegg
/obj/item/reagent_containers/food/snacks/sliceable/quiche

//
// FRIED (in the frier, not pan fried)
//
//batters
/datum/reagent/nutriment/coating
	var/icon_cooked
	var/coated_adj
	var/cooked_name = null	//Set this to the name, somehow.
/datum/reagent/nutriment/coating/batter
	coated_adj = "battered"
/datum/reagent/nutriment/coating/beerbatter
	coated_adj = "beer-battered"

/obj/item/reagent_containers/food/snacks/corn_dog
/obj/item/reagent_containers/food/snacks/friedmushroom
/obj/item/reagent_containers/food/snacks/funnelcake
/obj/item/reagent_containers/food/snacks/jalapeno_poppers
/obj/item/reagent_containers/food/snacks/nugget
/obj/item/reagent_containers/food/snacks/onionrings
/obj/item/reagent_containers/food/snacks/pisanggoreng	//Apparently like fried banana?
/obj/item/reagent_containers/food/snacks/risottoballs
/obj/item/reagent_containers/food/snacks/sausage/battered
/obj/item/reagent_containers/food/snacks/sweet_and_sour	//Bits for sweet and sour pork/chicken?

//
// FRUIT
//
/obj/item/reagent_containers/food/snacks/pineapple_ring

//
// MEAT
//
/obj/item/reagent_containers/food/snacks/meat/chicken
/obj/item/reagent_containers/food/snacks/meat/rat

/obj/item/reagent_containers/food/snacks/bacon
/obj/item/reagent_containers/food/snacks/bacon/oven
/obj/item/reagent_containers/food/snacks/bacon/pan
/obj/item/reagent_containers/food/snacks/bacon_and_eggs
/obj/item/reagent_containers/food/snacks/chickenfillet
/obj/item/reagent_containers/food/snacks/chickenkatsu
/obj/item/reagent_containers/food/snacks/chilicheesefries
/obj/item/reagent_containers/food/snacks/classichotdog
/obj/item/reagent_containers/food/snacks/crab_legs
/obj/item/reagent_containers/food/snacks/crabmeat
/obj/item/reagent_containers/food/snacks/donerkebab
/obj/item/reagent_containers/food/snacks/fish
/obj/item/reagent_containers/food/snacks/fish_taco
/obj/item/reagent_containers/food/snacks/meat_pocket
/obj/item/reagent_containers/food/snacks/meatsteak/grilled
/obj/item/reagent_containers/food/snacks/meatsteak/grilled/spicy
/obj/item/reagent_containers/food/snacks/porkbowl
/obj/item/reagent_containers/food/snacks/sashimi
/obj/item/reagent_containers/food/snacks/rawbacon
/obj/item/reagent_containers/food/snacks/ribplate
/obj/item/reagent_containers/food/snacks/xenomeat
/obj/item/reagent_containers/food/snacks/xenomeat/grilled

//
// PASTA
//
/obj/item/reagent_containers/food/snacks/lasagna
/obj/item/reagent_containers/food/snacks/risotto

//
// PASTRIES
//
/obj/item/reagent_containers/food/snacks/croissant

//
// PIZZA
//
/obj/item/reagent_containers/food/snacks/variable/pizza
/obj/item/reagent_containers/food/snacks/sliceable/pizza/pineapple
/obj/item/reagent_containers/food/snacks/sliceable/pizza/crunch

//
// SALAD
//
/obj/item/reagent_containers/food/snacks/salad/aesirsalad
/obj/item/reagent_containers/food/snacks/salad/tossedsalad
//obj/item/reagent_containers/food/snacks/salad/validsalad

//
// SOUP
//
/obj/item/reagent_containers/food/snacks/soup/beet
/obj/item/reagent_containers/food/snacks/soup/blood
/obj/item/reagent_containers/food/snacks/soup/bluespace
/obj/item/reagent_containers/food/snacks/soup/onion
/obj/item/reagent_containers/food/snacks/soup/meatball
/obj/item/reagent_containers/food/snacks/soup/mushroom
/obj/item/reagent_containers/food/snacks/soup/mystery
/obj/item/reagent_containers/food/snacks/soup/nettle
/obj/item/reagent_containers/food/snacks/soup/slime
/obj/item/reagent_containers/food/snacks/soup/tomato
/obj/item/reagent_containers/food/snacks/soup/vegetable
/obj/item/reagent_containers/food/snacks/soup/wish

//
// VEGGIES
//
/obj/item/reagent_containers/food/snacks/mashedpotato
/obj/item/reagent_containers/food/snacks/sauerkraut

//
// EXTRANEOUS
//
/obj/item/reagent_containers/food/snacks/spreads
/obj/item/reagent_containers/food/snacks/spreads/lard