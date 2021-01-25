/obj/item/weapon/soulmanip
	name = "soulcrypt manipulation tool"
	desc = "A device used to repair Soulcrypts, or extract them from cadavers."
	icon = 'zzzz_modular_occulus/icons/obj/soultools.dmi'
	icon_state = "repair"
	var/emagged = FALSE

/obj/item/weapon/soulmanip/afterattack(atom/A, mob/living/user)
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/person = A
		var/obj/item/weapon/implant/core_implant/soulcrypt/crypt = person.crypt
		if(!crypt)
			to_chat(user, SPAN_WARNING("[person] doesn't have a Soulcrypt to manipulate."))
			return

		user.visible_message(
			SPAN_DANGER("[user] plunges \the [src] into [person]'s chest!"),
			SPAN_DANGER("You plunge \the [src] into [person]'s chest!")
			)
		if(do_after(user,50,src))

			if(person.is_dead() || emagged)
				person.visible_message(SPAN_DANGER("[crypt.name] rips through [person]'s [crypt.part]."),\
				SPAN_DANGER("The [crypt.name] rips through your [crypt.part]."))
				playsound(src.loc, 'sound/weapons/bladeslice.ogg', 100, 0)
				crypt.part.take_damage(rand(15,30))
				person.pain(crypt.part, rand(20,40))
				crypt.uninstall()

			else
				if(!user.stat_check(STAT_COG, STAT_LEVEL_BASIC))
					to_chat(user, SPAN_NOTICE("You have no idea how to repair a Soulcrypt!"))
					A.visible_message(SPAN_NOTICE("[user] awkwardly pulls \the [src] out of [person]'s chest."),\
					SPAN_NOTICE("You awkwardly pull \the [src] out of [person]'s chest."))
				else if(crypt.integrity < crypt.max_integrity)
					var/amount_to_repair = rand(1,5) + (user.stats.getStat(STAT_BIO)/10) + (user.stats.getStat(STAT_COG)/5) + (user.stats.getStat(STAT_MEC)/10)
					crypt.integrity = between(0, crypt.integrity + amount_to_repair, crypt.max_integrity)
					to_chat(user, SPAN_NOTICE("Restored [amount_to_repair]% integrity!"))
					if(user.stat_check(STAT_COG, STAT_LEVEL_EXPERT) && crypt.was_emp)
						crypt.was_emp = FALSE
						to_chat(user, SPAN_NOTICE("Soulcrypt EMP damage repaired."))
					if (crypt.integrity == crypt.max_integrity)
						to_chat(user, SPAN_NOTICE("Soulcrypt fully repaired!"))
						playsound(src.loc, 'sound/machines/ping.ogg', 50, 0)
				else
					to_chat(user, SPAN_NOTICE("No Soulcrypt damage detected!"))
					playsound(src.loc, 'sound/machines/twobeep.ogg', 50, 0)


/obj/item/weapon/soulmanip/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/card/emag))
		emag_act(user)

	..()

/obj/item/weapon/soulmanip/emag_act(mob/user)
	if(!emagged)
		emagged = TRUE
		playsound(loc, "sparks", 75, 1, -1)
		to_chat(user, SPAN_NOTICE("You use the cryptographic sequencer on the [name]. It will now forcibly extract soulcrypts."))
