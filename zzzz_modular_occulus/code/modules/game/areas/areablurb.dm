/area

	var/narrate //A text-based description of what this area is for.
	var/list/blurbed_stated_to = list() //This list of names is here to make sure we don't state our descriptive blurb to a person more than once.



/area/proc/do_area_blurb(var/mob/living/L)
	if(isnull(narrate))
		return

	if(L?.get_preference_value(/datum/client_preference/area_info_blurb) != GLOB.PREF_YES)
		return

	if(!(L.ckey in blurbed_stated_to))
		blurbed_stated_to += L.ckey
		to_chat(L, SPAN_NOTICE("[narrate]"))