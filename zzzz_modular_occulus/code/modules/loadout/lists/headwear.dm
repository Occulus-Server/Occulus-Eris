/*
Most bandanas are already mask bandanas. However these loadout items were head-only.
With banana masks working properly, we can overwrite the headgear with the dual-slot item.
*/

/datum/gear/head
	path = /obj/item/clothing/mask/bandana/red

/datum/gear/head/bandana_green
	path = /obj/item/clothing/mask/bandana/green

/datum/gear/head/bandana_orange
	path = /obj/item/clothing/mask/bandana/orange

/datum/gear/head/blueberet
	path = /obj/item/clothing/head/solgov/blueberet

/datum/gear/head/wheelcap
	path = /obj/item/clothing/head/solgov/wheelcap
	allowed_roles = list(JOBS_SECURITY)

/datum/gear/head/wheelcapcomm
	path = /obj/item/clothing/head/solgov/wheelcapcomm
	allowed_roles = list(JOBS_COMMAND)


