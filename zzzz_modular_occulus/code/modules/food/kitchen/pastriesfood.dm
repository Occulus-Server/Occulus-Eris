/obj/item/reagent_containers/food/snacks/honeybun
	name = "honey bun"
	desc = "A sticky pastry bun glazed with honey."
	icon_state = "honeybun"
	bitesize = 3
	filling_color = "#A66829"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 3
	nutriment_desc = list("sweet pastry" = 1, "honey" = 5)
	preloaded_reagents = list("honey" = 3)
	taste_tag = list(FLOURY_FOOD, SWEET_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/truffle
	name = "chocolate truffle"
	desc = "Rich bite-sized chocolate."
	icon_state = "truffle"
	bitesize = 4
	filling_color = "#9C6b1E"
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_amt = 2
	nutriment_desc = list("truffle" = 1, "chocolate" = 5)
	preloaded_reagents = list("coco" = 6)
	taste_tag = list(COCO_FOOD, SWEET_FOOD, VEGETARIAN_FOOD)
	cooked = TRUE

/obj/item/reagent_containers/food/snacks/truffle/random
	name = "mystery chocolate truffle"
	desc = "Rich bite-sized chocolate with a mystery filling!"

/obj/item/reagent_containers/food/snacks/truffle/random/Initialize()
	. = ..()
	var/reagent_type = pick(list(/datum/reagent/drink/milk/cream,
        /datum/reagent/organic/nutriment/cherryjelly,
        /datum/reagent/organic/nutriment/mint,
        /datum/reagent/organic/frostoil,
        /datum/reagent/organic/capsaicin,
        /datum/reagent/drink/milk/cream,
        /datum/reagent/drink/coffee,
        /datum/reagent/drink/milkshake))
	reagents.add_reagent(reagent_type, 4)

/obj/item/reagent_containers/food/snacks/pie
    name = "banana pie"
    desc = "Banana and sugar."

/obj/item/reagent_containers/food/snacks/plump_pie
	name = "plump pie"
	desc = "I bet you love stuff made out of plump helmets!"
	icon_state = "plump_pie"
	filling_color = "#B8279B"
	bitesize = 2
	center_of_mass = list("x"=17, "y"=9)
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_desc = list("heartiness" = 2, "mushroom" = 3, "pie" = 3)
	nutriment_amt = 8
	cooked = TRUE
	taste_tag = list(SWEET_FOOD, UMAMI_FOOD)
    
/obj/item/reagent_containers/food/snacks/plump_pie/New()
    ..()
    if(prob(10))
        name = "exceptional plump pie"
        desc = "The chef has been taken by a fey mood! They have cooked an exceptional plump pie!"
        reagents.add_reagent("tricordrazine", 5)

/obj/item/reagent_containers/food/snacks/sliceable/keylimepie
	name = "key lime pie"
	desc = "A tart, sweet dessert made of limes from the keys. You know, those keys."
	icon_state = "keylimepie"
	slice_path = /obj/item/reagent_containers/food/snacks/keylimepieslice
	slices_num = 5
	filling_color = "#F5B951"
	center_of_mass = list("x"=16, "y"=10)
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	nutriment_desc = list("pie crust" = 2, "cream" = 3, "tart limes" = 10)
	nutriment_amt = 16
	cooked = TRUE
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD, VEGETARIAN_FOOD)

/obj/item/reagent_containers/food/snacks/keylimepieslice
	name = "slice of key lime pie"
	desc = "A slice of tart pie, with whipped cream on top."
	icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
	icon_state = "keylimepieslice"
	trash = /obj/item/trash/plate
	filling_color = "#F5B951"
	bitesize = 3
	center_of_mass = list("x"=16, "y"=12)
	nutriment_desc = list("pie crust" = 2, "cream" = 3, "tart limes" = 10)
	nutriment_amt = 2.2
	cooked = TRUE
	taste_tag = list(SWEET_FOOD, FLOURY_FOOD, VEGETARIAN_FOOD)