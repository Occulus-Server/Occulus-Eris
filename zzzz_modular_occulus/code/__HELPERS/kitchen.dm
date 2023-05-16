//This file basically has helpers for determining the temps of things in kitchen machines.

/datum/reagent/proc/get_thermal_fraction(var/datum/reagents/holder)
	return get_heat_capacity(holder)/holder.get_heat_capacity()

/datum/reagent/proc/get_thermal_energy(var/datum/reagents/holder)
	return (holder.chem_temp * get_thermal_fraction(holder))

/datum/reagent/proc/set_thermal_energy(amount, var/datum/reagents/holder, safety = FALSE)
	var/delta = amount/get_thermal_fraction(holder) - holder.chem_temp
	if(!round(delta, 1))
		return
	holder.add_thermal_energy(delta, safety)	//Handles on_heat_change

/datum/reagent/proc/add_thermal_energy(amount, var/datum/reagents/holder, safety = FALSE)
	holder.add_thermal_energy(amount, safety)

datum/reagent/proc/set_temperature(temperature, var/datum/reagents/holder, safety = FALSE)
	set_thermal_energy(temperature * get_heat_capacity(holder), holder, safety = safety)

/datum/reagents/proc/get_heat_capacity(var/datum/reagents/holder)
	. = 0
	for(var/_R in reagent_list)
		var/datum/reagent/R = new _R
		. += R.get_heat_capacity()

/datum/reagent/proc/get_heat_capacity(var/datum/reagents/holder)
	return SPECIFIC_HEAT_DEFAULT * (holder?.reagent_list && holder.reagent_list[holder.type])	//Occ edit, we don't have specific heat for some reason.
/*
/datum/reagents/proc/get_temperature()
	var/HC = get_heat_capacity()
	var/TE = chem_temp
	if(HC && TE)
		return TE / HC
	else
		return T20C
*/
/datum/reagents/proc/get_thermal_energy_change(old_temperature, new_temperature)
	return get_heat_capacity()*(max(new_temperature, TCMB) - old_temperature)

/datum/reagents/proc/set_thermal_energy(set_energy, safety = FALSE)
	return add_thermal_energy(-chem_temp + set_energy, safety)

/datum/reagents/proc/set_temperature(new_temperature, safety = FALSE)
	return set_thermal_energy(get_thermal_energy_change(0, new_temperature), safety)

/datum/reagents/proc/add_thermal_energy(thermal_energy_to_add, safety = FALSE)
	thermal_energy_to_add = max(-chem_temp, thermal_energy_to_add)
	var/total_heat_capacity = get_heat_capacity()

	for(var/_R in reagent_list)
		var/datum/reagent/R = decls_repository.get_decl(_R)
		var/energy_per_reagent = thermal_energy_to_add * (R.get_heat_capacity(src)/total_heat_capacity)
		if(!safety)
			R.on_heat_change(energy_per_reagent, src)
	chem_temp += thermal_energy_to_add

/datum/reagent/proc/on_heat_change(energy_change, var/datum/reagents/holder)
	return // stub for heat effects
