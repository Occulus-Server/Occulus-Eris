/*
The mixer subtype is used for  the candymaker and cereal maker. They are similar to cookers but with a few
fundamental differences
1. They have a single container which cant be removed. it will eject multiple contents
2. Items can't be added or removed once the process starts
3. Items are all placed in the same container when added directly
4. They do combining mode only. And will always combine the entire contents of the container into an output
*/

/obj/machinery/appliance/mixer
	name = "stand mixer"
	desc = "A large stand mixer for making lots of... mixed things. It spins in an oddly hypnotic fashion."
	max_contents = 1
	stat = POWEROFF
	cooking_coeff = 0.75
	active_power_usage = 3000
	idle_power_usage = 50
	appliancetype = 0
	icon = 'zzzz_modular_occulus/icons/obj/machines/kitchen.dmi'
	icon_state = "mixer_red"
	starts_with = list(/obj/item/reagent_containers/cooking_container/mixerbowl)
	cook_type = MIX
	//var/accepts_reagents = TRUE			//For use in moving things to/from beakers.
	//var/datum/reagents = list()			//Allows it to hold things but it won't react.

/obj/item/electronics/circuitboard/mixer
	name = "Circuit board (Mixer)"
	build_path = /obj/machinery/appliance/mixer
	origin_tech = list(TECH_DATA = 2)
	req_components = list(
		"/obj/item/stock_parts/matter_bin" = 1,
		"/obj/item/stock_parts/capacitor" = 2,
		"/obj/item/stock_parts/scanning_module" = 1)

/obj/machinery/appliance/mixer/Initialize()
	. = ..()
	cooking_objs = list()
	for(var/cctype in starts_with)
		if (length(cooking_objs) >= max_contents)
			break
		var/obj/item/reagent_containers/cooking_container/CC = new cctype(src)
		var/datum/cooking_item/CI = new /datum/cooking_item/(CC)
		cooking_objs.Add(CI)
	cooking = 0

	update_icon()


/obj/machinery/appliance/mixer/examine(var/mob/user)
	. = ..()
	if(!src in typesof(/obj/machinery/appliance/mixer))
		to_chat(user, SPAN_NOTICE("It is currently set to make a [selected_option]"))

/obj/machinery/appliance/mixer/Initialize()
	. = ..()
	cooking_objs += new /datum/cooking_item(new /obj/item/reagent_containers/cooking_container(src))
	cooking = 0
	selected_option = pick(output_options)
	update_cooking_power()

//Mixers cannot-not do combining mode. So the default option is removed from this. A combine target must be chosen
/*
/obj/machinery/appliance/mixer/choose_output()
	set src in oview(1)
	set name = "Choose output"
	set category = "Object"

//	if (!use_check(usr))
//		return

	if(isemptylist(output_options))
		return
	var/choice = input("What specific food do you wish to make with [src]?") as null|anything in output_options
	if(!choice)
		return
	selected_option = choice
	to_chat(usr, SPAN_NOTICE("You set [src] to make \a [selected_option]."))
	var/datum/cooking_item/CI = cooking_objs[1]
	CI.combine_target = selected_option
*/

/obj/machinery/appliance/mixer/has_space(var/obj/item/I)
	var/datum/cooking_item/CI = cooking_objs[1]
	if (!CI || !CI.container)
		return FALSE

	if (CI.container.can_fit(I))
		return CI

	return FALSE


/obj/machinery/appliance/mixer/can_remove_items(var/mob/user)
	if (stat)
		return ..()
	to_chat(user, SPAN_WARNING("You can't remove ingredients while [src] is turned on! Turn it off first or wait for it to finish."))
	return FALSE

//Container is not removable
/obj/machinery/appliance/mixer/removal_menu(var/mob/user)
	if (!can_remove_items(user))
		return FALSE
	var/list/menuoptions = list()
	for (var/cooking_obj in cooking_objs)
		var/datum/cooking_item/CI = cooking_obj
		if (CI.container?.check_contents() == CONTAINER_EMPTY)
			to_chat(user, "There's nothing in [src] to remove!")
			return
		for (var/thing in CI.container)
			var/obj/item/I = thing
			menuoptions[I.name] = I

	var/selection = show_radial_menu(user, src, menuoptions, require_near = TRUE, tooltips = TRUE)
	if (!selection)
		return FALSE
	var/obj/item/I = menuoptions[selection]
	if (!user?.put_in_hands(I))
		I.forceMove(get_turf(src))
	update_icon()
	return TRUE

/obj/machinery/appliance/mixer/attempt_toggle_power(var/mob/user, ranged = FALSE)
	. = ..()
	if(!use_power)
		return
	for(var/i in cooking_objs)
		var/datum/cooking_item/CI = i
		CI.combine_target = selected_option
	get_cooking_work(cooking_objs[1])

/obj/machinery/appliance/mixer/can_cook(var/obj/item/I, var/mob/user)
	if (!stat)
		to_chat(user, SPAN_WARNING("You can't add items while [src] is running. Wait for it to finish or turn the power off to abort"))
		return FALSE
	return ..()

/obj/machinery/appliance/mixer/finish_cooking(var/datum/cooking_item/CI)
	..()
	stat |= POWEROFF
	playsound(src, 'sound/machines/click.ogg', 40, 1)
	use_power = 0
	CI.reset()
	update_icon()


/obj/machinery/appliance/mixer/update_icon()
	var/string = "[!stat ? "_on" : ""]"
	icon_state = "mixer_red[string]"

/obj/machinery/appliance/mixer/Process()
	if (!stat)
		for (var/i in cooking_objs)
			do_cooking_tick(i)

/*
/obj/machinery/appliance/mixer/verb/reagenttransferstates(var/mob/user)
	set name = "Change Reagent Mode"
	set category = "Object"

	src.reagent_trans_mode = !accepts_reagents	//Toggle reagent mode
	visible_message("[user] sets the [src.name] to [src.accepts_reagents ? "accept" : "remove"] reagents.")
	

/obj/machinery/appliance/mixer/attackby(var/obj/item/I, var/mob/user)
	if(I in typesof(/obj/item/reagent_containers/food/snacks))
		insert

	if(I in typesof(/obj/item/reagent_containers))
		switch(accepts_reagents)
			if(TRUE)
				for(var/datum/reagent/R in I.reagents)
					R.trans_to_holder(src, R.volume)
					to_chat(user, SPAN_NOTICE("You add [R] to \the[src]."))
					return
				
			if(FALSE)	//This is the remove reagents stage, not the "can't put things in" stage
				var/reagentoptions = list()
				var/reagentslisted
				for(var/datum/reagent/R in src.reagents)
					if(R.volume)
						reagentslisted[R.name] += R	//Removal reference later.
						reagentoptions += R.name
				var/datum/reagent/toremove = input(user, "Which reagent would you like to remove?", "Reagent Removal") as null| anything in reagentoptions
				switch(toremove)
					if(null)	//They canceled the action
						return
					if(!null)
						var/transferredreagent = reagentslisted[toremove]
						transferredreagent.trans_to_holder(I, transferredreagent.volume)
						to_chat(user, SPAN_NOTICE("You remove [toremove] from \the [src]."))
						return
	else
		. = ..()



/obj/machinery/appliance/mixer/trans_reagents()
*/