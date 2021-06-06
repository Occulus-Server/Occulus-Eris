// Mostly just for the ADVANCED roller bed!

/obj/item/roller/adv
	name = "advanced roller bed"
	desc = "A specialized collapsed roller bed that can be stuffed in backpacks. Made by a long since defunct company."
	icon = 'zzzz_modular_occulus/icons/obj/rollerbed.dmi'
	slot_flags = SLOT_BACK|SLOT_BELT
	w_class = ITEM_SIZE_NORMAL
	structure_form_type = /obj/structure/bed/roller/adv	//The deployed form path.

/obj/structure/bed/roller/adv
	name = "advanced roller bed"
	desc = "A specialized roller bed that can be collapsed and stuffed in backpacks. Made by a long since defunct company."
	icon = 'zzzz_modular_occulus/icons/obj/rollerbed.dmi'
	icon_state = "down"
	item_form_type = /obj/item/roller/adv	//The folded-up object path.
