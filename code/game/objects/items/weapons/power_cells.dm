//BIG CELLS - for APC, borgs and machinery.
/obj/item/cell/large
	name = "\"Robustcell 1000L\""  // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable L-standardized power cell. This one is the cheapest you can find."  // Occulus Edit - Remove Eris corp. reference
	icon_state = "b_st"
	maxcharge = CELL_LARGE_BASE_CHARGE//1000
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3)
	price_tag = 200
	spawn_tags = SPAWN_TAG_POWERCELL_LARGE

/obj/item/cell/large/high
	name = "\"Robustcell 5000L\""  // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable L-standardized power cell. The popular and reliable version."  // Occulus Edit - Remove Eris corp. reference
	icon_state = "b_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 5000
	rarity_value = 5.5

/obj/item/cell/large/super
	name = "\"Robustcell 15000L\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable L-standardized power cell. This advanced version can store even more energy." // Occulus Edit - Remove Eris corp. reference
	icon_state = "b_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 15000
	rarity_value = 10

/obj/item/cell/large/hyper
	name = "\"Robustcell-X 20000L\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable L-standardized power cell. Looks like this is a rare and powerful prototype." // Occulus Edit - Remove Eris corp. reference
	icon_state = "b_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 20000
	rarity_value = 22.5

/obj/item/cell/large/moebius
	name = "\"Power-Geyser 2000L\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An experimental rechargeable L-standardized power cell. This one is cheap, yet better than the normal model for same price." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_b_st"
	maxcharge = 2000
	spawn_tags = SPAWN_TAG_POWERCELL_MOEBIUS_LARGE

/obj/item/cell/large/moebius/high
	name = "\"Power-Geyser 7000L\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An experimental rechargeable L-standardized power cell. Popular and reliable version." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_b_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 7000
	rarity_value = 6.5

/obj/item/cell/large/moebius/super
	name = "\"Power-Geyser 13000L\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An experimental L-standardized power cell. This advanced version can store even more energy." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_b_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 13000
	rarity_value = 9

/obj/item/cell/large/moebius/hyper
	name = "\"Power-Geyser 18000L\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An Experimental rechargeable L-standardized power cell. Looks like this is rare and powerful prototype." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_b_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 18000
	rarity_value = 22.5

/obj/item/cell/large/moebius/nuclear
	name = "\"Atomcell 13000L\""
	desc = "An Experimental rechargeable L-standardized power cell. This version able to recharge itself over time."
	icon_state = "meb_b_nu"
	autorecharging = TRUE
	origin_tech = list(TECH_POWER = 6)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3, MATERIAL_URANIUM = 6)
	maxcharge = 13000
	rarity_value = 45

/obj/item/cell/large/excelsior
	name = "\"Zarya 15000\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An Rechargeable L-standardized power cell. Power to the people!" // Occulus Edit - Remove Eris corp. reference
	icon_state = "exs_l"
	origin_tech = list(TECH_POWER = 4)
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTIC = 3)
	maxcharge = 15000
	rarity_value = 32

/obj/item/cell/large/neotheology
	name = "\"Spark 13000L\"" // Occulus Edit - Remove Eris corp. reference
	desc = "Unbranded non-rechargeable L-standardized power cell." // Occulus Edit - Remove Eris corp. reference
	icon_state = "b_nt"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_BIOMATTER = 15)
	maxcharge = 13000
	max_chargerate = 0
	spawn_charged = 1
	spawn_tags = SPAWN_TAG_POWERCELL_NEOTHEOLOGY_LARGE

/obj/item/cell/large/neotheology/plasma
	name = "\"Radiance 20000L\"" // Occulus Edit - Remove Eris corp. reference
	desc = "Unbranded non-rechargeable L-standardized power cell. This advanced version can store even more energy." // Occulus Edit - Remove Eris corp. reference
	icon_state = "b_nt_pl"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_BIOMATTER = 15)
	maxcharge = 20000

//Meme cells - for fun and cancer

/obj/item/cell/large/potato
	name = "potato battery"
	desc = "A rechargable starch based power cell."
	origin_tech = list(TECH_POWER = 1)
	icon = 'icons/obj/power.dmi'
	icon_state = "potato_cell"
	charge = 100
	maxcharge = 300
	minor_fault = 1
	spawn_blacklisted = TRUE

/obj/item/cell/large/slime
	name = "charged slime core"
	desc = "A yellow slime core infused with phoron, it crackles with power."
	origin_tech = list(TECH_POWER = 2, TECH_BIO = 4)
	icon = 'icons/mob/slimes.dmi'
	icon_state = "yellow slime extract"
	maxcharge = 10000
	matter = null
	spawn_blacklisted = TRUE

//MEDIUM CELLS - for energy weapons and large devices

/obj/item/cell/medium
	name = "\"Robustcell 600M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable M-standardized power cell. This one is the cheapest you can find." // Occulus Edit - Remove Eris corp. reference
	icon_state = "m_st"
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 7
	maxcharge = CELL_MEDIUM_BASE_CHARGE//600
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2)
	price_tag = 100
	spawn_tags = SPAWN_TAG_POWERCELL_MEDIUM

/obj/item/cell/medium/high
	name = "\"Robustcell 800M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable M-standardized power cell. Popular and reliable version." // Occulus Edit - Remove Eris corp. reference
	icon_state = "m_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 800
	spawn_tags = SPAWN_TAG_POWERCELL_MEDIUM_IH_AMMO

/obj/item/cell/medium/super
	name = "\"Robustcell 1000M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable M-standardized power cell. This advanced version can store even more energy." // Occulus Edit - Remove Eris corp. reference
	icon_state = "m_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 1000
	rarity_value = 8

/obj/item/cell/medium/hyper
	name = "\"Robustcell-X 1500M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable M-standardized power cell. Looks like this is a rare and powerful prototype." // Occulus Edit - Remove Eris corp. reference
	icon_state = "m_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1500
	rarity_value = 30

/obj/item/cell/medium/moebius
	name = "\"Power-Geyser 700M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An Experimental rechargeable M-standardized power cell. This one is cheap, yet better than the normal model for the same price." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_m_st"
	maxcharge = 700
	spawn_tags = SPAWN_TAG_POWERCELL_MOEBIUS_MEDIUM

/obj/item/cell/medium/moebius/high
	name = "\"Power-Geyser 900M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An Experimental rechargeable M-standardized power cell. Popular and reliable version." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_m_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 900
	rarity_value = 6.5


/obj/item/cell/medium/moebius/super
	name = "\"Power-Geyser 1000M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An experimental rechargeable M-standardized power cell. This advanced version can store even more energy." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_m_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 1000
	rarity_value = 9

/obj/item/cell/medium/moebius/hyper
	name = "\"Power-Geyser 1300M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An experimental rechargeable M-standardized power cell. Looks like this is rare and powerful prototype." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_m_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1300
	rarity_value = 22.5

/obj/item/cell/medium/moebius/nuclear
	name = "\"Atomcell 1000M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An experimental rechargeable M-standardized power cell. This version able to recharge itself over time." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_m_nu"
	autorecharging = TRUE
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_URANIUM = 4)
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1000
	rarity_value = 45

/obj/item/cell/medium/excelsior
	name = "\"Zarya 1000M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable M-standardized power cell. Power to the people!" // Occulus Edit - Remove Eris corp. reference
	icon_state = "exs_m"
	origin_tech = list(TECH_POWER = 4)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTIC = 2)
	maxcharge = 1000
	rarity_value = 27

/obj/item/cell/medium/neotheology
	name = "\"Spark 1000M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "Unbranded non-rechargeable M-standardized power cell." // Occulus Edit - Remove Eris corp. reference
	icon_state = "m_nt"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_BIOMATTER = 10)
	maxcharge = 1000
	max_chargerate = 0
	spawn_charged = 1
	spawn_tags = SPAWN_TAG_POWERCELL_NEOTHEOLOGY_MEDIUM

/obj/item/cell/medium/neotheology/plasma
	name = "\"Radiance 1500M\"" // Occulus Edit - Remove Eris corp. reference
	desc = "Unbranded non-rechargeable M-standardized power cell. This advanced version can store even more energy." // Occulus Edit - Remove Eris corp. reference
	icon_state = "m_nt_pl"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_BIOMATTER = 10)
	maxcharge = 1500

//SMALL CELLS - for small devices, such as flashlights, analyzers and HUDs.
/obj/item/cell/small
	name = "\"Robustcell 100S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable S-standardized power cell. This one is the cheapest you can find." // Occulus Edit - Remove Eris corp. reference
	icon_state = "s_st"
	w_class = ITEM_SIZE_TINY
	force = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 7
	maxcharge = CELL_SMALL_BASE_CHARGE//100
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1)
	price_tag = 50
	spawn_tags = SPAWN_TAG_POWERCELL_SMALL

/obj/item/cell/small/high
	name = "\"Robustcell 200S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable S-standardized power cell. Popular and reliable version." // Occulus Edit - Remove Eris corp. reference
	icon_state = "s_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 200
	rarity_value = 4

/obj/item/cell/small/super
	name = "\"Robustcell 300S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable S-standardized power cell. This advanced version can store even more energy." // Occulus Edit - Remove Eris corp. reference
	icon_state = "s_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 300
	rarity_value = 7

/obj/item/cell/small/hyper
	name = "\"Robustcell-X 500S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable S-standardized power cell. Looks like this is a rare and powerful prototype." // Occulus Edit - Remove Eris corp. reference
	icon_state = "s_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 500
	rarity_value = 20

/obj/item/cell/small/moebius
	name = "NanoTrasen \"Power-Geyser 120S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "NanoTrasen Laboratories branded rechargeable S-standardized power cell. This one is cheap, yet better than Aster model for same price." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_s_st"
	maxcharge = 120
	spawn_tags = SPAWN_TAG_POWERCELL_MOEBIUS_SMALL

/obj/item/cell/small/moebius/high
	name = "\"Power-Geyser 250S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An experimental rechargeable S-standardized power cell. Popular and reliable version." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_s_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 250
	rarity_value = 5

/obj/item/cell/small/moebius/super
	name = "\"Power-Geyser 300S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An experimental rechargeable S-standardized power cell. This advanced version can store even more energy." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_s_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 300
	rarity_value = 6

/obj/item/cell/small/moebius/hyper
	name = "\"Power-Geyser 400S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An experimental rechargeable S-standardized power cell. Looks like this is rare and powerful prototype." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_s_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 400
	rarity_value = 16

/obj/item/cell/small/moebius/nuclear
	name = "\"Atomcell 300S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An experimental rechargeable S-standardized microreactor cell. Recharges itself over time." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_s_nu"
	autorecharging = TRUE
	origin_tech = list(TECH_POWER = 6)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1, MATERIAL_URANIUM = 2)
	maxcharge = 300
	rarity_value = 40

/obj/item/cell/small/moebius/pda
	name = "\"Atomcell 50S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "An experimental branded S-standardized microreactor cell. Recharges itself over time." // Occulus Edit - Remove Eris corp. reference
	icon_state = "meb_pda"
	origin_tech = list(TECH_POWER = 4)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1)
	matter_reagents = list("radium" = 5, "uranium" = 1)
	maxcharge = 50
	// Autorecharge rate is calculated for PDA power consumption: enough to offset it, unless PDA light is on.
	autorecharging = TRUE
	autorecharge_rate = 0.0007
	recharge_time = 1
	spawn_blacklisted = TRUE

/obj/item/cell/small/excelsior
	name = "\"Zarya 250S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "A rechargeable S-standardized power cell. Power to the people!" // Occulus Edit - Remove Eris corp. reference
	icon_state = "exs_s"
	origin_tech = list(TECH_POWER = 4)
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 1)
	maxcharge = 300
	rarity_value = 32

/obj/item/cell/small/neotheology
	name = "\"Spark 300S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "Unbranded branded non-rechargeable S-standardized power cell." // Occulus Edit - Remove Eris corp. reference
	icon_state = "s_nt"
	matter = list(MATERIAL_STEEL = 1, MATERIAL_BIOMATTER = 5)
	maxcharge = 300
	max_chargerate = 0
	spawn_charged = 1
	spawn_tags = SPAWN_TAG_POWERCELL_NEOTHEOLOGY_SMALL

/obj/item/cell/small/neotheology/plasma
	name = "\"Radiance 500S\"" // Occulus Edit - Remove Eris corp. reference
	desc = "Unbranded branded non-rechargeable S-standardized power cell. This advanced version can store even more energy." // Occulus Edit - Remove Eris corp. reference
	icon_state = "s_nt_pl"
	matter = list(MATERIAL_STEEL = 1, MATERIAL_BIOMATTER = 5)
	maxcharge = 500

/obj/item/cell/disposable
	name = "a disposable cell"
	desc = "just steel for this one!"
	icon_state = "s_st"
	w_class = ITEM_SIZE_TINY
	force = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 7
	origin_tech = list(TECH_POWER = 1)
	matter = list(MATERIAL_STEEL = 1)  //some cost just in case you manage to get this in a disk or something
	maxcharge = 100  //small cause if someone manage to get this shouldn't be that usefull. and 100 is a nice number to work with.
	spawn_blacklisted = TRUE

// Infinite cells - intended for debug use only, plus a bit of BSL lore should a player ever get their hands on them. they never run out of charge
// and have the highest capacity in the game

/obj/item/cell/large/moebius/nuclear/infinite
	name = "BSL \"Nullcell 99999L\""
	desc = "Bluespace League branded rechargeable L-standardized power cell. This strange piece of technology has the tag 'Made in Space Finland' on the back. It never seems to run out of charge."
	icon_state = "infinite_b"
	autorecharge_rate = 1 // charges 100% of itself every tick
	bad_type = /obj/item/cell/large/moebius/nuclear/infinite // really shouldn't spawn in maint, or anywhere else
	maxcharge = 99999 // unlimited power! well, not really, but i dont think anything consumed 99999 watts a tick
	matter = list(MATERIAL_PLASMA = 12, MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3, MATERIAL_URANIUM = 12) // might as well give them material values

/obj/item/cell/medium/moebius/nuclear/infinite
	name = "BSL \"Nullcell 9999L\""
	desc = "Bluespace League branded rechargeable M-standardized power cell. This strange piece of technology has the tag 'Made in Space Finland' on the back. It never seems to run out of charge."
	icon_state = "infinite_m"
	autorecharge_rate = 1
	bad_type = /obj/item/cell/medium/moebius/nuclear/infinite
	maxcharge = 9999
	matter = list(MATERIAL_PLASMA = 8, MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_URANIUM = 8)

/obj/item/cell/small/moebius/nuclear/infinite
	name = "BSL \"Nullcell 999L\""
	desc = "Bluespace League branded rechargeable S-standardized power cell. This strange piece of technology has the tag 'Made in Space Finland' on the back. It never seems to run out of charge."
	icon_state = "infinite_s"
	autorecharge_rate = 1
	bad_type = /obj/item/cell/small/moebius/nuclear/infinite
	maxcharge = 999
	matter = list(MATERIAL_PLASMA = 4, MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1, MATERIAL_URANIUM = 4)

//Irremovable cells for exosuit energy weapons

/obj/item/cell/medium/mech
	name = "mech gun electrical component"
	desc = "An electrical component for exosuit energy guns."
	icon_state = "m_st"
	maxcharge = 700
	bad_type = /obj/item/cell/medium/mech
	matter = list()
