/obj/item/reagent_containers/food/snacks/no_raisin
		nutriment_amt = 5

/obj/item/reagent_containers/food/snacks/proc/update_taste(var/obj/item/reagent_containers/food/snacks/W)//This can be defined under snacks so we can have other foods besides sandwitch call it
	if(!istype(W))//If for some reason something that isn't a snack is put in here, get the heck out
		return
	for(var/currentflavor in W.taste_tag)//We only want one copy of each flavor
		if(currentflavor in taste_tag)
			continue
		taste_tag += currentflavor//Add the flavors

	//Here we remove incompatible flavors

	if(MEAT_FOOD in taste_tag)//If we have meat
		if(VEGETARIAN_FOOD in taste_tag)//and vegetarian
			taste_tag.Remove(VEGETARIAN_FOOD)//remove vegetarian
		if(VEGAN_FOOD in taste_tag)//and vegan
			taste_tag.Remove(VEGAN_FOOD)//remove vegan
	if((CHEESE_FOOD in taste_tag) && (VEGAN_FOOD in taste_tag))//if we have cheese and vegan
		taste_tag.Remove(VEGAN_FOOD)//remove vegan
	var/list/blandremoval = list(COCO_FOOD, SALTY_FOOD, SPICY_FOOD, SWEET_FOOD)//These tags remove  bland
	for(var/notblandflavor in blandremoval)//for each strong flavor
		if(notblandflavor in taste_tag)
			if(BLAND_FOOD in taste_tag)//if we have that flavor and bland
				taste_tag.Remove(BLAND_FOOD)//remove bland
	return
