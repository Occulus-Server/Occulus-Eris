/obj/item/weapon/implant/carrion_spider/explosive/install()
	..()
	spawn(600) //This is a 1 minute warning. I am varying these quite a lot
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain that slowly fades"))

/obj/item/weapon/implant/carrion_spider/flashbang/install()
	..()
	spawn(3000) //5 minute warning
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain that slowly fades"))

/obj/item/weapon/implant/carrion_spider/infection/install()
	..()
	spawn(50) //5 second warning, This one is kinda important to have feedback   
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain that slowly fades"))

/obj/item/weapon/implant/carrion_spider/breeding/install()
	..()
	spawn(6000) //10 minute warning, It can only activate when a person is dead, so its not high priority
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain that slowly fades"))

/obj/item/weapon/implant/carrion_spider/toxicbomb/install()
	..()
	spawn(600) //1 minute warning, potentially more deadly than an explosive spider, but unreliable
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain that slowly fades"))

/obj/item/weapon/implant/carrion_spider/disruptor/install()
	..()
	spawn(3000) //5 minute warning.
	to_chat(wearer, SPAN_WARNING("You feel a sharp stabbing pain followed by an odd electric tingle."))

/obj/item/weapon/implant/carrion_spider/mindboil/Process()
	..()

	if(active)
		if(wearer)
			attack_from = wearer
		else
			attack_from = src
		for(var/mob/living/carbon/human/H in view(5, attack_from))
			if(!H.mind || (H in victims) || (H == owner_mob)) //Occulus Edit
				continue
			H.sanity.onPsyDamage(1) //Half the ammount of mind fryer, can be mass produced
			var/chance_multi = 1
			if(H.stats.getPerk(PERK_EAR_OF_QUICKSILVER))
				chance_multi = 4
			if(prob(5*chance_multi))
				to_chat(H, SPAN_DANGER("You hear chittering and broken whispers scratch at your mind"))
		// Pick up a new contract if there is none
		if(owner_mob && !contract)
			find_contract()