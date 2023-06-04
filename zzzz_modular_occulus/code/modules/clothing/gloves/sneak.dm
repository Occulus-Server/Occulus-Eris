/obj/item/clothing/gloves/sneak //pickpocketting code in stripping.dm. Just checks for sneakgloves in gloves slot.
	name = "slick looking gloves"
	desc = "These inconspicuous gloves are fitted with Nanomemory fibers, aiding in pickpocketing"
	icon_state = "black"
	icon = 'icons/inventory/hands/icon.dmi'
	spawn_tags = SPAWN_TAG_GLOVES
	body_parts_covered = HANDS
	armor = list(melee = 2, bullet = 0, energy = 3, bomb = 0, bio = 0, rad = 0)
	slot_flags = SLOT_GLOVES
	attack_verb = list("challenged")
