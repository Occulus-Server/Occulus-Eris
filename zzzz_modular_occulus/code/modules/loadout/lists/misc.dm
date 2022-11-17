/datum/gear/laser_pointer
	display_name = "Laser Pointer"
	path = /obj/item/laser_pointer
	cost = 4

/datum/gear/box
	display_name = "A box"
	path = /obj/item/storage/box
	cost = 2

/datum/gear/baton_holster
	display_name = "baton sheath"
	path = /obj/item/storage/pouch/baton_holster
	cost = 2
	allowed_roles = list("Aegis Operative","Aegis Commander","Aegis Gunnery Sergeant","Captain","Head of Personnel","Quartermaster","Aegis Inspector","Aegis Medical Specialist")	//SYZYGY EDIT - Added medspec to list

/datum/gear/tennis/
	display_name = "tennis ball"
	path = /obj/item/toy/tennis
	cost = 1

/datum/gear/tennis/color_presets
	display_name = "tennis ball, color presets"
	path = /obj/item/toy/tennis
	cost = 1

/datum/gear/tennis/color_presets/New()
	..()
	var/balls = list(
		"Red"			=	/obj/item/toy/tennis/red,
		"Yellow"		=	/obj/item/toy/tennis/yellow,
		"Green"			=	/obj/item/toy/tennis/green,
		"Cyan"			=	/obj/item/toy/tennis/cyan,
		"Blue"			=	/obj/item/toy/tennis/blue,
		"Purple"		=	/obj/item/toy/tennis/purple
	)
	gear_tweaks += new /datum/gear_tweak/path(balls)

/datum/gear/implant/generic
	display_name = "implant, generic, primary"
	description = "An implant with no obvious purpose."
	path = /obj/item/implant
	cost = 1

/datum/gear/implant/generic/second
	display_name = "implant, generic, secondary"
	description = "An implant with no obvious purpose."
	path = /obj/item/implant
	cost = 1

/datum/gear/implant/generic/third
	display_name = "implant, generic, tertiary"
	description = "An implant with no obvious purpose."
	path = /obj/item/implant
	cost = 1

/datum/gear/implanter
	display_name = "dummy implanter"
	path = /obj/item/implanter
	cost = 0