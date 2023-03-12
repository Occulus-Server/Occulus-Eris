/obj/item/clothing/head/armor
	ear_protection = 1

/obj/item/clothing/head/armor/bulletproof/ironhammer_nvg
	spawn_blacklisted = TRUE

/obj/item/clothing/head/hardhat/visor/ees
	name = "\improper EES hardhat"
	desc = "An advanced hardhat incorporating the latest lightweight alloys available, and featuring an integrated electrochromic visor. Produced exclusively for Einstein Engineering Solutions."
	icon = 'zzzz_modular_occulus/icons/inventory/head/icon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/head/mob.dmi'
	icon_state = "advhardhat"
	armor = list(
		melee = 30,
		bullet = 15,
		energy = 35,
		bomb = 30,
		bio = 15,
		rad = 30
	)//Mix between hardhats and the insulated helmets
	body_parts_covered = HEAD|EARS|EYES
	flash_protection = FLASH_PROTECTION_MAJOR
	item_flags = STOPPRESSUREDAMAGE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	price_tag = 600
	rarity_value = 60
	style = STYLE_NEG_LOW //30 armor = negative style

/obj/item/clothing/head/beret/engineering/ees
	name = "\improper EES beret"
	desc = "A stylish beret in Einstein Engineering Solution's colors. Comes with a radiation-resistant lining."
	icon = 'zzzz_modular_occulus/icons/inventory/head/icon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/head/mob.dmi'
	icon_state = "ees"
	spawn_blacklisted = TRUE
	armor = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 10
	)

/obj/item/clothing/head/armor/faceshield/riot/blueshield
	name = "\improper Guardian Tactical Helmet"
	desc = "It's a helmet specifically designed to retain visual acuity with the visor down. Typically used by bodyguards escorting their clients."
	icon = 'zzzz_modular_occulus/icons/inventory/head/icon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/head/mob.dmi'
	icon_state = "blueshield_helm"
	armor_up = list(melee = 35, bullet = 25, energy = 20, bomb = 20, bio = 0, rad = 0)
	armor_down = list(melee = 40, bullet = 40, energy = 35, bomb = 35, bio = 0, rad = 0)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	tint_down = TINT_NONE
	price_tag = 200
	rarity_value = 30
