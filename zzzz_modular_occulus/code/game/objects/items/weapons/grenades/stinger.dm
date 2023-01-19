// Occulus-exclusive grenades go here

/obj/item/grenade/frag/rubber
	name = "NT LLG \"Stinger\""
	desc = "A crowd control weapon intended to surpress massive riots with ease."
	icon = 'zzzz_modular_occulus/icons/obj/stinger.dmi'
	icon_state = "stinger"
	item_state = "frggrenade"

	fragment_type = /obj/item/projectile/bullet/pellet/fragment/rubber/stinger
	num_fragments = 100  //total number of fragments produced by the grenade
	fragment_damage = 1

	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_STEEL = 2)
	matter_reagents = list("ammonium_nitrate" = 5)
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)

/obj/item/storage/box/frag/rubber
	name = "box of Stinger grenades"
	desc = "A box containing 4 Sting grenades. Designed for use on unruly crowds"
	icon_state = "box_security"
	illustration = "flashbang"

/obj/item/storage/box/frag/rubber/populate_contents()
	for(var/i in 1 to 4)
		new /obj/item/grenade/frag/rubber(src)

/datum/design/research/item/rubberfrag
	name = "stinger grenade"
	build_path = /obj/item/grenade/frag/rubber
	category = CAT_WEAPON

