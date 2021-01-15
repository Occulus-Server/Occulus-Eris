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
	base_quantity = 2 //They're a group antag, we want a few of em
	scaling_threshold = 15

/datum/storyevent/wallrot
	enabled = TRUE

/datum/storyevent/roleset/borer
	base_quantity = 1

/datum/storyevent/roleset/traitor
	scaling_threshold = 15

/datum/storyevent/roleset/carrion
	base_quantity = 1

/datum/storyevent/roleset/faction/mercenary
	base_quantity = 2
	scaling_threshold = 10
