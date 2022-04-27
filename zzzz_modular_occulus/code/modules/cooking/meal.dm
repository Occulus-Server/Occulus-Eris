//Most of this is the same code as csalads, but with slight changes. Mainly to numbers, partially to how things work.
/obj/item/trash/plate
	name = "plate"
	desc = "A standard plate. This one is empty."

/obj/item/trash/plate/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/material/shard) || istype(W,/obj/item/reagent_containers/food/snacks))
		var/obj/item/reagent_containers/food/snacks/meal/M = new(get_turf(src))
		M.attackby(W,user)
		qdel(src)
	..()

/datum/craft_recipe/plate
	name = "meal"
	result = /obj/item/trash/plate
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_GLASS)
	)
	related_stats = list(STAT_COG)//Same as csalads

/obj/item/reagent_containers/food/snacks/meal
	name = "meal"
	desc = "A collection of food items on a plate. Hope the chef isn't overcharging for this."
	icon = 'zzzz_modular_occulus/icons/obj/food.dmi'
	icon_state = "plate"
	trash = /obj/item/trash/snack_bowl
	bitesize = 2

	var/sandwichlimit = 3 //Lower limit than sandwiches because it's intended to contain more filling food.
	var/list/ingredients = list()

/obj/item/reagent_containers/food/snacks/meal/attackby(obj/item/W as obj, mob/user as mob)
	if(src.contents.len > sandwichlimit)
		to_chat(user, SPAN_WARNING("The [src] plate is full!"))
		return
	if(istype(W, /obj/item/reagent_containers/food/snacks/meal) || istype(W, /obj/item/reagent_containers/food/snacks/csalad)) //Quick check to not make these recursive.
		to_chat(user, SPAN_WARNING("The [src] is too small to hold the [W]!"))
		return
	if(istype(W, /obj/item/material/shard))
		to_chat(user, SPAN_NOTICE("You hide [W] in \the [src]."))
		user.drop_from_inventory(W, src)
		update()
		return
	if(istype(W,/obj/item/reagent_containers/food/snacks))
		to_chat(user, SPAN_NOTICE("You add [W] to \the [src]."))
		var/obj/item/reagent_containers/F = W
		F.reagents.trans_to_obj(src, F.reagents.total_volume)
		user.drop_from_inventory(W, src)
		ingredients += W
		update_taste(W)
		update()
		return
	..()

/obj/item/reagent_containers/food/snacks/meal/proc/update()
	var/fullname = "" //We need to build this from the contents of the var.
	var/i = 0

	cut_overlays()

	for(var/obj/item/reagent_containers/food/snacks/O in ingredients)

		i++
		if(i == 1)
			fullname += "[O.name]"
		else if(i == ingredients.len)
			fullname += " and [O.name]"
		else
			fullname += ", [O.name]"

		var/image/I = new(src.icon, "meal_ing_[i]")
		I.color = O.filling_color
		add_overlays(I)

	name = lowertext("[fullname] plate")
	if(length(name) > 80) name = "garbage plate"
	w_class = n_ceil(CLAMP((ingredients.len/2),2,4))

/obj/item/reagent_containers/food/snacks/meal/Destroy()
	for(var/obj/item/O in ingredients)
		qdel(O)
	. = ..()

/obj/item/reagent_containers/food/snacks/meal/examine(mob/user)
	..(user)
	var/obj/item/O = pick(contents)
	to_chat(user, SPAN_NOTICE("You think you can see [O.name]. Yum."))

/obj/item/reagent_containers/food/snacks/meal/attack(mob/M as mob, mob/user as mob, def_zone)
	var/obj/item/shard
	for(var/obj/item/O in contents)
		if(istype(O,/obj/item/material/shard))
			shard = O
			break

	var/mob/living/H = M

	if(H && shard && M == user) //This needs a check for feeding the food to other people, but that could be abusable.
		to_chat(H, SPAN_WARNING("You lacerate your mouth on a [shard.name] in the meal!"))
		H.adjustBruteLoss(5) //TODO: Target head if human.
	..()
