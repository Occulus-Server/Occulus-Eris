// -----------------------------
//          Chemistry bag
// -----------------------------

/obj/item/storage/bag/chemistry
	name = "chemistry bag"
	icon = 'zzzz_modular_occulus/icons/obj/chemical.dmi'
	icon_state = "chembag"
	desc = "A bag for storing pills, beakers, and bottles."
	max_storage_space = 100
	max_w_class = ITEM_SIZE_NORMAL
	w_class = ITEM_SIZE_NORMAL
	can_hold = list(/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle)