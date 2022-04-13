/obj/item/organ/internal/blood_vessel
	specific_organ_size = 0.25

/obj/item/organ/internal/nerve
	specific_organ_size = 0.25

/obj/item/organ/internal/blood_vessel/handle_blood()
	if(BP_IS_ROBOTIC(src) || !owner)
		return
	if(!blood_req)
		return
	if(damage > 0)//Damaged blood vessels bleed internally.
		var/removed = damage * 0.25
		if(owner.chem_effects[CE_BLOODCLOT])
			removed *= 1 - owner.chem_effects[CE_BLOODCLOT]
		removed *= (owner.vessel.total_volume / owner.species.blood_volume)
		owner.vessel.remove_reagent("blood", removed)
	..()


/datum/reagent/medicine/quickclot/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_BLOODCLOT, min(1,0.1 * effect_multiplier))	// adding 0.01 to be more than 0.1 in order to stop int bleeding from growing
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		for(var/obj/item/organ/external/E in H.organs)
			for(var/datum/wound/W in E.wounds)
				if(W.internal)
					W.heal_damage(5 * effect_multiplier)
		for(var/obj/item/organ/internal/blood_vessel/BV in H.internal_organs)
			BV.heal_damage(((0.2 + BV.damage * 0.05) * effect_multiplier), FALSE)

/obj/item/reagent_containers/hypospray/autoinjector
	preloaded_reagents = list("inaprovaline" = 9, "quickclot" = 1)
