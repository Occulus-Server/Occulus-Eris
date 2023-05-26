/obj/item/gun_upgrade/barrel/diffuser
	name = "MEK \"DIFFUSER\" micro lens"
	desc = "A point of light in the distance."
	icon_state = "Excruciator"
	rarity_value = 50

/obj/item/gun_upgrade/barrel/diffuser/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_MULT = 0.5,
		GUN_UPGRADE_CHARGECOST = 0.5
		)
	I.gun_loc_tag = GUN_BARREL
	I.req_gun_tags = list(GUN_ENERGY)

/datum/design/autolathe/diffuser
	name = "Mekhane \"DIFFUSER\" micro lens"
	build_path = /obj/item/gun_upgrade/barrel/diffuser

/obj/item/gun_upgrade/mechanism/funswitch
	name = "Make Shift \"Fun Switch\" full auto disconnector"
	desc = "The Solar ATF considers this \"fun switch\" to be the galaxy's smallest machine gun, so don't order one online unless you're lonely and really want to hang out with an SATF squad."
	icon_state = "Funswitch"
	rarity_value = 30

/obj/item/gun_upgrade/mechanism/funswitch/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_FULLAUTO = TRUE,	//Makes the Paco able to fire full auto when installed
		GUN_UPGRADE_RECOIL = 3,			//But also makes it horrific to control
		GUN_UPGRADE_DAMAGE_MULT = 0.7	//Reduction in damage, explained by "reduced muzzle velocity due to the breach not fully sealing before the hammer falls again"
	)
	I.gun_loc_tag = GUN_MECHANISM

/obj/item/gun_upgrade/mechanism/magkit
	name = "Frozen Star \"Shotslot\" magazine kit"
	desc = "A kit to allow a gun to be fitted with a magazine. This one is designed for the Regulator and Gladstone shotguns"
	icon_state = "Overshooter"
	rarity_value = 20

/obj/item/gun_upgrade/mechanism/magkit/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_MAGWELL = 1
		)
	I.req_gun_tags = list(GUN_MAGGABLE)
	I.gun_loc_tag = GUN_MECHANISM

/datum/component/item_upgrade/add_values_gun(obj/item/gun/G)
	.=..()	
	if(istype(G, /obj/item/gun/projectile))
		var/obj/item/gun/projectile/P = G
		if(weapon_upgrades[GUN_UPGRADE_MAGWELL])
			P.max_shells = 0
			P.load_method = MAGAZINE
			P.mag_well = MAG_WELL_SMG
			P.magazine_type = /obj/item/ammo_magazine/s5mag
			P.add_firemode(SEMI_AUTO_300)
