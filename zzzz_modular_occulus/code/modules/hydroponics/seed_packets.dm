//This is where we put new seed packets for Occulus! These are the ones that go into the vendors and stuff.//

/*
How this works is:
 - First create a need fruit or vegetable seed in the modular "seed_datums.dm"
 - Next create the same seed packet here, by calling it "[whatever you called your seed]seed"
 - Finally set its seed_type to the SEED NAME you created in seed_datums.dm.
   The code will automatically pick whatever fruit icon you set (as long as it's in seed.dmi) and put it on the packet for you. Simple!
If you want to add seeds to the seed vendor in the garden, go add the new seed paths to the vendor in the modular "vending.dm" file.
*/


/obj/item/seeds/blueberryseed
	seed_type = "blueberries"

/obj/item/seeds/strawberryseed
	seed_type = "strawberries"

/obj/item/seeds/pineappleseed
	seed_type = "pineapple"

/obj/item/seeds/cinnamonseed
	seed_type = "cinnamon"

/obj/item/seeds/mintseed
	seed_type = "mint"

