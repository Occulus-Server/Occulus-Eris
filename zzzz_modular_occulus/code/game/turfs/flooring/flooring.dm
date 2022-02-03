/decl/flooring/tiling
	flags = TURF_HAS_CORNERS | TURF_HAS_INNER_CORNERS | TURF_REMOVE_CROWBAR | TURF_CAN_BREAK | TURF_CAN_BURN | TURF_HIDES_THINGS | TURF_RIPPABLE
	// Added TURF_RIPPABLE to tiling so you can tear off any tiles, but not plating. Doing it the other way around doesn't work.

/decl/flooring/reinforced/plating/under/Entered(mob/living/M)
	for(var/obj/structure/catwalk/C in get_turf(M))
		return

	//BSTs need this or they generate tons of soundspam while flying through the ship
	if(!ishuman(M)|| M.incorporeal_move || !has_gravity(get_turf(M)) || M.stats.getPerk(PERK_NOTRIP)) //This should check if the person has the perk that makes you not trip on underplating
		return
	if(MOVING_QUICKLY(M))//Don't knock them over if they're an engineer?
		if(prob(5))
			M.adjustBruteLoss(5)
			M.slip(null, 6)
			playsound(M, 'sound/effects/bang.ogg', 50, 1)
			to_chat(M, SPAN_WARNING("You tripped over!"))
			return