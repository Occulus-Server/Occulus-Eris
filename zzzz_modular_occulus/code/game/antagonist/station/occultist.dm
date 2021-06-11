/datum/antagonist/occultist
	id = ROLE_OCCULTIST
	role_text = "Occultist"
	role_text_plural = "Occultists"
	restricted_jobs = list("AI", "Robot")
	protected_jobs = list("Aegis Gunnery Sergeant","Aegis Inspector", JOBS_COMMAND)
	bantype = ROLE_BANTYPE_OCCULTIST
	welcome_text = "You are an Occultist. You have glimpsed the secrets deep within this vessel and they have driven you to the brink of madness.<br>\
	Your mind is expanding! Drive yourself and others past the brink of insanity to further your knowledge of the true shape of the universe beyond the veil! <br>\
	The others will not understand, they may try and stop you. Do not let them! Even others who have pierced the veil may not be your friends! <br>\
	With enough insight you may choose to induct other members of the crew to your cult... but the process must be voluntary and your powers will terrify many."

	antaghud_indicator = "hudchangeling"


	survive_objective = null

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = -30//We WANT breakdowns
	)


/datum/antagonist/occultist/special_init()
	owner.current.make_occultist()

/datum/antagonist/occultist/can_become_antag(datum/mind/player)
	if(..() && ishuman(player.current))
		var/mob/living/carbon/human/H = player.current
		if(H.isSynthetic())
			return FALSE
		if(H.species.flags & NO_SCAN)
			return FALSE
		return TRUE
	return FALSE

/datum/antagonist/occultist/equip()
	var/mob/living/L = owner.current

	for(var/name in stat_modifiers)
		L.stats.changeStat(name, stat_modifiers[name])

/*Not ready yet
/datum/storyevent/roleset/occultist
	id = "occultist"
	name = "occultist"
	role_id = ROLE_OCCULTIST
	base_quantity = 1
	scaling_threshold = 10
*/