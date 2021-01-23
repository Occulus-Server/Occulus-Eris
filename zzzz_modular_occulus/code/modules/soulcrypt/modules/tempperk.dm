/datum/soulcrypt_module/perkadder
	name = "perk adder"
	description = "An active module that consumes energy to temporarily grant a perk"
	activation_message = "Perk adder active."
	deactivation_message = "Perk adder inactive."
	activates = TRUE
	uses_energy = TRUE
	has_energy_upkeep = TRUE
	energy_cost = 5
	causes_wear = FALSE	// Enable when we flesh out repair mechanics!
	wear_cause_amount = 0.01
	var/list/perks_to_add = list()

/datum/soulcrypt_module/perkadder/on_install()
	for(var/perk in perks_to_add)
		if(owner.wearer.stats.getPerk(perk))
			owner.send_host_message("<b>[name]:</b> Redundant physiology detected in user. Adjusting parameters...", MESSAGE_NOTICE)
			perks_to_add -= perk
			if(!perks_to_add)
				owner.send_host_message("<b>[name]:</b> No applicable effects to user. Recommend immediate uninstallation.", MESSAGE_WARNING)

/datum/soulcrypt_module/perkadder/perform()
	for(var/perk in perks_to_add)
		owner.wearer.stats.addPerk(perk)

/datum/soulcrypt_module/perkadder/deactivate()
	..()
	for(var/perk in perks_to_add)
		owner.wearer.stats.removePerk(perk)

/datum/soulcrypt_module/perkadder/marketpro
	name = "Synergy ERP"
	description = "An Enterprise Resource Program that analyses objects of interest in realtime, allowing the user to judge the intrinsic value of any item at a glance. Consumes a trivial amount of energy."
	activation_message = "Optical nerve injection site found! Synergistic ERP hook active."
	deactivation_message = "Shutdown signal detected! Disconnecting optical nerve hook."
	energy_cost = 1
	perks_to_add = list(/datum/perk/oddity/market_prof)

/datum/soulcrypt_module/perkadder/celerity
	name = "Celerity v0.91b"
	description = "This program is guaranteed to enhance nervous signalling systems, boosting your regular movement speed! Consumes a steady amount of energy."
	activation_message = "Greetings, beta tester! Nervous system signalling booster engaged."
	deactivation_message = "Thank you, beta tester! Nervous system signalling booster disengaged. Please fill out our survey form when available."
	energy_cost = 6
	wear_cause_amount = 0.02
	perks_to_add = list(/datum/perk/oddity/fast_walker, /datum/perk/oddity/parkour)
