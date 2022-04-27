/mob/living/carbon/superior_animal/roach/UnarmedAttack(var/atom/A, var/proximity)//Occulus Edit Start - This whole file is filled with our edits. Ergo I'm marking the whole thing as an Occulus Edit. Do not blindly merge anything into this.
	if(isliving(A))
		var/mob/living/L = A
		var/mob/living/carbon/human/H
		if(ishuman(L))
			H = L
		if(H)
			var/obj/item/reagent_containers/food/snacks/grown/howdoitameahorseinminecraft = H.get_active_hand()
			if(istype(howdoitameahorseinminecraft))
				if(try_tame(H, howdoitameahorseinminecraft))
					return FALSE //If they manage to tame the roach, stop the attack
		if(istype(L) && !L.weakened && ((prob(13) && src.density) || prob(2))) //OCCULUS EDIT - Dense roaches get almost 3x knockdown chance, others get halved chance
			if(H && H.has_shield())
				L.visible_message(SPAN_DANGER("\the [src] tried to knock down \the [L]! But [L] blocks \the [src] attack!"))
			else if(H && (H.stats.getStat(STAT_TGH) > 60)) //OCCULUS EDIT - Having 60+ TGH now nullifies roach knockdowns
				L.visible_message(SPAN_DANGER("\the [src] tried to knock down \the [L]! But [L] throws them off!")) //OCCULUS EDIT
			else
				L.Weaken(3)
				L.visible_message(SPAN_DANGER("\the [src] knocks down \the [L]!"))

	. = ..()//Occulus Edit End
