// Occulus loadout stuff

//UNIFORMS

/datum/gear/uniform/nursedress
	display_name = "nurse dress"
	path = /obj/item/clothing/under/rank/nurse

/datum/gear/uniform/shorts/color_presets
	display_name = "shorts, color presets"
	path = /obj/item/clothing/under/shorts/black
	cost = 1

/datum/gear/uniform/shorts/color_presets/New()
	..()
	var/shorts = list(
		"Black"			=	/obj/item/clothing/under/shorts/black,
		"Blue"			=	/obj/item/clothing/under/shorts/blue,
		"Green"			=	/obj/item/clothing/under/shorts/green,
		"Grey"			=	/obj/item/clothing/under/shorts/grey,
		"Red"			=	/obj/item/clothing/under/shorts/red
	)
	gear_tweaks += new /datum/gear_tweak/path(shorts)

/datum/gear/uniform/church_sport
	display_name = "Mekhane sports vestiment"
	path = /obj/item/clothing/under/rank/church/sport
	cost = 1
	allowed_roles = list("Chaplain","Mekhane Acolyte","Mekhane Agrolyte","Mekhane Custodian")

/datum/gear/uniform/turtleneck
	display_name = "black turtleneck"
	path = /obj/item/clothing/under/syndicate/civilian

/datum/gear/uniform/tacticalturtleneck
	display_name = "military turtleneck"
	path = /obj/item/clothing/under/turtleneck //Coinflip between a green and black one!

/datum/gear/uniform/yogapants
	display_name = "form-fitting athletic outfit"
	path = /obj/item/clothing/under/yogapants

/datum/gear/uniform/yogapantstrue
	display_name = "yoga pants"
	path = /obj/item/clothing/under/yogapants/topless

/datum/gear/uniform/sailor
	display_name = "sailor uniform"
	path = /obj/item/clothing/under/rank/sailoruniform

/datum/gear/uniform/solgovblackdress
	display_name = "solgov dress uniform (black)"
	path = /obj/item/clothing/under/rank/solgov/blackdress

/datum/gear/uniform/solgovwhitedress
	display_name = "solgov dress uniform (white)"
	path = /obj/item/clothing/under/rank/solgov/whiteservice

/datum/gear/uniform/solgovcommdress
	display_name = "solgov dress uniform (white skirt)"
	path = /obj/item/clothing/under/rank/solgov/whiteserviceskirt