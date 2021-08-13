#define iseffect(O) (istype(O, /obj/effect))



//Pull/push proc!
/proc/vortex(turf/T, setting_type, range)
	for(var/atom/movable/X in orange(range, T))
		if (X.anchored && iseffect(X))
			continue
		var/distance = get_dist(X, T)
		var/moving_power = max(range - distance, 1)
		if(moving_power > 2) //if the vortex is powerful and we're close, we get thrown
			if(setting_type)
				var/atom/throw_target = get_edge_target_turf(X, get_dir(X, get_step_away(X, T)))
				X.throw_at(throw_target, moving_power, 1)
			else
				X.throw_at(T, moving_power, 1)
		else
			if(setting_type)
				if(step_away(X, T) && moving_power > 1) //Can happen twice at most. So this is fine.
					addtimer(CALLBACK(GLOBAL_PROC, .proc/_step_away, X, T), 2)
			else
				if(step_towards(X, T) && moving_power > 1)
					addtimer(CALLBACK(GLOBAL_PROC, .proc/_step_towards, X, T), 2)

proc/gaseous_reagent_check(var/mob/living/carbon/human/H) //protective clothing check
	return (istype(H.wear_suit, /obj/item/clothing/suit/space) && istype(H.head, /obj/item/clothing/head/space)) \
		|| (istype(H.wear_suit, /obj/item/clothing/suit/bio_suit) && istype(H.head, /obj/item/clothing/head/bio_hood) && H.gloves) \
		|| (H.isSynthetic())

// Called when reagents are removed from a container, most likely after metabolizing in a mob
/datum/reagent/proc/on_remove(var/atom/A)
	return

// Called when a mob dies
/datum/reagent/proc/on_mob_death(var/mob/M)
 	return

 //on transfer to new container, return 1 to allow it to continue
/datum/reagent/proc/on_transfer(var/volume)
	return 1