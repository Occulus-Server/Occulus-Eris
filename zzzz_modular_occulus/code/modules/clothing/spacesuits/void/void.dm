/obj/item/clothing/suit/space/void/make_young()
	..()
	if(helmet)
		helmet.make_young()


/obj/item/clothing/head/space //we can recycle helmets now
	matter = list(MATERIAL_PLASTIC = 10, MATERIAL_STEEL = 4, MATERIAL_GLASS = 1)
/obj/item/clothing/head/space/void
	matter = list(MATERIAL_PLASTIC = 10, MATERIAL_STEEL = 3, MATERIAL_GLASS = 1, MATERIAL_SILVER = 1)
/obj/item/clothing/suit/space/void
	matter = list(MATERIAL_PLASTIC = 30, MATERIAL_STEEL = 5, MATERIAL_SILVER = 5)
/obj/item/clothing/head/space/void/engineering
	matter = list(MATERIAL_PLASTIC = 10, MATERIAL_STEEL = 3, MATERIAL_PHORONGLASS = 1, MATERIAL_OSMIUM = 1)
/obj/item/clothing/suit/space/void/engineering
	matter = list(MATERIAL_PLASTIC = 30, MATERIAL_STEEL = 8, MATERIAL_OSMIUM = 2)
/obj/item/clothing/head/space/void/mining
	matter = list(MATERIAL_PLASTIC = 10, MATERIAL_PLASTEEL = 4, MATERIAL_PHORONGLASS = 1)
/obj/item/clothing/suit/space/void/mining
	matter = list(MATERIAL_PLASTIC = 30, MATERIAL_PLASTEEL = 10)
/obj/item/clothing/head/space/void/medical
	matter = list(MATERIAL_PLASTIC = 12, MATERIAL_STEEL = 1, MATERIAL_GLASS = 2)
/obj/item/clothing/suit/space/void/medical
	matter = list(MATERIAL_PLASTIC = 35, MATERIAL_STEEL = 3, MATERIAL_GOLD = 2)
/obj/item/clothing/head/space/void/security
	matter = list(MATERIAL_PLASTIC = 10, MATERIAL_PLASTEEL = 4, MATERIAL_PHORONGLASS = 1)
/obj/item/clothing/suit/space/void/security
	matter = list(MATERIAL_PLASTIC = 30, MATERIAL_PLASTEEL = 10)
/obj/item/clothing/head/space/void/riggedvoidsuit
	matter = list(MATERIAL_PLASTIC = 15, MATERIAL_PLASTEEL = 8)
/obj/item/clothing/suit/space/void/riggedvoidsuit
	matter = list(MATERIAL_PLASTIC = 5, MATERIAL_PLASTEEL = 2, MATERIAL_GLASS = 10)
/obj/item/clothing/head/space/void/merc
	matter = list(MATERIAL_PLASTIC = 10, MATERIAL_PLASTEEL = 4, MATERIAL_PHORONGLASS = 1)
/obj/item/clothing/suit/space/void/merc
	matter = list(MATERIAL_PLASTIC = 10, MATERIAL_PLASTEEL = 4, MATERIAL_PHORONGLASS = 1)
	
/obj/item/clothing/suit/space/void
	valid_accessory_slots = list() 
	restricted_accessory_slots = list() 