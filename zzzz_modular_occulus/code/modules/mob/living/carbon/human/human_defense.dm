/mob/living/carbon/human/proc/get_siemens_coefficient_average()
	var/siemens_value = 0
	var/total = 0
	for(var/organ_name in organs_by_name)
		if(organ_name in organ_rel_size)
			var/obj/item/organ/external/organ = organs_by_name[organ_name]
			if(organ)
				var/weight = organ_rel_size[organ_name]
				siemens_value += get_siemens_coefficient_organ(organ) * weight
				total += weight

	if(fire_stacks < 0) // Water makes you more conductive.
		siemens_value *= 1.5

	return (siemens_value / max(total, 1))

/mob/living/carbon/human/get_shock_protection()
	return min(1 - get_siemens_coefficient_average(), 1) // Don't go above 1, but negatives are fine.