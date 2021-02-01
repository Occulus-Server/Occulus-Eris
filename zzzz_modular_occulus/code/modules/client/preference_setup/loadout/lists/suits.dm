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

/datum/gear/suit/cyberjacket
	display_name = "crystaljacket selection"
	path = /obj/item/clothing/suit/storage/cyberjacket
	cost = 2

/datum/gear/suit/cyberjacket/New()
	..()
	var/jacket = list(
		"Yellow"		=	/obj/item/clothing/suit/storage/cyberjacket,
		"Red"		=	/obj/item/clothing/suit/storage/cyberjacket/red,
		"Blue"		=	/obj/item/clothing/suit/storage/cyberjacket/blue,
		"Green"		=	/obj/item/clothing/suit/storage/cyberjacket/green,
		"Black"		=	/obj/item/clothing/suit/storage/cyberjacket/black,
		"White"		=	/obj/item/clothing/suit/storage/cyberjacket/white,
		"Pink"		=	/obj/item/clothing/suit/storage/cyberjacket/punk,
		"Copper"		=	/obj/item/clothing/suit/storage/cyberjacket/copper
	)
	gear_tweaks += new /datum/gear_tweak/path(jacket)
