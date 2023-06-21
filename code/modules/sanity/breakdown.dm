/datum/breakdown
	var/name
	var/datum/sanity/holder

	var/icon_state
	var/breakdown_sound

	var/start_message_span
	var/list/start_messages
	var/list/end_messages

	var/duration = 30 MINUTES //by default
	var/end_time
	var/delay //delay time before it occurs, or updates. it must be used manually.

	var/finished = FALSE //if the objectives were fulfilled.
	var/insight_reward	//Amount of isight for fulfilling the objectives.
	var/is_negative = FALSE

	var/restore_sanity_pre
	var/restore_sanity_post

/datum/breakdown/New(datum/sanity/S)
	..()
	holder = S

/datum/breakdown/Destroy()
	holder = null
	return ..()

/datum/breakdown/proc/can_occur()
	return !!name

/datum/breakdown/proc/update()
	if(finished || (duration && world.time > end_time) || holder.owner.stat == DEAD)
		conclude()
		return FALSE
	return TRUE

/datum/breakdown/proc/init_update()
	if(world.time + duration >= end_time + delay)
		return TRUE
	occur_animation()
	return FALSE

/datum/breakdown/proc/occur_animation()
	var/image/img = image('icons/effects/insanity_statuses.dmi', holder.owner)
	holder.owner << img
	flick(icon_state, img)

/datum/breakdown/proc/occur()
	occur_animation()
	holder.owner.playsound_local(get_turf(holder.owner), breakdown_sound, 100)
	//Occulus Edit Start - Occultists gain madness here
	for(var/mob/living/carbon/human/viewer in view(holder.owner, 7))
		if(viewer.mind)
			if(player_is_antag_id(viewer.mind, ROLE_OCCULTIST))
				var/madnessgain
				if(viewer == holder.owner)
					madnessgain = 1
				else
					madnessgain = 4
				var/obj/item/organ/internal/brain/occultist/B = viewer.random_organ_by_process(BP_BRAIN_CULTIST)
				if(B)
					B.madnesspoints += madnessgain
	//Occulus edit end... for now
	//Occulus edit: Occultist Totems should be able to transmit 1 madness point to the builder if they see a breakdown.
	for(var/obj/machinery/occultist/totem/T in view(holder.owner))
		var/mob/living/carbon/human/crafter = T.maker
		if(crafter.stat == DEAD) //No madness gain on death, though you get it on unconsciousness.
			return
		for(var/obj/item/organ/internal/brain/occultist/B in crafter.contents) //Get the brain from the owner
			if(B) //Check if they still have their brain
				B.madnesspoints ++ //Add one madness
			to_chat(crafter, "Your totem has harvested madness.")
	//Occulus edit: Occultist Totem Remote Gain End
	if(holder.owner.head && istype(holder.owner.head, /obj/item/clothing/head/mindreader))
		var/obj/item/clothing/head/mindreader/MR = holder.owner.head
		MR.extract_memory(holder.owner)
	if(start_messages)
		log_and_message_admins("[holder.owner] is affected by breakdown [name] with duration [duration/10] seconds.")
		to_chat(holder.owner, span(start_message_span, pick(start_messages)))
	if(restore_sanity_pre)
		holder.restoreLevel(restore_sanity_pre)
	if(delay > 0)
		duration += delay
	if(duration == 0)
		conclude()
		return FALSE
	else if(duration > 0)
		end_time = world.time + duration
	return TRUE

/datum/breakdown/proc/conclude()
	if(end_messages)
		log_and_message_admins("[holder.owner] is no longer affected by [name]")
		to_chat(holder.owner,SPAN_NOTICE(pick(end_messages)))
	if(insight_reward)
		// Occulus Edit: Progressive Breakdown
		if(!finished)
			holder.unmanaged_breakdown = TRUE
			to_chat(holder.owner, SPAN_WARNING("A lingering unease settles in your bones. Though the intensity of your craving has subsided, a void unfilled hints at a difficult hour yet to come."))
			addtimer(CALLBACK(holder, .datum/sanity/proc/reset_unmanaged_breakdown, 1 HOUR))
		// Occulus Edit End: Progressive Breakdown
		if(finished)
			// Occulus Edit: Success message on fulfilling your obsession
			to_chat(holder.owner, SPAN_NOTICE("Your yearnings satiated, a vibrant surge of readiness infuses you. The world feels conquerable again, at least for the present moment."))
			// Occulus Edit End
			holder.give_insight(insight_reward)
			if(restore_sanity_post)
				holder.restoreLevel(restore_sanity_post)
		else if(is_negative)
			holder.changeLevel(-rand(20,30))
	else if(restore_sanity_post)
		holder.restoreLevel(restore_sanity_post)
	qdel(src)