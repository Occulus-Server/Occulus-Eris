/obj/item/weapon/storage/pill_bottle/methylphenidate
	name = "bottle of Methylphenidate pills"
	desc = "Contains pills."
	spawn_tags = SPAWN_TAG_MEDICINE_CONTRABAND
	rarity_value = 15
	pill_type = /obj/item/weapon/reagent_containers/pill/methylphenidate

/obj/item/weapon/storage/pill_bottle/methylphenidate/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/weapon/storage/pill_bottle/delight
	name = "bottle of Delight pills"
	desc = "Contains mood improving pills."
	spawn_tags = SPAWN_TAG_MEDICINE_CONTRABAND
	rarity_value = 15
	pill_type = /obj/item/weapon/reagent_containers/pill/delight

/obj/item/weapon/storage/pill_bottle/delight/populate_contents()
	for(var/i in 1 to initial_amt)
		new pill_type(src)

/obj/item/weapon/reagent_containers/pill/delight
	name = "Delight pill"
	desc = "Contains Delight, often used to improve ones mood"
	icon_state = "pill18"
	preloaded_reagents = list("delight" = 10)