// One whole file just for a tiny override!

/obj/structure/closet/secure_closet/personal/engineering_personal/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/industrial(src)
	else
		new /obj/item/storage/backpack/satchel/industrial(src)
	new /obj/item/storage/toolbox/mechanical(src)
	new /obj/item/clothing/under/rank/engineer(src)
	new /obj/item/clothing/head/beret/engineering/ees(src)
	new /obj/item/clothing/head/welding(src)
	new /obj/item/device/radio/headset/headset_eng(src)
	new /obj/item/clothing/suit/storage/hazardvest/orange(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/glasses/powered/meson(src)
	new /obj/item/clothing/head/armor/helmet/technomancer(src)
	new /obj/item/clothing/suit/storage/vest/insulated(src)
	new /obj/item/taperoll/engineering(src)
	new /obj/item/clothing/gloves/insulated(src)
