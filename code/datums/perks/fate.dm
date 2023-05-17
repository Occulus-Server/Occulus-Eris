/datum/perk/fate/paper_worm
	name = "Paper Worm"
	desc = "You always look at the bright side of life but seems there's something you'd forgotten"
	icon_state = "paper"

/datum/perk/fate/paper_worm/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.positive_prob += 20

/datum/perk/fate/paper_worm/remove()
	if(holder)
		holder.sanity.positive_prob -= 20
	..()

/datum/perk/fate/freelancer
	name = "Freelancer"
	icon_state = "skills"
	desc = "You're a jack of all trades but master of none"

/datum/perk/fate/freelancer/assign(mob/living/carbon/human/H)
	..()
	var/maxstat = -INFINITY
	var/maxstatname
	spawn(1)
		for(var/name in ALL_STATS)
			if(holder.stats.getStat(name, TRUE) > maxstat)
				maxstat = holder.stats.getStat(name, TRUE)
				maxstatname = name
		for(var/name in ALL_STATS)
			if(name != maxstatname)
				holder.stats.changeStat(name, 4)
			else
				holder.stats.changeStat(name, -10)

/datum/perk/fate/nihilist
	name = "Nihilist"
	desc= "You have lost faith in this world and in its people."
	icon_state = "eye" //https://game-icons.net/1x1/lorc/tear-tracks.html

/datum/perk/fate/nihilist/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.positive_prob += 10
		holder.sanity.negative_prob += 20

/datum/perk/fate/nihilist/remove()
	if(holder)
		holder.sanity.positive_prob -= 10
		holder.sanity.negative_prob -= 20
		holder.stats.removeTempStat(STAT_COG, "Fate Nihilist")
	..()

/datum/perk/fate/moralist
	name = "Moralist"
	icon_state = "moralist" //https://game-icons.net/
	desc = "You are a good human being. Love life, and life will love you back. Love people, and they will love you back."

/datum/perk/fate/drug_addict
	name = "Drug Addict"
	icon_state = "medicine" //https://game-icons.net/1x1/delapouite/medicines.html
	desc = "You have absolutely no pleasure in the stimulants you indulge. It's a desperate attempt to escape from the dread of some strange impending doom"

/datum/perk/fate/drug_addict/assign(mob/living/carbon/human/H)
	..()
	spawn(1)
		var/turf/T = get_turf(holder)
		var/drugtype = pick(subtypesof(/datum/reagent/drug))
		if(!(drugtype in holder.metabolism_effects.addiction_list))
			var/datum/reagent/drug = new drugtype
			holder.metabolism_effects.addiction_list.Add(drug)
			for(var/j= 1 to 2)
				var/obj/item/storage/pill_bottle/PB = new /obj/item/storage/pill_bottle(T)
				PB.name = "bottle of happiness"
				for(var/i=1 to 7)
					var/obj/item/reagent_containers/pill/pill = new /obj/item/reagent_containers/pill(T)
					pill.reagents.add_reagent(drug.id, pill.volume)
					pill.name = "happy pill"
					PB.handle_item_insertion(pill)
				holder.equip_to_storage_or_drop(PB)

/datum/perk/fate/alcoholic
	name = "Alcoholic"
	icon_state = "beer" //https://game-icons.net/1x1/delapouite/beer-bottle.html
	desc = "For you it's alcohol: the cause of, and solution to, all of life's problems."

/datum/perk/fate/alcoholic/assign(mob/living/carbon/human/H)
	..()
	var/ethanoltype = pick(subtypesof(/datum/reagent/alcohol))
	if(!(ethanoltype in holder.metabolism_effects.addiction_list))
		var/datum/reagent/alcohol = new ethanoltype
		holder.metabolism_effects.addiction_list.Add(alcohol)

/datum/perk/fate/alcoholic_active
	name = "Alcoholic (active)"
	icon_state = "drinking" //https://game-icons.net/1x1/delapouite/drinking.html

/datum/perk/fate/alcoholic_active/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.stats.addTempStat(STAT_ROB, 10, INFINITY, "Fate Alcoholic")
		holder.stats.addTempStat(STAT_TGH, 10, INFINITY, "Fate Alcoholic")
		holder.stats.addTempStat(STAT_VIG, 10, INFINITY, "Fate Alcoholic")

/datum/perk/fate/alcoholic_active/remove()
	if(holder)
		holder.stats.removeTempStat(STAT_ROB, "Fate Alcoholic")
		holder.stats.removeTempStat(STAT_TGH, "Fate Alcoholic")
		holder.stats.removeTempStat(STAT_VIG, "Fate Alcoholic")
	..()

/datum/perk/fate/noble
	name = "Noble"
	icon_state = "family" //https://game-icons.net
	desc = "You're a noble, a graceful ornament to the civil order. The jewel of society. Waiting to be stolen."

/datum/perk/fate/noble/assign(mob/living/carbon/human/H)
	..()
	if(!holder)
		return
	holder.sanity.environment_cap_coeff -= 1
	if(!holder.family_name)		//Eclipse edit: Family name, not surname
		qdel(src)
		return
	holder.sanity.environment_cap_coeff -= 1
	var/turf/T = get_turf(holder)
	//Occulus Edit Start
	var/odditystrength = rand(1,3)
	var/obj/item/W
	switch(odditystrength)
		if(1)
			W = pick(/obj/item/gun/projectile/revolver/noble, /obj/item/gun/projectile/colt/noble, /obj/item/gun/projectile/mandella/noble, /obj/item/gun/projectile/boltgun/fs/noble)
		if(2)
			W = pick(/obj/item/tool/sword/noble, /obj/item/tool/sword/katana/noble, /obj/item/tool/hammer/mace/noble)
		if(3)
			W = pick(/obj/item/tool/knife/ritual/noble, /obj/item/tool/knife/dagger/ceremonial, /obj/item/tool/knife/tacknife/noble)
	holder.sanity.valid_inspirations += W
	W = new W(T)
	W.name = "[holder.family_name] family [W.name]"		//Eclipse edit: Family name, not surname
	var/oddities = 3
	var/list/stats = ALL_STATS
	var/list/final_oddity = list()
	for(var/i = 0 to oddities)
		var/stat = pick(stats)
		stats.Remove(stat)
		final_oddity += stat
		final_oddity[stat] = odditystrength
	//Occulus Edit End
	W.AddComponent(/datum/component/inspiration, final_oddity)
	W.AddComponent(/datum/component/atom_sanity, 1, "") //sanity gain by area
	W.sanity_damage -= 1 //damage by view
	W.price_tag = 8000 //Occulus Edit
	spawn(1)
		holder.equip_to_storage_or_drop(W)

/datum/perk/fate/noble/remove()
	if(holder)
		holder.sanity.environment_cap_coeff += 1
	..()

/datum/perk/fate/rat
	name = "Rat"
	desc = "Early bird gets the worm, but the second rat gets the cheese."
	icon_state = "rat" //https://game-icons.net/

/datum/perk/fate/rat/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.max_level -= 10

/datum/perk/fate/rat/remove()
	if(holder)
		holder.sanity.max_level += 10
	..()

/datum/perk/fate/rejected_genius
	name = "Rejected Genius"
	desc = "Your dreams are undisturbed by reality, your search for the impossible continues regardless of your peers."
	icon_state = "knowledge" //https://game-icons.net/

/datum/perk/fate/rejected_genius/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.environment_cap_coeff -= 1
		holder.sanity.positive_prob_multiplier -= 1
		holder.sanity.insight_passive_gain_multiplier *= 1.5
		holder.sanity.max_level -= 20

/datum/perk/fate/rejected_genius/remove()
	if(holder)
		holder.sanity.environment_cap_coeff += 1
		holder.sanity.positive_prob_multiplier += 1
		holder.sanity.insight_passive_gain_multiplier /= 1.5
		holder.sanity.max_level += 20
	..()

/datum/perk/fate/oborin_syndrome
	name = "Oborin Syndrome"
	icon_state = "prism" //https://game-icons.net/1x1/delapouite/prism.html
	desc = "You're often told you see the world in black and whites. But they're wrong, you see the greys, you live in the greys. Not the 'colors' though, those are just venus traps for the dumb flies, you're smarter than that. Only grey."

/datum/perk/fate/oborin_syndrome/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.max_level += 20
		spawn(1)
			holder.update_client_colour() //Handle the activation of the colourblindness on the mob.

/datum/perk/fate/oborin_syndrome/remove()
	if(holder)
		holder.sanity.max_level -= 20
	..()

/datum/perk/fate/lowborn
	name = "Lowborn"
	icon_state = "ladder" //https://game-icons.net/1x1/delapouite/hole-ladder.html
	desc = "For them you are a pariah, trash — untouchable! That’s the word! You are an Untouchable!"

/datum/perk/fate/lowborn/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.max_level += 10

/datum/perk/fate/lowborn/remove()
	if(holder)
		holder.sanity.max_level -= 10
	..()
