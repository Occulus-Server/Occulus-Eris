/obj/item/reagent_containers/food/snacks/croissant
    name = "croissant"
    desc = "A Sol delicacy, as long as the butter didn't leak out."
    icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
    icon_state = "croissant"
    filling_color = "#E3D796"
    nutriment_amt = 4
    nutriment_desc = list("buttery pastry" = 10)
    bitesize = 2
    taste_tag = list(SWEET_FOOD, FLOURY_FOOD, VEGETARIAN_FOOD)
    cooked = TRUE

/obj/item/reagent_containers/food/snacks/poppypretzel
    name = "poppy pretzel"
    desc = "A dough knot with added poppy seeds."
    icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
    icon_state = "poppypretzel"
    filling_color = "#916E36"
    nutriment_amt = 5
    nutriment_desc = list("salty pretzel" = 10, "poppyseed" = 5)
    bitesize = 2
    taste_tag = list(SALTY_FOOD, FLOURY_FOOD, VEGETARIAN_FOOD)
    cooked = TRUE

/obj/item/reagent_containers/food/snacks/unbakedloaf
    name = "raw loaf of bread"
    desc = "An unbaked loaf of bread."
    icon = 'zzzz_modular_occulus/icons/obj/kitchen_update/food.dmi'
    icon_state = "unbakedloaf"
    filling_color = "#f1dd9b"
    nutriment_amt = 4 
    nutriment_desc = list("raw dough" = 10, "salt" = 5)
    preloaded_reagents = list("protein" = 1, "nutriment" = 4)
    bitesize = 2
    taste_tag = list(BLAND_FOOD, FLOURY_FOOD, VEGETARIAN_FOOD)
    cooked = FALSE