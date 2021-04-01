/obj/item/weapon/implant/carrion_spider/friend
	name = "Pheromone spider"
	desc = "A small, brown spiderling. Holding this makes spiders not seem as scary"
	icon_state = "spiderling"
	spider_price = 25
	gene_price = 1 

/obj/item/weapon/implant/carrion_spider/friend/on_install()
	if(wearer)
		wearer.faction = "spiders"

/obj/item/weapon/implant/carrion_spider/friend/activate()
	if(wearer)
		wearer.faction = initial(wearer.faction)
		to_chat(wearer, SPAN_NOTICE("Spiders start to seem scary again"))
		die()
	else
		die()