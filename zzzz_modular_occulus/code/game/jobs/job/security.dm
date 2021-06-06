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
	if(prob(50))
		new /obj/item/weapon/storage/backpack/ironhammer(src)
	else
		new /obj/item/weapon/storage/backpack/sport/ironhammer(src)
	new /obj/item/weapon/storage/backpack/satchel/ironhammer(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/weapon/storage/belt/tactical/ironhammer(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/clothing/gloves/security/ironhammer(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/tactical(src)
	new /obj/item/ammo_magazine/ihclrifle/rubber(src)
	new /obj/item/ammo_magazine/ihclrifle/rubber(src)
	new /obj/item/weapon/gun/projectile/automatic/sol(src)
	new /obj/item/ammo_magazine/pistol/rubber(src)
	new /obj/item/ammo_magazine/pistol/rubber(src)
	new	/obj/item/weapon/gun/projectile/paco(src)
	new /obj/item/weapon/storage/pouch/pistol_holster(src)
	new /obj/item/weapon/storage/pouch/baton_holster(src)


/obj/structure/closet/secure_closet/medspec/populate_contents()
	new /obj/item/weapon/gun/energy/gun/martin(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/tactical(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/taperoll/police(src)
	new /obj/item/clothing/under/rank/medspec(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/weapon/storage/belt/tactical/ironhammer(src)
	new /obj/item/clothing/shoes/reinforced/ironhammer(src)
	new /obj/item/clothing/gloves/stungloves(src)
	new /obj/item/weapon/cell/medium/high(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/medspec(src)
	new /obj/item/ammo_magazine/smg/rubber(src)
	new /obj/item/weapon/gun/projectile/automatic/molly(src)
	new /obj/item/weapon/storage/pouch/pistol_holster(src)
	new /obj/item/weapon/storage/briefcase/crimekit(src)
	new /obj/item/weapon/storage/box/autoinjectors/tricordrazine(src)

/obj/structure/closet/secure_closet/detective/populate_contents()
	new /obj/item/clothing/under/rank/det(src)
	new /obj/item/clothing/under/rank/det/black(src)
	new /obj/item/clothing/under/rank/inspector(src)
	new /obj/item/clothing/suit/storage/detective(src)
	new /obj/item/clothing/suit/storage/detective/ironhammer(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/clothing/head/det(src)
	new /obj/item/clothing/head/det/grey(src)
	new /obj/item/clothing/shoes/reinforced/ironhammer(src)
	new /obj/item/weapon/storage/box/evidence(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/weapon/storage/belt/tactical/ironhammer(src)
	new /obj/item/clothing/suit/armor/vest/detective(src)
	new /obj/item/taperoll/police(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/tactical(src)
	new /obj/item/weapon/cell/small/high(src)
	new /obj/item/weapon/cell/small/high(src)
	new /obj/item/device/taperecorder(src)
	new /obj/item/weapon/gun/projectile/revolver/consul(src)
	new /obj/item/clothing/accessory/holster/armpit(src)
	new /obj/item/ammo_magazine/slmagnum/rubber(src)
	new /obj/item/ammo_magazine/slmagnum/rubber(src)
	new /obj/item/ammo_magazine/slmagnum/rubber(src)
	new /obj/item/weapon/storage/pouch/pistol_holster(src)
	new /obj/item/weapon/gun/energy/gun/martin(src)
	new /obj/item/weapon/storage/box/gloves(src)

/obj/structure/closet/secure_closet/warden/populate_contents()
	if(prob(50))
		new /obj/item/weapon/storage/backpack/ironhammer(src)
	else
		new /obj/item/weapon/storage/backpack/sport/ironhammer(src)
	new /obj/item/weapon/storage/backpack/satchel/ironhammer(src)
	new /obj/item/clothing/under/rank/warden(src)
	new /obj/item/clothing/head/beret/sec/navy/warden(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/tactical(src)
	new /obj/item/weapon/storage/belt/tactical/ironhammer(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/clothing/gloves/security/tactical(src)
	new /obj/item/weapon/storage/box/teargas(src)
	new /obj/item/weapon/storage/box/flashbangs(src)
	new /obj/item/ammo_magazine/pistol/rubber(src)
	new /obj/item/ammo_magazine/pistol/rubber(src)
	new	/obj/item/weapon/gun/projectile/paco(src)
	new /obj/item/ammo_magazine/ihclrifle/rubber(src)
	new /obj/item/ammo_magazine/ihclrifle/rubber(src)
	new /obj/item/weapon/gun/projectile/automatic/sol(src)
	new /obj/item/weapon/storage/box/holobadge(src)
	new /obj/item/clothing/accessory/badge/warden(src)
	new /obj/item/weapon/storage/pouch/pistol_holster(src)
	new /obj/item/weapon/storage/pouch/baton_holster(src)
	new /obj/item/clothing/suit/armor/vest/ironhammer(src)
	new /obj/item/weapon/gun/energy/gun/martin(src)

/obj/structure/closet/secure_closet/reinforced/hos/populate_contents()
	new /obj/item/weapon/gun/projectile/lamia(src)
	new /obj/item/weapon/gun/energy/gun/martin(src)
	if(prob(50))
		new /obj/item/weapon/storage/backpack/ironhammer(src)
	else
		new /obj/item/weapon/storage/backpack/sport/ironhammer(src)
	new /obj/item/weapon/storage/backpack/satchel/ironhammer(src)
	new /obj/item/clothing/head/beret/sec/navy/hos(src)
	new /obj/item/clothing/head/HoS(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/clothing/suit/storage/greatcoat/ironhammer(src)
	new /obj/item/clothing/under/rank/ih_commander(src)
	new /obj/item/device/radio/headset/heads/hos(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/tactical(src)
	new /obj/item/weapon/storage/belt/tactical/ironhammer(src)
	new /obj/item/clothing/gloves/stungloves(src)
	new /obj/item/weapon/cell/medium/high(src)
	new /obj/item/ammo_magazine/magnum/rubber(src)
	new /obj/item/ammo_magazine/magnum/rubber(src)
	new /obj/item/ammo_magazine/magnum/rubber(src)
	new /obj/item/weapon/cell/small/high(src)
	new /obj/item/weapon/cell/small/high(src)
	new /obj/item/weapon/gun/energy/gun/martin(src)
	new /obj/item/clothing/accessory/holster/waist(src)
	new /obj/item/weapon/melee/telebaton(src)
	new /obj/item/clothing/accessory/badge/hos(src)
	new /obj/item/weapon/storage/pouch/pistol_holster(src)
	new /obj/item/weapon/storage/pouch/baton_holster(src)