/datum/recipe/grilled_meat
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/meat
	)
	reagents = list(/datum/reagent/other/sodiumchloride = 1, /datum/reagent/organic/blackpepper = 1)
	result = /obj/item/reagent_containers/food/snacks/meatsteak/grilled

/datum/recipe/grilled_meat_spicy
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/meat
	)
	reagents = list(/datum/reagent/other/sodiumchloride = 1, /datum/reagent/organic/blackpepper = 1, /datum/reagent/organic/nutriment/spacespice = 1)
	result = /obj/item/reagent_containers/food/snacks/meatsteak/grilled/spicy

/datum/recipe/grilled_xenomeat
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/xenomeat
	)
	result = /obj/item/reagent_containers/food/snacks/xenomeat/grilled

/datum/recipe/grilled_xenomeat/make_food(obj/container) // make sure we burn all the polyacid away
	. = ..()
	var/list/results = .
	for(var/thing in results)
		var/obj/item/XMG = thing
		XMG.reagents.del_reagent(/datum/reagent/acid/polyacid)