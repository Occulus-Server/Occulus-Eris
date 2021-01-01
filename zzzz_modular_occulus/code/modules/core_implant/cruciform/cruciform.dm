// Nerfs cruciforms by making them weak against EMPs
/obj/item/weapon/implant/core_implant/cruciform/emp_act()
	if(get_module(CRUCIFORM_INQUISITOR))
		return	//Make inquisitors immune to EMPs. Would be pretty anticlimatic for an antag to just keel over from a single shot/grenade.

	if(wearer && activated)	// Do we have a wearer, and are we actually functional?
		to_chat(wearer, SPAN_DANGER("An agonizing jolt of electricity runs through you, the Cruciform in your chest malfunctioning!"))	// Notify them!

		var/datum/effect/effect/system/spark_spread/s = new	//sparks!
		s.set_up(1, 1, wearer.loc)
		s.start()

		if(max_power > 0) // Do we have more than 0 max energy (i.e. have not been EMP'd yet?)
			wearer.apply_effect(50, AGONY, 0)	// Pain!
			wearer.Weaken(10)	// 10 second hard stun
			power = 0
			max_power = 0	// The important bit. Basically disables cruciforms when EMP'd.

		else	// If we already got EMP'd...
			wearer.apply_effect(10, AGONY, 0)	// Just get some minor pain
