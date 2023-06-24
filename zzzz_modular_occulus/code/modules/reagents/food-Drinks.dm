/datum/reagent/drink/dr_gibb
	taste_tag = list(TASTE_SWEET, TASTE_LIGHT)

/datum/reagent/organic/nutriment/spacespice
	name = "Space Spice"
	description = "A blend of exotic herbs and spices brought to you by the Harkonnen corporation."
	id = "spacespice"
	reagent_state = SOLID
	color = "#e08702"
	taste_description = "exotic spices"
	taste_mult = 1.5
	taste_tag = list(TASTE_SPICY)
/*
	condiment_name = "bottle of space spice"
	condiment_icon_state = "spacespicebottle"
	condiment_center_of_mass = list("x"=16, "y"=10)
*/
/obj/item/reagent_containers/food/condiment/spacespice
	name = "Space Spice"
	desc = "A bottle of Harkonnen-Blend space spice. It must flow."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen.dmi'
	icon_state = "spacespice"
	preloaded_reagents = list("spacespice" = 50)
	possible_transfer_amounts = list(1, 2, 5, 10, 20, 25, 50)

/datum/chemical_reaction/spacespice
    result = "spacespice"
    required_reagents = list("pepper" = 1, "cinnamonpowder" = 1, "sodiumchloride" = 1, "capsaicin" = 1)
    result_amount = 4

/datum/reagent/organic/nutriment/mayonnaise
	name = "Mayonnaise"
	description = "A relatively bland condiment made from eggs."
	id = "mayonnaise"
	reagent_state = LIQUID
	color = "#F2F2CF"
	taste_description = "bland egg"
	taste_tag = list(TASTE_DULL)

/datum/chemical_reaction/mayonnaise
	result = "mayonnaise"
	required_reagents = list("egg" = 3)
	catalysts = list("enzyme" = 1)
	result_amount = 5

/datum/reagent/organic/nutriment/peanutbutter
	name = "Peanut Butter"
	description = "A salty condiment made from peanuts."
	id = "peanutbutter"
	reagent_state = LIQUID
	color = "#724f02"
	taste_description = "salty peanuts"

/datum/chemical_reaction/peanutbutter
	//Do this from grinding peanuts
/datum/reagent/organic/nutriment/batter
	name = "Batter"
	description = "A mixture of flour, water, and spices used to coat things for frying."
	id = "batter"
	reagent_state = LIQUID
	color = "#f7ebab"
	taste_description = "raw spiced flour"

/datum/chemical_reaction/batter
	result = "batter"
	required_reagents = list("flour" = 5, "water" = 5, "salt" = 1, "pepper" = 1)
	result_amount = 10	//cheap and inexpensive.

/datum/reagent/organic/nutriment/beerbatter
	name = "Beer batter"
	description = "A mix of flour, beer, and spices used to coat things for frying."
	id = "beerbatter"
	reagent_state = LIQUID
	color = "#e9d88c"
	taste_description = "raw fizzy spiced flour"

/datum/chemical_reaction/beerbatter
	result = "beerbatter"
	required_reagents = list("flour" = 5, "beer" = 5, "salt" = 1, "pepper" = 1)
	result_amount = 10	//Same as other batters.

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


/obj/item/reagent_containers/food/condiment/salt_large
	name = "Large Salt Bottle"
	desc = "A large bottle of table salt."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen.dmi'
	icon_state = "saltlarge"
	preloaded_reagents = list("sodiumchloride" = 100)
	volume = 100

/obj/item/reagent_containers/food/condiment/pepper_large
	name = "Large Pepper Bottle"
	desc = "A large bottle of pepper."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen.dmi'
	icon_state = "pepperlarge"
	preloaded_reagents = list("blackpepper" = 100)
	volume = 100

//Apparently there's already a sprite for this.
/obj/item/reagent_containers/food/condiment/cornoil
	name = "Corn Oil Jug"
	desc = "A massive jug of corn oil for the fryer."
	//icon = 'zzzz_modular_occulus/icons/obj/kitchen.dmi'
	//icon_state = "cornoiljug"
	preloaded_reagents = list("cornoil" = 300)//Whole goal is to not need more of this.

//I want to die, Eris has this in such a horrible way I'm just rewriting it here.
/obj/item/reagent_containers/food/condiment/on_reagent_change()
	var/nonmodifiable_states = list("saltshakersmall", "peppermillsmall", "saltlarge", "pepperlarge", "flour", "spacespice")
	if(icon_state in nonmodifiable_states)	//FUTUREPROOF YOUR SHIT ERIS
		return
	if(reagents.reagent_list.len > 0)		//I hate every single pixel of this proc.
		switch(reagents.get_master_reagent_id())
			if("ketchup")
				name = "Ketchup"
				desc = "You feel more American already."
				icon_state = "ketchup"
				center_of_mass = list("x"=16, "y"=6)
			if("capsaicin")
				name = "Hotsauce"
				desc = "You can almost TASTE the stomach ulcers now!"
				icon_state = "hotsauce"
				center_of_mass = list("x"=16, "y"=6)
			if("enzyme")
				name = "Universal Enzyme"
				desc = "Used in cooking various dishes."
				icon_state = "enzyme"
				center_of_mass = list("x"=16, "y"=6)
			if("soysauce")
				name = "Soy Sauce"
				desc = "A salty soy-based flavoring."
				icon_state = "soysauce"
				center_of_mass = list("x"=16, "y"=6)
			if("frostoil")
				name = "Coldsauce"
				desc = "Leaves the tongue numb in its passage."
				icon_state = "coldsauce"
				center_of_mass = list("x"=16, "y"=6)
			if("sodiumchloride")
				name = "Salt Shaker"
				desc = "Salt. From space oceans, presumably."
				icon_state = "saltshaker"
				center_of_mass = list("x"=16, "y"=10)
			if("blackpepper")
				name = "Pepper Mill"
				desc = "Often used to flavor food or make people sneeze."
				icon_state = "peppermillsmall"
				center_of_mass = list("x"=16, "y"=10)
			if("cornoil")
				name = "Corn Oil"
				desc = "A delicious oil used in cooking. Made from corn."
				icon_state = "oliveoil"
				center_of_mass = list("x"=16, "y"=6)
			if("sugar")
				name = "Sugar"
				desc = "Tastey space sugar!"
				center_of_mass = list("x"=16, "y"=6)
			else
				name = "Misc Condiment Bottle"
				if (reagents.reagent_list.len==1)
					desc = "Looks like it is [reagents.get_master_reagent_name()], but you are not sure."
				else
					desc = "A mixture of various condiments. [reagents.get_master_reagent_name()] is one of them."
				icon_state = "mixedcondiments"
				center_of_mass = list("x"=16, "y"=6)
	else
		icon_state = "emptycondiment"
		name = "Condiment Bottle"
		desc = "An empty condiment bottle."
		center_of_mass = list("x"=16, "y"=6)
		return
