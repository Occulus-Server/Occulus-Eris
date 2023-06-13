//***************//
//---Beverages---//
//***************//

// Juices, soda and similar //

/datum/reagent/water
	price_tag = 0 //We can get infinate amounts of water

/datum/reagent/drink/juice
	price_tag = 1 //We can generate infinate amounts of juice with no effort

/datum/reagent/toxin/poisonberryjuice
	price_tag = 2

/datum/reagent/drink/milk
	price_tag = 2

/datum/reagent/drink/soda
	price_tag = 1 //We can generate infinate amounts of soda with no effort

/datum/reagent/drink/doctor_delight
	price_tag = 3

/datum/reagent/drink/nothing
	price_tag = 4//Actually hard to get. 400cr per bottle

/datum/reagent/drink/milkshake
	price_tag = 4

/datum/reagent/drink/roy_rogers
	price_tag = 2

/datum/reagent/drink/shirley_temple
	price_tag = 2

/datum/reagent/drink/arnold_palmer
	price_tag = 2

/datum/reagent/drink/collins_mix
	price_tag = 2


// Beer //

/datum/reagent/alcohol/ale
	price_tag = 2

/datum/reagent/alcohol/beer
	price_tag = 2


// Hot Drinks //

/datum/reagent/drink/rewriter
	price_tag = 1

/datum/reagent/drink/tea
	price_tag = 1//We can generate infinate amounts of tea with no effort

/datum/reagent/drink/coffee
	price_tag = 1//we can generate infinate amounts of coffee with no effort

/datum/reagent/drink/hot_coco
	price_tag = 1

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

/datum/reagent/alcohol/vodka
	price_tag = 1

/datum/reagent/alcohol/rum
	price_tag = 1

/datum/reagent/alcohol/coffee/kahlua
	price_tag = 1

/datum/reagent/alcohol/bluecuracao
	price_tag = 1

/datum/reagent/alcohol/melonliquor
	price_tag = 1

// Intermediate stuff, up to 50usd//

/datum/reagent/alcohol/gin
	price_tag = 2

/datum/reagent/alcohol/absinthe
	price_tag = 2

/datum/reagent/alcohol/whiskey
	price_tag = 2

/datum/reagent/alcohol/irish_cream
	price_tag = 2

/datum/reagent/alcohol/deadrum
	price_tag = 2

/datum/reagent/alcohol/goldschlager
	price_tag = 2

/datum/reagent/alcohol/coffee/brave_bull // Not an original liquor in its own. But since it's a mix of purely Tequila
	price_tag = 2

// More expensive stuff

/datum/reagent/alcohol/tequilla
	price_tag = 3

/datum/reagent/alcohol/thirteenloko
	price_tag = 3

/datum/reagent/alcohol/specialwhiskey
	price_tag = 3

// VERY expensive stuff

/datum/reagent/alcohol/patron
	price_tag = 4//Silver in it

// Wines //

/datum/reagent/alcohol/wine
	price_tag = 1

/datum/reagent/alcohol/sake
	price_tag = 1

/datum/reagent/alcohol/vermouth
	price_tag = 1

/datum/reagent/alcohol/cognac
	price_tag = 3

/datum/reagent/alcohol/pwine
	price_tag = 4


// Cocktails //
/*
/datum/reagent/alcohol/acid_spit
	price_tag = 40

/datum/reagent/alcohol/alliescocktail
	price_tag = 40

/datum/reagent/alcohol/aloe
	price_tag = 4

/datum/reagent/alcohol/amasec
	price_tag = 4

/datum/reagent/alcohol/andalusia
	price_tag = 4

/datum/reagent/alcohol/antifreeze
	price_tag = 4

/datum/reagent/alcohol/atomicbomb
	price_tag = 4

/datum/reagent/alcohol/coffee/b52
	price_tag = 4

/datum/reagent/alcohol/bahama_mama
	price_tag = 4

/datum/reagent/alcohol/barefoot
	price_tag = 4

/datum/reagent/alcohol/beepsky_smash
	price_tag = 4

/datum/reagent/alcohol/bilk
	price_tag = 4

/datum/reagent/alcohol/black_russian
	price_tag = 4

/datum/reagent/alcohol/bloody_mary
	price_tag = 4

/datum/reagent/alcohol/booger
	price_tag = 4

/datum/reagent/alcohol/brave_bull
	price_tag = 4

/datum/reagent/alcohol/changeling_sting
	price_tag = 4

/datum/reagent/alcohol/martini
	price_tag = 4

/datum/reagent/alcohol/cuba_libre
	price_tag = 4

/datum/reagent/alcohol/demonsblood
	price_tag = 4

/datum/reagent/alcohol/devilskiss
	price_tag = 4

/datum/reagent/alcohol/driestmartini
	price_tag = 4

/datum/reagent/alcohol/ginfizz
	price_tag = 4

/datum/reagent/alcohol/grog
	price_tag = 4

/datum/reagent/alcohol/erikasurprise
	price_tag = 4

/datum/reagent/alcohol/gargle_blaster
	price_tag = 4

/datum/reagent/alcohol/gintonic
	price_tag = 4

/datum/reagent/alcohol/hippies_delight
	price_tag = 4

/datum/reagent/alcohol/hooch
	price_tag = 4

/datum/reagent/alcohol/iced_beer
	price_tag = 4

/datum/reagent/alcohol/irishcarbomb
	price_tag = 4

/datum/reagent/alcohol/coffee/irishcoffee
	price_tag = 4

/datum/reagent/alcohol/longislandicedtea
	price_tag = 4

/datum/reagent/alcohol/manhattan
	price_tag = 4

/datum/reagent/alcohol/manhattan_proj
	price_tag = 4

/datum/reagent/alcohol/manly_dorf
	price_tag = 4

/datum/reagent/alcohol/margarita
	price_tag = 4

/datum/reagent/alcohol/mead
	price_tag = 4

/datum/reagent/alcohol/moonshine
	price_tag = 4

/datum/reagent/alcohol/neurotoxin
	price_tag = 4

/datum/reagent/alcohol/red_mead
	price_tag = 4

/datum/reagent/alcohol/sbiten
	price_tag = 4

/datum/reagent/alcohol/screwdrivercocktail
	price_tag = 4

/datum/reagent/alcohol/silencer
	price_tag = 4

/datum/reagent/alcohol/singulo
	price_tag = 4

/datum/reagent/alcohol/snowwhite
	price_tag = 4

/datum/reagent/alcohol/suidream
	price_tag = 4

/datum/reagent/alcohol/syndicatebomb
	price_tag = 4

/datum/reagent/alcohol/tequillasunrise
	price_tag = 4

/datum/reagent/alcohol/threemileisland
	price_tag = 4

/datum/reagent/alcohol/toxins_special
	price_tag = 4

/datum/reagent/alcohol/vodkamartini
	price_tag = 4

/datum/reagent/alcohol/vodkatonic
	price_tag = 4

/datum/reagent/alcohol/white_russian
	price_tag = 4

/datum/reagent/alcohol/whiskey_cola
	price_tag = 4

/datum/reagent/alcohol/whiskeysoda
	price_tag = 4


// Cocktails without alcohol //

/datum/reagent/alcohol/bananahonk
	price_tag = 3

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
		. += R.volume * R.price_tag

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
