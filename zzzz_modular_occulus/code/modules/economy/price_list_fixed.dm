//***************//
//---Beverages---//
//***************//

// Juices, soda and similar //

/datum/reagent/water
	price_per_unit = 0 //We can get infinate amounts of water

/datum/reagent/drink/juice
	price_per_unit = 1 //We can generate infinate amounts of juice with no effort

/datum/reagent/toxin/poisonberryjuice
	price_per_unit = 2

/datum/reagent/drink/milk
	price_per_unit = 2

/datum/reagent/drink/soda
	price_per_unit = 1 //We can generate infinate amounts of soda with no effort

/datum/reagent/drink/doctor_delight
	price_per_unit = 3

/datum/reagent/drink/nothing
	price_per_unit = 4//Actually hard to get. 400cr per bottle

/datum/reagent/drink/milkshake
	price_per_unit = 4

/datum/reagent/drink/roy_rogers
	price_per_unit = 2

/datum/reagent/drink/shirley_temple
	price_per_unit = 2

/datum/reagent/drink/arnold_palmer
	price_per_unit = 2

/datum/reagent/drink/collins_mix
	price_per_unit = 2


// Beer //

/datum/reagent/ethanol/ale
	price_per_unit = 2

/datum/reagent/ethanol/beer
	price_per_unit = 2


// Hot Drinks //

/datum/reagent/drink/rewriter
	price_per_unit = 1

/datum/reagent/drink/tea
	price_per_unit = 1//We can generate infinate amounts of tea with no effort

/datum/reagent/drink/coffee
	price_per_unit = 1//we can generate infinate amounts of coffee with no effort

/datum/reagent/drink/hot_coco
	price_per_unit = 1

/obj/item/reagent_containers/food
	price_tag = 10

/obj/item/reagent_containers/food/drinks/coffee
	price_tag = 0//Trash

/obj/item/reagent_containers/food/drinks/tea
	price_tag = 0//It's trash

/obj/item/reagent_containers/food/drinks/h_chocolate
	price_tag = 0//No bottle returns


// Spirituous liquors //
// Cheap Stuff Up to 30usd//

/datum/reagent/ethanol/vodka
	price_per_unit = 1

/datum/reagent/ethanol/rum
	price_per_unit = 1

/datum/reagent/ethanol/coffee/kahlua
	price_per_unit = 1

/datum/reagent/ethanol/bluecuracao
	price_per_unit = 1

/datum/reagent/ethanol/melonliquor
	price_per_unit = 1

// Intermediate stuff, up to 50usd//

/datum/reagent/ethanol/gin
	price_per_unit = 2

/datum/reagent/ethanol/absinthe
	price_per_unit = 2

/datum/reagent/ethanol/whiskey
	price_per_unit = 2

/datum/reagent/ethanol/irish_cream
	price_per_unit = 2

/datum/reagent/ethanol/deadrum
	price_per_unit = 2

/datum/reagent/ethanol/goldschlager
	price_per_unit = 2

/datum/reagent/ethanol/coffee/brave_bull // Not an original liquor in its own. But since it's a mix of purely Tequila
	price_per_unit = 2

// More expensive stuff

/datum/reagent/ethanol/tequilla
	price_per_unit = 3

/datum/reagent/ethanol/thirteenloko
	price_per_unit = 3

/datum/reagent/ethanol/specialwhiskey
	price_per_unit = 3

// VERY expensive stuff

/datum/reagent/ethanol/patron
	price_per_unit = 4//Silver in it

// Wines //

/datum/reagent/ethanol/wine
	price_per_unit = 1

/datum/reagent/ethanol/sake
	price_per_unit = 1

/datum/reagent/ethanol/vermouth
	price_per_unit = 1

/datum/reagent/ethanol/cognac
	price_per_unit = 3

/datum/reagent/ethanol/pwine
	price_per_unit = 4


// Cocktails //
/*
/datum/reagent/ethanol/acid_spit
	price_per_unit = 40

/datum/reagent/ethanol/alliescocktail
	price_per_unit = 40

/datum/reagent/ethanol/aloe
	price_per_unit = 4

/datum/reagent/ethanol/amasec
	price_per_unit = 4

/datum/reagent/ethanol/andalusia
	price_per_unit = 4

/datum/reagent/ethanol/antifreeze
	price_per_unit = 4

/datum/reagent/ethanol/atomicbomb
	price_per_unit = 4

/datum/reagent/ethanol/coffee/b52
	price_per_unit = 4

/datum/reagent/ethanol/bahama_mama
	price_per_unit = 4

/datum/reagent/ethanol/barefoot
	price_per_unit = 4

/datum/reagent/ethanol/beepsky_smash
	price_per_unit = 4

/datum/reagent/ethanol/bilk
	price_per_unit = 4

/datum/reagent/ethanol/black_russian
	price_per_unit = 4

/datum/reagent/ethanol/bloody_mary
	price_per_unit = 4

/datum/reagent/ethanol/booger
	price_per_unit = 4

/datum/reagent/ethanol/brave_bull
	price_per_unit = 4

/datum/reagent/ethanol/changeling_sting
	price_per_unit = 4

/datum/reagent/ethanol/martini
	price_per_unit = 4

/datum/reagent/ethanol/cuba_libre
	price_per_unit = 4

/datum/reagent/ethanol/demonsblood
	price_per_unit = 4

/datum/reagent/ethanol/devilskiss
	price_per_unit = 4

/datum/reagent/ethanol/driestmartini
	price_per_unit = 4

/datum/reagent/ethanol/ginfizz
	price_per_unit = 4

/datum/reagent/ethanol/grog
	price_per_unit = 4

/datum/reagent/ethanol/erikasurprise
	price_per_unit = 4

/datum/reagent/ethanol/gargle_blaster
	price_per_unit = 4

/datum/reagent/ethanol/gintonic
	price_per_unit = 4

/datum/reagent/ethanol/hippies_delight
	price_per_unit = 4

/datum/reagent/ethanol/hooch
	price_per_unit = 4

/datum/reagent/ethanol/iced_beer
	price_per_unit = 4

/datum/reagent/ethanol/irishcarbomb
	price_per_unit = 4

/datum/reagent/ethanol/coffee/irishcoffee
	price_per_unit = 4

/datum/reagent/ethanol/longislandicedtea
	price_per_unit = 4

/datum/reagent/ethanol/manhattan
	price_per_unit = 4

/datum/reagent/ethanol/manhattan_proj
	price_per_unit = 4

/datum/reagent/ethanol/manly_dorf
	price_per_unit = 4

/datum/reagent/ethanol/margarita
	price_per_unit = 4

/datum/reagent/ethanol/mead
	price_per_unit = 4

/datum/reagent/ethanol/moonshine
	price_per_unit = 4

/datum/reagent/ethanol/neurotoxin
	price_per_unit = 4

/datum/reagent/ethanol/red_mead
	price_per_unit = 4

/datum/reagent/ethanol/sbiten
	price_per_unit = 4

/datum/reagent/ethanol/screwdrivercocktail
	price_per_unit = 4

/datum/reagent/ethanol/silencer
	price_per_unit = 4

/datum/reagent/ethanol/singulo
	price_per_unit = 4

/datum/reagent/ethanol/snowwhite
	price_per_unit = 4

/datum/reagent/ethanol/suidream
	price_per_unit = 4

/datum/reagent/ethanol/syndicatebomb
	price_per_unit = 4

/datum/reagent/ethanol/tequillasunrise
	price_per_unit = 4

/datum/reagent/ethanol/threemileisland
	price_per_unit = 4

/datum/reagent/ethanol/toxins_special
	price_per_unit = 4

/datum/reagent/ethanol/vodkamartini
	price_per_unit = 4

/datum/reagent/ethanol/vodkatonic
	price_per_unit = 4

/datum/reagent/ethanol/white_russian
	price_per_unit = 4

/datum/reagent/ethanol/whiskey_cola
	price_per_unit = 4

/datum/reagent/ethanol/whiskeysoda
	price_per_unit = 4


// Cocktails without alcohol //

/datum/reagent/ethanol/bananahonk
	price_per_unit = 3

*/

// From the machine //

/obj/item/reagent_containers/food/drinks/cans/cola
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/dr_gibb
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/starkist
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/waterbottle
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/space_up
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/iced_tea
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/grape_juice
	price_tag = 1


//*****************//
//--Bottle Return--//
//*****************//

// Juices, soda and similar //

/obj/item/reagent_containers/food/drinks/bottle/cola
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/space_up
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/space_mountain_wind
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/orangejuice
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/cream
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/tomatojuice
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/limejuice
	price_tag = 10


// Beer //

/obj/item/reagent_containers/food/drinks/bottle/small/beer
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/small/ale
	price_tag = 10


// Spirituous Liquors //

/obj/item/reagent_containers/food/drinks/bottle/absinthe
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/bluecuracao
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/gin
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/kahlua
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/melonliquor
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/rum
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/tequilla
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/vodka
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/whiskey
	price_tag = 10


/obj/item/reagent_containers/food/drinks/bottle/patron
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/goldschlager
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing
	price_tag = 10

/obj/item/reagent_containers/food/drinks/bottle/grenadine
	price_tag = 10


// Wines //

/obj/item/reagent_containers/food/drinks/bottle/wine
	price_tag = 20

/obj/item/reagent_containers/food/drinks/bottle/cognac
	price_tag = 20

/obj/item/reagent_containers/food/drinks/bottle/vermouth
	price_tag = 20

/obj/item/reagent_containers/food/drinks/bottle/pwine
	price_tag = 20

/obj/item/reagent_containers/get_item_cost(export)
	. = ..()
	if(!reagents)
		return
	for(var/datum/reagent/R in reagents.reagent_list)
		. += R.volume * R.price_per_unit

/obj/item/tool/
	price_tag = 5 //THIS IS MULTIPLIED BY (TOTAL TOOL_QUALITIES/5+1)
/obj/item/ammo_casing/
	price_tag = 2

/obj/item/clothing/head/space
	price_tag = 100
/obj/item/clothing/head/space/void/medical
	price_tag = 150
/obj/item/clothing/head/space/void/agrolyte
	price_tag = 150
/obj/item/clothing/head/space/void/custodian
	price_tag = 150
/obj/item/clothing/head/space/void/acolyte
	price_tag = 150
/obj/item/clothing/head/space/void/engineering
	price_tag = 200
/obj/item/clothing/head/space/void/atmos
	price_tag = 200
/obj/item/clothing/head/space/void/mining
	price_tag = 250
/obj/item/clothing/head/space/void/security
	price_tag = 250
/obj/item/clothing/head/space/void/science
	price_tag = 250
/obj/item/clothing/head/space/void/merc
	price_tag = 300
/obj/item/clothing/head/space/void/SCAF
	price_tag = 300
/obj/item/clothing/head/space/void/wizard
	price_tag = 2500
/obj/item/clothing/head/space/void/excelsior
	price_tag = 50
/obj/item/clothing/head/space/capspace
	price_tag = 1000

/obj/item/clothing/suit/space
	price_tag = 600
/obj/item/clothing/suit/space/void/agrolyte
	price_tag = 900
/obj/item/clothing/suit/space/void/custodian
	price_tag = 900
/obj/item/clothing/suit/space/void/medical
	price_tag = 900
/obj/item/clothing/suit/space/void/acolyte
	price_tag = 900
/obj/item/clothing/suit/space/void/engineering
	price_tag = 1200
/obj/item/clothing/suit/space/void/atmos
	price_tag = 1200
/obj/item/clothing/suit/space/void/mining
	price_tag = 1500
/obj/item/clothing/suit/space/void/security
	price_tag = 1500
/obj/item/clothing/suit/space/void/science
	price_tag = 1500
/obj/item/clothing/suit/space/void/captain
	price_tag = 1500
/obj/item/clothing/suit/space/void/merc
	price_tag = 1800
/obj/item/clothing/suit/space/void/SCAF
	price_tag = 1800
/obj/item/clothing/suit/space/void/wizard
	price_tag = 12000 //Basically won't spawn and super rare. Also covered in gems
/obj/item/clothing/suit/space/void/excelsior
	price_tag = 300

/obj/item/rig
	price_tag = 3000
