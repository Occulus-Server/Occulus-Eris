//Chips
/obj/item/reagent_containers/food/snacks/chipplate
	name = "basket of chips"
	desc = "A plate of chips intended for dipping."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "chip_basket"
	trash = /obj/item/trash/plate
	var/vendingobject = /obj/item/reagent_containers/food/snacks/chip
	bitesize = 1
	var/unitname = "chip"
	filling_color = "#FFF454"
	nutriment_amt = 10
	nutriment_desc = list("crispy chips" = 10, "salt" = 1)
	preloaded_reagents = list("sodiumchloride" = 10)
	taste_tag = list(SALTY_FOOD, VEGAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chip
	name = "chip"
	desc = "A portion sized chip good for dipping."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "chip"
	var/bitten_state = "chip_half"
	bitesize = 1
	center_of_mass = list("x"=16, "y"=16)
	nutriment_amt = 2
	nutriment_desc = list("crispy chips" = 5, "salt" = 1)
	preloaded_reagents = list("sodiumchloride" = 1)
	filling_color = "#EDF291"
	taste_tag = list(SALTY_FOOD, VEGAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chip/salsa
	name = "salsa chip"
	desc = "A portion sized chip good for dipping. This one has salsa on it."
	icon_state = "chip_salsa"
	bitten_state = "chip_half"
	bitesize = 2
	filling_color = "#FF4D36"
	nutriment_desc = list("crispy chip" = 5, "salsa" = 2)

/obj/item/reagent_containers/food/snacks/chip/guac
	name = "guac chip"
	desc = "A portion sized chip good for dipping. This one has guac on it."
	icon_state = "chip_guac"
	bitten_state = "chip_half"
	bitesize = 2
	filling_color = "#35961D"
	nutriment_desc = list("crispy chip" = 5, "guacamole" = 5)

/obj/item/reagent_containers/food/snacks/chip/cheese
	name = "cheese chip"
	desc = "A portion sized chip good for dipping. This one has cheese sauce on it."
	icon_state = "chip_cheese"
	bitten_state = "chip_half"
	bitesize = 2
	filling_color = "#FFF454"
	nutriment_desc = list("crispy chip" = 5, "cheese" = 1)
	taste_tag = list(CHEESE_FOOD, SALTY_FOOD, VEGETARIAN_FOOD)

/obj/item/reagent_containers/food/snacks/chip/sourcream
	name = "sour cream chip"
	desc = "A portion sized chip good for dipping. This one has sour cream on it."
	icon_state = "chip_sourcream"
	bitten_state = "chip_half_sourcream"
	bitesize = 2
	filling_color = "#e4e4e4"
	nutriment_desc = list("crispy chip" = 5, "sour cream" = 1)
	taste_tag = list(SALTY_FOOD, VEGETARIAN_FOOD)

/obj/item/reagent_containers/food/snacks/chip/hummus
	name = "hummus chip"
	desc = "A portion sized chip good for dipping. This one has hummus on it."
	icon_state = "chip_hummus"
	bitten_state = "chip_half_hummus"
	bitesize = 2
	filling_color = "#cca628"
	nutriment_desc = list("crispy chip" = 5, "hummus" = 1)

/obj/item/reagent_containers/food/snacks/chip/nacho
	name = "nacho chip"
	desc = "A nacho ship stray from a plate of cheesy nachos."
	icon_state = "chip_nacho"
	bitten_state = "chip_half"
	bitesize = 2
	filling_color = "#FFF454"
	nutriment_desc = list("cheesy chip" = 5, "cheese" = 1)
	taste_tag = list(CHEESE_FOOD, SALTY_FOOD, VEGETARIAN_FOOD)

/obj/item/reagent_containers/food/snacks/chip/nacho/salsa
	name = "nacho chip"
	desc = "A stray nacho chip from a plate of cheesy nachos. This one has salsa on it."
	icon_state = "chip_nacho_salsa"
	bitten_state = "chip_half"
	bitesize = 2
	filling_color = "#FF4D36"
	nutriment_desc = list("cheesy chip" = 5, "cheese" = 1, "salsa" = 3)

/obj/item/reagent_containers/food/snacks/chip/nacho/guac
	name = "nacho chip"
	desc = "A stray nacho chip from a plate of cheesy nachos. This one has guac on it."
	icon_state = "chip_nacho_guac"
	bitten_state = "chip_half"
	bitesize = 2
	filling_color = "#35961D"
	nutriment_desc = list("cheesy chip" = 5, "cheese" = 1, "guacamole" = 2)

/obj/item/reagent_containers/food/snacks/chip/nacho/cheese
	name = "nacho chip"
	desc = "A stray nacho chip from a plate of cheesy nachos. This one has extra cheese on it."
	icon_state = "chip_nacho_cheese"
	bitten_state = "chip_half"
	bitesize = 2
	filling_color = "#FFF454"
	nutriment_desc = list("cheesy chip" = 5, "cheese" = 10)

/obj/item/reagent_containers/food/snacks/chip/nacho/sourcream
	name = "nacho chip"
	desc = "A stray nacho chip from a plate of cheesy nachos. This one has extra sour cream on it."
	icon_state = "chip_nacho_sourcream"
	bitten_state = "chip_half_sourcream"
	bitesize = 2
	filling_color = "#e4e4e4"
	nutriment_desc = list("cheesy chip" = 5, "sour cream" = 3)

/obj/item/reagent_containers/food/snacks/chip/nacho/hummus
	name = "nacho chip"
	desc = "A stray nacho chip from a plate of cheesy nachos. This one has extra hummus on it."
	icon_state = "chip_nacho_hummus"
	bitten_state = "chip_half_hummus"
	bitesize = 2
	filling_color = "#cca628"
	nutriment_desc = list("cheesy chip" = 5, "hummus" = 10)

// chip plates
/obj/item/reagent_containers/food/snacks/chipplate/attack_hand(mob/user as mob)
	var/obj/item/reagent_containers/food/snacks/returningitem = new vendingobject(loc)
	returningitem.reagents.clear_reagents()
	reagents.trans_to(returningitem, bitesize)
	returningitem.bitesize = bitesize/2
	user.put_in_hands(returningitem)
	if (reagents && reagents.total_volume)
		to_chat(user, "You take a [unitname] from the plate.")
	else
		to_chat(user, "You take the last [unitname] from the plate.")
		var/obj/waste = new trash(loc)
		if (loc == user)
			user.put_in_hands(waste)
		qdel(src)

/obj/item/reagent_containers/food/snacks/chipplate/MouseDrop(mob/user) //Dropping the chip onto the user
	if(istype(user) && user == usr)
		user.put_in_active_hand(src)
		src.pickup(user)
		return
	. = ..()

/obj/item/reagent_containers/food/snacks/chipplate/nachos
	name = "plate of nachos"
	desc = "A very cheesy nacho plate."
	icon_state = "nachos"
	trash = /obj/item/trash/plate
	vendingobject = /obj/item/reagent_containers/food/snacks/chip/nacho
	bitesize = 1
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 10
	nutriment_desc = list("tortilla chips" = 10, "cheese" = 5)
	taste_tag = list(SALTY_FOOD, VEGETARIAN_FOOD, CHEESE_FOOD)
	cooked = TRUE
//
//DIPS
//
/obj/item/reagent_containers/food/snacks/dip
	name = "queso dip"
	desc = "A simple, cheesy dip consisting of tomatos, cheese, and spices."
	var/nachotrans = /obj/item/reagent_containers/food/snacks/chip/nacho/cheese
	var/chiptrans = /obj/item/reagent_containers/food/snacks/chip/cheese
	icon_state = "dip_cheese"
	trash = /obj/item/trash/snack_bowl
	bitesize = 1
	center_of_mass = list("x"=16, "y"=16)
	filling_color = "#FFF454"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 20
	nutriment_desc = list("queso" = 10, "spices" = 2, "tomato" = 1)
	taste_tag = list(CHEESE_FOOD, SPICY_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/dip/attackby(obj/item/reagent_containers/food/snacks/item as obj, mob/user as mob)
	. = ..()
	var/obj/item/reagent_containers/food/snacks/returningitem
	if(istype(item,/obj/item/reagent_containers/food/snacks/chip/nacho) && item.icon_state == "chip_nacho")
		returningitem = new nachotrans(src)
	else if (istype(item,/obj/item/reagent_containers/food/snacks/chip) && (item.icon_state == "chip" || item.icon_state == "chip_half"))
		returningitem = new chiptrans(src)
	if(returningitem)
		returningitem.reagents.clear_reagents() //Clear the new chip
		var/memed = 0
		item.reagents.trans_to(returningitem, item.reagents.total_volume) //Old chip to new chip
		if(item.icon_state == "chip_half")
			returningitem.icon_state = "[returningitem.icon_state]_half"
			returningitem.bitesize = Clamp(returningitem.reagents.total_volume,1,10)
		else if(prob(1))
			memed = 1
			to_chat(user, "You scoop up some dip with \the [returningitem], but mid-scoop, \the [returningitem] breaks off into the dreadful abyss of dip, never to be seen again...")
			returningitem.icon_state = "[returningitem.icon_state]_half"
			returningitem.bitesize = Clamp(returningitem.reagents.total_volume,1,10)
		else
			returningitem.bitesize = Clamp(returningitem.reagents.total_volume*0.5,1,10)
		qdel(item)
		reagents.trans_to(returningitem, bitesize) //Dip to new chip
		user.put_in_hands(returningitem)

		if (reagents && reagents.total_volume)
			if(!memed)
				to_chat(user, "You scoop up some dip with \the [returningitem].")
		else
			if(!memed)
				to_chat(user, "You scoop up the remaining dip with \the [returningitem].")
			var/obj/waste = new trash(loc)
			if (loc == user)
				user.put_in_hands(waste)
			qdel(src)

/obj/item/reagent_containers/food/snacks/dip/salsa
	name = "salsa dip"
	desc = "Traditional Solarian chunky salsa dip containing tomatos, peppers, and spices."
	nachotrans = /obj/item/reagent_containers/food/snacks/chip/nacho/salsa
	chiptrans = /obj/item/reagent_containers/food/snacks/chip/salsa
	icon_state = "dip_salsa"
	filling_color = "#FF4D36"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 20
	nutriment_desc = list("salsa" = 20)
	taste_tag = list(VEGAN_FOOD, SPICY_FOOD)

/obj/item/reagent_containers/food/snacks/dip/guac
	name = "guac dip"
	desc = "A recreation of the ancient Solarian 'Guacamole' dip using tofu, limes, and spices."
	nachotrans = /obj/item/reagent_containers/food/snacks/chip/nacho/guac
	chiptrans = /obj/item/reagent_containers/food/snacks/chip/guac
	icon_state = "dip_guac"
	filling_color = "#35961D"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 20
	nutriment_desc = list("guacamole" = 10, "spices" = 2, "citrus" = 1)
	taste_tag = list(VEGAN_FOOD, SPICY_FOOD)

/obj/item/reagent_containers/food/snacks/dip/hummus
	name = "hummus"
	desc = "A savoury Solarian chickpea dip."
	nachotrans = /obj/item/reagent_containers/food/snacks/chip/nacho/hummus
	chiptrans = /obj/item/reagent_containers/food/snacks/chip/hummus
	icon_state = "dip_hummus"
	filling_color = "#cca628"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 20
	nutriment_desc = list("savoury hummus" = 10)
	taste_tag = list(VEGAN_FOOD, SPICY_FOOD)

//
//NON-DIP/NON-CHIP
//
/obj/item/reagent_containers/food/snacks/redcurry
	name = "red curry"
	gender = PLURAL
	desc = "A bowl of creamy red curry with meat and rice. This one looks savory."
	icon_state = "redcurry"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#f73333"
	center_of_mass = list("x"=16, "y"=8)
	bitesize = 3
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 8
	nutriment_desc = list("rice" = 3, "spiced curry" = 10)
	preloaded_reagents = list("protein" = 7, "spacespice" = 2)
	taste_tag = list(MEAT_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/greencurry
	name = "green curry"
	gender = PLURAL
	desc = "A bowl of creamy green curry with tofu, hot peppers and rice. This one looks spicy!"
	icon_state = "greencurry"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#58b76c"
	center_of_mass = list("x"=16, "y"=8)
	bitesize = 3
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 8
	nutriment_desc = list("rice" = 3, "spiced curry" = 10) 
	preloaded_reagents = list("tofu" = 5, "spacespice" = 2, "capsaicin" = 2)
	taste_tag = list(VEGETARIAN_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/yellowcurry
	name = "yellow curry"
	gender = PLURAL
	desc = "A bowl of creamy yellow curry with potatoes, peanuts and rice. This one looks mild."
	icon_state = "yellowcurry"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#bc9509"
	center_of_mass = list("x"=16, "y"=8)
	bitesize = 3
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 8
	nutriment_desc = list("rice" = 2, "curry" = 5, "potato" = 5, "peanuts" = 5)
	preloaded_reagents = list("spacespice" = 2)
	taste_tag = list(VEGETARIAN_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/friedrice
	name = "fried rice"
	gender = PLURAL
	desc = "A less-boring dish of less-boring rice!"
	icon_state = "friedrice"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#FFFBDB"
	center_of_mass = list("x"=17, "y"=11)
	bitesize = 2
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 8
	nutriment_desc = list("rice" = 5, "carrot" = 3)
	preloaded_reagents = list("carrotjuice" = 3, "oculine" = 1)
	taste_tag = list(VEGAN_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/risotto
	name = "risotto"
	gender = PLURAL
	desc = "A creamy, savory rice dish from southern Europe, typically cooked slowly with wine and broth. This one has bits of mushroom."
	icon_state = "risotto"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#edd7d7"
	center_of_mass = list("x"=15, "y"=9)
	bitesize = 2
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 9
	nutriment_desc = list("mushroom" = 10, "spices" = 3)
	preloaded_reagents = list("protein" = 1)
	taste_tag = list(VEGETARIAN_FOOD, SPICY_FOOD, UMAMI_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/risottoballs
	name = "risotto balls"
	gender = PLURAL
	desc = "Mushroom risotto that has been battered and deep fried. The best use of leftovers!"
	icon_state = "risottoballs"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#edd7d7"
	center_of_mass = list("x"=15, "y"=9)
	bitesize = 3
	nutriment_amt = 2
	nutriment_desc = list("mushroom" = 10, "spices" = 3)
	preloaded_reagents = list("protein" = 1, "sodiumchloride" = 1, "blackpepper" = 1)
	taste_tag = list(VEGETARIAN_FOOD, SPICY_FOOD, UMAMI_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/limebowl
	name = "lime rice bowl"
	desc = "A delicious bowl of lime rice."
	icon_state = "lime_rice_bowl"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#FFFBDB"
	bitesize = 2
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 4
	nutriment_desc = list("egg" = 3, "lime" = 5, "rice" = 2)
	preloaded_reagents = list("protein" = 3)
	taste_tag = list(VEGAN_FOOD, BLAND_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/bibimbap
	name = "bibimbap bowl"
	desc = "A traditional Solarian meal of meat and mixed vegetables. It's served on a bed of rice, and topped with a fried egg."
	icon_state = "bibimbap"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#4f2100"
	center_of_mass = list("x"=15, "y"=9)
	bitesize = 4
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 6
	nutriment_desc = list("mushroom" = 8, "carrot" = 3, "rice" = 2)
	preloaded_reagents = list("protein" = 8, "oculine" = 3, "spacespice" = 2)
	taste_tag = list(UMAMI_FOOD, VEGETARIAN_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/lomein
	name = "lo mein"
	gender = PLURAL
	desc = "A popular Solarian noodle dish. Chopsticks optional."
	icon_state = "lomein"
	trash = /obj/item/trash/plate
	filling_color = "#FCEE81"
	center_of_mass = list("x"=16, "y"=10)
	bitesize = 2
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 8
	nutriment_desc = list("mushroom" = 5, "noodles" = 10, "cabbage" = 5)
	preloaded_reagents = list("protein" = 2, "carrotjuice" = 3, "oculine" = 1)
	taste_tag = list(VEGETARIAN_FOOD, UMAMI_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/tortilla
	name = "tortilla"
	desc = "A thin, flour-based tortilla that can be used in a variety of dishes, or can be served as is."
	icon_state = "tortilla"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=16)
	filling_color = "#A66829"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 6
	nutriment_desc = list("tortilla" = 6)
	taste_tag = list(VEGAN_FOOD, BLAND_FOOD)
	cooked = TRUE

//
//Burritos
//

/obj/item/reagent_containers/food/snacks/burrito
	name = "meat burrito"
	desc = "Meat wrapped in a flour tortilla. It's a burrito by definition."
	icon_state = "burrito"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=16)
	filling_color = "#F06451"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 6
	nutriment_desc = list("meat" = 5, "tortilla" = 1)
	preloaded_reagents = list("protein" = 4)
	taste_tag = list(MEAT_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/burrito_vegan
	name = "vegan burrito"
	desc = "Tofu wrapped in a flour tortilla."
	icon_state = "burrito_vegan"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=16)
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 6
	nutriment_desc = list("tofu" = 10, "tortilla" = 5)
	taste_tag = list(VEGAN_FOOD, BLAND_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/burrito_spicy
	name = "spicy meat burrito"
	desc = "Meat and chilis wrapped in a flour tortilla."
	icon_state = "burrito_spicy"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=16)
	filling_color = "#F06451"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 6
	nutriment_desc = list("spiced meat" = 10, "tortilla" = 5)
	preloaded_reagents = list("protein" = 6)
	taste_tag = list(MEAT_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/burrito_cheese
	name = "meat cheese burrito"
	desc = "Meat and melted cheese wrapped in a flour tortilla."
	icon_state = "burrito_cheese"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=16)
	filling_color = "#FFF454"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 6
	nutriment_desc = list("meat" = 5, "cheese" = 5, "tortilla" = 1)
	preloaded_reagents = list("protein" = 6)
	taste_tag = list(MEAT_FOOD, CHEESE_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/burrito_cheese_spicy
	name = "spicy cheese meat burrito"
	desc = "Meat, melted cheese, and chilis wrapped in a flour tortilla."
	icon_state = "burrito_cheese_spicy"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=16)
	filling_color = "#FFF454"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 6
	nutriment_desc = list("meat" = 5, "cheese" = 5, "spices" = 10, "tortilla" = 1)
	preloaded_reagents = list("protein" = 6)
	taste_tag = list(MEAT_FOOD, CHEESE_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/burrito_hell
	name = "el diablo"
	desc = "Meat and an insane amount of chilis packed in a flour tortilla. You may want to get a priest."
	icon_state = "burrito_hell"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=16)
	filling_color = "#F06451"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 24
	nutriment_desc = list("hellfire" = 10, "meat" = 1, "tortilla" = 1)
	preloaded_reagents = list("capsaicin" = 6, "protein" = 6)	//10 chilis is a lot
	taste_tag = list(MEAT_FOOD, SPICY_FOOD)	//if I could put spicy in there more than once I would
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/breakfast_wrap
	name = "breakfast wrap"
	desc = "Bacon, eggs, cheese, and tortilla spiced and grilled to perfection."
	icon_state = "breakfast_wrap"
	bitesize = 4
	center_of_mass = list("x"=16, "y"=16)
	filling_color = "#FFF454"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 6
	nutriment_desc = list("bacon" = 10, "egg" = 5, "cheese" = 5, "spices" = 3, "tortilla" = 1)
	preloaded_reagents = list("capsaicin" = 1)
	taste_tag = list(MEAT_FOOD, CHEESE_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/burrito_mystery
	name = "mystery meat burrito"
	desc = "Is it a burrito? Who knows."
	icon_state = "burrito_mystery"
	bitesize = 5
	center_of_mass = list("x"=16, "y"=16)
	filling_color = "#B042FF"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 6
	nutriment_desc = list("regret" = 10)
	preloaded_reagents = list()
	taste_tag = list(BLAND_FOOD)
	cooked = TRUE

//OTHER

/obj/item/reagent_containers/food/snacks/meatbun
	name = "meat bun"
	desc = "A soft, fluffy flour bun also known as baozi. This one is filled with a spiced meat filling."
	icon_state = "meatbun"
	filling_color = "#edd7d7"
	center_of_mass = list("x"=16, "y"=11)
	bitesize = 5
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 5
	nutriment_desc = list("spiced meat" = 5, "soft bread" = 5)
	preloaded_reagents = list("protein" = 3)
	taste_tag = list(MEAT_FOOD, SPICY_FOOD, FLOURY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/custardbun
	name = "custard bun"
	desc = "A soft, fluffy flour bun also known as baozi. This one is filled with an egg custard."
	icon_state = "meatbun"
	filling_color = "#ebedc2"
	center_of_mass = list("x"=16, "y"=11)
	bitesize = 6
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 5
	nutriment_desc = list("spiced chicken" = 5, "soft bread" = 5)
	preloaded_reagents = list("protein" = 3)
	taste_tag = list(MEAT_FOOD, SPICY_FOOD, FLOURY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chickenmomo
	name = "chicken momo"
	gender = PLURAL
	desc = "A plate of spiced and steamed chicken dumplings."
	icon_state = "momo"
	trash = /obj/item/trash/plate
	filling_color = "#edd7d7"
	center_of_mass = list("x"=15, "y"=9)
	bitesize = 3
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 9
	nutriment_desc = list("spiced meat" = 5, "soft bread" = 5)
	preloaded_reagents = list("protein" = 6, "spacespice" = 2)
	taste_tag = list(MEAT_FOOD, SPICY_FOOD, FLOURY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/veggiemomo
	name = "veggie momo"
	gender = PLURAL
	desc = "A plate of spiced and steamed vegetable dumplings."
	icon_state = "momo"
	trash = /obj/item/trash/plate
	filling_color = "#edd7d7"
	center_of_mass = list("x"=15, "y"=9)
	bitesize = 3
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 9
	nutriment_desc = list("spiced vegetables" = 5, "soft bread" = 5)
	preloaded_reagents = list("protein" = 3, "carrotjuice" = 3, "oculine" = 1)
	taste_tag = list(VEGETARIAN_FOOD, SPICY_FOOD, FLOURY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/roasted_peanut
	name = "roasted peanut"
	desc = "A singular roasted peanut. How peanut-ful."
	icon_state = "roast_peanut"
	bitesize = 2
	filling_color = "#D89E37"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 1
	nutriment_desc = list("roasted peanut" = 5)
	preloaded_reagents = list("protein" = 3)
	taste_tag = list(SALTY_FOOD, VEGAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chipplate/peanuts_bowl
	name = "bowl of roasted peanuts"
	desc = "Peanuts roasted to flavourful and rich perfection."
	icon_state = "roast_peanuts_bowl"
	trash = /obj/item/trash/snack_bowl
	vendingobject = /obj/item/reagent_containers/food/snacks/roasted_peanut
	bitesize = 4
	unitname = "roasted peanut"
	filling_color = "#D89E37"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 4
	nutriment_desc = list("roasted peanut" = 10)
	preloaded_reagents = list("protein" = 15)
	taste_tag = list(SALTY_FOOD, VEGAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/chana_masala
	name = "chana masala"
	desc = "Curried chickpeas on rice."
	icon_state = "chana_masala"
	filling_color = "#C97F02"
	bitesize = 2
	trash = /obj/item/trash/plate
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 8
	nutriment_desc = list("spiced chickpeas" = 10)
	preloaded_reagents = list("rice" = 10, "spacespice" = 2, "capsaicin" = 2)
	taste_tag = list(VEGAN_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/hummus
	name = "hummus"
	desc = "A tasty spread made from chickpeas and sesame seed paste."
	icon_state = "hummus"
	filling_color = "#F1DA96"
	bitesize = 3
	trash = /obj/item/trash/snack_bowl
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 4
	nutriment_desc = list("spiced chickpeas" = 10, "garlic" = 1)
	taste_tag = list(VEGAN_FOOD, SPICY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/bagel
	name = "bagel"
	desc = "Goes great with cream cheese and smoked salmon."
	icon_state = "bagel"
	filling_color = "#F1B45E"
	bitesize = 1
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 2
	nutriment_desc = list("bagel" = 2)
	taste_tag = list(VEGETARIAN_FOOD, BLAND_FOOD)
	cooked = TRUE