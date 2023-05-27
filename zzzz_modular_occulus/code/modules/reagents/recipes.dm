//This is where Occulus new recipes go! Specifically for drinks, I think...//

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
	required_reagents = list("ldm" = 1)
	minimum_temperature = 474
/datum/chemical_reaction/ldm_vortex/on_reaction(datum/reagents/holder, created_volume)
	var/turf/T = get_turf(holder.my_atom)
	var/range = clamp(sqrt(created_volume/2), 1, 6)
	vortex(T, 0, range)

/datum/chemical_reaction/sorium
	result_amount = 4
	required_reagents = list("mercury" = 1, "tungsten" = 1, "carbon" = 1)
	catalysts = list("plasma" = 5)

/datum/chemical_reaction/sorium/on_reaction(datum/reagents/holder, created_volume)
	holder.remove_reagent(/datum/reagent/sorium, created_volume*4)
	var/turf/T = get_turf(holder.my_atom)
	var/range = clamp(sqrt(created_volume*4), 1, 6)
	vortex(T, 1, range)

/datum/chemical_reaction/sorium_vortex
	required_reagents = list("sorium" = 1)
	minimum_temperature = 474

/datum/chemical_reaction/sorium_vortex/on_reaction(datum/reagents/holder, created_volume)
	var/turf/T = get_turf(holder.my_atom)
	var/range = clamp(sqrt(created_volume), 1, 6)
	vortex(T, 1, range)

/datum/chemical_reaction/nitrate
	result = "nitrate"
	required_reagents = list("nitrogen" = 1, "carbon" = 3)
	result_amount = 4

/datum/chemical_reaction/aluminum_nitrate
	result = "aluminum_nitrate"
	required_reagents = list("aluminum" = 1, "nitrate" = 3)
	result_amount = 4

/datum/chemical_reaction/ammonium_nitrate
	result = "ammonium_nitrate"
	required_reagents = list("ammonia" = 1, "nitrate" = 3)
	result_amount = 4

/datum/chemical_reaction/tartrate
	result = "tartrate"
	required_reagents = list("nitrogen" = 1, "hydrazine" = 1)
	result_amount = 2

/datum/chemical_reaction/brownies
	required_reagents = list("aluminum_nitrate" = 40, "tartrate" = 20)
	result_amount = 0
	on_reaction(var/datum/reagents/holder, var/created_volume)
		for(var/i = 0; i < 3; i++)
			new /obj/item/reagent_containers/food/snacks/brownies(get_turf(holder.my_atom))
		return
/datum/chemical_reaction/babelizine
	result = "babelizine"
	required_reagents = list("mutagen" = 2, "alkysine" =1)
	result_amount = 3


/datum/chemical_reaction/bliss
	result = "bliss"
	required_reagents = list("serotrotium" = 1, "delight" = 2, "methylphenidate" = 1)
	result_amount = 4
	minimum_temperature = 474

/datum/chemical_reaction/frioline
	result = "frioline"
	required_reagents = list("nitrate" = 1, "tungsten" =1, "acetone" = 1)
	result_amount = 3
	minimum_temperature = 474
//

/datum/chemical_reaction/luxitol
	result = "luxitol"
	required_reagents = list("aluminum_nitrate" = 2, "phosphorus" = 3)
	result_amount = 5
	catalysts = list("uranium" = 5)

/datum/chemical_reaction/liquid_skin
	result = "liquid_skin"
	required_reagents = list("silver" = 1, "sulfur" = 1, "carbon" = 1, "sodium" = 1, "blood" = 1)
	result_amount = 5

/datum/chemical_reaction/paralitol
	result = "paralitol"
	required_reagents = list("mindbreaker" =2, "pacid" =2)
	result_amount = 2

/datum/chemical_reaction/liquid_bluespace
	result = "liquid_bluespace"
	required_reagents = list("bluespace_dust" =1, "mercury" = 1)
	result_amount = 1

/datum/chemical_reaction/aloe
	result = "aloe"
	required_reagents = list("irishcream" = 1, "watermelonjuice" = 1)
	result_amount = 3

/datum/chemical_reaction/blueberry_milkshake
	result = "blueberry_milkshake"
	required_reagents = list("milkshake" = 1, "blueberryjuice" = 1)
	result_amount = 5

/datum/chemical_reaction/pineapple_milkshake
	result = "pineapple_milkshake"
	required_reagents = list("milkshake" = 1, "pineapplejuice" = 1)
	result_amount = 5

/datum/chemical_reaction/strawberry_milkshake
	result = "strawberry_milkshake"
	required_reagents = list("milkshake" = 1, "strawberryjuice" = 1)
	result_amount = 5

/datum/chemical_reaction/chocolate_milkshake
	result = "chocolate_milkshake"
	required_reagents = list("milkshake" = 1, "coco" = 1)
	result_amount = 5

/datum/chemical_reaction/mintchocolate_milkshake
	result = "mintchocolate_milkshake"
	required_reagents = list("milkshake" = 1, "mintchocky" = 1)
	result_amount = 5

/datum/chemical_reaction/banana_milkshake
	result = "banana_milkshake"
	required_reagents = list("milkshake" = 1, "banana" = 1)
	result_amount = 5

/datum/chemical_reaction/berry_milkshake
	result = "berry_milkshake"
	required_reagents = list("milkshake" = 1, "berryjuice" = 1)
	result_amount = 5

/datum/chemical_reaction/grape_milkshake
	result = "grape_milkshake"
	required_reagents = list("milkshake" = 1, "grapejuice" = 1)
	result_amount = 5

/datum/chemical_reaction/watermelon_milkshake
	result = "watermelon_milkshake"
	required_reagents = list("milkshake" = 1, "watermelonjuice" = 1)
	result_amount = 5

/datum/chemical_reaction/cherry_milkshake
	result = "cherry_milkshake"
	required_reagents = list("milkshake" = 1, "cherryjelly" = 1)
	result_amount = 5

/datum/chemical_reaction/pumpkinspice_milkshake
	result = "pumpkinspice_milkshake"
	required_reagents = list("milkshake" = 1, "pumpkinjuice" = 1, "cinnamonpowder" = 1)
	result_amount = 5

/datum/chemical_reaction/junglejuice
	result = "junglejuice"
	required_reagents = list("ice" = 1, "banana" = 1, "berryjuice" = 1, "grapejuice" = 1, "watermelonjuice" = 1, "cherryjelly" = 1, "strawberryjuice" = 1, "pineapplejuice" = 1, "blueberryjuice" = 1)
	result_amount = 10

/datum/chemical_reaction/jungle_milkshake
	result = "jungle_milkshake"
	required_reagents = list("milkshake" = 1, "junglejuice" = 1)
	result_amount = 5

/datum/chemical_reaction/mintchocky
	result = "mintchocky"
	required_reagents = list("milk" = 2, "coco" = 1, "blendedmint" = 1)
	result_amount = 5

/datum/chemical_reaction/mojito
	result = "mojito"
	required_reagents = list("sodawater" = 1, "ice" = 2, "limejuice" = 1, "rum" = 1, "blendedmint" = 1, "sugar" = 1)
	result_amount = 5


