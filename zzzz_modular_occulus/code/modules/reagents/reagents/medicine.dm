/datum/reagent/medicine/lacertidam
	name = "Lacertidam"
	id = "lacertidam"
	description = "Lacertidam is a weak analgesic medication and can be used to treat minor blunt trauma."
	taste_description = "bitterness"
	taste_mult = 3
	reagent_state = LIQUID
	color = "#EBB2B2"
	overdose = REAGENTS_OVERDOSE * 1.5
	scannable = 1

/datum/reagent/medicine/bicaridine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0.45 * effect_multiplier, 0, 5 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, 0.1)

/datum/reagent/medicine/ambursidol
	name = "Ambursidol"
	id = "ambursidol"
	description = "Ambursidol is a weak drug used to treat used to treat minor burns."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#FFE4B2"
	overdose = REAGENTS_OVERDOSE * 1.5
	scannable = 1

/datum/reagent/medicine/ambursidol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0, 0.45 * effect_multiplier, 0, 3 * effect_multiplier)
