/obj/machinery/appliance/cooker/stove
	name = "stove"
	desc = "Don't touch it! Control-click to turn it on."
	icon_state = "stove_off"
	cook_type = "pan-fried"
	appliancetype = list("SKILLET",  "SAUCEPAN", "POT")
	food_color = "#a34719"
	can_burn_food = TRUE
	on_icon = "stove_on"
	off_icon = "stove_off"

	idle_power_usage = 1 KILOWATTS
	//uses ~30% power to stay warm
	optimal_power = 1.2

	max_contents = 4

	starts_with = list(
		/obj/item/reagent_containers/cooking_container/skillet,
		/obj/item/reagent_containers/cooking_container/pot,
		/obj/item/reagent_containers/cooking_container/saucepan
	)

/obj/item/electronics/circuitboard/stove
	name = "Circuit board (Stove)"
	build_path = /obj/machinery/appliance/cooker/stove
	origin_tech = list(TECH_DATA = 2)
	req_components = list(
		"/obj/item/stock_parts/matter_bin" = 2,
		"/obj/item/stock_parts/capacitor" = 3,
		"/obj/item/stock_parts/scanning_module" = 1)

/obj/machinery/appliance/cooker/stove/update_icon()
	. = ..()
	cut_overlays()
	var/counter = 1
	for(var/obj/item/reagent_containers/cooking_container/CC in contents)
		//var/image/pan_overlay
		if(istype(CC, /obj/item/reagent_containers/cooking_container/skillet))
			add_overlay(image('zzzz_modular_occulus/icons/obj/machines/kitchen.dmi', "skillet[counter]"))
		else if(istype(CC, /obj/item/reagent_containers/cooking_container/pot))
			add_overlay(image('zzzz_modular_occulus/icons/obj/machines/kitchen.dmi', "pot[counter]"))
		else if(istype(CC, /obj/item/reagent_containers/cooking_container/saucepan))
			add_overlay(image('zzzz_modular_occulus/icons/obj/machines/kitchen.dmi', "pan[counter]"))
		counter++
