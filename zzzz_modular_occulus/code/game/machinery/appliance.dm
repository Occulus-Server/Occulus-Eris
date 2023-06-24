// Tracks precooked food to stop deep fried baked grilled grilled grilled diona nymph cereal.
/*
/obj/item/reagent_containers/food/snacks
	var/tmp/list/cooked
*/
//How we track what's being cooked
/datum/cooking_item
	var/max_cookwork = 0
	var/cookwork
	var/overcook_mult = 5
	var/obj/item/reagent_containers/cooking_container/container = list() //Probably throwing errors because no weapon type, should be fixed after port
	var/combine_target = null
	var/burned = FALSE

	var/oil = 0
	var/max_oil = 0//Used for fryers.


/datum/cooking_item/New(var/obj/item/I)
	container = I

//This is called for containers whose contents are ejected without removing the container
/datum/cooking_item/proc/reset()
	max_cookwork = 0
	cookwork = 0
	burned = FALSE
	max_oil = 0
	oil = 0
	combine_target = null
	//Container is not reset

/obj/machinery/appliance
	layer = BELOW_OBJ_LAYER
	density = TRUE
	anchored = TRUE

	use_power = IDLE_POWER_USE
	idle_power_usage = 5
	active_power_usage = 100

	stat = POWEROFF	//Starts turned off

	pass_flags = PASSTABLE	//Occulus Edit, As request by jams
	reagent_flags = OPENCONTAINER | NO_REACT

	icon = 'zzzz_modular_occulus/icons/obj/machines/kitchen.dmi'
	icon_state = "null"

	var/max_contents = 1			// Maximum number of things this appliance can simultaneously cook
	var/on_icon						// Icon state used when cooking.
	var/off_icon					// Icon state used when not cooking.
	var/cooking = FALSE				// Whether or not the machine is currently operating.
	var/cook_type					// A string value used to track what kind of food this machine makes.
	var/cooking_power = 0			// How quickly do things cook in this machine?
	var/food_color					// Colour of resulting food item.
	var/cooked_sound = 'sound/machines/ding.ogg'				// Sound played when cooking completes.
	var/can_burn_food = FALSE		// Can the object burn food that is left inside?
	var/burn_chance = 10			// How likely is the food to burn?
	var/list/cooking_objs = list()	// List of things being cooked
	var/hot = FALSE					// I hate tracking cooking temps, so I won't! Now things are either hot or not hot.
	var/optimal_power
	var/optimal_temp
	var/cooking_coeff
	var/min_temp = 0
	var/temperature = 0
	var/heating_power
	var/resistance
	var/finish_verb
	var/power_verb

	// If the machine has multiple output modes, define them here.
	var/selected_option
	var/list/output_options = list()
	var/list/available_recipes = list()

	var/container_type = null
	var/appliancetype

	var/attackverb = "slam"				//These are for determining what happens if you slam someone into a kitchen appliance.
	var/main_damage_type = BURN			//The proc is kitchen_smackdown
	var/alt_damage_type = BRUTE			//Being slammed into hot objects should cause some of each type of damage
	var/maindamage = 0					//This is basically just the damage being slammed into each thing will do.
	var/altdamage = 0					//The fryer does oxyloss AND burn because your head is being shoved into hot oil, so we need a second damage type. Normally this will be brute, though.
	var/main_affected_organ = BP_HEAD	//This will be the head on every appliance
	var/alt_affected_organ = null		//This basically only exists for the fryer and oven because you're inhaling hot oil/air
	var/starts_with

/obj/machinery/appliance/Initialize()
	.=..()
	//If it is supposed to have many options, add them
	if(output_options.len)
		verbs += /obj/machinery/appliance/proc/choose_output

	if(!src.available_recipes)
		available_recipes = new

	for(var/type in subtypesof(/datum/recipe))	//Assign the proper recipe datums
		var/datum/recipe/test = type
		if(!(test.appliance))					//Get rid of the recipes that do not have any appliances
			continue
		if(src.appliancetype == test.appliance)	//Each recipe intended to be made in the kitchen is gonna need a flag assigning it to a specific machine, no donuts in the grill
			src.available_recipes += new type

/obj/machinery/appliance/Destroy()
	for(var/a in cooking_objs)
		var/datum/cooking_item/CI = a
		qdel(CI.container)//Food is fragile, it probably doesnt survive the destruction of the machine
		cooking_objs -= CI
		qdel(CI)
	return ..()

//Now for the examine code, telling us what's cooking and how cooked it is.
/obj/machinery/appliance/examine(var/mob/user)
	. = ..()
	if(Adjacent(user))
		. += list_contents(user)
	if(!use_power)
		to_chat(user, SPAN_NOTICE("It is switched off."))

/obj/machinery/appliance/proc/list_contents(var/mob/user)
	if(cooking_objs.len)
		var/string = "Contains..."
		for (var/a in cooking_objs)
			var/datum/cooking_item/CI = a
			string += "-\a [CI.container.name], [report_progress(CI)]</br>"
		return string
	else
		to_chat(user, SPAN_NOTICE("It is empty!"))

/obj/machinery/appliance/proc/report_progress(var/datum/cooking_item/CI)
	if(!CI || !CI.max_cookwork)
		return null

	if(!CI.cookwork || CI.cookwork == 0)
		return "It is cold."
	var/progress = CI.cookwork / CI.max_cookwork

	if(progress < 0.25)
		return "It's barely started cooking."
	if(progress < 0.75)
		return SPAN_NOTICE("It's cooking away nicely")
	if(progress < 1)
		return SPAN_NOTICE("It's almost ready!")

	var/half_overcook = (CI.overcook_mult - 1)*0.5
	if(progress < 1 + half_overcook)
		return "It is done!"
	if(progress < CI.overcook_mult)
		return SPAN_WARNING("It looks overcooked, get it out!")
	else
		return SPAN_DANGER("It is burning!")

/obj/machinery/appliance/proc/get_cooking_item_from_container(var/obj/item/reagent_containers/cooking_container/CC)//This will need the same update as the base container line?
	for(var/C in cooking_objs)
		var/datum/cooking_item/CI = C
		if(CI.container == CC)
			return CI

/obj/machinery/appliance/update_icon()
	if(cooking_objs.len)
		icon_state = "[src.name][!stat ? "_on" : ""]"

/obj/machinery/appliance/proc/update_cooking_power()
	if(hot)
		cooking_power = optimal_power
	if(!hot)
		cooking_power = 0

/obj/machinery/appliance/proc/attempt_toggle_power(mob/user)
	stat ^= POWEROFF						//Toggle power
	if(!(stat & POWEROFF))
		if(contents.len)					//If there's anything in there
			for(var/obj/item/reagent_containers/cooking_container/C in contents)
				if(C.contents.len)			//With things in it
					cooking = TRUE			//We want to restart cooking
	if(stat & POWEROFF)
		cooking = FALSE
	use_power = (stat & POWEROFF) ? 0 : 2
	if(user)
		user.visible_message("[user] turns [src] [use_power ? "on" : "off"].", "You turn [use_power ? "on" : "off"] \the [src].")
	playsound(src, 'sound/machines/click.ogg', 40, 1)
	update_icon()

/obj/machinery/appliance/AICtrlClick(mob/user)
	attempt_toggle_power(user)

//Now for cooking stuff.
/obj/machinery/appliance/proc/can_cook(var/obj/item/I, var/mob/user)
	// Maybe allow drowning or slamming grabbed mobs for attack purposes? No cooking them though.
	if(I in typesof(/obj/item/grab))
		//Check intent here, if help
		to_chat(user, SPAN_WARNING("That's not going to fit."))
		return 2

	if (!has_space(I))
		to_chat(user, SPAN_WARNING("There's no room in [src] for that!"))
		return FALSE

	if (istype(I, /obj/item/reagent_containers/cooking_container))
		var/obj/item/reagent_containers/cooking_container/CC = I
		if(CC.appliancetype && appliancetype)
			return TRUE

	// We're trying to cook something else. Check if it's valid.
	var/obj/item/reagent_containers/food/snacks/check = I			//Needs a weapon but should be fine after the PR
	if(istype(check) && LAZYISIN(cook_type,check.cooked))
		to_chat(user, SPAN_WARNING("[check] has already been [cook_type].")) //Prevents 'deep fried deep fried deep fried deep fried baked grilled deep fried baked dionea nymph cereal'
		return FALSE
	else if(istype(I, /obj/item/reagent_containers/glass))			//Needs a weapon but should be fine after the PR
		to_chat(user, SPAN_WARNING("That would probably break [I]."))
		return FALSE
	else if(I.has_quality(QUALITY_SCREW_DRIVING) || I.has_quality(QUALITY_PRYING) || istype(I, /obj/item/storage/part_replacer)) //Needs a weapon but should be fine after PR
		return
	else if(!istype(check) && !istype(I, /obj/item))
		to_chat(user, SPAN_WARNING("That's not edible."))
		return FALSE
	return TRUE

/obj/machinery/appliance/proc/has_space(var/obj/item/I)
	if (length(cooking_objs) >= max_contents)
		return FALSE
	return TRUE

/obj/machinery/appliance/proc/choose_output()
	set src in view()
	set name = "Choose output"
	set category = "Object"

	if(isemptylist(output_options))
		return
	var/choice = input("What specific food do you wish to make with [src]?", "Choose Output") as null|anything in output_options+"Default"
	if(!choice)
		return
	selected_option = (choice == "Default") ? null : choice
	to_chat(usr, SPAN_NOTICE("You decide to make [choice == "Default" ? "nothing specific" : choice] with [src]."))

/obj/machinery/appliance/attackby(var/obj/item/I, var/mob/user)
	if(!cook_type || (stat & (BROKEN)))
		to_chat(user, SPAN_WARNING("[src] is not working."))
		return

	var/result = can_cook(I, user)
	if(result == FALSE)			//Note: Get these to do the proper decon thing
		if(I.has_quality(QUALITY_SCREW_DRIVING))
			return
		else if(I.has_quality(QUALITY_PRYING))
			return
		else if(istype(I, /obj/item/storage/part_replacer))
			return
		return
	/*	Also part of kitchen smackdown, to be reworked while I test the proc.
	if((result == 3) && (user.a_intent == I_HURT))//Grabbing someone and trying to cook them without trying to slam their head against the grill? No slam.
		var/obj/item/grab/G = I
		if (G && istype(G) && G.affecting)
			kitchen_smackdown(src, G.affecting, user, G)
			return
	*/

	//From here we can start cooking food
	add_content(I, user)
	update_icon()

//Okay I lied about the cooking, one more proc.
/*disabled for more testing.
/obj/machinery/appliance/proc/kitchen_smackdown(var/obj/machinery/appliance/surface, var/mob/living/carbon/human/victim, var/mob/user, var/obj/item/grab/G)
	//You need a stronger than passive grab to actually do damage.
	if(G.state == GRAB_PASSIVE)
		to_chat(user, SPAN_WARNING("You fail to [surface.attackverb] [victim] with \the [surface]! You need a better grip!"))
		to_chat(victim, SPAN_WARNING("[user] fails to [surface.attackverb] you with \the [surface]! They need a better grip!"))
		visible_message("[user] fails to [surface.attackverb] [victim] with \the [surface]!")
		return
	else
		to_chat(user, SPAN_DANGER("You [surface.attackverb] [victim] with \the [surface]!"))
		to_chat(victim, SPAN_DANGER("[user] manages to [surface.attackverb] you with \the [surface]!"))
		visible_message("[user] manages to [surface.attackverb] [victim] with \the [surface]!")
		//damage block
		victim.apply_damage(damage = maindamage, damagetype = surface.main_damage_type, main_affected_organ)
		if(hot)		//No heat or boiling air damage if it's off. Just slamming.
			victim.apply_damage(altdamage, surface.alt_damage_type , alt_affected_organ)

		Destroy(G)	//This should be destroyed for balance reasons, don't want people to SLAM over and over again

	//Attack log stuff
		user.attack_log += "\[[time_stamp()]\]<font color='red'> Attacked [victim.name] ([victim.ckey]) with [name] (INTENT: [uppertext(user.a_intent)])</font>"
		victim.attack_log += "\[[time_stamp()]\]<font color='orange'> Attacked by [user.name] ([user.ckey]) against \the [src] (INTENT: [uppertext(user.a_intent)])</font>"
		msg_admin_attack("[user.name] ([user.ckey]) slammed [victim.name] ([victim.ckey]) against \the [src] (INTENT: [uppertext(user.a_intent)]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)") //BS12 EDIT ALG
		return
*/
//Override for container mechanics
/obj/machinery/appliance/proc/add_content(var/obj/item/I, var/mob/user)
	if(I in typesof(/obj/item/grab))
		to_chat(user, SPAN_NOTICE("You can't cook that!"))
		return
		/*	//This is the proc for beating people up with the kitchen equipment but it's not working correctly. Deprecated until I can test it more.
		var/obj/item/grab/newgrab = I
		kitchen_smackdown(src, newgrab.affecting, user, newgrab)
		return
		*/

	if(!user.unEquip(I))
		return

	var/datum/cooking_item/CI = has_space(I)
	if (istype(I, /obj/item/reagent_containers/cooking_container) && CI)
		var/obj/item/reagent_containers/cooking_container/CC = I
		CI = new /datum/cooking_item/(CC)
		I.forceMove(src)
		cooking_objs.Add(CI)
		if(!CC.contents.len)//If we're just putting an empty container in, then dont start any processing.
			user.visible_message("<b>[user]</b> puts [I] into [src].")
			return
	else
		if (CI && istype(CI))
			I.forceMove(CI.container)
			return
		else //Something went wrong/
			return
	// We can actually start cooking now.
	user.visible_message("<b>[user]</b> puts [I] into [src].")
	if(selected_option || length(CI.container.contents) || select_cooking_recipe(CI.container || src, appliance = CI.container.appliancetype)) // we're doing combo cooking, we're not just heating reagents, OR we have a valid reagent-only recipe
		// this is to stop reagents from burning when you're heating stuff
		get_cooking_work(CI)
		if(!(stat & POWEROFF))
			cooking = TRUE

	return CI

//And cooking work proper for actually cooking the food
/obj/machinery/appliance/proc/get_cooking_work(var/datum/cooking_item/CI)
	for (var/obj/item/J in CI.container)
		oilwork(J, CI)

	for (var/obj/item/reagent_containers/food/snacks/S in CI.container.contents)
		for (var/_R in S.reagents.reagent_list)

			if (ispath(_R, /datum/reagent/organic/nutriment))
				CI.max_cookwork += S.reagents.reagent_list[_R].volume * 2//Added reagents contribute less than those in food items due to granular form

				//Nonfat reagents will soak oil
				if (!ispath(_R, /datum/reagent/organic/nutriment/cornoil))
					CI.max_oil += S.reagents.reagent_list[_R].volume * 0.25
			else
				CI.max_cookwork += S.reagents.total_volume
				CI.max_oil += S.reagents.total_volume* 0.10

	for (var/_R in CI.container.reagents.reagent_list)

		if (ispath(_R, /datum/reagent/organic/nutriment))
			CI.max_cookwork += CI.container.reagents.reagent_list[_R].volume * 2//Added reagents contribute less than those in food items due to granular form

			//Nonfat reagents will soak oil
			if (!ispath(_R, /datum/reagent/organic/nutriment/cornoil))
				CI.max_oil += CI.container.reagents.reagent_list[_R].volume * 0.25
		else
			CI.max_cookwork += CI.container.reagents.total_volume
			CI.max_oil += CI.container.reagents.total_volume * 0.10

	//Rescaling cooking work to avoid insanely long times for large things
	var/brackets = CI.max_cookwork / 4
	CI.max_cookwork = 4*(1-0.95**brackets)/0.05


//Just a helper to save code duplication in the above
/obj/machinery/appliance/proc/oilwork(var/obj/item/I, var/datum/cooking_item/CI)
	var/obj/item/reagent_containers/food/snacks/S = I
	var/work = 0
	if (istype(S) && S.reagents)
		for (var/_R in S.reagents.reagent_list)
			if (ispath(_R, /datum/reagent/organic/nutriment))
				work += S.reagents.reagent_list[_R] *3//Core nutrients contribute much more than peripheral chemicals

				//Nonfat reagents will soak oil
				if (!ispath(_R, /datum/reagent/organic/nutriment/cornoil))
					CI.max_oil += S.reagents.reagent_list[_R] * 0.35
			else
				work += S.reagents.reagent_list[_R]
				CI.max_oil += S.reagents.reagent_list[_R] * 0.15


	else if(istype(I, /obj/item/holder))
		var/obj/item/holder/H = I
		var/mob/living/contained = H.contained
		if (contained)
			work += (contained.mob_size * contained.mob_size * 2) + 2

	CI.max_cookwork += work

//Called every tick while we're cooking something
/obj/machinery/appliance/proc/do_cooking_tick(var/datum/cooking_item/CI)
	for(CI in cooking_objs)
		if(!(CI.max_cookwork))
			continue
		var/was_done = (CI.cookwork >= CI.max_cookwork)	//This check being here ensures we always have a little more cookwork than needed just in case.
		CI.cookwork += src.cooking_power
		if(!was_done && CI.cookwork >= CI.max_cookwork)	//If cookwork has gone from above to below 0, then this item finished cooking
			finish_cooking(CI)
		else if(can_burn_food && !CI.burned && CI.cookwork > CI.max_cookwork * CI.overcook_mult)	//If it's overcooked and can burn, it's going to burn.
			burn_food(CI)
	return TRUE

/obj/machinery/appliance/proc/finish_cooking(var/datum/cooking_item/CI)
	audible_message("<b>[src]</b> [finish_verb]")
	if(cooked_sound)
		playsound(get_turf(src), cooked_sound, 50, 1)
	//Check recipes first, a valid recipe overrides other options
	var/datum/recipe/R
	var/atom/C = null
	var/appliance
	if (CI.container && CI.container.appliancetype)
		C = CI.container
		appliance = CI.container.appliancetype
	else if(appliancetype)
		C = src
		appliance = appliancetype
	if(appliance)
		R = select_cooking_recipe(C, appliance = appliance)
	if(R)
		var/list/results = R.cook_food(C)
		var/obj/temp = new /obj(src) //To prevent infinite loops, all results will be moved into a temporary location so they're not considered as inputs for other recipes
		for(var/atom/movable/AM in results)
			AM.forceMove(temp)
		//making multiple copies of a recipe from one container. For example, tons of fries
		while(select_cooking_recipe(C, appliance = appliance) == R)
			var/list/TR = list()
			TR += R.cook_food(C)
			for (var/atom/movable/AM in TR) //Move results to buffer
				AM.forceMove(temp)
			results += TR

		for(var/S in results)
			var/obj/item/reagent_containers/food/snacks/F = S
			F.forceMove(C) //Move everything from the buffer back to the container
			LAZYDISTINCTADD(F.cooked, cook_type)

		QDEL_NULL(temp) //delete buffer object
		. = TRUE //None of the rest of this function is relevant for recipe cooking

	else if(CI.combine_target)
		. = combination_cook(CI)

	else	//Otherwise, we're just doing standard modification cooking. change a color + name
		for (var/obj/item/i in CI.container)
			modify_cook(i, CI)

//Combination cooking involves combining the names and reagents of ingredients into a predefined output object
//The ingredients represent flavours or fillings. EG: donut pizza, cheese bread
/obj/machinery/appliance/proc/combination_cook(var/datum/cooking_item/CI)
	if(!CI.combine_target)
		return
	var/cook_path = output_options[CI.combine_target]

	var/list/tasteflags = list()	//Holds the taste flags to apply to the new cooked item.
	var/list/words = list()
	var/list/cooktypes = list()
	var/datum/reagents/buffer = new /datum/reagents(1000)
	var/totalcolour

	for (var/obj/item/I in CI.container)
		var/obj/item/reagent_containers/food/snacks/N
		N = I
		if(N.taste_tag.len)
			for(var/T in N.taste_tag)
				tasteflags += T

		var/obj/item/reagent_containers/food/snacks/S
		if (istype(I, /obj/item/reagent_containers/food/snacks))
			S = I

		if (!S)
			continue

		words |= splittext(S.name," ")
		cooktypes |= S.cooked

		if (S.reagents && S.reagents.total_volume > 0)
			if (S.filling_color)
				if (!totalcolour || !buffer.total_volume)
					totalcolour = S.filling_color
				else
					var/t = buffer.total_volume + S.reagents.total_volume
					t = buffer.total_volume / y
					totalcolour = BlendRGB(totalcolour, S.filling_color, t)
					//Blend colours in order to find a good filling color


			S.reagents.trans_to_holder(buffer, S.reagents.total_volume)
		//Cleanup these empty husk ingredients now
		if (I)
			qdel(I)
		if (S)
			qdel(S)

	CI.container.reagents.trans_to_holder(buffer, CI.container.reagents.total_volume)

	var/obj/item/reagent_containers/food/snacks/variable/result = new cook_path(CI.container)
	buffer.trans_to(result, buffer.total_volume)

	//Filling overlay
	var/image/I = image(result.icon, "[result.icon_state]_filling")
	I.color = totalcolour
	result.overlays += I
	result.filling_color = totalcolour

	.//Set the name.
	words -= list("and", "the", "in", "is", "bar", "raw", "sticks", "boiled", "fried", "deep", "-o-", "warm", "two", "flavored")
	//Remove common connecting words and unsuitable ones from the list. Unsuitable words include those describing
	//the shape, cooked-ness/temperature or other state of an ingredient which doesn't apply to the finished product
	words.Remove(result.name)
	shuffle(words)
	var/num = 6 //Maximum number of words
	result.name = result.get_name_sans_prefix()
	while (num > 0)
		num--
		if (isemptylist(words))
			break
		//Add prefixes from the ingredients in a random order until we run out or hit limit
		result.name = "[pop(words)] [result.name]"

	//This proc sets the size of the output result
	result.update_prefix()
	//for(var/T in tasteflags)	//Now we set the taste flags of the thing so we can get proper food out of it.
	//	result.tasteflags += T
	//update_taste(result)
	//Final step. Cook function just cooks batter for now.
	for (var/obj/item/reagent_containers/food/snacks/S in CI.container)
		S.cook()
	return result

//Helper proc for standard modification cooking
/obj/machinery/appliance/proc/modify_cook(var/obj/item/input, var/datum/cooking_item/CI)
	var/obj/item/reagent_containers/food/snacks/result
	if (istype(input, /obj/item/reagent_containers/food/snacks))
		result = input
	else		//Nonviable item
		return

	if (!result)
		return

	LAZYDISTINCTADD(result.cooked, cook_type)
	// Set icon and appearance.
	change_product_appearance(result, CI)

	// Update strings.
	change_product_strings(result, CI)

/obj/machinery/appliance/Process()
	if((cooking_power > 0) && cooking)
		for(var/i in cooking_objs)
			do_cooking_tick(i)

/obj/machinery/appliance/proc/burn_food(var/datum/cooking_item/CI)
	// You dun goofed.
	CI.burned = TRUE
	CI.container.clear()
	new /obj/item/reagent_containers/food/snacks/badrecipe(CI.container)

	// Produce nasty smoke.
	visible_message(SPAN_DANGER("[src] vomits a gout of rancid smoke!"))
	var/datum/effect/effect/system/smoke_spread/bad/smoke = new /datum/effect/effect/system/smoke_spread/bad
	smoke.attach(src)
	smoke.set_up(10, 0, get_turf(src), 300)
	smoke.start()

/obj/machinery/appliance/CtrlClick(var/mob/user)
	if(user.stat == DEAD || user.stat == UNCONSCIOUS)
		return
	attempt_toggle_power(user, FALSE)

/obj/machinery/appliance/attack_hand(var/mob/user)
	if(isemptylist(cooking_objs))
		return
	if(removal_menu(user))
		return
	. = ..()

/obj/machinery/appliance/proc/removal_menu(var/mob/user)
	if(!can_remove_items(user))
		return FALSE
	var/list/choices = list()
	var/list/menuoptions = list()
	for(var/a in cooking_objs)
		var/datum/cooking_item/CI = a
		if(CI.container)
			var/current_iteration_len = length(menuoptions) + 1
			menuoptions[CI.container.label(current_iteration_len)] = CI
			var/obj/item/icon_to_use = CI.container
			//var/status = CI
			if(CI.container.contents.len == 1)
				var/obj/item/I = locate() in CI.container.contents
				icon_to_use = I
			choices[CI.container.label(current_iteration_len)] = icon_to_use

	var/selection = show_radial_menu(user, src, choices, require_near = TRUE, tooltips = TRUE)
	if(selection)
		var/datum/cooking_item/CI = menuoptions[selection]
		eject(CI, user)
		//testing block
		for(var/obj/item/reagent_containers/cooking_container/C in contents)
			if(C.contents.len)
				cooking = TRUE
				continue
			cooking = FALSE
		//testing block end
		update_icon()
	return TRUE

/obj/machinery/appliance/proc/can_remove_items(var/mob/user)
	return TRUE

/* TODO: implement once recipes are in
/obj/machinery/appliance/proc/updateMeatName(var/obj/item/I)
	var/cookprogress = I.cookwork / I.max_cookwork
	//The idea here is to put down the ability to make meats uncooked, rare, medium rare, medium, medium well, well done, and burnt.
	if(cookprogress == 0) //Uncooked
	if(cookprogress <= 0.2) //Rare
	if(cookprogress <= 0.4) //Medium rare
	if(cookprogress <= 0.6) //Medium
	if(cookprogress <= 0.8) //Medium well
	if(cookprogress <= 1)	//We ask them poitely, but firmly, to leave
	if(cookprogress > 1)	//burnt
*/

/obj/machinery/appliance/proc/eject(var/datum/cooking_item/CI, var/mob/user = null)
	var/obj/item/thing
	var/delete = TRUE
	var/status = CI.container.contents.len
	if(status == 1)//If theres only one object in a container then we extract that
		thing = locate(/obj/item) in CI.container
		delete = FALSE
	else//If the container is empty OR contains more than one thing, then we must extract the container
		thing = CI.container
		cooking_objs -= CI
	if(!user || !user.put_in_hands(thing))
		thing.forceMove(get_turf(src))
	//Implement once recipes are in
	//if(thing in typesof(/obj/item/reagent_containers/food/snacks/meat) || thing in typesof(/obj/item/reagent_containers/food/snacks/xenomeat))
	//	updateMeatName(thing)
	if(delete)
		qdel(CI)
	else
		CI.reset()//reset instead of deleting if the container is left inside

/obj/machinery/appliance/proc/change_product_strings(var/obj/item/reagent_containers/food/snacks/product, var/datum/cooking_item/CI)
	product.name = "[cook_type] [product.name]"
	product.desc = "[product.desc]\nIt has been [cook_type]."


/obj/machinery/appliance/proc/change_product_appearance(var/obj/item/reagent_containers/food/snacks/product, var/datum/cooking_item/CI)
	if(!product.coating) //Coatings change colour through a new sprite
		product.color = food_color
	product.filling_color = food_color