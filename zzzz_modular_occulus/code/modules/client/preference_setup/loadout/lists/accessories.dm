/datum/gear/accessory/shemaugh
	display_name = "shemaugh selection"
	path = /obj/item/clothing/accessory/shemaugh
	slot = slot_wear_mask
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/accessory/mekhanecape
	display_name = "mekhane cape selection"
	path = /obj/item/clothing/accessory/job/cape/church/small
	allowed_roles = list("Chaplain","Mekhane Acolyte","Mekhane Agrolyte","Mekhane Custodian")
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/accessory/collar
	display_name = "collar selection"
	path = /obj/item/clothing/accessory/collar
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/accessory/badge
	display_name = "holobadge"
	path = /obj/item/clothing/accessory/badge/holo
	allowed_roles = list(JOBS_SECURITY)

/datum/gear/accessory/cordbadge
	display_name = "holobadge, cord"
	path = /obj/item/clothing/accessory/badge/holo/cord
	allowed_roles = list(JOBS_SECURITY)