#define olympian_time 60 SECONDS

/datum/reagent/toxin/kaisertophin
	name = "Kaisertophin"
	id = "kaisertophin"
	description = "A golden ichor harvested from the emperor roach itself."
	taste_description = "liquid ambrosia"
	reagent_state = LIQUID
	color = "#FFD700"
	overdose = 5
	addiction_chance = 100
	nerve_system_accumulations = 80
	heating_point = 573
	heating_products = list("radium", "mercury", "lithium", "nutriment")

/datum/reagent/toxin/kaisertophin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.stats.addTempStat(STAT_ROB, STAT_LEVEL_GODLIKE, olympian_time, "fuhrerole_w")
	M.stats.addTempStat(STAT_TGH, STAT_LEVEL_GODLIKE, olympian_time, "fuhrerole_w")

/datum/reagent/toxin/kaisertophin/on_mob_delete(mob/living/L)


/datum/reagent/toxin/kaisertophin/withdrawal_act(mob/living/carbon/M)
	M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_BASIC, STIM_TIME, "fuhrerole_w")
	M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_BASIC, STIM_TIME, "fuhrerole_w")

/datum/reagent/toxin/kaisertophin/overdose(mob/living/carbon/M, alien)
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	for(var/obj/item/organ/internal/S in H.internal_organs)	//ALL INTERNAL ORGANS.
		if(istype(S))
			S.take_damage(1, 0)	//Greedy for Ambrosia results in insides melting
	M.adjustFireLoss(50)


