/obj/item/weapon/access_update_tool
	name = "soulcrypt access updater"
	desc = "A device used to update access for someone's soulcrypt."
	icon = 'zzzz_modular_occulus/icons/obj/soultools.dmi'
	icon_state = "updater"

	var/obj/item/weapon/card/id/card //Our current ID card. We copy access from this.

/obj/item/weapon/access_update_tool/examine(mob/user)
	. = ..()
	if(card)
		to_chat(user, SPAN_NOTICE("It appears to have an ID card in it's ID card port."))


/obj/item/weapon/access_update_tool/attackby(obj/item/I, mob/user as mob)
	if(card)	//haha it was deleting pre-existing IDs if you try to insert one while there was one in it
		to_chat(user, SPAN_WARNING("There's already an ID in the card port!"))
		return

	if(istype(I, /obj/item/weapon/card/id))
		to_chat(user, SPAN_NOTICE("You slot the [I] into [src]'s ID card port."))
		user.drop_item()
		I.forceMove(src)
		card = I
		playsound(loc, 'sound/machines/id_swipe.ogg', 100, 1)
		update_icon()

/obj/item/weapon/access_update_tool/attack_self(mob/user)
	if(card)
		to_chat(user, SPAN_NOTICE("You remove the ID card from [src]'s ID card port."))
		user.put_in_hands(card)
		card = null
		playsound(loc, 'sound/machines/id_swipe.ogg', 100, 1)
		update_icon()

/obj/item/weapon/access_update_tool/AltClick(var/mob/user)
	if(!CanPhysicallyInteract(user))
		return
	if(card)
		to_chat(user, SPAN_NOTICE("You remove the ID card from [src]'s ID card port."))
		user.put_in_hands(card)
		card = null
		playsound(loc, 'sound/machines/id_swipe.ogg', 100, 1)
		update_icon()

/obj/item/weapon/access_update_tool/afterattack(atom/A, mob/living/user)
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/person = A
		var/obj/item/weapon/implant/core_implant/soulcrypt/crypt = person.crypt
		if(!crypt)
			to_chat(user, SPAN_WARNING("[person] doesn't have a Soulcrypt to modify."))
			return
		if(!card)	//haha it was runtiming if you didn't put a card in
			to_chat(user, SPAN_WARNING("There's no ID in the card port to copy access from!"))
			return
		//Else, we overwrite the soulcrypt's current access with the access on the ID card.
		crypt.access.Cut()
		for(var/x in card.access)
			crypt.access += x
		to_chat(user, SPAN_NOTICE("Access upload completed!"))
		playsound(loc, 'sound/machines/chime.ogg', 50, 1)
		crypt.send_host_message("Access transponder code upload completed.")

/obj/item/weapon/access_update_tool/update_icon()
	..()
	if(card)
		icon_state = "updater-card"
	else
		icon_state = "updater"
