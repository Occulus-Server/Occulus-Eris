/datum/technology/basic_nonlethal
	unlocks_designs = list(	/datum/design/research/item/flash,
							/datum/design/research/item/holochip/warrant)


/datum/technology/combatholochips
	name = "Combat Holochips Gunmods"
	desc = "Experimental holochips that can vastly boost the user's capabilities for a time. Use at your own risk."
	tech_type = RESEARCH_COMBAT

	x = 0.8
	y = 0.2
	icon = "toxincoater"

	required_technologies = list(/datum/technology/adv_exotic_weaponry)
	required_tech_levels = list()
	cost = 1000

	unlocks_designs = list(	/datum/design/research/item/holochip/combat,
							/datum/design/research/item/holochip/tough,
							/datum/design/research/item/holochip/painkiller)
