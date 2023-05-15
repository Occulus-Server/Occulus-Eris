/mob/living/carbon/human/proc/quick_equip_s_store(obj/item/Item)
	if(istype(src.s_store,/obj/item/storage/))
		var/obj/item/storage/B= src.s_store
		if(B.attackby(Item,src))
			return TRUE
	return FALSE

/mob/living/carbon/human/proc/quick_equip_l_store(obj/item/Item)
	if(istype(src.l_store,/obj/item/storage/))
		var/obj/item/storage/B= src.l_store
		if(B.attackby(Item,src))
			return TRUE
	return FALSE

/mob/living/carbon/human/proc/quick_equip_r_store(obj/item/Item)
	if(istype(src.r_store,/obj/item/storage/))
		var/obj/item/storage/B= src.r_store
		if(B.attackby(Item,src))
			return TRUE
	return FALSE