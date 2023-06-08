/datum/sanity/proc/onMusic(var/rate)
	if(!rate)
		changeLevel(SANITY_GAIN_MUSIC)
	else
		changeLevel(rate)
	if(resting)
		add_rest(INSIGHT_DESIRE_MUSIC, 0.4)

/datum/sanity/proc/onExercise(var/rate)
	changeLevel(rate)
	if(resting)
		add_rest(INSIGHT_DESIRE_EXERCISE, rate)

/datum/sanity/proc/reset_unmanaged_breakdown()
    to_chat(owner, SPAN_NOTICE("An hour has passed and the storm within has finally stilled. Unfulfilled desires recede into oblivion, and a newfound calm reigns, readying you for whatever comes next."))
    unmanaged_breakdown = FALSE