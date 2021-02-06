/obj/structure/closet/secure_closet/reinforced/CMOcculus
	name = "chief medical officer's locker"
	req_access = list(access_cmo)
	icon_state = "cmo"

/obj/structure/closet/secure_closet/reinforced/CMOcculus/populate_contents()
	if(prob(50))
		new /obj/item/weapon/storage/backpack/medical(src)
	else
		new /obj/item/weapon/storage/backpack/satchel(src)
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
	new /obj/item/weapon/storage/hypospraykit/cmo(src)
	new /obj/item/weapon/storage/belt/medical(src)
	new /obj/item/weapon/storage/pouch/medical_supply(src)
	new /obj/item/weapon/reagent_containers/hypospray/autoinjector/drugs(src)