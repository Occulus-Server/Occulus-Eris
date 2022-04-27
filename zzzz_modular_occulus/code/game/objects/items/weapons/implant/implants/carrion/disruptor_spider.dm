/obj/item/implant/carrion_spider/disruptor
	name = "Disruptor spider"
	desc = "A small, brown spiderling. Holding this makes spiders not seem as scary"
	icon = 'zzzz_modular_occulus/icons/obj/carrion_spiders.dmi'
	icon_state = "spiderling_disruptor"
	spider_price = 30

/obj/item/implant/carrion_spider/disruptor/activate()
	..()
	empulse(src, 2, 1)
	die()