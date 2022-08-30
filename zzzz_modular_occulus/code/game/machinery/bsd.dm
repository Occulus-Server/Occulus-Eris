//The Bluespace Drive//
//This thing is spoiler heavy. Do not map this or use it WITHOUT MY PERMISSION -Ikky
//Unless you're downstream then I can't stop you.

/obj/machinery/bsd
	name = "A Runtime Error"
	desc = "One day you will have to answer for your actions, and God may not be so... forgiving."
	icon = 'zzzz_modular_occulus/icons/obj/bsd.dmi'
	icon_state = "faceofgod"
	density = TRUE
	anchored = TRUE
	use_power = NO_POWER_USE
	unacidable = TRUE

/obj/machinery/bsd/ex_act(severity, target) //immune to explosions. Make this do very bad things later.
	return

/obj/machinery/bsd/New() //Don't look at it
	bound_width = world.icon_size*2
	bound_height = world.icon_size*2
	..()

/obj/machinery/bsd/Process()
	for(var/mob/living/carbon/human/H in oviewers(5, src))
		H.apply_effect(30, IRRADIATE) //Radiation suits should protect from this.
		if(H.glasses && istype(H.glasses, /obj/item/clothing/glasses/powered))
			if(prob(0.01))
				to_chat(H, "You feel uneasy.")
		else
			H.adjust_hallucination(10, 10)
			H.sanity.onPsyDamage(5)
			if(prob(1))
				to_chat(H, pick("Your teeth itch.", "Your eye twitches.", "Your mouth is dry.", "Everything is wrong."))

	..()

/obj/machinery/bsd/attackby(obj/item/I, mob/user)
	..()
	user.visible_message(SPAN_NOTICE("[user] hits [src] with [I] and disappears!"), SPAN_NOTICE("You hit [src] with [I] and disappear!"))
	user.drop_item()
	go_to_bluespace(get_turf(src), 8, TRUE, I, src, aprecision=16)
	go_to_bluespace(get_turf(src), 8, TRUE, user, src, aprecision=16)


/obj/machinery/bsd/attack_hand(mob/user)
	..()
	if(user.a_intent == I_HURT)
		user.visible_message(SPAN_NOTICE("[user] hits [src] and disappears!"), SPAN_NOTICE("You hit [src] and disappear!"))
		go_to_bluespace(get_turf(src), 8, TRUE, user, src, aprecision=16)

/obj/machinery/bsd/hitby(AM as mob|obj)
	..()
	if(ismob(AM) || isobj(AM))
		visible_message(SPAN_DANGER("[AM] strikes [src] and disappears!"))
		go_to_bluespace(get_turf(src), 8, TRUE, AM, src, aprecision=16)


