/obj/item/weapon/soulextract
	name = "emergency soulcrypt extractor"
	desc = "An device used to extract Soulcrypts from degraded cadavers. \
			Does not function if alternate means of resuscitation are possible to prevent forking incidents."
	icon = 'zzzz_modular_occulus/icons/obj/soultools.dmi'
	icon_state = "extract"
	var/emagged = FALSE

/obj/item/weapon/soulextract/afterattack(atom/A, mob/living/user)
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/person = A
		var/obj/item/weapon/implant/core_implant/soulcrypt/crypt = person.crypt
		if(!crypt)
			to_chat(user, SPAN_WARNING("[person] doesn't have a Soulcrypt to extract."))
			return

		user.visible_message(
			SPAN_DANGER("[user] plunges \the [src] into [person]'s chest!"),
			SPAN_DANGER("You plunge \the [src] into [person]'s chest!")
			)

		if(do_after(user,50,src))

			if(!can_revive(person) || emagged)
				person.visible_message(SPAN_DANGER("[crypt.name] rips through [person]'s [crypt.part]."),\
				SPAN_DANGER("The [crypt.name] rips through your [crypt.part]."))
				playsound(src.loc, 'sound/weapons/bladeslice.ogg', 100, 0)
				crypt.part.take_damage(rand(15,30))
				person.pain(crypt.part, rand(20,40))
				crypt.uninstall()

			else
				to_chat(user, SPAN_NOTICE("Invalid patient state detected! Attempt alternate means of resuscitation first."))
				playsound(src.loc, 'sound/machines/buzz-two.ogg', 50, 0)
				A.visible_message(SPAN_NOTICE("[user] awkwardly pulls \the [src] out of [person]'s chest."),\
				SPAN_NOTICE("You awkwardly pull \the [src] out of [person]'s chest."))

/obj/item/weapon/soulextract/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/card/emag))
		emag_act(user)
	..()

/obj/item/weapon/soulextract/emag_act(mob/user)
	if(!emagged)
		emagged = TRUE
		playsound(loc, "sparks", 75, 1, -1)
		to_chat(user, SPAN_NOTICE("You use the cryptographic sequencer on the [name]. It will now forcibly extract soulcrypts from living persons."))

/obj/item/weapon/soulextract/proc/can_revive(mob/living/carbon/human/H)	//copypasta from defibs
	if(!H.is_dead())
		return TRUE	//counterintuitive but it's needed to make sure the thingy won't work on live people

	var/deadtime = world.time - H.timeofdeath
	if(deadtime > 15 MINUTES && !H.isSynthetic())
		return FALSE

	H.updatehealth()

	if(H.isSynthetic())
		if(H.health + H.getOxyLoss() + H.getToxLoss() <= -100)
			return FALSE

	else if(H.health + H.getOxyLoss() <= -100 || (HUSK in H.mutations))
		return FALSE

	return TRUE
