/datum/reagent/toxin/blattedin
	affects_dead = 1

/datum/reagent/toxin/blattedin/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	if(istype(M, /mob/living/carbon/superior_animal/roach))
		var/mob/living/carbon/superior_animal/roach/bug = M
		if(bug.stat == DEAD)
			if((bug.blattedin_revives_left > 0) && prob(70))//Roaches sometimes can come back to life from healing vapors
				bug.blattedin_revives_left = max(0, bug.blattedin_revives_left - 1)
				bug.rejuvenate()
			else
				bug.blattedin_revives_left = max(0, bug.blattedin_revives_left - 1)
		else
			bug.heal_organ_damage(heal_strength*removed)
	else
		.=..()
