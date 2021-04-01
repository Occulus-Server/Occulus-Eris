/obj/item/weapon/implant/carrion_spider/injector
	name = "injector spider"
	desc = "A tiny spider with a clear abdomen. Its maw is not but a sharp hypodermic needle."
	icon = 'zzzz_modular_occulus/icons/obj/carrion_spiders.dmi'
	icon_state = "spiderling_injector"
	allow_reagents = TRUE
	reagent_flags = REFILLABLE
	spider_price = 30
	var/volume = 30

/obj/item/weapon/implant/carrion_spider/injector/Initialize()
	create_reagents(volume)

/obj/item/weapon/implant/carrion_spider/injector/activate()
	if(wearer)
		reagents.trans_to_mob(wearer, reagents.total_volume, CHEM_BLOOD)
		to_chat(wearer, "You feel a slight pinch.")
		die()
	else
		to_chat(owner_mob, SPAN_WARNING("[src] doesn't have a host"))