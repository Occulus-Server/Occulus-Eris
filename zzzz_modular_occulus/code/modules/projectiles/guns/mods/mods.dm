/obj/item/weapon/gun_upgrade/barrel/diffuser
	name = "Frozen Star \"Diffuser\" micro lens"
	desc = "A point of light in the distance."
	icon_state = "Excruciator"
	rarity_value = 50

/obj/item/weapon/gun_upgrade/barrel/diffuser/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_MULT = 0.5,
		GUN_UPGRADE_CHARGECOST = 0.5
		)
	I.gun_loc_tag = GUN_BARREL
	I.req_gun_tags = list(GUN_ENERGY)

