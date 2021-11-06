//Fixes being able to tear holes through the ship with your bare hands.
/datum/statverb/remove_plating/action(mob/user, turf/simulated/floor/target)
	if(target.flooring && target.flooring.flags & TURF_REMOVE_CROWBAR)
		user.visible_message(
			SPAN_DANGER("[user] grabbed the edges of [target] with their hands!"),
			"You grab the edges of [target] with your hands."
		)
		if(do_mob(user, target, target.flooring.removal_time * 3))
			if(target.flooring.flags & TURF_RIPPABLE) //This checks if anything can be ripped. If not, it'll stop at the first nonrippable thing.
				user.visible_message(
				SPAN_DANGER("[user] roughly tore plating off from [target]!"),
				"You tore the plating off from [target]"
			)
				target.make_plating(FALSE)

			else //If it can't be ripped, don't rip it.
				user.visible_message(
					SPAN_DANGER("[user] fails to tear the plating from [target]!"),
					"[target] can't be removed by your bare hands alone!"
					)
		else
			var/target_name = target ? "[target]" : "the floor"
			user.visible_message(
				SPAN_DANGER("[user] stopped tearing the plating off from [target_name]!"),
				"You stop tearing plating off from [target_name]"
			)