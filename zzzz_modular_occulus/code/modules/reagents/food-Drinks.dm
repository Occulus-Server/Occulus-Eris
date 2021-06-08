/datum/reagent/drink/dr_gibb
	taste_tag = list(TASTE_SWEET, TASTE_LIGHT)

/obj/item/weapon/reagent_containers/food/snacks/brownies
	name = "Brownies"
	icon_state = "waffles"
	desc = "Ovenless Brownies!"
	filling_color = "#A79459"

	New()
		..()
		reagents.add_reagent("nutriment", 6)