/obj/item/weapon/implant/carrion_spider/mending
	name = "mending spider"
	desc = "A small spider with a vividly red abdomen. A dark medical cross emblazons its facing side"
	icon = 'zzzz_modular_occulus/icons/obj/carrion_spiders.dmi'
	icon_state = "spiderling_mending"
	spider_price = 50
	gene_price = 1

/obj/item/weapon/implant/carrion_spider/mending/activate()
	..()
	if(wearer)
		wearer.reagents.add_reagent("kyphotorin", 5)
		wearer.reagents.add_reagent("ossisine", 5)
		wearer.reagents.add_reagent("meralyne", 5)
		wearer.reagents.add_reagent("dermaline", 5)
		wearer.reagents.add_reagent("stoxin", 10)
		wearer.reagents.add_reagent("imidazoline", 5)
		wearer.reagents.add_reagent("alkysine", 1)
		wearer.reagents.add_reagent("anti_toxin", 5)
		to_chat(wearer, SPAN_NOTICE("You feel exhausted as your body starts to reconstruct"))
		die()
	else
		to_chat(owner_mob, SPAN_WARNING("[src] doesn't have a host"))