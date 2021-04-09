/obj/item/clothing/suit/storage/captains_coat
	name = "captain's greatcoat"
	desc = "It's a swanky blue greatcoat with gold epaulettes and trimmings denoting the rank of \"Captain\"."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/captain.dmi'
	icon_state = "captains_coat"
	item_state = "captains_coat"
	icon_override = 'zzzz_modular_occulus/icons/mob/suit.dmi'
	icon_override_female = 'zzzz_modular_occulus/icons/mob/suit_fem.dmi'
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(
		melee = 30,
		bullet = 35,
		energy = 30,
		bomb = 15,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.8
	spawn_blacklisted = TRUE	//no random captain shit in maint

/obj/item/clothing/suit/space/void/captain
	name = "captain's voidsuit"
	desc = "A bulky, heavy-duty voidsuit for hazardous, low-pressure environments. Only for the most fashionable of corporate figureheads."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/captain.dmi'
	icon_state = "captains_voidsuit"
	item_state = "captains_voidsuit"
	icon_override = 'zzzz_modular_occulus/icons/inventory/suit/captain.dmi'
	icon_override_female = 'zzzz_modular_occulus/icons/mob/suit_fem.dmi'
	slowdown = 0.3
	armor = list(
		melee = 50,
		bullet = 40,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.7
	helmet = /obj/item/clothing/head/space/capspace
	spawn_blacklisted = TRUE	//no random captain shit in maint

/obj/item/clothing/suit/space/void/captain/equipped
	tank = /obj/item/weapon/tank/jetpack/oxygen
	boots = /obj/item/clothing/shoes/magboots

/obj/item/clothing/suit/storage/toggle/labcoat/cmo
	spawn_blacklisted = TRUE	//no random command shit in maint

/obj/item/clothing/suit/storage/cyberjacket
	name = "crystaljacket"
	desc = "A stylish jacket featuring a proprietary liquid crystal liner that absorbs physical impacts exceptionally well. The liquid crystal layer also serves to provide a neat glow around the collar."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/jacket.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/suit/jacketmob.dmi'
	icon_state = "cyber"
	rarity_value = 6
	armor = list(
		melee = 25,
		bullet = 5,
		energy = 0,
		bomb = 5,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	style = STYLE_HIGH

/obj/item/clothing/suit/storage/cyberjacket/red
	icon_state = "cyber_red"

/obj/item/clothing/suit/storage/cyberjacket/blue
	icon_state = "cyber_blue"

/obj/item/clothing/suit/storage/cyberjacket/green
	icon_state = "cyber_green"

/obj/item/clothing/suit/storage/cyberjacket/black
	icon_state = "cyber_black"

/obj/item/clothing/suit/storage/cyberjacket/white
	icon_state = "cyber_white"

/obj/item/clothing/suit/storage/cyberjacket/punk
	icon_state = "cyber_punk"

/obj/item/clothing/suit/storage/cyberjacket/copper
	icon_state = "cyber_copper"

/obj/item/clothing/suit/storage/solgov
	icon = 'zzzz_modular_occulus/icons/inventory/suit/solgovicon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/suit/solgovmob.dmi'

/obj/item/clothing/suit/storage/solgov/dressnco
	name = "solgov NCO dress unfirom"
	icon_state = "whitedress_snco"
	item_state = "whitedress_snco"

/obj/item/clothing/suit/storage/solgov/wo
	name = "solgov Warrent Officer dress uniform"
	icon_state = "whitedress_wo"
	item_state = "whitedress_wo"

/obj/item/clothing/suit/storage/solgov/ltcdr
	name = "solgov Officer dress uniform"
	icon_state = "whitedress_comm"
	item_state = "whitedress_comm"