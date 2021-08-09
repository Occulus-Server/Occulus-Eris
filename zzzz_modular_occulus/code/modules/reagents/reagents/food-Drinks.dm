//// Occulus Modular Drinks! Time to add some flavor to our server. Literally ////

///////JUICES///////

/datum/reagent/drink/blueberryjuice
	name = "Blueberry Juice"
	id = "blueberryjuice"
	description = "Used to mix with cocktails, milkshakes or if you just want some refreshing blueberry juice."
	taste_description = "fresh fruity blueberry"
	taste_mult = 1.1
	color = "#4D0121"
	taste_tag = list(TASTE_LIGHT,TASTE_REFRESHING)

	glass_icon_state = "blueberryjuice"
	glass_name = "blueberry juice"
	glass_desc = "Rather simple when it comes to fruit juices, but still refreshing!"

/datum/reagent/drink/pineapplejuice
	name = "Pineapple Juice"
	id = "pineapplejuice"
	description = "Used to mix with cocktails, milkshakes or if you just want a strong \"oomph\" of refreshing sour pineapple juice."
	taste_description = "sour fruity pineapple"
	taste_mult = 1.1
	color = "#E3A603"
	taste_tag = list(TASTE_SOUR,TASTE_REFRESHING)

	glass_icon_state = "pineapplejuice"
	glass_name = "pineapple juice"
	glass_desc = "Very strong and sour, but also very refreshing!"

/datum/reagent/drink/strawberryjuice
	name = "Strawberry Juice"
	id = "strawberryjuice"
	description = "Used to mix with cocktails, milkshakes or if you just want some sweet refreshing strawberry juice."
	taste_description = "sweet fruity strawberry"
	taste_mult = 1.1
	color = "#C20032"
	taste_tag = list(TASTE_SWEET,TASTE_REFRESHING)

	glass_icon_state = "strawberryjuice"
	glass_name = "strawberry juice"
	glass_desc = "Sweet and sugary, but also very refreshing!"

/datum/reagent/drink/pumpkinjuice
	name = "Pumpkin Juice"
	id = "pumpkinjuice"
	description = "Used to mix with cocktails, milkshakes and lattes. Not the most appealing drink by itself however."
	taste_description = "bland pumpkin"
	taste_mult = 0.5
	color = "#EDA529"
	taste_tag = list(TASTE_LIGHT)

	glass_icon_state = "pumpkinjuice"
	glass_name = "pumpkin juice"
	glass_desc = "Pretty bland pumpkin juice by itself. Shouldn't you be mixing this with something?."

/datum/reagent/drink/watermelonjuice
	name = "Watermelon Juice"
	id = "watermelonjuice"
	description = "Delicious juice made from watermelon."
	taste_description = "sweet watermelon"
	color = "#B83333"
	taste_tag = list(TASTE_SWEET, TASTE_REFRESHING) // Make it refreshing. Cus it should be.

	glass_icon_state = "watermelon"
	glass_name = "watermelon juice" // Gave it a new, better sprite.
	glass_desc = "Delicious juice made from watermelon. The perfect drink to match your watermelon swimshorts!"

/datum/reagent/drink/junglejuice
	name = "Jungle Juice"
	id = "junglejuice"
	description = "A very fruity tropical flavour with a mix of sour and sweet fruit juices, cooled to perfection in order to quench the thirst of a hot summer day!"
	taste_description = "a strong mix of many sweet, sour and refreshing tropical fruits"
	color = "#EA5C5C"
	taste_tag = list(TASTE_SWEET, TASTE_STRONG, TASTE_SOUR, TASTE_REFRESHING) //

	glass_icon_state = "junglejuice"
	glass_name = "jungle juice"
	glass_desc = "A very fruity tropical flavour with a mix of sour and sweet fruit juices, cooled to perfection in order to quench the thirst of a hot summer day!"




///////MILKSHAKES///////

/datum/reagent/drink/milkshake/blueberry
	name = "Blueberry Milkshake"
	description = "A sweet blueberry flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	taste_description = "thick creamy blueberry"
	id = "blueberry_milkshake"
	color = "#969CE5"
	adj_temp = -9
	taste_tag = list(TASTE_LIGHT, TASTE_SWEET, TASTE_SLIMEY)

	glass_icon_state = "shake_blueberry"
	glass_name = "Blueberry Milkshake"
	glass_desc = "A sweet blueberry flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milkshake/blueberry/New()
	var/toppings = pick("_solo", "_straw", "_umbr", "_both")
	glass_icon_state += toppings

/datum/reagent/drink/milkshake/pineapple // We have no pineapple fruits.
	name = "Pineapple Milkshake"
	description = "A sweet and strong pineapple flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	taste_description = "strong creamy pineapple"
	id = "pineapple_milkshake"
	color = "#FCFF40"
	adj_temp = -9
	taste_tag = list(TASTE_LIGHT, TASTE_SWEET, TASTE_STRONG, TASTE_SLIMEY)

	glass_icon_state = "shake_pineapple"
	glass_name = "Pineapple Milkshake"
	glass_desc = "A sweet and strong pineapple flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milkshake/pineapple/New()
	var/toppings = pick("_solo", "_straw", "_umbr", "_both")
	glass_icon_state += toppings

/datum/reagent/drink/milkshake/strawberry // We have no strawberry fruits.
	name = "Strawberry Milkshake"
	description = "A sweet sugary strawberry flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	taste_description = "sweet creamy strawberry"
	id = "strawberry_milkshake"
	color = "#FE7F7F"
	adj_temp = -9
	taste_tag = list(TASTE_LIGHT, TASTE_SWEET, TASTE_SLIMEY)

	glass_icon_state = "shake_strawberry"
	glass_name = "Strawberry Milkshake"
	glass_desc = "A sweet sugary strawberry flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milkshake/strawberry/New()
	var/toppings = pick("_solo", "_straw", "_umbr", "_both")
	glass_icon_state += toppings

/datum/reagent/drink/milkshake/chocolate
	name = "Chocolate Milkshake"
	description = "A deep chocolate flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	taste_description = "rich creamy chocolate"
	id = "chocolate_milkshake"
	color = "#81551D"
	adj_temp = -9
	taste_tag = list(TASTE_LIGHT, TASTE_SWEET, TASTE_SLIMEY)

	glass_icon_state = "shake_chocolate"
	glass_name = "Chocolate Milkshake"
	glass_desc = "A deep chocolate flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milkshake/chocolate/New()
	var/toppings = pick("_solo", "_straw", "_umbr", "_both")
	glass_icon_state += toppings

/datum/reagent/drink/milkshake/mintchocolate // We have no mint plants.
	name = "Mint Chocolate Milkshake"
	description = "A refreshing mint chocolate flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	taste_description = "cooling creamy mint chocolate"
	id = "mintchocolate_milkshake"
	color = "#9F7136"
	adj_temp = -9
	taste_tag = list(TASTE_LIGHT, TASTE_SWEET, TASTE_REFRESHING, TASTE_SLIMEY)

	glass_icon_state = "shake_chocolate_mint"
	glass_name = "Mint Chocolate Milkshake"
	glass_desc = "A refreshing mint chocolate flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milkshake/mintchocolate/New()
	var/toppings = pick("_solo", "_straw", "_umbr", "_both")
	glass_icon_state += toppings

/datum/reagent/drink/milkshake/banana
	name = "Banana Milkshake"
	description = "A sweet and gentle banana flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	taste_description = "smooth creamy banana"
	id = "banana_milkshake"
	color = "#FFFD78"
	adj_temp = -9
	taste_tag = list(TASTE_LIGHT, TASTE_SWEET, TASTE_SLIMEY)

	glass_icon_state = "shake_banana"
	glass_name = "Banana Milkshake"
	glass_desc = "A sweet and gentle banana flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milkshake/banana/New()
	var/toppings = pick("_solo", "_straw", "_umbr", "_both")
	glass_icon_state += toppings

/datum/reagent/drink/milkshake/berry
	name = "Berry Milkshake"
	description = "A sweet forest berry flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	taste_description = "fruity creamy berries"
	id = "berry_milkshake"
	color = "#B76B99"
	adj_temp = -9
	taste_tag = list(TASTE_LIGHT, TASTE_SWEET, TASTE_SLIMEY)

	glass_icon_state = "shake_berry"
	glass_name = "Berry Milkshake"
	glass_desc = "A sweet forest berry flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milkshake/berry/New()
	var/toppings = pick("_solo", "_straw", "_umbr", "_both")
	glass_icon_state += toppings

/datum/reagent/drink/milkshake/grape
	name = "Grape Milkshake"
	description = "A very sweet grape flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	taste_description = "very sweet creamy grapes"
	id = "grape_milkshake"
	color = "#9E6ABF"
	adj_temp = -9
	taste_tag = list(TASTE_LIGHT, TASTE_SWEET, TASTE_STRONG, TASTE_SLIMEY)

	glass_icon_state = "shake_grape"
	glass_name = "Grape Milkshake"
	glass_desc = "A very sweet grape flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milkshake/grape/New()
	var/toppings = pick("_solo", "_straw", "_umbr", "_both")
	glass_icon_state += toppings

/datum/reagent/drink/milkshake/watermelon // Requires slices
	name = "Watermelon Milkshake"
	description = "A sweet and subtle watermelon flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	taste_description = "subtle creamy watermelon"
	id = "watermelon_milkshake"
	color = "#FFB1B1"
	adj_temp = -9
	taste_tag = list(TASTE_LIGHT, TASTE_SWEET, TASTE_REFRESHING, TASTE_SLIMEY)

	glass_icon_state = "shake_watermelon"
	glass_name = "Watermelon Milkshake"
	glass_desc = "A sweet and subtle watermelon flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milkshake/watermelon/New()
	var/toppings = pick("_solo", "_straw", "_umbr", "_both")
	glass_icon_state += toppings

/datum/reagent/drink/milkshake/cherry
	name = "Cherry Milkshake"
	description = "A luxuriously sweet cherry flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	taste_description = "luxuriously creamy cherries"
	id = "cherry_milkshake"
	color = "#FF5B5B"
	adj_temp = -9
	taste_tag = list(TASTE_LIGHT, TASTE_SWEET, TASTE_SLIMEY)

	glass_icon_state = "shake_cherry"
	glass_name = "Cherry Milkshake"
	glass_desc = "A luxuriously sweet cherry flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milkshake/cherry/New()
	var/toppings = pick("_solo", "_straw", "_umbr", "_both")
	glass_icon_state += toppings

/datum/reagent/drink/milkshake/pumpkinspice
	name = "Pumpkin Spice Milkshake"
	description = "A sweet pumpkin spice flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth and cinnamon. The perfect drink for a comfortable Autumn day."
	taste_description = "a cold autumn night"
	id = "pumpkinspice_milkshake"
	color = "#CB7D19"
	adj_temp = -9
	taste_tag = list(TASTE_LIGHT, TASTE_SWEET, TASTE_SLIMEY)

	glass_icon_state = "pumpkin_spice"
	glass_name = "Pumpkin Spice Milkshake"
	glass_desc = "A sweet pumpkin spice flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth and cinnamon. The perfect drink for a comfortable Autumn day."
	glass_center_of_mass = list("x"=16, "y"=7)

/datum/reagent/drink/milkshake/junglefruits // A BLAST OF FRUITY FLAVOUR!! Every fruit in one >:3
	name = "Jungle Milkshake"
	description = "A very fruity tropical flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	taste_description = "a strong creamy mix of many sweet, sour and refreshing tropical fruits"
	id = "jungle_milkshake"
	color = "#EA5C5C"
	adj_temp = -9
	taste_tag = list(TASTE_SWEET, TASTE_STRONG, TASTE_SOUR, TASTE_REFRESHING, TASTE_SLIMEY)

	glass_icon_state = "jungle_fruits"
	glass_name = "Jungle Milkshake"
	glass_desc = "A very fruity tropical flavour with a smooth blend of cream and milk, shaken and cooled to perfection in order to guarantee palate satisfaction, all topped with a light layer of froth."
	glass_center_of_mass = list("x"=16, "y"=7)




//////CONDIMENTS//////

/datum/reagent/drink/cinnamonpowder
	name = "Cinnamon Powder"
	id = "cinnamonpowder"
	description = "A common condiment to mix with milkshakes or desserts. Not to be used for challenges."
	taste_description = "dry cinnamon powder"
	taste_mult = 0.5
	color = "#D78F5F"
	taste_tag = list(TASTE_DRY)

	glass_icon_state = "glass_brown"
	glass_name = "cinnamon powder"
	glass_desc = "Pure grinded up cinnamon powder. Delicious when used as a condiment, but a cough hazard when taken by itself."

/datum/reagent/drink/blendedmint
	name = "Blended Mint"
	id = "blendedmint"
	description = "A common condiment to mix with cocktails or other foods. It's just a cup of leaves innit."
	taste_description = "dry mint leaves"
	taste_mult = 0.5
	color = "#98CD49"
	taste_tag = list(TASTE_DRY)

	glass_icon_state = "booger"
	glass_name = "blended mint leaves"
	glass_desc = "Very dry and bland, but with a minty aftertaste! Not the best thing to be \"drinking\" though."




//////COCKTAILS//////

/datum/reagent/drink/mojito
	name = "Mojito"
	id = "mojito"
	description = "A midnight classic, for when you want to feel cool at the beach."
	taste_description = "a perfect blend of refreshing sweet and sour"
	taste_mult = 1.1
	color = "#5DEB47"
	taste_tag = list(TASTE_SWEET, TASTE_SOUR, TASTE_REFRESHING, TASTE_BUBBLY)

	glass_icon_state = "mojito"
	glass_name = "mojito"
	glass_desc = "A splash of rum, soda and lime juice surrounded by a generous serving of crushed ice, topped off with some sugar and fresh mint leaves. The best cocktail to enjoy on the beach or by the pool."




//////OTHERS//////

/datum/reagent/drink/mintchocky
	name = "Mint Chocky"
	id = "mintchocky"
	description = "A minty refreshing take on the classic Chocky."
	taste_description = "minty chocolate milk"
	taste_mult = 1.1
	color = "#9F7136"
	taste_tag = list(TASTE_SWEET, TASTE_REFRESHING)

	glass_icon_state = "mintchocky"
	glass_name = "mint chocky"
	glass_desc = "A minty milk chocolate that can be enjoyed by itself or used in the making of milkshake and ice cream."