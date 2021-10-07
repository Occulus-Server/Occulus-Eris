/obj/item/clothing/gloves/sneak
	name = "slick gloves"
	desc = "These inconspicuous gloves are fitted with Nanomemory fibers, aiding in pickpocketting"
	icon = 'icons/inventory/hands/icon.dmi'
	spawn_tags = SPAWN_TAG_GLOVES
	body_parts_covered = HANDS
	armor = list(melee = 10, bullet = 0, energy = 15, bomb = 0, bio = 0, rad = 0)
	slot_flags = SLOT_GLOVES
	attack_verb = list("challenged")


/obj/item/clothing/gloves/sneak/equipped(mob/living/L, var/slot)	//define slot as hands slot?
	L.stats.addPerk(PERK_FAST_FINGERS)

/obj/item/clothing/gloves/sneak/dropped(mob/living/L)	//not working currently.
	L.stats.removePerk(PERK_FAST_FINGERS)