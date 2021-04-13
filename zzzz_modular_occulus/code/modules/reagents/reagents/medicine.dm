/datum/reagent/medicine/synaptizine
	metabolism = REM * 0.25

/datum/reagent/medicine/spaceacillin
	metabolism = REM * 0.25

/datum/reagent/toxin
	metabolism = REM * 0.25

/datum/reagent/medicine/paracetamol
	metabolism = REM * 0.25

/datum/reagent/medicine/tramadol
	metabolism = REM * 0.25

/datum/reagent/medicine/oxycodone
	metabolism = REM * 0.25

/datum/reagent/medicine/reconstructive_nanites
	name = "Reconstructive nanites"
	id = "res nanites"
	description = "Microscopic machines that aggressively rebuild organic cells regardless of the metabolism of the body."
	taste_description = "metal"
	reagent_state = SOLID
	overdose = REAGENTS_OVERDOSE
	scannable = 1
	affects_dead = 1
	metabolism = REM * 2
	price_tag = 50

/datum/chemical_reaction/reconstructive_nanites
	result = "res nanites"
	required_reagents = list("rezadone" = 1, "clonexadone" = 1, "nanites" = 1, "meralyne" = 1, "dermaline" = 1)
	result_amount = 1

/datum/reagent/medicine/reconstructive_nanites/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustOxyLoss(-0.3 * effect_multiplier)
	M.heal_organ_damage(0.3 * effect_multiplier, 0.3 * effect_multiplier)
	M.adjustToxLoss(-0.3 * effect_multiplier)