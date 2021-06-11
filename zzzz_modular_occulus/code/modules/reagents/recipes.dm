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
	result = "aluminum_nitrate"
	required_reagents = list("aluminum" = 1, "nitrate" = 3)
	result_amount = 4

/datum/chemical_reaction/brownies
	required_reagents = list("aluminum_nitrate" = 40, "tartrate" = 20)
	result_amount = 0
	on_reaction(var/datum/reagents/holder, var/created_volume)
		for(var/i = 0; i < 3; i++)
			new /obj/item/weapon/reagent_containers/food/snacks/brownies(get_turf(holder.my_atom))
		return
/datum/chemical_reaction/babelizine
	result = "babelizine"
	required_reagents = list("unstable mutagen" = 2, "alkysine" =1)
	result_amount = 3

/datum/chemical_reaction/malaxitol
	result = "malaxitol"
	required_reagents = list("synaptizine" = 2, "innaprovaline" = 1, "acetone" = 1)
	result_amount = 2

/datum/chemical_reaction/bliss
	result = "bliss"
	required_reagents = list("serotrotium" = 1, "delight" = 2, "methylphenidate" = 1)
	result_amount = 4
	minimum_temperature = 474

/datum/chemical_reaction/frioline
	result = "frioline"
	required_reagents = list("nitrate" = 1, "tungsten" =1, "aceteone" = 1)
	result_amount = 3
	maximum_temperature = 200
//

/datum/chemical_reaction/luxitol
	result = "luxitol"
	required_reagents = list("aluminum_nitrate" = 2, "phosphorus" = 3)
	result_amount = 5
	catalysts = list("uranium" = 5)

/datum/chemical_reaction/liquid_skin
	result = "liquid_skin"
	required_reagents = list("silver" = 1, "sulfur" = 1, "oxygen" = 1, "chlorine" = 1, "blood" = 1)
	result_amount = 5

/datum/chemical_reaction/paralitol
	result = "paralitol"
	required_reagents = list("mindbreaker" =2, "pacid" =2)
	result_amount = 2

/datum/chemical_reaction/mortemol
	result = "mortemol"
	required_reagents = list("seligitillin" = 3, "rezadone" = 1)
	result_amount = 2

/datum/chemical_reaction/oxyphoromin
	result = "oxyphoromin"
	required_reagents = list("oxycodone" =2, "phoron" = 1, "fuhrerole" = 1)
	result_amount = 2
	minimum_temperature = 474

/datum/chemical_reaction/liquid_bluespace
	result = "liquid_bluespace"
	required_reagents = list("bluespace_dust" =1, "mercury" = 1)
	result_amount = 1

/datum/chemical_reaction/ignisol
	result = "ignisol"
	required_reagents = list("thermite" = 1, "fuel" = 3, "phoron" = 1)
	result_amount = 5