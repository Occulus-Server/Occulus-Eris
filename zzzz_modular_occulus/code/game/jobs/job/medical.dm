/datum/job/cmo
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_genetics, access_heads,
		access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
		access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels,
		access_external_airlocks, access_paramedic, access_research_equipment, access_change_medbay, access_maint_tunnels
	)
	stat_modifiers = list(
		STAT_BIO = 50,
		STAT_COG = 30,
		STAT_VIG = 10
	)

/datum/job/doctor
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology,
		access_genetics, access_maint_tunnels
	)
	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_COG = 10,
		STAT_VIG = 10
	)

/datum/job/chemist
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry, access_virology,
		access_genetics, access_maint_tunnels)
	stat_modifiers = list(
		STAT_BIO = 30,
		STAT_COG = 10,
		STAT_MEC = 10,
		STAT_VIG = 10
	)

/datum/job/psychiatrist
	perks = list(/datum/perk/selfmedicated, /datum/perk/oddity/empath)
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_psychiatrist, access_chemistry, access_maint_tunnels
	)
	stat_modifiers = list(
		STAT_BIO = 30,
		STAT_COG = 15,
		STAT_VIG = 15
	)

/datum/job/paramedic
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_paramedic,
		access_eva, access_maint_tunnels, access_external_airlocks, access_chemistry,
		access_sec_doors, access_engine, access_mailsorting
	)
	stat_modifiers = list(
		STAT_BIO = 30,
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)
