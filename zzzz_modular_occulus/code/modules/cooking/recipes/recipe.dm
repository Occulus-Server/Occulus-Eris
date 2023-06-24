/*
 *  Functions you need:
 *  /datum/recipe/proc/make(var/obj/container as obj)
 *    Creates result inside container,
 *    deletes prerequisite reagents,
 *    transfers reagents from prerequisite objects,
 *    deletes all prerequisite objects (even not needed for recipe at the moment).
 *
 *  /proc/select_cooking_recipe(obj/obj as obj, exact = 1, appliance)
 *    Selects the recipe for you based on the appliance and ingredients involved.
 *    obj is a machine (or magic hat) with prerequisites,
 *    exact = 0 forces algorithm to ignore superfluous stuff.
 *Use select_cooking_recipe to avoid stepping on select_recipe's toes.
 *
 *  Functions you do not need to call directly but could:
 *  /datum/recipe/proc/check_reagents(var/datum/reagents/avail_reagents)
 *  /datum/recipe/proc/check_items(var/obj/container as obj)
 *
 * */

/datum/reagents/proc/trans_type_to(var/target, var/rtype, var/amount = 1)
	if (!target)
		return

	//var/datum/reagent/transfering_reagent = rtype

	if (istype(target, /atom))
		var/atom/A = target
		if (!A.reagents || !A.simulated)
			return

	amount = min(amount, REAGENT_VOLUME(src, rtype))

	if(!amount)
		return


	var/datum/reagents/F = new /datum/reagents(amount)
	var/tmpdata = REAGENT_DATA(src, rtype)
	F.add_reagent(rtype, amount, tmpdata)
	remove_reagent(rtype, amount)


	if (istype(target, /atom))
		return F.trans_to(target, amount) // Let this proc check the atom's type
	else if (istype(target, /datum/reagents))
		return F.trans_to_holder(target, amount)


//base Eris /datum/recipe is found in /code/datums/recipe.dm.
//They have base time 100, 1/10th of a second, and the vars: reagents(list), items(list), fruit(list), time (100), and result.
/datum/recipe
	var/display_name
	var/coating = null	//Required coating on all items in the recipe. The default value of null explitly requires no coating
						//A value of -1 is permissive and cares not for any coatings
						//Any typepath indicates a specific coating that should be present
						//Coatings are used for batter, breadcrumbs, beer-batter, colonel's secret coating, etc
	var/result_quantity = 1 //number of instances of result that are created.

	#define RECIPE_REAGENT_REPLACE		0 //Reagents in the ingredients are discarded.
	//Only the reagents present in the result at compiletime are used
	#define RECIPE_REAGENT_MAX			1 //The result will contain the maximum of each reagent present between the two pools. Compiletime result, and sum of ingredients
	#define RECIPE_REAGENT_MIN 			2 //As above, but the minimum, ignoring zero values.
	#define RECIPE_REAGENT_SUM 			3 //The entire quantity of the ingredients are added to the result

	var/reagent_mix = RECIPE_REAGENT_MAX	//How to handle reagent differences between the ingredients and the results

	var/finished_temperature = T0C + 40 //The temperature of the reagents of the final product. Only affects nutrient type.

	var/appliance = MIX	//Which appliances this recipe can be made in.
	//List of defines is in _defines/misc.dm. But for reference they are:
	/*
		MIX (the mixer, or by hand)
		FRYER (the fryer)
		OVEN (the oven)
		SKILLET (the skillet, on the stove)
		SAUCEPAN (the saucepan, on the stove)
		POT (the pot, on the stove)
		PLANCHA (the plancha)
	*/
	//This is a bitfield, more than one type can be used. Connect with | to have more than one option: POT | SAUCEPAN

/datum/recipe/proc/get_appliance_names()
	var/list/appliance_names
	if(appliance & GRILL) // this comes first in the proc because it's the most important - geeves
		LAZYADD(appliance_names, "a grill")
	if(appliance & MIX)
		LAZYADD(appliance_names, "a mixing bowl or plate")
	if(appliance & FRYER)
		LAZYADD(appliance_names, "a fryer")
	if(appliance & OVEN)
		LAZYADD(appliance_names, "an oven")
	if(appliance & SKILLET)
		LAZYADD(appliance_names, "a skillet")
	if(appliance & SAUCEPAN)
		LAZYADD(appliance_names, "a saucepan")
	if(appliance & POT)
		LAZYADD(appliance_names, "a pot")
	return english_list(appliance_names, and_text = " or ")

/datum/recipe/proc/cook_check_reagents(var/datum/reagents/avail_reagents)
	if (!LAZYLEN(reagents))	//If no reagents in the recipe
		return avail_reagents?.total_volume ? COOK_CHECK_EXTRA : COOK_CHECK_EXACT	//If there is a total volume of reagents, they're extra. Otherwise, exactly enough.

	if (!avail_reagents)
		return COOK_CHECK_EXTRA

	. = TRUE
	for (var/r_r in reagents)
		var/aval_r_amnt = avail_reagents.get_reagent_amount(r_r)
		if (aval_r_amnt - reagents[r_r] >= 0)
			if (aval_r_amnt>reagents[r_r])
				. = COOK_CHECK_EXTRA
		else
			return COOK_CHECK_FAIL

	if ((reagents?length(reagents):0) < length(avail_reagents.reagent_list))
		return COOK_CHECK_EXTRA
	return .

/datum/recipe/proc/cook_check_fruit(var/obj/container)
	if (!LAZYLEN(fruit))
		var/obj/item/reagent_containers/food/snacks/grown/G = locate() in container
		return G ? COOK_CHECK_EXTRA : COOK_CHECK_EXACT
	. = COOK_CHECK_EXTRA
	var/list/checklist = fruit.len
	if(checklist)	//Runtime killing
		checklist = fruit.Copy()
	//var/list/checklist = fruit.Copy()
	for(var/obj/item/reagent_containers/food/snacks/S in container)
		var/use_tag
		if(istype(S, /obj/item/reagent_containers/food/snacks/grown))
			var/obj/item/reagent_containers/food/snacks/grown/G = S
			if(!G.seed || !G.seed.kitchen_tag)
				continue
			use_tag = G.dry ? "dried [G.seed.kitchen_tag]" : G.seed.kitchen_tag
/*		else if(istype(S, /obj/item/reagent_containers/food/snacks/fruit_slice))
			var/obj/item/reagent_containers/food/snacks/fruit_slice/FS = S
			if(!FS.seed || !FS.seed.kitchen_tag)
				continue
			use_tag = "[FS.seed.kitchen_tag] slice"*/
		use_tag = "[S.dry ? "dried " : ""][use_tag]"
		if(isnull(checklist[use_tag]))
			continue
		if (check_coating(S))
			checklist[use_tag]--
	for(var/ktag in checklist)
		if(!isnull(checklist[ktag]))
			if(checklist[ktag] < 0)
				. = COOK_CHECK_EXTRA
			else if(checklist[ktag] > 0)
				. = COOK_CHECK_FAIL
				break
	return .

/datum/recipe/proc/cook_check_items(var/obj/container as obj)
	if (!LAZYLEN(items))
		return container?.contents.len ? COOK_CHECK_EXTRA : COOK_CHECK_EXACT
	. = COOK_CHECK_EXACT
	var/list/checklist = items.len
	if(checklist)	//Runtime killing
		checklist = items.Copy()
	for(var/obj/O in container)
		if(istype(O,/obj/item/reagent_containers/food/snacks/grown))
			continue // Fruit is handled in check_fruit().
		var/found = 0
		for(var/i = 1; i < length(checklist)+1; i++)
			var/item_type = checklist[i]
			if (istype(O,item_type))
				if(check_coating(O))
					checklist.Cut(i, i+1)
					found = 1
					break

		if (!found)
			. = COOK_CHECK_EXTRA
		if (!LAZYLEN(checklist) && . != COOK_CHECK_EXTRA)
			return COOK_CHECK_EXTRA//No need to iterate through everything if we know theres at least one extraneous ingredient
	if (length(checklist))
		. = COOK_CHECK_FAIL

	return .


//This is called on individual items within the container.
/datum/recipe/proc/check_coating(var/obj/item/reagent_containers/food/snacks/S)
	if(!istype(S))
		return TRUE//Only snacks can be battered

	if (coating == -1)
		return TRUE //-1 value doesnt care

	return !coating || (S.coating == coating)

//This proc is called under the assumption that the container has already been checked and found to contain the necessary ingredients
/datum/recipe/proc/cook_food(var/obj/container as obj)
	if(!result)
		return
//We will subtract all the ingredients from the container, and transfer their reagents into a holder
//We will not touch things which are not required for this recipe. They will be left behind for the caller
//to decide what to do. They may be used again to make another recipe or discarded, or merged into the results,
//thats no longer the concern of this proc
	var/datum/reagents/buffer = new /datum/reagents(1e12)//

	//Find items we need
	if (LAZYLEN(items))
		for (var/i in items)
			var/obj/item/I = locate(i) in container
			if (I && I.reagents)
				I.reagents.trans_to_holder(buffer,I.reagents.total_volume)
				qdel(I)

	//Find fruits
	if (LAZYLEN(fruit))
		var/list/checklist = list()
		checklist = fruit.Copy()

		for(var/obj/item/reagent_containers/food/snacks/grown/G in container)
			if(!G.seed || !G.seed.kitchen_tag || isnull(checklist[G.seed.kitchen_tag]))
				continue

			if (checklist[G.seed.kitchen_tag] > 0)
				//We found a thing we need
				checklist[G.seed.kitchen_tag]--
				if (G && G.reagents)
					G.reagents.trans_to_holder(buffer,G.reagents.total_volume)
				qdel(G)

	//And lastly deduct necessary quantities of reagents
	if (LAZYLEN(reagents))
		for (var/r in reagents)
			//Doesnt matter whether or not there's enough, we assume that check is done before
			container.reagents.trans_type_to(buffer, r, reagents[r])

	/*
	Now we've removed all the ingredients that were used and we have the buffer containing the total of
	all their reagents.
	If we have multiple results, holder will be used as a buffer to hold reagents for the result objects.
	If, as in the most common case, there is only a single result, then it will just be a reference to
	the single-result's reagents
	*/
	var/datum/reagents/holder = new/datum/reagents(10000000000)
	var/list/results = list()
	for (var/_ in 1 to result_quantity)
		var/obj/result_obj = new result(container)
		results.Add(result_obj)

		if (!result_obj.reagents)//This shouldn't happen
			//If the result somehow has no reagents defined, then create a new holder
			result_obj.create_reagents(buffer.total_volume*1.5)

		if (result_quantity == 1)
			qdel(holder)
			holder = result_obj.reagents
		else
			result_obj.reagents.trans_to_holder(holder, result_obj.reagents.total_volume)


	switch(reagent_mix)
		if (RECIPE_REAGENT_REPLACE)
			//We do no transferring
		if (RECIPE_REAGENT_SUM)
			//Sum is easy, just shove the entire buffer into the result
			buffer.trans_to_holder(holder, buffer.total_volume)
		// TODO: Check code here - Doesn't work
		if (RECIPE_REAGENT_MAX)
			//We want the highest of each.
			//Iterate through everything in buffer. If the target has less than the buffer, then top it up
			for (var/_R in buffer.reagent_list)
				var/rvol = REAGENT_VOLUME(holder, _R)
				var/bvol = REAGENT_VOLUME(buffer, _R)
				if (rvol < bvol)
					//Transfer the difference
					buffer.trans_type_to(holder, _R, bvol-rvol)
		// TODO: Check code here - Doesn't work
		if (RECIPE_REAGENT_MIN)
			//Min is slightly more complex. We want the result to have the lowest from each side
			//But zero will not count. Where a side has zero its ignored and the side with a nonzero value is used
			for (var/_R in buffer.reagent_list)
				var/rvol = REAGENT_VOLUME(holder, _R)
				var/bvol = REAGENT_VOLUME(buffer, _R)
				if (rvol == 0) //If the target has zero of this reagent
					buffer.trans_type_to(holder, _R, bvol)
					//Then transfer all of ours

				else if (rvol > bvol)
					//if the target has more than ours
					//Remove the difference
					holder.remove_reagent(_R, rvol-bvol)


	if (length(results) > 1)
		//If we're here, then holder is a buffer containing the total reagents for all the results.
		//So now we redistribute it among them
		var/total = holder.total_volume
		for (var/i in results)
			var/atom/a = i //optimisation
			holder.trans_to(a, total / length(results))

	return results

//The following is used for sorting recipes by complexity for recipe selection.
/proc/cmp_recipe_complexity_dsc(datum/recipe/A, datum/recipe/B)
	var/a_score = LAZYLEN(A.items) + LAZYLEN(A.reagents) + LAZYLEN(A.fruit)
	var/b_score = LAZYLEN(B.items) + LAZYLEN(B.reagents) + LAZYLEN(B.fruit)
	return b_score - a_score

//When exact is false, extraneous ingredients are ignored
//When exact is true, extraneous ingredients will fail the recipe
//In both cases, the full complement of required inredients is still needed
//This is dumb. 
//Basically this proc checks for if the recipe fits the appliance, then if there aren't too few reagents, ingredients, and fruit. 
/proc/select_cooking_recipe(var/obj/obj as obj, var/exact = COOK_CHECK_EXTRA, var/appliance = null)
	if(!appliance)
		crash_with("Null appliance flag passed to select_cooking_recipe!")
	var/list/recipelist = list()
	for(var/D in subtypesof(/datum/recipe))
		var/toadd = new D
		recipelist += toadd
		qdel(D)
	var/list/possible_recipes = list()
	for (var/R in recipelist)
		var/datum/recipe/recipe = pick_n_take(recipelist)
		if(!(appliance & recipe.appliance))
			continue
		if((recipe.cook_check_reagents(obj.reagents) < exact) || (recipe.cook_check_items(obj) < exact) || (recipe.cook_check_fruit(obj) < exact))
			continue
		//if(!(recipe in possible_recipes))
		possible_recipes += recipe
	if (!LAZYLEN(possible_recipes))
		return null
	sortTim(possible_recipes, cmp = /proc/cmp_recipe_complexity_dsc) // Select the most complex recipe
	//testing block
	var/result = possible_recipes[1]
	return result
	//testing block end
	//return possible_recipes[1]

//Please only ever call this inside a cooking proc as it relies on other checks such as if it can create a valid recipe.
//This assumes that we already have all the required objects in the container because it comes after a select_recipe check
//Use this proc where you would use make_food but want to have reagents left over afterwards.
//The entire purpose of this proc is because base Eris make_food just deletes every reagent involved in the recipe at once and only outputs one thing. OK for microwaves, bad for literally anything else
/datum/recipe/proc/batch_bake(var/obj/container as obj)
	if(!result)
		crash_with("Recipe tried to batch bake without a result.")
		return
		//note: basically check the container for appropriate reagents/items/fruit and then sequentially remove them
	var/obj/result_obj = new result(container)	//we have enough for at least one result
	if(LAZYLEN(reagents))						//First check and remove reagents
		for(var/datum/reagent/R in reagents)
			var/amt_to_remove = reagents[R.id]
			container.reagents.remove_reagent(R.id, amt_to_remove)
			message_admins("removed [amt_to_remove] of [R.id] from [container]")
			container.reagents.update_total()
	if(LAZYLEN(items))							//Then check and remove items
		var/list/item_checklist = list()
		item_checklist = items.Copy()
		for(var/obj/item/reagent_containers/food/snacks/I in container.contents)	//Run though all items in the container and check them against the item checklist, removing them from the checklist if found
			if(I in item_checklist && !(istype(I, /obj/item/reagent_containers/food/snacks/grown)) && item_checklist.len)
				item_checklist -= I
				qdel(I)
	if(LAZYLEN(fruit))							//Do the same thing with fruits
		var/list/fruit_checklist = list()
		fruit_checklist = fruit.Copy()
		for(var/obj/item/reagent_containers/food/snacks/grown/F in container.contents)
			if(F.seed.kitchen_tag in fruit && fruit_checklist[F.seed.kitchen_tag] > 0)	//Once we hit zero in an item in fruit_checklist we have enough fruit of that kind
				fruit_checklist[F.seed.kitchen_tag]--	//Fruits are stored as "kitchen_tag" = X, so subtract one
				qdel(F)									//then kill it
	return result_obj