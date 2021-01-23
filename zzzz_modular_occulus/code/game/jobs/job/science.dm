/datum/job/scientist
	stat_modifiers = list(
		STAT_MEC = 10,
		STAT_COG = 30,
		STAT_BIO = 20
	)
	access = list(
		access_robotics, access_tox, access_tox_storage, access_moebius, access_xenobiology, access_xenoarch, access_research_equipment,
		access_genetics, access_maint_tunnels
	)


/datum/job/roboticist
	stat_modifiers = list(
		STAT_MEC = 25,
		STAT_COG = 10,
		STAT_BIO = 25
	)
	access = list(
		access_robotics, access_tox, access_tox_storage, access_morgue, access_moebius, access_research_equipment, access_maint_tunnels
	)

/datum/job/rd
	access = list(
		access_rd, access_heads, access_tox, access_genetics, access_morgue,
		access_tox_storage, access_teleporter, access_sec_doors,
		access_moebius, access_medical_equip, access_chemistry, access_virology, access_surgery, access_psychiatrist,
		access_robotics, access_xenobiology, access_ai_upload, access_tech_storage, access_eva, access_external_airlocks,
		access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_research_equipment,
		access_change_research, access_maint_tunnels
	)
