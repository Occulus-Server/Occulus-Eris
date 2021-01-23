/obj/item/clothing/suit/storage/captains_coat
	name = "captain's greatcoat"
	desc = "It's a swanky blue greatcoat with gold epaulettes and trimmings denoting the rank of \"Captain\"."
	icon = 'zzz_modular_syzygy/icons/suit_icons.dmi'
	icon_state = "captains_coat"
	item_state = "captains_coat"
	icon_override = 'zzz_modular_syzygy/icons/mob/suit.dmi'
	icon_override_female = 'zzz_modular_syzygy/icons/mob/suit_fem.dmi'
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
	icon = 'zzz_modular_syzygy/icons/suit_icons.dmi'
	icon_state = "captains_voidsuit"
	item_state = "captains_voidsuit"
	icon_override = 'zzz_modular_syzygy/icons/mob/suit.dmi'
	icon_override_female = 'zzz_modular_syzygy/icons/mob/suit_fem.dmi'
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
