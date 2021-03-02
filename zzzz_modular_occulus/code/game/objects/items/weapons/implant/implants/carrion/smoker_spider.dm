/obj/item/weapon/implant/carrion_spider/smoker
	name = "smoker spider"
	desc = "A tiny spider with a pearl-white abdomen covered in smooth bubbles."
	icon = 'zzzz_modular_occulus/icons/obj/carrion_spiders.dmi'
	icon_state = "spiderling_smoker"
	spider_price = 10
	var/datum/effect/effect/system/smoke_spread/bad/smoke

/obj/item/weapon/implant/carrion_spider/smoker/New()
	..()
	smoke = new
	smoke.attach(src)

/ob	j/item/weapon/implant/carrion_spider/smoker/Destroy()
	qdel(smoke)
	smoke = null
	return ..()


/obj/item/weapon/implant/carrion_spider/smoker/activate()
	playsound(loc, 'sound/effects/smoke.ogg', 50, 1, -3)
	smoke.set_up(10, 0, usr.loc)
	spawn(0)
		smoke.start()
		sleep(10)
		smoke.start()
		sleep(10)
		smoke.start()
		sleep(10)
		smoke.start()
		die()