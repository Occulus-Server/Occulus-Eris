/obj/item/weapon/storage/pouch/get_storage_cost()
	var/totalvolume = BASE_STORAGE_COST(w_class)
	for(var/obj/item/I in contents)
		totalvolume += I.get_storage_cost()/2
	return totalvolume

/obj/item/weapon/storage/pouch/ammo/get_storage_cost()
	return BASE_STORAGE_COST(w_class)

/obj/item/weapon/storage/pouch/small_generic/get_storage_cost()
	return BASE_STORAGE_COST(w_class)

/obj/item/weapon/storage/pouch/large_generic/get_storage_cost()
	return BASE_STORAGE_COST(w_class)

/obj/item/weapon/storage/pouch/holding/get_storage_cost()
	return BASE_STORAGE_COST(w_class)

/obj/item/weapon/storage/belt/get_storage_cost()
	var/totalvolume = BASE_STORAGE_COST(w_class)
	for(var/obj/item/I in contents)
		totalvolume += I.get_storage_cost()/2
	return totalvolume

/obj/item/weapon/storage/toolbox/get_storage_cost()
	var/totalvolume = BASE_STORAGE_COST(w_class)
	for(var/obj/item/I in contents)
		totalvolume += I.get_storage_cost()/2
	return totalvolume