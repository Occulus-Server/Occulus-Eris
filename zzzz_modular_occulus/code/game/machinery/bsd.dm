//The Bluespace Drive//
//This thing is spoiler heavy. Do not map this or use it WITHOUT MY PERMISSION -Ikky
//Unless you're downstream then I can't stop you.

/obj/structure/bsd
	name = "A Runtime Error"
	desc = "One day you will have to answer for your actions, and God may not be so... forgiving."
	icon = 'zzzz_modular_occulus/icons/obj/bsd.dmi'
	icon_state = "faceofgod"
	density = TRUE
	anchored = TRUE

/obj/structure/bsd/New() //Don't look at it
	START_PROCESSING(SSobj, src)
	..()

/obj/structure/bsd/Process()
	for(var/mob/living/carbon/human/H in oviewers(5, src))
		H.sanity.insight += 0.05
		H.sanity.level -= 30
		H.sanity.environment_cap_coeff = 0
		H.apply_effect(100, IRRADIATE)
		H.adjust_hallucination(120, 30)

/obj/structure/bsd/Destroy()
	STOP_PROCESSING(SSobj, src)
