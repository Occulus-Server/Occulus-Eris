/obj/item/fabkit
	name = "EES Bed FabKit"
	desc = "A large reinforced box containing a pre-measured construction kit. One time use tools included."
	icon = 'zzzz_modular_occulus/icons/obj/fabkits.dmi'
	icon_state = "fabkit_bed"
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 2)
	w_class = ITEM_SIZE_NORMAL
	rarity_value = 123
	var/structure_form_type = /obj/structure/bed/padded	

/obj/item/fabkit/attack_self(mob/user)
	deploy(user)

/obj/item/fabkit/proc/deploy(var/mob/user)
	var/turf/T = get_turf(src) //When held, this will still find the user's location
	if (istype(T))
		if (do_after(user, 5 SECONDS))
			var/obj/structure/bed/padded/R = new structure_form_type(user.loc)
			R.add_fingerprint(user)
			qdel(src)