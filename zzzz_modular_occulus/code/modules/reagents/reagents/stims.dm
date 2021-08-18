/datum/reagent/stim/pro_surgeon/overdose(mob/living/carbon/M, alien, var/mob/living/carbon/human/H)
	if(prob(5 - (5 * M.stats.getMult(STAT_TGH))))
		M.custom_emote(1,"twitches and drops [gender_datums[H.identifying_gender].his] [M.get_active_hand()].") // there are many genders
		M.drop_item()
	M.add_chemical_effect(CE_TOXIN, 1)
	if(prob(80 - (20 * M.stats.getMult(STAT_TGH))))
		M.adjustToxLoss(5)

/datum/reagent/stim/ultra_surgeon/overdose(mob/living/carbon/M, alien, var/mob/living/carbon/human/H)
	if(prob(80 - (20 * M.stats.getMult(STAT_TGH))))
		M.adjustToxLoss(10)
	if(prob(10 - (5 * M.stats.getMult(STAT_TGH))))
		M.custom_emote(1,"twitches and drops [gender_datums[H.identifying_gender].his] [M.get_active_hand()].") // there are many genders
		M.drop_item()