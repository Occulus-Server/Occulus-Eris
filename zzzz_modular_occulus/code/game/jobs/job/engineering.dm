/datum/job/chief_engineer
	also_known_languages = list(LANGUAGE_CYRILLIC = 0)
	access = list(
		access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
		access_heads, access_construction, access_sec_doors, access_mailsorting, access_moebius,
		access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload, access_change_engineering
	)
	stat_modifiers = list(
		STAT_MEC = 40,
		STAT_COG = 20,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)

/datum/job/technomancer
	also_known_languages = list(LANGUAGE_CYRILLIC = 0)
	access = list(
		access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_external_airlocks, access_construction, access_atmospherics,
		access_sec_doors, access_mailsorting, access_moebius
	)
	stat_modifiers = list(
		STAT_MEC = 35,
		STAT_COG = 15,
		STAT_TGH = 10
	)