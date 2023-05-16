/datum/reagent/drink/dr_gibb
	taste_tag = list(TASTE_SWEET, TASTE_LIGHT)

/datum/reagent/organic/nutriment/spacespice
	name = "Space Spice"
	description = "A blend of exotic herbs and spices brought to you by the Harkonnen corporation."
	reagent_state = SOLID
	color = "#e08702"
	taste_description = "spices"
	taste_mult = 1.5
	taste_tag = list(TASTE_SPICY)
/*
	condiment_name = "bottle of space spice"
	condiment_icon_state = "spacespicebottle"
	condiment_center_of_mass = list("x"=16, "y"=10)
*/
/datum/reagent/organic/nutriment/mayonnaise


/datum/reagent/organic/nutriment/peanutbutter


/datum/reagent/organic/nutriment/batter

/datum/reagent/organic/nutriment/beerbatter

/obj/item/reagent_containers/food/snacks/brownies
	name = "Brownies"
	icon_state = "crackersbox"
	desc = "Ovenless Brownies!"
	filling_color = "#A79459"
	bitesize = 2
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 2
	nutriment_desc = list("chocolate" = 5)
	preloaded_reagents = list("sugar" = 2, "coco" = 2)
	taste_tag = list(SWEET_FOOD, COCO_FOOD)

/obj/item/reagent_containers/food/snacks/meat/roachmeat/kaiser
	preloaded_reagents = list("protein" = 6, "seligitillin" = 6, "kaisertophin" = 12, "diplopterum" = 6)