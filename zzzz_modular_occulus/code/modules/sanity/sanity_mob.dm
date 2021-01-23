/datum/sanity/proc/onMusic()
	changeLevel(SANITY_GAIN_MUSIC)
	if(resting)
		add_rest(INSIGHT_DESIRE_MUSIC, 0.4)

/datum/sanity/proc/onExercise(var/rate)
	changeLevel(rate)
	if(resting)
		add_rest(INSIGHT_DESIRE_EXERCISE, rate)

