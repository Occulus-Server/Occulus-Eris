/obj/item/trash/snack_bowl
	name = "bowl"
	desc = "A salad bowl. This one is empty."
/obj/item/trash/snack_bowl/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/material/shard) || istype(W,/obj/item/weapon/reagent_containers/food/snacks))
		var/obj/item/weapon/reagent_containers/food/snacks/csalad/S = new(get_turf(src))
		S.attackby(W,user)
		qdel(src)
	..()

/datum/craft_recipe/bowl
	name = "snack bowl"
	result = /obj/item/trash/snack_bowl
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_GLASS)
	)
	related_stats = list(STAT_COG)

/obj/item/weapon/reagent_containers/food/snacks/csalad
	name = "salad"
	desc = "A cold dish made of various things. Valid."
	icon = 'zzzz_modular_occulus/icons/obj/food.dmi'
	icon_state = "snack_bowl"
	trash = /obj/item/trash/snack_bowl
	bitesize = 2

	var/list/ingredients = list()

/obj/item/weapon/reagent_containers/food/snacks/csalad/attackby(obj/item/W as obj, mob/user as mob)

	var/sandwich_limit = 8 //Higher ingredient limit as salads can't stack bread slices to go higher

	if(src.contents.len > sandwich_limit)
		to_chat(user, "\red The [src] bowl is full!")
		return
	else if(istype(W,/obj/item/weapon/material/shard))
		to_chat(user, SPAN_NOTICE("You hide [W] in \the [src]."))
		user.drop_from_inventory(W, src)
		update()
		return
	else if(istype(W,/obj/item/weapon/reagent_containers/food/snacks))
		to_chat(user, SPAN_NOTICE("You add [W] to \the [src]."))
		var/obj/item/weapon/reagent_containers/F = W
		F.reagents.trans_to_obj(src, F.reagents.total_volume)
		user.drop_from_inventory(W, src)
		ingredients += W
		update_taste(W)//Occulus Edit
		update()
		return
	..()

/obj/item/weapon/reagent_containers/food/snacks/csalad/proc/update()
	var/fullname = "" //We need to build this from the contents of the var.
	var/i = 0

	cut_overlays()

	for(var/obj/item/weapon/reagent_containers/food/snacks/O in ingredients)

		i++
		if(i == 1)
			fullname += "[O.name]"
		else if(i == ingredients.len)
			fullname += " and [O.name]"
		else
			fullname += ", [O.name]"

		var/image/I = new(src.icon, "salad_filling_[i]")
		I.color = O.filling_color
		add_overlays(I)

	name = lowertext("[fullname] salad")
	if(length(name) > 80) name = "[pick(taste_tag)] salad"
	w_class = n_ceil(CLAMP((ingredients.len/2),2,4))

/obj/item/weapon/reagent_containers/food/snacks/csalad/Destroy()
	for(var/obj/item/O in ingredients)
		qdel(O)
	. = ..()

/obj/item/weapon/reagent_containers/food/snacks/csalad/examine(mob/user)
	..(user)
	var/obj/item/O = pick(contents)
	to_chat(user, SPAN_NOTICE("You think you can see [O.name] in there."))

/obj/item/weapon/reagent_containers/food/snacks/csalad/attack(mob/M as mob, mob/user as mob, def_zone)
	var/obj/item/shard
	for(var/obj/item/O in contents)
		if(istype(O,/obj/item/weapon/material/shard))
			shard = O
			break

	var/mob/living/H
	if(isliving(M))
		H = M

	if(H && shard && M == user) //This needs a check for feeding the food to other people, but that could be abusable.
		to_chat(H, SPAN_WARNING("You lacerate your mouth on a [shard.name] in the salad!"))
		H.adjustBruteLoss(5) //TODO: Target head if human.
	..()
