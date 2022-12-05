/datum/technology/basic_nonlethal
	unlocks_designs = list(	/datum/design/research/item/flash,
							/datum/design/research/item/holochip/warrant,
							/datum/design/research/item/rubberfrag)


/datum/technology/combatholochips
	name = "Combat Holochips Gunmods"
	desc = "Experimental holochips that can vastly boost the user's capabilities for a time. Use at your own risk."
	tech_type = RESEARCH_COMBAT

	x = 0.8
	y = 0.2
	icon = "holochip"

	required_technologies = list(/datum/technology/adv_exotic_weaponry)
	required_tech_levels = list()
	cost = 1000

	unlocks_designs = list(	/datum/design/research/item/holochip/combat,
							/datum/design/research/item/holochip/tough,
							/datum/design/research/item/holochip/painkiller)


/datum/technology/advanced_armor
	name = "Advanced Armor Solutions"
	desc = "Advanced voidsuit with combined ballistic and ablative plating, and other personal protection."
	tech_type = RESEARCH_COMBAT

	x = 0.8
	y = 0.5
	icon = "moebiushelm"

	required_technologies = list(/datum/technology/laser_weaponry)
	required_tech_levels = list()
	cost = 2500
	unlocks_designs = list(/datum/design/research/item/science_voidsuit,
						   /datum/design/research/item/bastion)

// nanite weapons

/datum/technology/naniteweaponry
	name = "Self Regenerating Nanite Weaponry"
	desc = "State of the art weaponry that regenerates ammunition slowly over time using advanced nanite technology."
	tech_type = RESEARCH_COMBAT

	x = 0.7
	y = 0.2
	icon = "whitenail"

	required_technologies = list(/datum/technology/exotic_weaponry)
	required_tech_levels = list()
	cost = 5000

	unlocks_designs = list(/datum/design/research/item/weapon/whitenail,
						   /datum/design/research/item/weapon/whitenail/whitenailmag,
						   /datum/design/research/item/weapon/whitenail/whitenailmag/rubber,
						   /datum/design/research/item/weapon/blacktalon,
						   /datum/design/research/item/weapon/blacktalon/blacktalonmag,
						   /datum/design/research/item/weapon/blacktalon/blacktalonmag/rubber,
						   /datum/design/research/item/weapon/greyclaw,
						   /datum/design/research/item/weapon/greyclaw/greyclawmag,
						   /datum/design/research/item/weapon/greyclaw/greyclawmag/rubber,
						   )

// Railguns

/datum/technology/railguns
	name = "Hyper Velocity Weaponry"
	desc = "Prototype weaponry that uses electromagnetic propulsion to send projectiles."
	tech_type = RESEARCH_COMBAT

	x = 0.6
	y = 0.7
	icon = "railgun"

	required_technologies = list(/datum/technology/temp)
	required_tech_levels = list(RESEARCH_ENGINEERING = 5, RESEARCH_POWERSTORAGE = 4)
	cost = 6000

	unlocks_designs = list(/datum/design/research/item/weapon/railgun,
							/datum/design/research/item/weapon/gauss
							)

