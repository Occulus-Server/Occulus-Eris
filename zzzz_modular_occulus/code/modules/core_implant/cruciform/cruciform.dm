/obj/item/weapon/implant/core_implant/cruciform
	power_regen = 0.25 //Voted by community.

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

//Replacement for the proc over on Eris. Recovers 0.25 base power, increases by 0.01 per point of cog up to 1

/obj/item/weapon/implant/core_implant/cruciform/auto_restore_power()
	if(power >= max_power)
		power = max_power
		return
	var/true_power_regen = power_regen
	true_power_regen += max(0, min(0.75, wearer.stats.getStat(STAT_COG)/100))
	restore_power(true_power_regen)