/*
/obj/machinery/kitchen
	layer = BELOW_OBJ_LAYER
	density = TRUE
	anchored = TRUE

	use_power = IDLE_POWER_USE
	idle_power_usage = 5
	active_power_usage = 100

	pass_flags = PASSTABLE	//Occulus Edit, As request by jams

	reagent_flags = OPENCONTAINER | NO_REACT


	var/operating = 0 // Is it on?
	var/dirty = 0 // = {0..100} Does it need cleaning?
	var/broken = 0 // ={0,1,2} How broken is it???
	var/dinger = TRUE //so we don't have the campfire dinging
	var/global/list/datum/recipe/available_recipes // List of the recipes you can use
	var/global/list/acceptable_items // List of the items you can put in
	var/global/list/acceptable_reagents // List of the reagents you can put in
	var/global/max_n_of_items = 0

/obj/machinery/kitchen/attackedby(obj/item/I, mob/user)
	//Is it broken?
	if(src.broken > 0)

		var/list/usable_qualities = list()
		if(broken == 2)
			usable_qualities.Add(QUALITY_SCREW_DRIVING)
		if(broken == 1)
			usable_qualities.Add(QUALITY_BOLT_TURNING)


		var/tool_type = I.get_tool_type(user, usable_qualities, src)
		switch(tool_type)

			if(QUALITY_SCREW_DRIVING)
				if(broken == 2)
					user.visible_message( \
						SPAN_NOTICE("\The [user] starts to fix part of the [src]."), \
						SPAN_NOTICE("You start to fix part of the [src].") \
					)
					if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
						user.visible_message( \
							SPAN_NOTICE("\The [user] fixes part of the [src]."), \
							SPAN_NOTICE("You have fixed part of the [src].") \
						)
						src.broken = 1
						return
					return

			if(QUALITY_BOLT_TURNING)
				if(broken == 1)
					user.visible_message( \
						SPAN_NOTICE("\The [user] starts to fix part of the [src]."), \
						SPAN_NOTICE("You start to fix part of the [src].") \
					)
					if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
						user.visible_message( \
							SPAN_NOTICE("\The [user] fixes the [src]."), \
							SPAN_NOTICE("You have fixed the [src].") \
						)
						src.icon_state = "mw"
						src.broken = 0 // Fix it!
						src.dirty = 0 // just to be sure
						src.reagent_flags = OPENCONTAINER
						return
					return

			if(ABORT_CHECK)
				return

	//If we dont fix it with code above - return
		to_chat(user, SPAN_WARNING("It's broken!"))
		return

	//Is it dirty?
	else if(src.dirty==100)
		if(istype(I, /obj/item/weapon/reagent_containers/spray/cleaner) || istype(I, /obj/item/weapon/soap) // If they're trying to clean it then let them
			user.visible_message( \
				SPAN_NOTICE("\The [user] starts to clean the [src]."), \
				SPAN_NOTICE("You start to clean the [src].") \
			)
			if(do_after(user, 20, src))
				user.visible_message( \
					SPAN_NOTICE("\The [user] has cleaned the [src]."), \
					SPAN_NOTICE("You have cleaned the [src].") \
				)
				src.dirty = 0 // It's clean!
				src.broken = 0 // just to be sure
				src.icon_state = "mw"
				src.reagent_flags = OPENCONTAINER
		else //Otherwise bad luck!!
			to_chat(user, SPAN_WARNING("It's dirty!"))
			return 1

	//Can you actually put the thing in?
	else if(is_type_in_list(I,acceptable_items))
		if(length(contents) >= max_n_of_items)
			to_chat(user, SPAN_WARNING("This [src] is full of ingredients, you cannot put more."))
			return 1
		if(istype(I, /obj/item/stack) && I:get_amount() > 1) // This is bad, but I can't think of how to change it
			var/obj/item/stack/S = I
			new I.type (src)
			S.use(1)
			user.visible_message( \
				SPAN_NOTICE("\The [user] has added one of [I] to \the [src]."), \
				SPAN_NOTICE("You add one of [I] to \the [src]."))
			return
		else
			user.drop_item()
			I.loc = src
			user.visible_message( \
				SPAN_NOTICE("\The [user] has added \the [I] to \the [src]."), \
				SPAN_NOTICE("You add \the [I] to \the [src]."))
			return

	else if(istype(I,/obj/item/weapon/reagent_containers/glass) || \
	        istype(I,/obj/item/weapon/reagent_containers/food/drinks) || \
	        istype(I,/obj/item/weapon/reagent_containers/food/condiment) \
		)
		if(!I.reagents)
			return 1
		for (var/datum/reagent/R in I.reagents.reagent_list)
			if(!acceptable_reagents.Find(R.id))
				to_chat(user, SPAN_WARNING("Your [I] contains components unsuitable for cookery."))
				return 1
		return

	if(QUALITY_BOLT_TURNING in I.tool_qualities)
		user.visible_message( \
		"<span class='notice'>\The [user] begins [src.anchored ? "securing" : "unsecuring"] the [src].</span>", \
		"<span class='notice'>You attempt to [src.anchored ? "secure" : "unsecure"] the [src].</span>"
		)
		if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_BOLT_TURNING, FAILCHANCE_EASY,  required_stat = STAT_MEC))
			user.visible_message( \
			"<span class='notice'>\The [user] [src.anchored ? "secures" : "unsecures"] the [src].</span>", \
			"<span class='notice'>You [src.anchored ? "secure" : "unsecure"] the [src].</span>"
			)
			src.anchored = !src.anchored

	if(I in typesof(food) && (!(I in acceptable_items) || !(I in acceptable_reagents)))//Food, but not cookable on the machine
		tochat(user, SPAN_NOTICE("You can't think of something to cook with \the [I] here."))
		return

/obj/machinery/kitchen/interact(mob/user as mob) // The microwave menu, but we need it for every kitchen machine.
	var/dat = ""
	if(src.broken > 0)
		dat = {"<TT>The [src] is broken!</TT>"}
	else if(src.operating)
		dat = {"<TT>Cooking in progress!<BR>Please wait...!</TT>"}
	else if(src.dirty==100)
		dat = {"<TT>This [src] is dirty!<BR>Please clean it before use!</TT>"}
	else
		var/list/items_counts = new
		var/list/items_measures = new
		var/list/items_measures_p = new
		for (var/obj/O in contents)
			var/display_name = O.name
			if(istype(O,/obj/item/weapon/reagent_containers/food/snacks/egg))
				items_measures[display_name] = "egg"
				items_measures_p[display_name] = "eggs"
			if(istype(O,/obj/item/weapon/reagent_containers/food/snacks/tofu))
				items_measures[display_name] = "tofu chunk"
				items_measures_p[display_name] = "tofu chunks"
			if(istype(O,/obj/item/weapon/reagent_containers/food/snacks/meat)) //any meat
				items_measures[display_name] = "slab of meat"
				items_measures_p[display_name] = "slabs of meat"
			if(istype(O,/obj/item/weapon/reagent_containers/food/snacks/donkpocket))
				display_name = "Turnovers"
				items_measures[display_name] = "turnover"
				items_measures_p[display_name] = "turnovers"
			if(istype(O,/obj/item/weapon/reagent_containers/food/snacks/meat/carp))
				items_measures[display_name] = "fillet of meat"
				items_measures_p[display_name] = "fillets of meat"
			items_counts[display_name]++
		for (var/O in items_counts)
			var/N = items_counts[O]
			if(!items_measures.Find(O))
				dat += {"<B>[capitalize(O)]:</B> [N] [lowertext(O)]\s<BR>"}
			else
				if(N == 1)
					dat += {"<B>[capitalize(O)]:</B> [N] [items_measures[O]]<BR>"}
				else
					dat += {"<B>[capitalize(O)]:</B> [N] [items_measures_p[O]]<BR>"}

		for (var/datum/reagent/R in reagents.reagent_list)
			var/display_name = R.name
			if(R.id == "capsaicin")
				display_name = "Hotsauce"
			if(R.id == "frostoil")
				display_name = "Coldsauce"
			dat += {"<B>[display_name]:</B> [R.volume] unit\s<BR>"}

		if(length(items_counts) == 0 && length(reagents.reagent_list) == 0)
			dat = {"<B>The [src] is empty</B><BR>"}
		else
			dat = {"<b>Ingredients:</b><br>[dat]"}
		dat += {"<HR><BR>\
<A href='?src=\ref[src];action=cook'>Cook!!<BR>\
<A href='?src=\ref[src];action=dispose'>Eject ingredients!<BR>\
"}

	user << browse("<HEAD><TITLE>[src] Controls</TITLE></HEAD><TT>[dat]</TT>", "window=[src]")
	onclose(user, "[src]")
	return


//Fryer. Used to make fried foods like tator tots, french fries, fried chicken, etc.
/obj/machinery/kitchen/fryer
	cookingwhitelist =
		meats
		no vegetables
		breads - flat for fried bread, dough balls for doughnuts
		doughs

//Grill. Cooks things you put on it by "grilling", good for sandwiches and meat.
/obj/machinery/kitchen/grill
	cookingwhitelist =
		meats
		vegetables
		breads - grilled bread
		sandwiches

//Stand Mixer. Used to make bread dough.
/obj/machinery/kitchen/mixer
	cookingwhitelist = list(
		/obj/item/weapon/reagent_containers/food/drinks/milk,
		/obj/item/weapon/reagent_containers/food/drinks/soymilk,

	flour
	water
	egg
	cheese
	chocolate
	dough
	meat

/obj/machinery/kitchen/mixer/attackby(mob/user as mob)


//Oven. Used to bake things like bread, donk pockets, meat, veggies, etc...
/obj/machinery/kitchen/oven
	vegetables
	meat
	bread
	dough - bread loaves or buns

/obj/machinery/kitchen/oven/attackby(var/item/I, mob/user as mob)
	var/ingredients
	if(I = pan)
		ingredients = I.contents



//TODO: pizza time
//obj/machinery/kitchen/over/pizza

//Stove. Used to cook things like soups or sauces.
/obj/machinery/kitchen/stove
	soup
	meat
	sandwich
	dough - flatbread
*/