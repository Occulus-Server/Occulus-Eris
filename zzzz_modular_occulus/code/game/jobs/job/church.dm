/datum/job/chaplain
	stat_modifiers = list(
		STAT_BIO = 35,
		STAT_COG = 10,
		STAT_MEC = 20,
		STAT_ROB = 20,
		STAT_TGH = 15
	)
	also_known_languages = list(LANGUAGE_CYRILLIC = 0)
/datum/job/acolyte
	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_COG = 10,
		STAT_MEC = 10,
		STAT_ROB = 20,
		STAT_TGH = 10
	)
	cruciform_access = list(access_morgue, access_crematorium, access_maint_tunnels, access_hydroponics, access_janitor)
	access = list(access_morgue, access_crematorium, access_maint_tunnels, access_hydroponics, access_janitor)
	also_known_languages = list(LANGUAGE_CYRILLIC = 0)
/datum/job/hydro
	wage = WAGE_LABOUR
	also_known_languages = list(LANGUAGE_JIVE = 0)
	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_COG = 10,
		STAT_ROB = 15,
		STAT_TGH = 10
	)
/datum/job/janitor
	wage = WAGE_LABOUR_HAZARD
	stat_modifiers = list(
		STAT_BIO = 10,
		STAT_COG = 10,
		STAT_MEC = 10,
		STAT_ROB = 20,
		STAT_TGH = 10
	)
	also_known_languages = list(LANGUAGE_CYRILLIC = 0)
