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

