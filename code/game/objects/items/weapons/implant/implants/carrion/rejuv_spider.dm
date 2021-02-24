/obj/item/weapon/implant/carrion_spider/rejuv
	name = "rejuvenation spider"
	icon_state = "spiderling_rejuv"
	spider_price = 50

/obj/item/weapon/implant/carrion_spider/rejuv/activate()
	..()
	if(wearer)
		wearer.reagents.add_reagent("kyphotorin", 5)
		wearer.reagents.add_reagent("ossisine", 5)
		wearer.reagents.add_reagent("meralyne", 5)
		wearer.reagents.add_reagent("dermaline", 5)
		wearer.reagents.add_reagent("stoxin", 10) //This is roughly 3.5-3.75 minutes.. Fairly inline for Infection spider
		wearer.reagents.add_reagent("imidazoline", 5)
		wearer.reagents.add_reagent("alkysine", 5)
		wearer.reagents.add_reagent("anti_toxin", 5)
		to_chat(wearer, SPAN_NOTICE("You feel a pinch and a sudden onset of tiredness"))
		die()
	else
		to_chat(owner_mob, SPAN_WARNING("[src] doesn't have a host"))
