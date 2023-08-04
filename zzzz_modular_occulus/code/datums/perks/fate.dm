/datum/perk/fate/desensitized
	name = "Desensitized"
	desc = "You have seen the worst the world has to offer and it has scarred you. Blood doesn't bother you, and the unususal has no allure for you."
	icon_state = "prism" //https://game-icons.net/

/datum/perk/fate/desensitized/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.environment_cap_coeff += 1
		holder.sanity.positive_prob_multiplier += 0.1
		holder.sanity.insight_passive_gain_multiplier *= 0.25
		holder.sanity.max_level += 20

/datum/perk/fate/desensitized/remove()
	if(holder)
		holder.sanity.environment_cap_coeff -= 1
		holder.sanity.positive_prob_multiplier -= 1
		holder.sanity.insight_passive_gain_multiplier /= 0.25
		holder.sanity.max_level -= 20
	..()