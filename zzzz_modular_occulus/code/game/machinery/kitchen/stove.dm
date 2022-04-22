/obj/machinery/appliance/cooker/stove
	name = "stove"
	desc = "Don't touch it!"
	icon_state = "stove_off"
	cook_type = "pan-fried"
	appliancetype = SKILLET | SAUCEPAN | POT
	food_color = "#a34719"
	can_burn_food = TRUE
	on_icon = "stove_on"
	off_icon = "stove_off"

	idle_power_usage = 1 KILOWATTS
	//uses ~30% power to stay warm
	optimal_power = 1.2

	max_contents = 4

	stat = POWEROFF	//Starts turned off

	starts_with = list(
		/obj/item/reagent_containers/cooking_container/skillet,
		/obj/item/reagent_containers/cooking_container/pot,
		/obj/item/reagent_containers/cooking_container/saucepan
	)

/obj/item/electronics/circuitboard/stove
	name = "Circuit board (Stove)"
	build_path = /obj/machinery/appliance/cooker
	origin_tech = list(TECH_DATA = 2)

/obj/machinery/appliance/cooker/stove/update_icon()
	. = ..()
	cut_overlays()
	var/list/pans = list()
	for(var/obj/item/reagent_containers/cooking_container/CC in contents)
		var/image/pan_overlay
		switch(CC.appliancetype)
			if(SKILLET)
				pan_overlay = image('icons/obj/cooking_machines.dmi', "skillet[Clamp(length(pans)+1, 1, 4)]")
			if(SAUCEPAN)
				pan_overlay = image('icons/obj/cooking_machines.dmi', "pan[Clamp(length(pans)+1, 1, 4)]")
			if(POT)
				pan_overlay = image('icons/obj/cooking_machines.dmi', "pot[Clamp(length(pans)+1, 1, 4)]")
			else
				continue
		pan_overlay.color = CC.color
		pans += pan_overlay
	if(isemptylist(pans))
		return
	add_overlay(pans)