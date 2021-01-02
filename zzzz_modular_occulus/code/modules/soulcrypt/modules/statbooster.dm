/datum/soulcrypt_module/statboost
	name = "statboost"
	description = "An active module that consumes energy to boost a stat."
	activation_message = "Statboost active."
	deactivation_message = "Statboost inactive."
	activates = TRUE
	uses_energy = TRUE
	has_energy_upkeep = TRUE
	energy_cost = 5 //all of your standard energy generation
	causes_wear = FALSE	// Enable when we flesh out repair mechanics!
	wear_cause_amount = 0.01
	var/list/stats_to_boost = list()

/datum/soulcrypt_module/statboost/perform()
	for(var/stat in stats_to_boost)
		var/amount = stats_to_boost[stat]
		owner.wearer.stats.changeStat(stat, amount)

/datum/soulcrypt_module/statboost/deactivate()
	..()
	if(owner.wearer) // check if user still exists otherwise we cannot read null.stats
		for(var/stat in stats_to_boost)
			var/amount = stats_to_boost[stat]
			owner.wearer.stats.changeStat(stat, -amount)

/datum/soulcrypt_module/statboost/medical
	name = "AnatomyPro"
	description = "Activates a premium subscription to a neural linked, real-time surgical assistant AI, \
				significantly enhancing one's understanding of biology. Consumes a sustainable amount of energy."
	activation_message = "Premium subscription active! Connection established."
	deactivation_message = "Severing connection to AnatomyPro servers. Thank you for your patronage."
	stats_to_boost = list(STAT_BIO = 20, STAT_COG = 5)

/datum/soulcrypt_module/statboost/science
	name = "Wolfram Analytica"
	description = "Enables direct neural access to an analytical engine, significantly enhancing cognitive abilities. Consumes a sustainable amount of energy."
	activation_message = "Heuristical analysis package activated. WARNING: Cease usage immediately if you begin experiencing headaches."
	deactivation_message = "Shutting down."
	stats_to_boost = list(STAT_COG = 20, STAT_MEC = 5)

/datum/soulcrypt_module/statboost/aegissurvival
	name = "Aegis Survival Optimizer"
	description = "Performs specific biochemical tweaks to one's body, making it slightly more robust in general. Consumes a sustainable amount of energy."
	activation_message = "BOOTING UP... OPTIMIZATIONS APPLIED."
	deactivation_message = "SHUT DOWN SEQUENCE INITIATED... BIOCHEMICAL SIGNALS REVERTING TO NOMINAL LEVELS."
	stats_to_boost = list(STAT_ROB = 5, STAT_TGH = 10, STAT_VIG = 5)

/datum/soulcrypt_module/statboost/aegiscombat	//literally exists here as a star citizen joke
	name = "Aegis Combat Assist"
	description = "Augments one's reflexes to aid in general combat scenarios, mostly improving firearms handling. Consumes an unsustainable amount of energy."
	activation_message = "ACTIVATED"
	deactivation_message = "DISABLED"
	stats_to_boost = list(STAT_VIG = 20, STAT_ROB = 5)
