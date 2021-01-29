// Nerfs cruciforms by making them weak against EMPs
/obj/item/weapon/implant/core_implant/cruciform/emp_act()
	if(get_module(CRUCIFORM_INQUISITOR))
		return	//Make inquisitors immune to EMPs. Because they're stronk!

	if(wearer && activated)	// Do we have a wearer, and are we actually functional?
		to_chat(wearer, SPAN_DANGER("Sparks fly out from your cruciform, its power distrupted by an electromagnetic pulse!"))	// Notify them!

		var/datum/effect/effect/system/spark_spread/s = new	//sparks!
		s.set_up(1, 1, wearer.loc)
		s.start()

		power = 0
