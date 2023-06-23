/datum/recipe/grilled_meat
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/meat
	)
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	result = /obj/item/reagent_containers/food/snacks/meatsteak/grilled

/datum/recipe/grilled_meat_spicy
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/meat
	)
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1, "spacespice" = 1)
	result = /obj/item/reagent_containers/food/snacks/meatsteak/grilled/spicy

/datum/recipe/grilled_roachmeat
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat
	)
	result = /obj/item/reagent_containers/food/snacks/meatsteak/grilled/grilled_roachmeat

/datum/recipe/grilled_roachmeat/seuche
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/seuche)

/datum/recipe/grilled_roachmeat/panzer
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/panzer)

/datum/recipe/grilled_roachmeat/fuhrer
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/fuhrer)

/datum/recipe/grilled_roachmeat/kaiser
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/kaiser)

/datum/recipe/grilled_roachmeat/jager
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/jager)

/datum/recipe/grilled_roachmeat/kraftwerk
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/kraftwerk)

/datum/recipe/grilled_roachmeat/benzin
	items = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/benzin)

/datum/recipe/grilled_spidermeat
	appliance = GRILL
	items = list(/obj/item/reagent_containers/food/snacks/meat/spider)
	result = /obj/item/reagent_containers/food/snacks/meatsteak/grilled/grilled_spidermeat

/datum/recipe/grilled_spidermeat/hunter
	items = list(/obj/item/reagent_containers/food/snacks/meat/spider/hunter)

/datum/recipe/grilled_spidermeat/nurse
	items = list(/obj/item/reagent_containers/food/snacks/meat/spider/nurse)

/datum/recipe/grilled_xenomeat
	appliance = GRILL
	items = list(/obj/item/reagent_containers/food/snacks/meat/xenomeat)
	result = /obj/item/reagent_containers/food/snacks/meatsteak/grilled/grilled_xenomeat

/datum/recipe/grilled_roachmeat/make_food(obj/container) // make sure we burn all the roach chems away
	. = ..()
	var/list/results = .
	var/list/chems = list(/datum/reagent/toxin/blattedin, 
		/datum/reagent/toxin/diplopterum, 
		/datum/reagent/toxin/fuhrerole, 
		/datum/reagent/toxin/seligitillin, 
		/datum/reagent/toxin/starkellin, 
		/datum/reagent/toxin/gewaltine, 
		/datum/reagent/toxin/kaisertophin,
		/datum/reagent/nanites, 
		/datum/reagent/nanites/uncapped,
		/datum/reagent/toxin/fuel)
	for(var/thing in results)
		var/obj/item/XMG = thing
		for(var/C in chems)
			XMG.reagents.del_reagent(C)
/*	REENABLE THIS WHEN PRed BECAUSE THESE DON'T EXIST ON THIS BRANCH
/datum/recipe/grilled_spidermeat/make_food(obj/container) // make sure we burn all the spider chems away
	. = ..()
	var/list/results = .
	var/list/chems = list(/datum/reagent/toxin/pararein, /datum/reagent/toxin/aranecolmin)
	for(var/thing in results)
		var/obj/item/XMG = thing
		for(var/C in chems)
			XMG.reagents.del_reagent(C)
*/
/datum/recipe/grilled_xenomeat/make_food(obj/container) // make sure we burn all the polyacid away
	. = ..()
	var/list/results = .
	for(var/thing in results)
		var/obj/item/XMG = thing
		XMG.reagents.del_reagent(/datum/reagent/acid/polyacid)