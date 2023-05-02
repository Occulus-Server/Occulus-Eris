/obj/structure/closet/secure_closet/reinforced/CMOcculus
	name = "chief medical officer's locker"
	req_access = list(access_cmo)
	icon_state = "cmo"

/obj/structure/closet/secure_closet/reinforced/CMOcculus/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/medical(src)
	else
		new /obj/item/storage/backpack/satchel(src)
	new /obj/item/clothing/suit/bio_suit/cmo(src)
	new /obj/item/clothing/head/bio_hood/cmo(src)
	new /obj/item/clothing/shoes/color/white(src)
	new /obj/item/clothing/shoes/reinforced/medical(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/clothing/under/rank/medical/green(src)
	new /obj/item/clothing/head/surgery/green(src)
	new /obj/item/clothing/under/rank/moebius_biolab_officer(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/cmo(src)
	new /obj/item/clothing/gloves/latex(src)
	new /obj/item/clothing/shoes/color/brown	(src)
	new /obj/item/device/radio/headset/heads/cmo(src)
	new /obj/item/device/flash(src)
	new /obj/item/storage/hypospraykit/cmo(src)
	new /obj/item/storage/belt/medical(src)
	new /obj/item/storage/pouch/medical_supply(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/drugs(src)

/obj/structure/closet/secure_closet/psychiatrist
	name = "Psychiatrist's locker"
	req_access = list(access_psychiatrist)
	icon_state = "med"

/obj/structure/closet/secure_closet/psychiatrist/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/medical(src)
	else
		new /obj/item/storage/backpack/satchel/medical(src)
	new /obj/item/storage/pill_bottle/citalopram(src)
	new /obj/item/storage/pill_bottle/methylphenidate(src)
	new	/obj/item/storage/pill_bottle/delight(src)
	new /obj/item/clothing/under/rank/medical(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/gloves/latex(src)
	new /obj/item/clipboard(src)
	new /obj/item/device/radio/headset/headset_med(src)
	new /obj/item/taperoll/medical(src)
	new /obj/item/clothing/shoes/reinforced/medical(src)
	new /obj/item/clothing/head/soft/medical(src)
	new /obj/item/folder/cyan(src)
	new /obj/item/device/taperecorder(src)
	new /obj/item/reagent_containers/food/snacks/chocolatebar(src)
	new /obj/item/reagent_containers/food/snacks/chocolatebar(src)
	new /obj/item/reagent_containers/food/snacks/chocolatebar(src)
	new /obj/item/device/neuroinducer(src)

/obj/structure/closet/wall_mounted/blood
	name = "blood pack wall locker"
	req_access = list(access_medical_equip)
	icon = 'zzzz_modular_occulus/icons/obj/closet.dmi'
	icon_state = "medical_wall"

/obj/structure/closet/wall_mounted/blood/populate_contents()
	new /obj/item/reagent_containers/blood/APlus(src)
	new /obj/item/reagent_containers/blood/AMinus(src)
	new	/obj/item/reagent_containers/blood/BPlus(src)
	new /obj/item/reagent_containers/blood/BMinus(src)
	new /obj/item/reagent_containers/blood/OPlus(src)
	new /obj/item/reagent_containers/blood/OMinus(src)
	new /obj/item/reagent_containers/blood/empty(src)

/obj/structure/closet/secure_closet/personal/paramedic/populate_contents()
	..()
	new /obj/item/gun/projectile/selfload/moebius(src)
	new /obj/item/ammo_magazine/pistol/rubber(src)
	new /obj/item/modular_computer/tablet/moebius/preset(src)
