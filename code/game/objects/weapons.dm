/obj/item
	name = "weapon"
	icon = 'icons/obj/weapons.dmi'
	hitsound = "swing_hit"
	bad_type = /obj/item

/obj/item/Bump(mob/M)
	spawn(0)
		..()
	return
