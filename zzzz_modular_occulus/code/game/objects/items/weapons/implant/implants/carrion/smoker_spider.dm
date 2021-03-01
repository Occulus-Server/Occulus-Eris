/obj/item/weapon/implant/carrion_spider/smoker
	name = "smoker spider"
	desc = "A tiny spider with a pearl-white abdomen covered in smooth bubbles."
	icon = 'zzzz_modular_occulus/icons/obj/carrion_spiders.dmi'
	icon_state = "spiderling_mending"
	allow_reagents = TRUE
	reagent_flags = REFILLABLE
	spider_price = 10
	var/volume = 30

/obj/item/weapon/implant/carrion_spider/smoker/Initialize()
	create_reagents(volume)

/obj/item/weapon/implant/carrion_spider/smoker/activate()
	reagents.add_reagent("phosphorus", 60)
	reagents.add_reagent("sugar", 60)
	reagents.add_reagent("potassium", 60)
	die()