//// Occulus Modular Seeds! Time to give our server some more seeds!////

/*
How it works is pretty simple. This is the datum, the data that pretty much tells the game "This is what our seed's stats are.
The way I do most new seeds is copying the watermelon seed (because it's got pretty much every trait), pasting at the bottom and
modifying it as I see fit. The NAME of the seed (e.g., in "/datum/seed/blueberry", "name = blueberries" is the name, not blueberry)
is what the "seed_type" should be if you're making seed packets. It's really fucking stupid, but this code was never good to begin with.

The code automatically makes seed packets based off the fruit's datum stats (as long as the sprite is also in seed.dmi).
Specifically, the product icon and product colour stats.
The product icon and plant icons are based off of "seed.dmi", "hydroponics_growing.dmi", and "hydroponics_products.dmi", so take a look
at those if you want to use an existing sprite and recolour it with the product_colour and plant_colour stats.

Another thing to note is that in hydroponics_products.dmi there are two sets of products. One with `-product` which is the actual fruit you can harvest and eat,
and another without the `-product` which is the sprite that will appear on the plant when it is ready to be harvested. This is very important to keep in mind.

The chems list is for what the product of this seed will give when injested or blended. So keep that in mind too.

Finally, I'm going to make your life easier here. Each new seed has to be given a taste_tag. The list of tastes that can be added to taste_tag can be
found inside the `sanity.dm` file. The same place where you can fine the tastes for drinks!

If you need more examples, there's a TON of them on the original seed_datums.dm file. Go take a look, learn and have fun making new seeds!
*/




//////Existing seeds that need fixing//////

/datum/seed/pumpkin
	name = "pumpkin"
	seed_name = "pumpkin"
	display_name = "pumpkin vine"
	chems = list("nutriment" = list(1,6), "pumpkinjuice" = list(10,6))
	kitchen_tag = "pumpkin"
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/pumpkin/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"vine2") // Fixed product sprite
	set_trait(TRAIT_PRODUCT_COLOUR,"#DC8602") // Fixed colour
	set_trait(TRAIT_PLANT_COLOUR,"#BAE8C1")
	set_trait(TRAIT_PLANT_ICON,"vine2")
	set_trait(TRAIT_WATER_CONSUMPTION, 6)

/datum/seed/watermelon
	name = "watermelon"
	seed_name = "watermelon"
	display_name = "watermelon vine"
	chems = list("nutriment" = list(1,6), "watermelonjuice" = list(10,6))
	kitchen_tag = "watermelon" // Added a kitchen tag.
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/watermelon/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_JUICY,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,1)
	set_trait(TRAIT_PRODUCT_ICON,"vine")
	set_trait(TRAIT_PRODUCT_COLOUR,"#52FF7F") // Fixed colour
	set_trait(TRAIT_PLANT_COLOUR,"#257522")
	set_trait(TRAIT_PLANT_ICON,"vine2")
	set_trait(TRAIT_FLESH_COLOUR,"#F22C2C")
	set_trait(TRAIT_IDEAL_HEAT, 298)
	set_trait(TRAIT_IDEAL_LIGHT, 6)
	set_trait(TRAIT_WATER_CONSUMPTION, 6)

/datum/seed/citrus/lemon
	name = "lemon"
	seed_name = "lemon"
	display_name = "lemon tree" //It's just one tree, not multiple. Removed plural
	chems = list("nutriment" = list(1,20), "lemonjuice" = list(10,20))
	kitchen_tag = "lemon"
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/citrus/lemon/New()
	..()
	set_trait(TRAIT_PRODUCES_POWER,1)
	set_trait(TRAIT_PRODUCT_COLOUR,"#F0E226")
	set_trait(TRAIT_FLESH_COLOUR,"#F0E226")
	set_trait(TRAIT_IDEAL_LIGHT, 6)
	set_trait(TRAIT_PRODUCT_ICON,"lemon") // Fixed product sprite





//////Existing seeds that need to be given a taste//////

// Chili plants/variants.
/datum/seed/chili
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SPICY_FOOD)

/datum/seed/chili/ice
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SPICY_FOOD)

/datum/seed/berry
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/berry/glow
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD, SPICY_FOOD)

/datum/seed/berry/poison
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD, SPICY_FOOD)

/datum/seed/berry/poison/death
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SPICY_FOOD, SALTY_FOOD)

/datum/seed/nettle
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SPICY_FOOD)

/datum/seed/nettle/death
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SPICY_FOOD, SALTY_FOOD)

/datum/seed/tomato/blood
	taste_tag = list(MEAT_FOOD)

/datum/seed/tomato/killer
	taste_tag = list(MEAT_FOOD)

/datum/seed/tomato/blue
	taste_tag = list(VEGETARIAN_FOOD, CHEESE_FOOD)

/datum/seed/eggplant
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, UMAMI_FOOD)

/datum/seed/apple
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/apple/poison
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD, SPICY_FOOD)

/datum/seed/ambrosia
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, UMAMI_FOOD)

/datum/seed/mushroom
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, UMAMI_FOOD)

/datum/seed/mushroom/plump
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, UMAMI_FOOD, SWEET_FOOD)

/datum/seed/mushroom/poison
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, UMAMI_FOOD, SPICY_FOOD)

/datum/seed/mushroom/glowshroom
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, UMAMI_FOOD, SALTY_FOOD)

/datum/seed/grapes
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/peanuts
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, UMAMI_FOOD)

/datum/seed/banana
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/corn
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/soybean
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, UMAMI_FOOD)

/datum/seed/wheat
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, FLOURY_FOOD)

/datum/seed/rice
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, FLOURY_FOOD)

/datum/seed/whitebeets
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/sugarcane
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/citrus
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/cocoa
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, COCO_FOOD)

/datum/seed/cherries
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)





//////New seeds!//////

/datum/seed/blueberry
	name = "blueberries"
	seed_name = "blueberry"
	display_name = "blueberry bush"
	chems = list("nutriment" = list(1,10), "blueberryjuice" = list(10,10))
	kitchen_tag = "blueberries"
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/blueberry/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_JUICY,1)
	set_trait(TRAIT_MATURATION,5)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,2)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"berry")
	set_trait(TRAIT_PRODUCT_COLOUR,"#3BA4EC")
	set_trait(TRAIT_PLANT_ICON,"bush")
	set_trait(TRAIT_IDEAL_HEAT, 298)
	set_trait(TRAIT_IDEAL_LIGHT, 7)
	set_trait(TRAIT_WATER_CONSUMPTION, 6)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.15)

/datum/seed/strawberry
	name = "strawberries"
	seed_name = "strawberry"
	display_name = "strawberry bush"
	chems = list("nutriment" = list(1,10), "strawberryjuice" = list(10,10))
	kitchen_tag = "strawberries"
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/strawberry/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_JUICY,1)
	set_trait(TRAIT_MATURATION,5)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,2)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"strawberry")
	set_trait(TRAIT_PRODUCT_COLOUR,"#FF0606")
	set_trait(TRAIT_PLANT_ICON,"bush")
	set_trait(TRAIT_IDEAL_HEAT, 298)
	set_trait(TRAIT_IDEAL_LIGHT, 7)
	set_trait(TRAIT_WATER_CONSUMPTION, 6)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.15)

/datum/seed/pineapple
	name = "pineapple"
	seed_name = "pineapple"
	display_name = "pineapple shrub"
	chems = list("nutriment" = list(10,20), "pineapplejuice" = list(20,30))
	kitchen_tag = "pineapples"
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SWEET_FOOD)

/datum/seed/pineapple/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,2)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,1)
	set_trait(TRAIT_PRODUCT_ICON,"pineapple")
	set_trait(TRAIT_PRODUCT_COLOUR,"#FBFBFB")
	set_trait(TRAIT_PLANT_COLOUR,"#69AD50")
	set_trait(TRAIT_PLANT_ICON,"pineapple")
	set_trait(TRAIT_IDEAL_HEAT, 298)
	set_trait(TRAIT_IDEAL_LIGHT, 7)
	set_trait(TRAIT_WATER_CONSUMPTION, 6)

/datum/seed/cinnamon
	name = "cinnamon"
	seed_name = "cinnamon"
	display_name = "cinnamon"
	chems = list("cinnamonpowder" = list(6,12))
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SPICY_FOOD) // Spicy as in it's a spice.

/datum/seed/cinnamon/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,3)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,4)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"cinnamon")
	set_trait(TRAIT_PRODUCT_COLOUR,"#e4a073")
	set_trait(TRAIT_PLANT_COLOUR,"#4bbc46")
	set_trait(TRAIT_PLANT_ICON,"stalk3")
	set_trait(TRAIT_IDEAL_HEAT, 298)

/datum/seed/mint
	name = "mint"
	seed_name = "mint"
	display_name = "mint plant"
	chems = list("blendedmint" = list(10,10))
	kitchen_tag = "mint"
	taste_tag = list(VEGETARIAN_FOOD, VEGAN_FOOD, SPICY_FOOD) //Spicy as in it's a spice.

/datum/seed/mint/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,5)
	set_trait(TRAIT_PRODUCT_ICON,"mint")
	set_trait(TRAIT_PRODUCT_COLOUR,"#8AFF24")
	set_trait(TRAIT_PLANT_COLOUR,"#749733")
	set_trait(TRAIT_PLANT_ICON,"mint")
	set_trait(TRAIT_IDEAL_HEAT, 299)
	set_trait(TRAIT_IDEAL_LIGHT, 7)
	set_trait(TRAIT_WATER_CONSUMPTION, 6)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.15)