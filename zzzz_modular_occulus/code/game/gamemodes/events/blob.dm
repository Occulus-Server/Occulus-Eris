/obj/effect/blob/proc/MeltFloor(var/turf/T)
	if(!core)
		return
	if(istype(T, /turf/simulated/floor))
		if(prob(25))
			var/turf/simulated/floor/D
			D = T
			D.take_damage(20, BLAST)
			playsound(src.loc, pick('sound/items/Welder.ogg','sound/items/Welder.ogg'), 10, 1)
	for(var/obj/item/A in T)
		if(!A.unacidable)
			if(prob(5))
				visible_message(SPAN_DANGER("Acid melts [A]!"))
				A.ex_act(1)
	for(var/obj/machinery/B in T)
		if(!B.unacidable)
			if(prob(5))
				B.ex_act(1)
				visible_message(SPAN_DANGER("Acid melts [B]!"))
	for(var/obj/structure/C in T)
		if(!C.unacidable)
			if(prob(5))
				C.ex_act(1)
				visible_message(SPAN_DANGER("Acid melts [C]!"))
	if(istype(T, /turf/simulated/open))
		expand(get_turf(locate(T.x, T.y, T.z-1)))
		active = FALSE

/obj/effect/blob/shield/MeltFloor(var/turf/T)
	if(istype(T, /turf/simulated/floor))
		if(prob(10))
			var/turf/simulated/floor/D
			D = T
			D.take_damage(100, BLAST)
			playsound(src.loc, pick('sound/items/Welder.ogg','sound/items/Welder.ogg'), 75, 1)
	..()
/obj/structure/multiz
	unacidable = 1

/obj/machinery/multistructure/bioreactor_part
	unacidable = 1

