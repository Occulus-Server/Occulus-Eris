// Radsuits - cramming this In here since it's a tiny fix
/obj/item/clothing/head/radiation
	body_parts_covered = HEAD|FACE|EYES
	heat_protection =    HEAD|FACE|EYES
	cold_protection =    HEAD|FACE|EYES

/obj/item/clothing/suit/radiation
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
	heat_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
	cold_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
// Firesuits - Cramming this varedit here for now

/obj/item/clothing/suit/fire
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
	heat_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
	cold_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS

// Engie Armor

/obj/item/clothing/suit/storage/vest/insulated
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
	heat_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
	cold_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS

// Station voidsuits

/obj/item/clothing/head/space/void
	body_parts_covered = HEAD|FACE|EYES
	heat_protection =    HEAD|FACE|EYES
	cold_protection =    HEAD|FACE|EYES

/obj/item/clothing/suit/space/void
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
	heat_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
	cold_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS

//Engineering rig
/obj/item/clothing/head/space/void/engineering
	name = "EES voidsuit helmet"
	armor = list(
		melee = 35,
		bullet = 20,
		energy = 20,
		bomb = 25,
		bio = 100,
		rad = 100
	)

/obj/item/clothing/suit/space/void/engineering
	name = "EES voidsuit"
	armor = list(
		melee = 35,
		bullet = 20,
		energy = 20,
		bomb = 25,
		bio = 100,
		rad = 100
	)

//Mining rig
/obj/item/clothing/head/space/void/mining
	name = "FTU voidsuit helmet"
	armor = list(
		melee = 50,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)

/obj/item/clothing/suit/space/void/mining
	name = "FTU voidsuit"
	slowdown = 0.40
	armor = list(
		melee = 50,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)

//Medical Rig
/obj/item/clothing/head/space/void/medical
	name = "NT medical voidsuit helmet"
	armor = list(
		melee = 30,
		bullet = 10,
		energy = 10,
		bomb = 25,
		bio = 100,
		rad = 75
	)

/obj/item/clothing/suit/space/void/medical
	icon_state = "rig-medical"
	name = "NT medical voidsuit"
	slowdown = 0.15
	armor = list(
		melee = 30,
		bullet = 10,
		energy = 10,
		bomb = 25,
		bio = 100,
		rad = 75
	)

	//Security
/obj/item/clothing/head/space/void/security
	name = "CAS combat voidsuit helmet"
	armor = list(
		melee = 35,
		bullet = 45,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	ear_protection = 1

/obj/item/clothing/suit/space/void/security
	name = "CAS combat voidsuit"
	armor = list(
		melee = 35,
		bullet = 45,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 75
	)

//Science
/obj/item/clothing/head/space/void/science
	name = "NT combat Helmet"
	armor = list(
		melee = 35,
		bullet = 30,
		energy = 45,
		bomb = 100,
		bio = 100,
		rad = 75
	)
	ear_protection = 1

/obj/item/clothing/suit/space/void/science
	name = "NT combat voidsuit"
	armor = list(
		melee = 35,
		bullet = 30,
		energy = 45,
		bomb = 100,
		bio = 100,
		rad = 75
	)

/obj/item/clothing/head/space/void/dss
	name = "deepflare assault voidsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has an additional layer of armor."
	icon = 'zzzz_modular_occulus/icons/inventory/head/icon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/head/mob.dmi'
	icon_state = "dss_helm"
	item_state = "dss_helm"
	item_state_slots = list(
		slot_l_hand_str = "sec_helm",
		slot_r_hand_str = "sec_helm",
		)

	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	siemens_coefficient = 0.7
	ear_protection = 1

/obj/item/clothing/suit/space/void/dss
	name = "deepflare assault voidsuit"
	desc = "A bulky suit that protects against hazardous, low pressure environments. Sacrifices mobility for protection."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/icon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/suit/mob.dmi'
	icon_state = "dss_voidsuit"
	item_state = "dss_voidsuit"
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 8, MATERIAL_STEEL = 5, MATERIAL_GLASS = 5)
	siemens_coefficient = 0.7
	helmet = /obj/item/clothing/head/space/void/dss
	rarity_value = 40

