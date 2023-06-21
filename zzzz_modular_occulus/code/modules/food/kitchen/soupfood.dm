/obj/item/reagent_containers/food/snacks/soup/onion
	name = "onion soup"
	desc = "This better taste good for how long it takes."
	icon_state = "onionsoup"
	filling_color = "#E0C367"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 5
	nutriment_desc = list("onion" = 10, "salt" = 1)
	bitesize = 3
	taste_tag = list(VEGAN_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soup/bluespace
	name = "bluespace tomato soup"
	desc = "Did it just teleport off the spoon? Maybe this isn't a good idea to eat."
	icon_state = "spiral_soup"
	filling_color = "#0066FF"
	bitesize = 3
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 5
	nutriment_desc = list("tomato" = 10, "science gone horribly wrong" = 1)
	preloaded_reagents = list("bluespace_dust" = 5)
	taste_tag = list(VEGAN_FOOD, BLAND_FOOD, SPICY_FOOD)    //bluespace probably tastes spicy
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soup/vegetable
	name = "vegetable soup"
	desc = "Vegetables cooked up in a pot. Surprisingly tasty."
	icon_state = "vegetablesoup"
	filling_color = "#AFC4B5"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 5
	nutriment_desc = list("delicious vegetables" = 10, "broth" = 3)
	preloaded_reagents = list("water" = 5)
	taste_tag = list(SALTY_FOOD, VEGAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soup/nettle
	name = "nettle soup"
	desc = "Tastes like prickly."
	icon_state = "nettlesoup"
	filling_color = "#AFC4B5"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 8
	nutriment_desc = list("tingly" = 1, "vegetable matter" = 10, "salt" = 2)
	preloaded_reagents = list("tricordrazine" = 5, "water" = 5)
	taste_tag = list(VEGAN_FOOD, SPICY_FOOD, SALTY_FOOD)    //the nettle chems probably hurt a bit, hence spicy
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soup/wish
	name = "wish soup"
	desc = "I wish this was soup."
	icon_state = "wishsoup"
	filling_color = "#D1F4FF"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 1
	nutriment_desc = list("water" = 5)
	preloaded_reagents = list("water" = 10)
	taste_tag = list(BLAND_FOOD, VEGAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soup/wish/Initialize()
	. = ..()
	if(prob(25))
		src.desc = "A wish come true!"
		src.nutriment_amt = 5
		src.nutriment_desc += list("something comforting" = 10)

/obj/item/reagent_containers/food/snacks/soup/tomato
	name = "tomato soup"
	desc = "Ordering this without a grilled cheese is against the law on several planets."
	icon_state = "tomatosoup"
	filling_color = "#D92929"
	bitesize = 3
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 5
	nutriment_desc = list("tomato" = 10, "herbs" = 3, "salt" = 1)
	preloaded_reagents = list("tomatojuice" = 10, "water" = 3)
	taste_tag = list(VEGAN_FOOD, SALTY_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soup/blood
	name = "tomato soup"
	desc = "Ordering this without a grilled ch- wait a minute."
	icon_state = "tomatosoup"
	filling_color = "#FF0000"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 5
	nutriment_desc = list("copper" = 10, "tomato?" = 3)
	preloaded_reagents = list("protein" = 2, "blood" = 10, "water" = 5)
	taste_tag = list(MEAT_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soup/slime
	name = "slime soup"
	desc = "If no water is available, you may substitute tears."
	filling_color = "#C4DBA0"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "slimesoup"
	nutriment_amt = 2
	nutriment_desc = list("something slimy" = 10)
	preloaded_reagents = list("slimejelly" = 10, "water" = 10)
	taste_tag = list(VEGETARIAN_FOOD, BLAND_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soup/mystery
	name = "mystery soup"
	desc = "The mystery is, why aren't you eating it?"
	icon_state = "mysterysoup"
	filling_color = "#F082FF"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 1
	nutriment_desc = list()
	preloaded_reagents = list()
	taste_tag = list()
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soup/mystery/Initialize()
	. = ..()
	switch(rand(1,10))
		if(1)
			nutriment_amt = 6
			nutriment_desc = list("something spicy" = 10, "tomato" = 5)
			preloaded_reagents = list("capsaicin" = 3, "tomatojuice" = 2)
			taste_tag = list(VEGAN_FOOD, SPICY_FOOD)
		if(2)
			nutriment_amt = 6
			nutriment_desc = list("cold" = 10, "tomato" = 2)
			preloaded_reagents = list("frostoil" = 3, "tomatojuice" = 2)
			taste_tag = list(VEGAN_FOOD, SPICY_FOOD)
		if(3)
			nutriment_amt = 5
			nutriment_desc = list("water" = 5, "something bitter" = 1)
			preloaded_reagents = list("water" = 5, "tricordrazine" = 5)
			taste_tag = list(VEGAN_FOOD, BLAND_FOOD)
		if(4)
			nutriment_amt = 5
			nutriment_desc = list("water" = 10)
			preloaded_reagents = list("water" = 10)
			taste_tag = list(VEGAN_FOOD, BLAND_FOOD)
		if(5)
			nutriment_amt = 2
			nutriment_desc = list("banana" = 10)
			preloaded_reagents = list("banana" = 10)
			taste_tag = list(VEGAN_FOOD, BLAND_FOOD)
		if(6)
			nutriment_amt = 6
			nutriment_desc = list("copper" = 10)
			preloaded_reagents = list("blood" = 10)
			taste_tag = list(MEAT_FOOD, BLAND_FOOD)
		if(7)
			nutriment_amt = 2
			nutriment_desc = list("something slimy" = 10)
			preloaded_reagents = list("water" = 10, "slimejelly" = 10)
			taste_tag = list(VEGETARIAN_FOOD, BLAND_FOOD)
		if(8)
			nutriment_amt = 4
			nutriment_desc = list("something burnt" = 5, "something disgusting" = 1)
			preloaded_reagents = list("toxin" = 10, "carbon" = 10)
			taste_tag = list(VEGAN_FOOD, SPICY_FOOD)
		if(9)
			nutriment_amt = 5
			nutriment_desc = list("tomatoes" = 10)
			preloaded_reagents = list("tomatojuice" = 10)
			taste_tag = list(VEGAN_FOOD, BLAND_FOOD)
		if(10)
			nutriment_amt = 6
			nutriment_desc = list("tomato" = 10, "carrot" = 2)
			preloaded_reagents = list("tomatojuice" = 5, "oculine" = 5)
			taste_tag = list(VEGAN_FOOD)

/obj/item/reagent_containers/food/snacks/soup/mushroom
	name = "mushroom soup"
	desc = "A delicious and hearty mushroom soup."
	icon_state = "mushroomsoup"
	filling_color = "#E386BF"
	nutriment_amt = 8
	nutriment_desc = list("mushroom" = 10, "cream" = 2)
	taste_tag = list(UMAMI_FOOD, VEGETARIAN_FOOD)
	bitesize = 3
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/soup/mushroom/Initialize()
	. = ..()
	if(prob(10))
		switch(rand(1,3))
			if(1)
				desc = "MUSHROOM, MUSHROOM, SHUT IT!!"
			if(2)
				desc = "ENOUGH about the mushrooms, we all know it's a mushroom, we get it!"
			if(3)
				desc = "Focus, chef, leave the mushrooms alone!"