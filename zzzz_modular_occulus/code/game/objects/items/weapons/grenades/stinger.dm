// Lore name override for Occulus

/obj/item/grenade/frag/sting
	name = "NT LLG \"Stinger\""
	desc = "A crowd control weapon intended to surpress massive riots with ease."
	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_STEEL = 2)
	matter_reagents = list("ammonium_nitrate" = 5)
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)

/obj/item/grenade/frag/sting/AG
	name = "FTU LLG \"Stinger\""
	desc = "A crowd control weapon intended to surpress massive riots with ease."
	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_STEEL = 2)
	matter_reagents = list("ammonium_nitrate" = 5)
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)

/datum/design/research/item/stingfrag
	name = "stinger grenade"
	build_path = /obj/item/grenade/frag/sting
	category = CAT_WEAPON

