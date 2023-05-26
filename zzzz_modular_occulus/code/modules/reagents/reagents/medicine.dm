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

/datum/reagent/medicine/bicaridine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0.6 * effect_multiplier, 0, 5 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, 0.15)
	M.add_chemical_effect(CE_PAINKILLER, -25)
	M.add_chemical_effect(CE_PULSE, 1)

/datum/reagent/medicine/meralyne/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(1.2 * effect_multiplier, 0, 5 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, 0.30)
	M.add_chemical_effect(CE_PAINKILLER, -50)
	M.add_chemical_effect(CE_PULSE, 2)

/datum/reagent/medicine/kelotane/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0, 0.6 * effect_multiplier, 0, 3 * effect_multiplier)
	M.add_chemical_effect(CE_SPEEDBOOST, -1)
	M.add_chemical_effect(CE_PULSE, -1)

/datum/reagent/medicine/dermaline/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0, 1.2 * effect_multiplier, 0, 5 * effect_multiplier)
	M.add_chemical_effect(CE_SPEEDBOOST, -2)
	M.add_chemical_effect(CE_PULSE, -2)

/datum/reagent/medicine/polystem/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.heal_organ_damage(0.4 * effect_multiplier, 0, 3 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, min(1,0.1 * effect_multiplier))

/datum/reagent/medicine/tricordrazine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustOxyLoss(-0.4 * effect_multiplier)
	M.heal_organ_damage(0.2 * effect_multiplier, 0.2 * effect_multiplier)
	M.adjustToxLoss(-0.2 * effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, 0.1)

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
	price_per_unit = 50

/datum/reagent/medicine/myosynaptizine
	name = "Myosynaptizine"
	id = "myosynaptizine"
	description = "A combination of polystem and synaptizine that heals muscle and nerves damage slowly without need for surgery. Dangerous in large amount"
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#BCD2C8" // Midway between Polystem and Synaptizine
	scannable = 1
	metabolism = REM / 2
	overdose = REAGENTS_OVERDOSE / 2
	nerve_system_accumulations = 50

/datum/reagent/medicine/myosynaptizine/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	// Only heal soft tissues, give it a niche as a supplement before peridaxon are widely available instead of just worse bicaridine
	var/valid_organs = list(OP_NERVE, OP_MUSCLE) // Don't take over quickclot niche 
	for(var/obj/item/organ/internal/I in H.internal_organs)
		for(var/C in valid_organs)
			if(C in I.organ_efficiency)
				if(I.damage > 0 && !BP_IS_ROBOTIC(I))
					I.heal_damage((0.2 + I.damage * 0.05) * effect_multiplier)

/datum/chemical_reaction/myosynaptizine
	result = "myosynaptizine"
	required_reagents = list("synaptizine" = 1, "polystem" = 1)
	result_amount = 2

/datum/chemical_reaction/reconstructive_nanites
	result = "res nanites"
	required_reagents = list("rezadone" = 1, "clonexadone" = 1, "nanites" = 1, "meralyne" = 1, "dermaline" = 1)
	result_amount = 1

/datum/reagent/medicine/reconstructive_nanites/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustOxyLoss(-0.3 * effect_multiplier)
	M.heal_organ_damage(0.3 * effect_multiplier, 0.3 * effect_multiplier)
	M.adjustToxLoss(-0.3 * effect_multiplier)
