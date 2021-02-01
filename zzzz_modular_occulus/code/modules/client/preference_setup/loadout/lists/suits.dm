// Suit slot
/*
/datum/gear/suit
	display_name = "apron, blue"
	path = /obj/item/clothing/suit/apron
	slot = slot_wear_suit
	sort_category = "Suits and Overwear"
	cost = 1
	*/
/datum/gear/suit/sleevelessjacket
	display_name = "sleeveless jacket selection"
	path = /obj/item/clothing/suit/storage/hooded/sleeveless

/datum/gear/suit/sleevelessjacket/New()
	..()
	var/jacket = list(
		"Red"		=	/obj/item/clothing/suit/storage/hooded/sleeveless,
		"Black"		=	/obj/item/clothing/suit/storage/hooded/sleeveless/black,
		"Blue"		=	/obj/item/clothing/suit/storage/hooded/sleeveless/blue,
		"Yellow"	=	/obj/item/clothing/suit/storage/hooded/sleeveless/yellow,
		"White"		=	/obj/item/clothing/suit/storage/hooded/sleeveless/white
	)
	gear_tweaks += new /datum/gear_tweak/path(jacket)
