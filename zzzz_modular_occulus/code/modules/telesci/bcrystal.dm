/obj/item/bluespace_dust/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/reagent_containers))
		I.reagents.add_reagent("bluespace_dust", 5)
		qdel(src)