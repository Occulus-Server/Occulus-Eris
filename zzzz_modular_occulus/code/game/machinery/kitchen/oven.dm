/obj/machinery/appliance/cooker/oven
	name = "oven"
	desc = "Cookies are ready, dear. Alt-click to open or close the oven door. Control-click to turn it on."
	icon_state = "oven"
	on_icon = "oven_on"
	off_icon = "oven"
	
	cook_type = "baked"
	appliancetype = OVEN
	food_color = "#a34719"
	can_burn_food = TRUE
	active_power_usage = 6 KILOWATTS
	idle_power_usage = 2 KILOWATTS
	//uses ~30% power to stay warm
	optimal_power = 1.2
	light_x = 2
	max_contents = 5
	stat = POWEROFF	//Starts turned off
	var/open = FALSE // Start closed so people don't heat up ovens with the door open

	maindamage = 30
	altdamage = 30
	alt_damage_type = OXY
	alt_affected_organ = OP_LUNGS

	starts_with = list(
		/obj/item/reagent_containers/cooking_container/oven,
		/obj/item/reagent_containers/cooking_container/oven,
		/obj/item/reagent_containers/cooking_container/oven,
		/obj/item/reagent_containers/cooking_container/oven,
		/obj/item/reagent_containers/cooking_container/oven
	)

	output_options = list(
		"Pizza" = /obj/item/reagent_containers/food/snacks/variable/pizza,
		"Bread" = /obj/item/reagent_containers/food/snacks/variable/bread,
		"Pie" = /obj/item/reagent_containers/food/snacks/variable/pie,
		"Cake" = /obj/item/reagent_containers/food/snacks/variable/cake,
		"Hot Pocket" = /obj/item/reagent_containers/food/snacks/variable/pocket,
		"Kebab" = /obj/item/reagent_containers/food/snacks/variable/kebab,
		"Waffles" = /obj/item/reagent_containers/food/snacks/variable/waffles,
		"Cookie" = /obj/item/reagent_containers/food/snacks/variable/cookie,
		"Donut" = /obj/item/reagent_containers/food/snacks/variable/donut
	)

/obj/item/electronics/circuitboard/oven
	name = "Circuit board (Oven)"
	build_path = /obj/machinery/appliance/cooker/oven
	origin_tech = list(TECH_DATA = 2)
	req_components = list(
		"/obj/item/stock_parts/matter_bin" = 1,
		"/obj/item/stock_parts/capacitor" = 3,
		"/obj/item/stock_parts/scanning_module" = 2)

/obj/machinery/appliance/cooker/oven/update_icon()	//Four icon states, so handled separately from the others.
	if (!open)
		icon_state = "oven[!stat ? "_closed_on" : ""]"
	else
		icon_state = "oven_open[!stat ? "_on" : ""]"

/obj/machinery/appliance/cooker/oven/AltClick(var/mob/user)
	try_toggle_door(user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

/obj/machinery/appliance/cooker/oven/verb/toggle_door()
	set src in oview(1)
	set category = "Object"
	set name = "Open/close oven door"

	try_toggle_door(usr)

/obj/machinery/appliance/cooker/oven/proc/try_toggle_door(mob/user)
//	if(!use_check(user))
//		return
	if(stat)	//Can open or close if it's off.
		to_chat(user, SPAN_NOTICE("You [open ? "close" : "open"] the oven door."))
		open = !open
		playsound(src, 'sound/machines/hatch_open.ogg', 20, 1)
		update_icon()
	else if(!stat && open)	//Can close if it's on
		to_chat(user, SPAN_NOTICE("You close the oven door."))
		open = !open
		playsound(src, 'sound/machines/hatch_open.ogg', 20, 1)
		update_icon()
	else	//Can't open if it's on.
		to_chat(user, SPAN_WARNING("Opening the oven while it's on is probably a bad idea."))

/obj/machinery/appliance/cooker/oven/proc/manip(var/obj/item/I)
	// check if someone's trying to manipulate the machine

	return I.has_quality(QUALITY_SCREW_DRIVING) || I.has_quality(QUALITY_PRYING) || istype(I, /obj/item/storage/part_replacer) || istype(I, /obj/item/stock_parts)

/obj/machinery/appliance/cooker/oven/can_cook(var/obj/item/I, var/mob/user)
	if (!open && !manip(I, user))
		to_chat(user, SPAN_WARNING("You can't put anything in while the door is closed!"))
		return FALSE

	else
		return ..()

/obj/machinery/appliance/cooker/oven/can_remove_items(var/mob/user)
	if(!open)
		to_chat(user, SPAN_WARNING("You can't take anything out while the door is closed!"))
		return FALSE
	return ..()

//Oven has lots of recipes and combine options. The chance for interference is high, so
//If a combine target is set the oven will do it instead of checking recipes
/obj/machinery/appliance/cooker/oven/finish_cooking(var/datum/cooking_item/CI)
	if(CI.combine_target)
		visible_message(SPAN_NOTICE("<b>[src]</b> pings!"))
		combination_cook(CI)
		return
	..()