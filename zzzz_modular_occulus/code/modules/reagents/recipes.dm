/datum/chemical_reaction/bouncer
	required_reagents = list("iron" = 1, "fuhrerole" = 1, "hyperzine" = 1)

/datum/chemical_reaction/liquid_dark_matter
	result_amount = 3
	required_reagents = list("lithium" = 1, "radium" = 1, "carbon" = 1)
	catalysts = list("uranium" = 5)

/datum/chemical_reaction/liquid_dark_matter/on_reaction(datum/reagents/holder, created_volume)
	holder.remove_reagent(/datum/reagent/liquid_dark_matter, created_volume*3)
	var/turf/T = get_turf(holder.my_atom)
	var/range = clamp(sqrt(created_volume*3), 1, 6)
	vortex(T, 0, range)

/datum/chemical_reaction/ldm_vortex
	required_reagents = list(/datum/reagent/liquid_dark_matter = 1)
	minimum_temperature = 474
/datum/chemical_reaction/ldm_vortex/on_reaction(datum/reagents/holder, created_volume)
	var/turf/T = get_turf(holder.my_atom)
	var/range = clamp(sqrt(created_volume/2), 1, 6)
	vortex(T, 0, range)

/datum/chemical_reaction/sorium
	result_amount = 4
	required_reagents = list("mercury" = 1, "tungsten" = 1, "carbon" = 1)
	catalysts = list("silver" = 5)

/datum/chemical_reaction/sorium/on_reaction(datum/reagents/holder, created_volume)
	holder.remove_reagent(/datum/reagent/sorium, created_volume*4)
	var/turf/T = get_turf(holder.my_atom)
	var/range = clamp(sqrt(created_volume*4), 1, 6)
	vortex(T, 1, range)

/datum/chemical_reaction/sorium_vortex
	required_reagents = list(/datum/reagent/sorium = 1)
	minimum_temperature = 474

/datum/chemical_reaction/sorium_vortex/on_reaction(datum/reagents/holder, created_volume)
	var/turf/T = get_turf(holder.my_atom)
	var/range = clamp(sqrt(created_volume), 1, 6)
	vortex(T, 1, range)

/datum/chemical_reaction/nitrate
	result = "nitrate"
	required_reagents = list("nitrogen" = 1, "oxygen" = 3)
	result_amount = 4

/datum/chemical_reaction/aluminum_nitrate
	required_reagents = list("aluminum" = 1, "nitrate" = 3)
	result_amount = 4

/datum/chemical_reaction/brownies
	required_reagents = list("aluminum_nitrate" = 40, "tartrate" = 20)
	result_amount = 0
	on_reaction(var/datum/reagents/holder, var/created_volume)
		for(var/i = 0; i < 3; i++)
			new /obj/item/weapon/reagent_containers/food/snacks/brownies(get_turf(holder.my_atom))
		return
