/obj/item/weapon/implant/carrion_spider/explosive/install()
	..()
	sleep(600) //This is a 1 minute warning. I am varying these quite a lot
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain that slowly fades"))

/obj/item/weapon/implant/carrion_spider/flashbang/install()
	..()
	sleep(3000) //5 minute warning
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain that slowly fades"))

/obj/item/weapon/implant/carrion_spider/infection/install()
	..()
	sleep(50) //5 second warning, This one is kinda important to have feedback   
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain that slowly fades"))

/obj/item/weapon/implant/carrion_spider/breeding/install()
	..()
	sleep(6000) //10 minute warning, It can only activate when a person is dead, so its not high priority
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain that slowly fades"))

/obj/item/weapon/implant/carrion_spider/toxicbomb/install()
	..()
	sleep(600) //1 minute warning, potentially more deadly than an explosive spider, but unreliable
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain that slowly fades"))

/obj/item/weapon/implant/carrion_spider/disruptor/install()
	..()
	sleep(3000) //5 minute warning.
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain followed by an odd electric tingle."))