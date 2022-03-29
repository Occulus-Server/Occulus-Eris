/obj/item/ore/Crossed(atom/movable/AM) //TGCode for QoL walk over and pick up ore! Adjusted for Eris code in variety of places.
	var/obj/item/storage/bag/ore/OB
	var/turf/simulated/floor/F = get_turf(src)
	if(loc != F)
		return ..()
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		for(var/thing in H.get_body_slots())
			if(istype(thing, /obj/item/storage/bag/ore))
				OB = thing
				break
	else if(isrobot(AM))
		var/mob/living/silicon/robot/R = AM
		for(var/thing in R.get_all_slots())
			if(istype(thing, /obj/item/storage/bag/ore))
				OB = thing
				break
	if(OB && istype(F, /turf/simulated/floor/asteroid))
		OB.collectItems(F, AM)	//Attackby wouldn't work here to pick up the ore from the turf when I did it originally. Using collect items instead.
	return ..()

/datum/craft_recipe/furniture/ore_box
	name = "ore box"
	result = /obj/structure/ore_box
	time = 200
	flags = CRAFT_ON_FLOOR
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_WOOD),
		list(QUALITY_SAWING, 15, 20),
		list(QUALITY_HAMMERING, 15, 20)
	)

