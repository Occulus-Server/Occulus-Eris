/obj/item/implant/carrion_spider/cleaner
	name = "cleaner spider"
	desc = "A tiny spider with a pearl-white abdomen covered in smooth bubbles."
	icon = 'zzzz_modular_occulus/icons/obj/carrion_spiders.dmi'
	icon_state = "spiderling_cleaner"
	allow_reagents = TRUE
	spider_price = 25
	var/volume = 90

/obj/item/implant/carrion_spider/cleaner/Initialize()
	create_reagents(volume)

/obj/item/implant/carrion_spider/cleaner/activate()
	reagents.add_reagent("surfactant", 40)
	reagents.add_reagent("cleaner", 10)
	reagents.add_reagent("water", 40)
	die()