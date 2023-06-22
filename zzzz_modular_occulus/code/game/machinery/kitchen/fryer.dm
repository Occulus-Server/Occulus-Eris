/obj/machinery/appliance/cooker/fryer
	name = "fryer"
	desc = "A deep-fat frying unit. A label on the side warns to not fry cereals. Control-click to turn it on."
	icon_state = "fryer"
	//can_cook_mobs = 1
	cook_type = "deep fried"
	food_color = "#ffad33"
	appliancetype = FRYER
	active_power_usage = 12 KILOWATTS
	heating_power = 12000
	optimal_power = 1.35
	idle_power_usage = 3.6 KILOWATTS
	//Power used to maintain temperature once it's heated.
	//Going with 25% of the active power. This is a somewhat arbitrary value
	resistance = 10000	// Approx. 4 minutes.
	max_contents = 2
	stat = NOPOWER//Starts turned off
	starts_with = list(
		/obj/item/reagent_containers/cooking_container/fryer,
		/obj/item/reagent_containers/cooking_container/fryer
	)

	var/datum/reagents/oil
	var/optimal_oil = 9000//90 litres of cooking oil

	maindamage = 30
	altdamage = 30
	alt_damage_type = OXY
	alt_affected_organ = OP_LUNGS

/obj/item/electronics/circuitboard/cooker/fryer
	name = "Circuit board (Deep-Fryer)"
	build_path = /obj/machinery/appliance/cooker/fryer
	req_components = list(
		"/obj/item/stock_parts/capacitor" = 3,
		"/obj/item/stock_parts/scanning_module" = 1,
		"/obj/item/stock_parts/matter_bin" = 2)

/obj/machinery/appliance/cooker/fryer/examine(var/mob/user)
	. = ..()
	if (.)//no need to duplicate adjacency check
		to_chat(user, "Oil Level: [oil.total_volume]/[optimal_oil]")

/obj/machinery/appliance/cooker/fryer/Initialize()
	. = ..()
	var/oilamount = src.optimal_oil * 1.25
	var/newoil = new /datum/reagent/organic/nutriment/cornoil
	var/variance = rand(0, 0.1)	//Fryer is always a little below full, but its usually negligible
	if (prob(20))				//Sometimes the fryer will start with much less than full oil, significantly impacting efficiency until filled
		variance = rand(0, 0.5)
	oil.add_reagent("cornoil", src.optimal_oil*(1 - variance))

/obj/machinery/appliance/cooker/fryer/Process()
	. = ..()
	//Set temperature of oil, used to be a set temperature proc
	if(!oil.chem_temp == src.temperature)
		oil.chem_temp = src.temperature

/obj/machinery/appliance/cooker/fryer/update_cooking_power()
	..()//In addition to parent temperature calculation
	//Fryer efficiency also drops when oil levels arent optimal
	var/oil_level = oil
	var/datum/reagent/organic/nutriment/cornoil/OL = oil.get_master_reagent()
	if (OL && istype(OL))
		oil_level = oil.reagent_list[OL.type]

	var/oil_efficiency = 0
	if (oil_level)
		oil_efficiency = oil_level / optimal_oil

		if (oil_efficiency > 1)
			//We're above optimal, efficiency goes down as we pass too much over it
			oil_efficiency = 1 - (oil_efficiency - 1)

	cooking_power *= oil_efficiency

/obj/machinery/appliance/cooker/fryer/update_icon()
	. = ..()
	cut_overlays()
	var/counter = 1
	for(var/obj/item/reagent_containers/cooking_container/CC in contents)
		add_overlay(image('zzzz_modular_occulus/icons/obj/machines/kitchen.dmi', "frybasket[counter]"))
		counter++

//Fryer gradually infuses any cooked food with oil. Moar calories
//This causes a slow drop in oil levels, encouraging refill after extended use
/obj/machinery/appliance/cooker/fryer/do_cooking_tick(var/datum/cooking_item/CI)
	if(..() && (CI.oil < CI.max_oil) && prob(20))
		var/datum/reagents/buffer = new /datum/reagents(2)
		oil.trans_to_holder(buffer, min(0.5, CI.max_oil - CI.oil))
		CI.oil += buffer.total_volume
		CI.container.soak_reagent(buffer)

//To solve any odd logic problems with results having oil as part of their compiletime ingredients.
//Upon finishing a recipe the fryer will analyse any oils in the result, and replace them with our oil
//As well as capping the total to the max oil
/obj/machinery/appliance/cooker/fryer/finish_cooking(var/datum/cooking_item/CI)
	..()
	var/total_oil = 0
	var/total_our_oil = 0
	var/total_removed = 0
	var/datum/reagent/our_oil = oil.get_master_reagent()

	for (var/obj/item/I in CI.container)
		if (I.reagents && I.reagents.total_volume)
			for (var/_R in I.reagents.reagent_list)
				if (ispath(_R, /datum/reagent/organic/nutriment/cornoil))
					total_oil += I.reagents.reagent_list[_R]
					if (_R != our_oil.type)
						total_removed += I.reagents.reagent_list[_R]
						I.reagents.remove_reagent(_R, I.reagents.reagent_list[_R])
					else
						total_our_oil += I.reagents.reagent_list[_R]

	if (total_removed > 0 || total_oil != CI.max_oil)
		total_oil = min(total_oil, CI.max_oil)

		if (total_our_oil < total_oil)
			//If we have less than the combined total, then top up from our reservoir
			var/datum/reagents/buffer = new /datum/reagents(INFINITY)
			oil.trans_to_holder(buffer, total_oil - total_our_oil)
			CI.container.soak_reagent(buffer)
		else if (total_our_oil > total_oil)
			//If we have more than the maximum allowed then we delete some.
			//This could only happen if one of the objects spawns with the same type of oil as ours
			var/portion = 1 - (total_oil / total_our_oil) //find the percentage to remove
			for (var/thing in CI.container)
				var/obj/item/I = thing
				if (I.reagents && I.reagents.total_volume)
					for (var/_R in I.reagents.reagent_list)
						if (_R == our_oil.type)
							I.reagents.remove_reagent(_R, I.reagents.reagent_list[_R]*portion)
					I.reagents.set_temperature(T0C + 40 + rand(-5, 5)) // warm, but not hot; avoiding aftereffects of the hot oil

/obj/machinery/appliance/cooker/fryer/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/reagent_containers/glass) && I.reagents)
		if (I.reagents.total_volume <= 0 && oil)
			//Its empty, handle scooping some hot oil out of the fryer
			oil.trans_to(I, I.reagents.maximum_volume)
			user.visible_message("[user] scoops some oil out of [src].", SPAN_NOTICE("You scoop some oil out of [src]."))
			return TRUE
	//It contains stuff, handle pouring any oil into the fryer
	//Possibly in future allow pouring non-oil reagents in, in  order to sabotage it and poison food.
	//That would really require coding some sort of filter or better replacement mechanism first
	//So for now, restrict to oil only
		var/amount = 0
		for (var/_R in I.reagents.reagent_list)
			if (ispath(_R, /datum/reagent/organic/nutriment/cornoil))
				var/delta = oil.maximum_volume - oil.total_volume
				delta = min(delta, I.reagents.reagent_list[_R])
				oil.add_reagent(_R, delta)
				I.reagents.remove_reagent(_R, delta)
				amount += delta
		if (amount > 0)
			user.visible_message("[user] pours some oil into [src].", SPAN_NOTICE("You pour [amount]u of oil into [src]."), SPAN_NOTICE("You hear something viscous being poured into a metal container."))
			return TRUE
	//If neither of the above returned, then call parent as normal
	..()