/datum/job/ihc
	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 30,
		STAT_VIG = 30
	)
/datum/job/inspector
	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_ROB = 15,
		STAT_TGH = 5,
		STAT_VIG = 25
	)
/datum/job/medspec
	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_TGH = 10,
		STAT_VIG = 15
	)
/datum/job/ihoper
	stat_modifiers = list(
		STAT_ROB = 20,
		STAT_TGH = 20,
		STAT_VIG = 20
	)

/decl/hierarchy/outfit/job/security/ihoper
	backpack_contents = list(/obj/item/weapon/handcuffs = 1, /obj/item/device/lighting/toggleable/flashlight/seclite = 1)

/decl/hierarchy/outfit/job/security/medspec
	backpack_contents = list(/obj/item/weapon/cell/small/high = 1)

/decl/hierarchy/outfit/job/security/inspector
	belt = /obj/item/weapon/storage/belt/tactical

/decl/hierarchy/outfit/job/security/gunserg
	backpack_contents = list(/obj/item/weapon/handcuffs = 1, /obj/item/device/lighting/toggleable/flashlight/seclite = 1, /obj/item/weapon/cell/small/high = 2)

/decl/hierarchy/outfit/job/security/ihc
	belt = /obj/item/weapon/storage/belt/tactical

/obj/structure/closet/secure_closet/personal/security/populate_contents()
	new /obj/item/weapon/gun/energy/gun/martin(src)

/obj/structure/closet/secure_closet/medspec/populate_contents()
	new /obj/item/weapon/gun/energy/gun/martin(src)

/obj/structure/closet/secure_closet/detective/populate_contents()
	new /obj/item/weapon/gun/energy/gun/martin(src)

/obj/structure/closet/secure_closet/reinforced/hos/populate_contents()
	new /obj/item/weapon/gun/projectile/lamia(src)
	new /obj/item/weapon/gun/energy/gun/martin(src)