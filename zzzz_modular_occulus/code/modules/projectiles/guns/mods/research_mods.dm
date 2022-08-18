

/obj/item/gun_upgrade/mechanism/overdrive/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = 1.2,
	GUN_UPGRADE_DAMAGE_MULT = 0.20,
	GUN_UPGRADE_AGONY_MULT = 0.2,
	GUN_UPGRADE_FIRE_DELAY_MULT = 0.75,
	GUN_UPGRADE_FULLAUTO = TRUE,
	GUN_UPGRADE_CHARGECOST = 0.15)
	I.req_fuel_cell = REQ_CELL
	I.gun_loc_tag = GUN_MECHANISM