/*
AUTOLATHE DATUMS
*/

//STUFF ADDED IN THE CHURCH EQUIPMENT PORT
/datum/design/autolathe/sword/nt_sword/name = "Mekhane Shortsword"
/datum/design/autolathe/sword/nt_longsword/name = "Mekhane Longsword"
/datum/design/autolathe/sword/nt_dagger/name = "Mekhane Dagger"
/datum/design/autolathe/sword/nt_halberd/name = "Mekhane Halberd"
/datum/design/autolathe/sword/nt_scourge/name = "Mekhane Scourge"
/datum/design/autolathe/shield/nt_shield/name = "Mekhane Shield"
/datum/design/autolathe/grenade/nt_explosive/name = "MEK OBG \"Nova\""
/datum/design/autolathe/grenade/nt_flashbang/name = "MEK FBG \"Pulsar\""
/datum/design/autolathe/grenade/nt_frag/name = "MEK DFG \"Flare\""
/datum/design/autolathe/grenade/nt_smokebomb/name = "MEK SG \"Nebula\""

// CLOTHING
/datum/design/bioprinter/nt_clothes/acolyte_armor/name = "MEK Acolyte Armor"
/datum/design/bioprinter/nt_clothes/agrolyte_armor/name = "MEK Agrolyte Armor"
/datum/design/bioprinter/nt_clothes/custodian_armor/name = "MEK Custodian Armor"
/datum/design/bioprinter/nt_clothes/preacher_coat/name = "MEK Preacher Longcoat"
/datum/design/bioprinter/nt_clothes/acolyte_jacket/name = "MEK Acolyte Jacket"
/datum/design/bioprinter/nt_clothes/sports_jacket/name = "MEK Sports Jacket"
/datum/design/bioprinter/nt_clothes/acolyte_uniform/name = "MEK Acolyte Garment"
/datum/design/bioprinter/nt_clothes/sports_uniform/name = "MEK Sport Clothes"
/datum/design/bioprinter/nt_clothes/church_uniform/name = "MEK Church Garment"
/datum/design/bioprinter/belt/utility/neotheology/name = "Mekhanite utility belt"
/datum/design/bioprinter/belt/security/neotheology/name = "Mekhanite tactical belt"

// UTILITIES
/datum/design/autolathe/device/grenade/nt_cleaner/name = "MEK \"Cleansing Tide\" Pod"
/datum/design/autolathe/device/grenade/nt_weedkiller/name = "MEK \"Kudzu Killer\" Pod"
/datum/design/autolathe/device/headset_church/name = "Mekhane Radio Encryption Key"

// OTHER STUFF
/datum/design/autolathe/firstaid/nt/name = "Mekhanite Medkit"

/*
THIS IS WHERE THE ACTUAL TWEAKING OF STUFF GOES
*/

//WEAPONS

/* DAMAGE VALUES FOR REFERENCE
WEAPON_FORCE_PAINFUL		15
WEAPON_FORCE_DANGEROUS		20
WEAPON_FORCE_ROBUST			26
WEAPON_FORCE_BRUTAL			33
WEAPON_FORCE_LETHAL			40

ARMOR_PEN_GRAZING			5
ARMOR_PEN_SHALLOW			10
ARMOR_PEN_MODERATE			15
ARMOR_PEN_DEEP				20
ARMOR_PEN_EXTREME			25
ARMOR_PEN_MASSIVE			30
*/

// A lot of the church weapons seem very focused on ignoring armor and fighting against other people. We really shouldn't be expecting that to happen here.
/obj/item/weapon/tool/sword/nt
	name = "Mekhane Shortsword"
	force = WEAPON_FORCE_ROBUST	// Buffed one notch up
	armor_penetration = ARMOR_PEN_GRAZING	// Nerfed down two notches

/obj/item/weapon/tool/sword/nt/longsword
	name = "Mekhane Longsword"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MODERATE	// Nerfed down two notches

/obj/item/weapon/tool/knife/dagger/nt	// This is relatively in line with all the other daggers.
	name = "Mekhane Dagger"
	force = WEAPON_FORCE_PAINFUL
	armor_penetration = ARMOR_PEN_EXTREME	// Nerfed down a notch

/obj/item/weapon/tool/sword/nt/halberd
	name = "Mekhane Halberd"
	force = WEAPON_FORCE_LETHAL	// Buffed two notches up, now it's stronger than the fire axe
	armor_penetration = ARMOR_PEN_DEEP	// Nerfed down two notches

/obj/item/weapon/tool/sword/nt/scourge	// This is absolutely an armor shredding specialist, so its kinda fine as is. REMAINS UNTOUCHED.
	name = "Mekhane Scourge"
	force = WEAPON_FORCE_PAINFUL
	force_extended = WEAPON_FORCE_DANGEROUS
	armor_penetration = ARMOR_PEN_DEEP
	armor_penetration_extended = ARMOR_PEN_HALF

/obj/item/weapon/shield/riot/nt
	name = "Mekhane Shield"


// GRENADES
/obj/item/weapon/grenade/explosive/nt/name = "MEK OBG \"Nova\""
/obj/item/weapon/grenade/flashbang/nt/name = "MEK FBG \"Pulsar\""
/obj/item/weapon/grenade/smokebomb/nt/name = "MEK SG \"Nebula\""
/obj/item/weapon/grenade/frag/nt/name = "MEK DFG \"Flare\""

// HEALING ITEMS

/obj/item/stack/medical/advanced/bruise_pack/nt
	name = "Mekhanite Bruisepack"
	singular_name = "Mekhanite Bruisepack"
	desc = "An advanced bruisepack for severe injuries."

/obj/item/stack/medical/advanced/ointment/nt
	name = "Mekhanite Burnpack"
	singular_name = "Mekhanite Burnpack"
	desc = "An advanced treatment kit for severe burns."
