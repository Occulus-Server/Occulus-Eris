// Occulus overrides for storyteller events go here

/datum/storyevent/hivemind
	tags = list(TAG_COMMUNAL, TAG_DESTRUCTIVE, TAG_NEGATIVE, TAG_SCARY, TAG_ROUNDENDING)
	req_crew = 12	//Makes it so that at least 9 players must be playing in order to spawn
	max_crew_diff_lower = 3

/datum/storyevent/blob
	tags = list(TAG_COMBAT, TAG_DESTRUCTIVE, TAG_NEGATIVE, TAG_ROUNDENDING)
	req_crew = 9
	max_crew_diff_lower = 3

/datum/storyevent/roleset/blitz
	weight = 0
	enabled = FALSE

/datum/storyevent/roleset/faction/excelsior
	req_crew = 12	//Makes it so that at least 9 players must be playing in order to spawn
	max_crew_diff_lower = 3

/datum/storyevent/wallrot
	enabled = TRUE