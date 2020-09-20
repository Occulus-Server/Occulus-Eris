/obj/structure/wire_splicing
	name = "wire splicing"
	desc = "Looks like someone was very drunk when doing this, or just didn't care. This can be removed by wirecutters."
	icon = 'icons/obj/traps.dmi'
	icon_state = "wire_splicing1"
	density = FALSE
	anchored = TRUE
	flags = CONDUCT
	layer = TURF_LAYER + 0.45
	var/messiness = 0 // How bad the splicing was, determines the chance of shock
	var/list/aware_mobs = list() //List of refs of mobs that examined this trap. Won't trigger it when walking. //Syzygy Edit.

/obj/structure/wire_splicing/examine(mob/user)
	..()
	to_chat(user, "It has [messiness] wire[messiness > 1?"s":""] dangling around")

	if(isliving(user) && !("\ref[user]" in aware_mobs))	//Syzygy Edit.
		to_chat(user, SPAN_NOTICE("You're aware of this wire splicing, now. You won't clumsily step on it when walking carefully."))
		aware_mobs |= "\ref[user]"

/obj/structure/wire_splicing/Crossed(AM as mob|obj)
	if(isliving(AM))
		var/mob/living/L = AM
		var/turf/T = get_turf(src)
		var/chance_to_shock = messiness * 10
		chance_to_shock -= L.skill_to_evade_traps(chance_to_shock)
		if(("\ref[L]" in aware_mobs) && MOVING_DELIBERATELY(L))	//Syzygy Edit.
			return ..()
		if(locate(/obj/structure/catwalk) in T)
			chance_to_shock -= 20
		if(prob(chance_to_shock))
			shock(L, FALSE)
