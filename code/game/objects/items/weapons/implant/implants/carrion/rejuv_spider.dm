/obj/item/weapon/implant/carrion_spider/rejuv
	name = "rejuvenation spider"
	icon_state = "spiderling_rejuv"
	spider_price = 50

/obj/item/weapon/implant/carrion_spider/rejuv/activate()
	..()
	if(wearer)
		wearer.reagents.add_reagent("kyphotorin", 5)
		to_chat(wearer, SPAN_NOTICE("You feel a pinch and a sudden burning over your limb stumps!"))
		die()
	else
		to_chat(owner_mob, SPAN_WARNING("[src] doesn't have a host"))
