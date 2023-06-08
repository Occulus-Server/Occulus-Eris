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

// Well the file is already here so instead of file-piling a bed into a different one file

/obj/structure/bed/cot
	name = "silk cot"
	desc = "A cot constructed of metal rods and silk cloth. Improvements could be made, like taking the side rods off and living in a hammock."
	icon = 'zzzz_modular_occulus/icons/obj/silkwork.dmi'
	icon_state = "cot"
	base_icon = "cot"

/obj/structure/bed/cot/New(var/newloc)
	..(newloc, MATERIAL_STEEL, "silk")

/obj/structure/bed/cot/get_matter()
	var/list/matter = ..()
	. = matter.Copy()
	if(material)
		LAZYAPLUS(., material.name, 3)
	if(padding_material)
		LAZYAPLUS(., padding_material.name, 3)