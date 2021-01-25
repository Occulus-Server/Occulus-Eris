/datum/soulcrypt_module/painkiller
	name = "Painkiller v2.1"
	description = "A module that taps into the user's nervous system to intercept pain signals."
	activates = TRUE
	uses_energy = TRUE
	has_energy_upkeep = FALSE
	energy_cost = 75
	causes_wear = TRUE
	wear_cause_amount = 25
	can_activate_while_incapacitated = TRUE
	has_cooldown = TRUE
	cooldown_delay = 180 SECONDS
	var/pain_reduction = 100

/datum/soulcrypt_module/painkiller/perform()
	owner.wearer.add_chemical_effect(CE_PAINKILLER, pain_reduction)
	owner.wearer.halloss -= 25
	active = FALSE

/datum/soulcrypt_module/painkiller/stat_text()
	return "Kill Pain"
