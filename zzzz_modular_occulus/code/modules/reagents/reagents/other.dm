/*/datum/chemical_reaction/rejuvenating_agent
	result = "rejuvetaning_agent"
	required_reagents = list("cleaner" = 2, "pacid" = 1, "sulfur" = 1, "uncap nanites" = 1)
	result_amount = 1
*/

/datum/reagent/resuscitator
		reagent_type = "Stimulator" //For some reason this doesn't inherit a reagent type unless we do this...????


/datum/reagent/liquid_dark_matter
	name = "Liquid Dark Matter"
	description = "Sucks everything into the detonation point."
	reagent_state = LIQUID
	color = "#210021"
	taste_description = "compressed bitterness"

/datum/reagent/sorium
	name = "Sorium"
	description = "Sends everything flying from the detonation point."
	reagent_state = LIQUID
	color = "#5A64C8"
	taste_description = "air and bitterness"

/datum/reagent/phlogiston
	name = "Phlogiston"
	description = "Catches you on fire and makes you ignite."
	reagent_state = LIQUID
	color = "#FA00AF"
	taste_description = "burning"
