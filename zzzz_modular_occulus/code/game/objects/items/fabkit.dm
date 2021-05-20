/obj/item/fabkit
	name = "EES Bed FabKit"
	desc = "A large reinforced box containing a pre-measured construction kit. One time use tools included."
	icon = 'zzzz_modular_occulus/icons/obj/fabkits.dmi'
	icon_state = "fabkit_bed"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 5)
	w_class = ITEM_SIZE_NORMAL
	rarity_value = 123
	price_tag = 300
	var/structure_form_type = /obj/structure/bed/padded	

/obj/item/fabkit/attack_self(mob/user)
	deploy(user)

/obj/item/fabkit/proc/deploy(var/mob/user)
	var/turf/T = get_turf(src) 
	if (istype(T))
		if (do_after(user, 5 SECONDS))
			var/obj/structure/bed/padded/R = new structure_form_type(user.loc)
			R.add_fingerprint(user)
			qdel(src)

/obj/item/fabkit/bench
	name = "EES Weightlifter FabKit"
	icon_state = "fabkit_bench"
	matter = list(MATERIAL_STEEL = 30, MATERIAL_PLASTEEL = 10)
	w_class = ITEM_SIZE_HUGE
	rarity_value = 223
	price_tag = 1500
	structure_form_type = /obj/structure/fitness/weightlifter

/obj/item/fabkit/bag
	name = "EES Punchingbag FabKit"
	icon_state = "fabkit_bag"
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 30)
	w_class = ITEM_SIZE_HUGE
	rarity_value = 223
	price_tag = 1500
	structure_form_type = /obj/structure/fitness/punchingbag

/obj/item/fabkit/psych
	name = "EES Psych Bed FabKit"
	icon_state = "fabkit_psych"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_WOOD = 5, MATERIAL_PLASTIC = 2)
	w_class = ITEM_SIZE_NORMAL
	rarity_value = 223
	price_tag = 600
	structure_form_type = /obj/structure/bed/psych

/obj/item/fabkit/dryrack
	name = "EES Drying Rack FabKit"
	icon_state = "fabkit_dryrack"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_WOOD = 10)
	w_class = ITEM_SIZE_NORMAL
	rarity_value = 223
	price_tag = 750
	structure_form_type = /obj/machinery/smartfridge/drying_rack