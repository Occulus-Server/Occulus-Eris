/obj/machinery/appliance/cooker/grill
	name = "grill"
	desc = "Smells like... Propane? Control-click to turn it on."
	icon_state = "grill"
	cook_type = "grilled"
	appliancetype = "GRILL"
	stat = POWEROFF
	food_color = "#a34719"

	finish_verb = "sizzles to completion!"

	max_contents = 1
	cooking_coeff = 0.3 //Cooks slowly but also burns slowly?
	power_verb = "fire up"

	idle_power_usage = 0
	active_power_usage = 0


	component_parts = list(
		/obj/item/electronics/circuitboard/cooker/grill,
		/obj/item/stock_parts/capacitor = 2,
		/obj/item/stock_parts/micro_laser,
		/obj/item/stack/cable_coil = 5
	)

	starts_with = list(
		/obj/item/reagent_containers/cooking_container/grill_grate
	)

	attackverb = "grill"


/obj/item/electronics/circuitboard/cooker/grill
	name = "Circuit board (Grill)"
	build_path = /obj/machinery/appliance/cooker/grill
	req_components = list(
		"/obj/item/stock_parts/capacitor" = 4,
		"/obj/item/stack/cable_coil" = 1,
		"/obj/item/stock_parts/micro_laser" = 1)

/obj/machinery/appliance/cooker/grill/RefreshParts()
	..()
	cooking_coeff = 0.3 // we will always cook nice and slow

/obj/machinery/appliance/cooker/grill/get_efficiency()
	return 100	//I'm lazy and hate this temperature system, so if it's on it's efficient.
	//return (temperature / optimal_temp) * 100
/*
/obj/machinery/appliance/cooker/grill/activation_message(var/mob/user)
	user.visible_message("<b>[user]</b> [stat ? "turns off" : "fires up"] \the [src].", "You [stat ? "turn off" : "fire up"] \the [src].")
*/
/obj/machinery/appliance/cooker/grill/has_space(var/obj/item/I)
	if(istype(I, /obj/item/reagent_containers/cooking_container))
		if(length(cooking_objs) < max_contents)
			return TRUE
	else
		if(length(cooking_objs))
			var/datum/cooking_item/CI = cooking_objs[1]
			var/obj/item/reagent_containers/cooking_container/grill_grate/G = CI.container
			if(G?.can_fit(I))
				return CI
	return FALSE

/obj/machinery/appliance/cooker/grill/update_icon()
	. = ..()
	overlays.Cut()
	if(length(cooking_objs))
		var/datum/cooking_item/CI = cooking_objs[1]
		var/obj/item/reagent_containers/cooking_container/grill_grate/G = CI.container
		if(G)
			add_overlay(image('zzzz_modular_occulus/icons/obj/machines/kitchen.dmi', "grill"))
			var/counter = 1
			for(var/thing in G.contents)
				if(istype(thing, /obj/item/reagent_containers/food/snacks/meat/roachmeat))
					add_overlay(image('zzzz_modular_occulus/icons/obj/machines/kitchen.dmi', "xenomeat[counter]"))
				else if(istype(thing, /obj/item/reagent_containers/food/snacks/meat))
					add_overlay(image('zzzz_modular_occulus/icons/obj/machines/kitchen.dmi', "meat[counter]"))
				counter++
