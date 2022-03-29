/obj/item/implant/carrion_spider/sleeping
	name = "Narcolepsy spider"
	desc = "A spiderling with a few small chem sacks, occasionally pulsing with a blue chemical"
	icon = 'zzzz_modular_occulus/icons/obj/carrion_spiders.dmi'
	icon_state = "spiderling_sleeping"
	spider_price = 25

/obj/item/implant/carrion_spider/sleeping/activate()
	..()
	if(wearer)
		wearer.reagents.add_reagent("stoxin", 5)
		to_chat(wearer, SPAN_NOTICE("You feel tired and drop into a sleep"))
		sleep(20)
		wearer.reagents.add_reagent("chloralhydrate", 3)
		die()
	else
		to_chat(owner_mob, SPAN_WARNING("[src] doesn't have a host"))
