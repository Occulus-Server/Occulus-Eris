/datum/uplink_item/item/tools/spy_sensor
	antag_roles = list(ROLE_TRAITOR) //Removed from Rogue Drone uplink

/datum/uplink_item/item/tools/mind_fryer
	antag_roles = list(ROLE_TRAITOR)//Removed from Rogue Drone uplink

/datum/uplink_item/item/tools/blitz_hp_upgrade
	name = "Armour Augmentation"
	desc = "Augment your chassis to take more blows before destruction."
	item_cost = 4
	antag_roles = list(ROLE_BLITZ)


/datum/uplink_item/item/tools/blitz_hp_upgrade/get_goods(var/obj/item/device/uplink/U, var/loc, var/mob/living/user)
	if(user && istype(user, /mob/living/silicon/robot/drone/blitzshell))
		var/mob/living/silicon/robot/drone/blitzshell/BS = user
		BS.maxHealth += 20
		to_chat(BS, SPAN_NOTICE("Your chassis armour is augmented."))
		return 1
	return 0


/datum/uplink_item/item/tools/blitz_cell_upgrade
	name = "Cell Augmentation"
	desc = "Augment your cell charge, to hold additional energy."
	item_cost = 15
	antag_roles = list(ROLE_BLITZ)


/datum/uplink_item/item/tools/blitz_cell_upgrade/get_goods(var/obj/item/device/uplink/U, var/loc, var/mob/living/user)
	if(user && istype(user, /mob/living/silicon/robot/drone/blitzshell))
		var/mob/living/silicon/robot/drone/blitzshell/BS = user
		var/obj/item/weapon/cell/C = BS.get_cell()
		if(C)
			C.maxcharge *= 1.5
			to_chat(BS, SPAN_NOTICE("Your cell's maximum charge has been augmented."))
		return 1
	return 0

/datum/uplink_item/item/tools/blitz_nanorepair
	name = "Recharge Nanorepair Capsule"
	desc = "Reload your nanorepair system, gaining extra charges."
	antag_roles = list(ROLE_BLITZ)

/datum/uplink_item/item/tools/blitz_smokescreen
	name = "Smoke Upgade"
	desc = "Creates an embedded smoke deployment system."
	item_cost = 8
	antag_roles = list(ROLE_BLITZ)


/datum/uplink_item/item/tools/blitz_smokescharge
	name = "Recharge Smoke Canister"
	desc = "Reload your smoke system, gaining extra charges."
	item_cost = 4
	antag_roles = list(ROLE_BLITZ)


/datum/uplink_item/item/tools/blitz_reinforcements
	name = "Construct Advanced Drone"
	desc = "Build an Advanced Drone, like yourself."
	item_cost = 25
	antag_roles = list(ROLE_BLITZ)


/datum/uplink_item/item/tools/blitz_reinforcements/get_goods(var/obj/item/device/uplink/U, var/loc, var/mob/living/user)
	to_chat(user, SPAN_NOTICE("You construct another advanced drone."))
	spawn(5)
		var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
		sparks.set_up(5, 0, loc)
		sparks.start()
		var/mob/living/silicon/robot/drone/blitzshell/BS = new /mob/living/silicon/robot/drone/blitzshell(loc)
		BS.request_player()
	return 1

/datum/uplink_item/item/tools/neuroinducer
	name = "Jail broken Neuroinducer"
	desc = "This device is will induce a mental breakdown and reduce the targets nerve. Takes a few seconds to apply, and uses medium cells."
	item_cost = 4
	path = /obj/item/device/neuroinducertraitor

/datum/uplink_item/item/stealth_items/jammer
	name = "Subspace Jammer"
	desc = "An older radio hacked apart and modified to create subspace noise. Primarily for blocking subspace communications, preventing the use of headsets and PDAs. Also masks suit sensors."
	item_cost = 5
	path = /obj/item/device/radio_jammer

/datum/uplink_item/item/stealth_items/pickpocket
	name = "Nano-Swift gloves"
	desc = "A intricately crafted set of gloves designed to allow ear pickpocketing."
	item_cost = 1
	path = /obj/item/clothing/gloves/sneak