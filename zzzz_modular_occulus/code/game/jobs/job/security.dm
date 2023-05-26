/datum/job/ihc
	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 30,
		STAT_VIG = 30
	)
/datum/job/inspector
	total_positions = 1
	spawn_positions = 1
	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_COG = 10,
		STAT_ROB = 10,
		STAT_TGH = 5,
		STAT_VIG = 25
	)
/datum/job/medspec
	access = list(
		access_security, access_brig, access_moebius, access_sec_doors, access_medspec, access_morgue,
		access_maint_tunnels, access_medical_equip, access_engine, access_mailsorting, access_external_airlocks, access_eva
	)
	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_COG = 5,
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_VIG = 20

	)
	description = "You are a highly trained medical specialist within Aegis. You thusly have a combination of medical and military training. You are not quite as knowledgeable as a civilian career doctor, not quite as much of a fighter as a dedicated Aegis operative.<br>\
	<br>\
	Within Aegis, you have the following roles<br>\
	<br>\
	1. Field Medic. <br>\
	You are expected to serve directly behind the frontlines in a combat situation, treating and stabilising the wounded. You may need to perform emergency trauma surgery and are equipped to do so. You are not expected nor qualified to act as a civilian doctor. <br>\
	<br>\
	2. Fire Support.<br>\
	Often you will be assigned alongside an operative or inspector as a partner. In those situations you may act as fire support for your partner. Try and minimize risk to yourself, as your skill set is invaluable and you are not able to help others while incapacitated or dead.<br>\
	<br>\
	3. Brig Support. <br>\
	During quiet times, you are responsible for assisting other support roles in Aegis. You are also capable of performing lab work alongside the Inspector and should ensure the well-being of prisoners under the care of the Gunnery Sergeant."

/datum/job/ihoper
	alt_titles = list("Aegis Recruit")
	stat_modifiers = list(
		STAT_ROB = 20,
		STAT_TGH = 20,
		STAT_VIG = 20
	)

/decl/hierarchy/outfit/job/security/ihoper
	backpack_contents = list(/obj/item/handcuffs = 1, /obj/item/device/lighting/toggleable/flashlight/seclite = 1)

/decl/hierarchy/outfit/job/security/medspec
	backpack_contents = list(/obj/item/cell/small/high = 1)

/decl/hierarchy/outfit/job/security/inspector
	belt = /obj/item/storage/belt/tactical

/decl/hierarchy/outfit/job/security/gunserg
	backpack_contents = list(/obj/item/handcuffs = 1, /obj/item/device/lighting/toggleable/flashlight/seclite = 1, /obj/item/cell/small/high = 2)

/decl/hierarchy/outfit/job/security/ihc
	belt = /obj/item/storage/belt/tactical

/obj/structure/closet/secure_closet/personal/security/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/ironhammer(src)
	else
		new /obj/item/storage/backpack/sport/ironhammer(src)
	new /obj/item/storage/backpack/satchel/ironhammer(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/storage/belt/tactical/ironhammer(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/clothing/gloves/security/ironhammer(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/tactical(src)
	new /obj/item/ammo_magazine/ihclrifle/rubber(src)
	new /obj/item/ammo_magazine/ihclrifle/rubber(src)
	new /obj/item/ammo_magazine/pistol/rubber(src)
	new /obj/item/ammo_magazine/pistol/rubber(src)
	new /obj/item/storage/pouch/pistol_holster(src)
	new /obj/item/storage/pouch/baton_holster(src)


/obj/structure/closet/secure_closet/medspec/populate_contents()
	new /obj/item/clothing/glasses/sunglasses/sechud/tactical(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/taperoll/police(src)
	new /obj/item/clothing/under/rank/medspec(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/storage/belt/tactical/ironhammer(src)
	new /obj/item/clothing/shoes/reinforced/ironhammer(src)
	new /obj/item/clothing/gloves/stungloves(src)
	new /obj/item/cell/medium/high(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/medspec(src)
	new /obj/item/ammo_magazine/smg/rubber(src)
	new /obj/item/storage/pouch/pistol_holster(src)
	new /obj/item/storage/briefcase/crimekit(src)
	new /obj/item/storage/box/autoinjectors/tricordrazine(src)
	new /obj/item/storage/pouch/medical_supply

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
	new /obj/item/storage/box/evidence(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/storage/belt/tactical/ironhammer(src)
	new /obj/item/clothing/suit/armor/vest/detective(src)
	new /obj/item/taperoll/police(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/tactical(src)
	new /obj/item/cell/small/high(src)
	new /obj/item/cell/small/high(src)
	new /obj/item/device/taperecorder(src)
	new /obj/item/gun/projectile/revolver/consul(src)
	new /obj/item/clothing/accessory/holster(src)
	new /obj/item/ammo_magazine/slmagnum/rubber(src)
	new /obj/item/ammo_magazine/slmagnum/rubber(src)
	new /obj/item/ammo_magazine/slmagnum/rubber(src)
	new /obj/item/storage/pouch/pistol_holster(src)
	new /obj/item/storage/box/gloves(src)

/obj/structure/closet/secure_closet/warden/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/ironhammer(src)
	else
		new /obj/item/storage/backpack/sport/ironhammer(src)
	new /obj/item/storage/backpack/satchel/ironhammer(src)
	new /obj/item/clothing/under/rank/warden(src)
	new /obj/item/clothing/head/beret/sec/navy/warden(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/tactical(src)
	new /obj/item/storage/belt/tactical/ironhammer(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/clothing/gloves/security/tactical(src)
	new /obj/item/storage/box/teargas(src)
	new /obj/item/storage/box/flashbangs(src)
	new /obj/item/ammo_magazine/pistol/rubber(src)
	new /obj/item/ammo_magazine/pistol/rubber(src)
	new /obj/item/ammo_magazine/ihclrifle/rubber(src)
	new /obj/item/ammo_magazine/ihclrifle/rubber(src)
	new /obj/item/storage/box/holobadge(src)
	new /obj/item/clothing/accessory/badge/warden(src)
	new /obj/item/storage/pouch/pistol_holster(src)
	new /obj/item/storage/pouch/baton_holster(src)
	new /obj/item/clothing/suit/armor/vest/ironhammer(src)

/obj/structure/closet/secure_closet/reinforced/hos/populate_contents()
	new /obj/item/gun/projectile/lamia(src)
	new /obj/item/gun/energy/gun/martin(src)
	if(prob(50))
		new /obj/item/storage/backpack/ironhammer(src)
	else
		new /obj/item/storage/backpack/sport/ironhammer(src)
	new /obj/item/storage/backpack/satchel/ironhammer(src)
	new /obj/item/clothing/head/beret/sec/navy/hos(src)
	new /obj/item/clothing/head/HoS(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/clothing/suit/storage/greatcoat/ironhammer(src)
	new /obj/item/clothing/under/rank/ih_commander(src)
	new /obj/item/device/radio/headset/heads/hos(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/tactical(src)
	new /obj/item/storage/belt/tactical/ironhammer(src)
	new /obj/item/clothing/gloves/stungloves(src)
	new /obj/item/cell/medium/high(src)
	new /obj/item/ammo_magazine/magnum/rubber(src)
	new /obj/item/ammo_magazine/magnum/rubber(src)
	new /obj/item/ammo_magazine/magnum/rubber(src)
	new /obj/item/cell/small/high(src)
	new /obj/item/cell/small/high(src)
	new /obj/item/gun/energy/gun/martin(src)
	new /obj/item/clothing/accessory/holster(src)
	new /obj/item/melee/telebaton(src)
	new /obj/item/clothing/accessory/badge/commander(src)
	new /obj/item/storage/pouch/pistol_holster(src)
	new /obj/item/storage/pouch/baton_holster(src)
