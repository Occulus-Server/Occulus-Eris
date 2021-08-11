/datum/sanity/proc/onMusic()
	changeLevel(SANITY_GAIN_MUSIC)
	if(resting)
		add_rest(INSIGHT_DESIRE_MUSIC, 0.4)

/datum/sanity/proc/onExercise(var/rate)
	changeLevel(rate)
	if(resting)
		add_rest(INSIGHT_DESIRE_EXERCISE, rate)

/datum/sanity/oddity_stat_up(multiplier) //Occulus rewrite for adding instructional manuals.
	var/stat_points = 15
	var/list/L = list()
	var/list/stat_change = list() //if I define this here it says var defined but not used, if I don't define it it yells about undefined vars
	var/other_stats = list() // same as /list/stat_change
	var/stat_val = 0
	var/stat_up = 0
	var/stat_pool = 0 //same as list/stat_change
	var/list/inspiration_items = list()

	for(var/obj/item/I in owner.get_contents())
		if(is_type_in_list(I, valid_inspirations) && I.GetComponent(/datum/component/inspiration))
			inspiration_items += I
	if(inspiration_items.len)
		var/obj/item/O = inspiration_items.len > 1 ? owner.client ? input(owner, "Select something to use as inspiration", "Level up") in inspiration_items : pick(inspiration_items) : inspiration_items[1]
		if(!O)
			return
		if(istype(O, /obj/item/weapon/oddity/instructional)) //this is occulus' code for detecting if you use an instructional
			GET_COMPONENT_FROM(I, /datum/component/inspiration, O) // If it's a valid inspiration, it should have this component. If not, runtime
			L = I.calculate_statistics()
			var/stat = L[1]
			for(var/item in ALL_STATS)
				if(stat == item)
					continue
				other_stats += item
			stat_val = (L[stat] * rand(2, 4)) //What's the value to be added to the stat? Multiplier is one for the instructional stuff because it's just a normal level up.We store this for use later.
			stat_up = (stat_val * resting) //Level up that stat a number of times equal to the stored levels.
			to_chat(owner, SPAN_NOTICE("Your [stat] stat goes up by [stat_up]"))
			owner.stats.changeStat(stat, stat_up)
			stat_pool = ((stat_points - stat_val) * resting ) // Take away the number of points you get from the stat-specific. buff, then get the number of points from each level (normally 15)
			while(stat_pool >= 1)
				LAZYAPLUS(stat_change, pick(other_stats), 1)
				stat_pool--
			for(stat in stat_change)
				owner.stats.changeStat(stat, stat_change[stat])
				to_chat(owner, SPAN_NOTICE("Your [stat] goes up by [stat_change]."))
			if(owner.stats.getPerk(PERK_ARTIST))
				to_chat(owner, SPAN_NOTICE("You use the instructional material as a muse."))
			else to_chat(owner, SPAN_NOTICE("You finish reading the instructional material."))
			owner.playsound_local(get_turf(owner), 'sound/sanity/rest.ogg', 100)
			resting = 0
			for(var/mob/living/carbon/human/H in viewers(owner))
				SEND_SIGNAL(H, COMSIG_HUMAN_ODDITY_LEVEL_UP, owner, O)
			return
		if(istype(O, /obj/item/weapon/oddity)) //this is regular eris level up code
			GET_COMPONENT_FROM(I, /datum/component/inspiration, O) // If it's a valid inspiration, it should have this component. If not, runtime
			L = I.calculate_statistics()
			for(var/stat in L)
				stat_up = L[stat] * multiplier
				to_chat(owner, SPAN_NOTICE("Your [stat] stat goes up by [stat_up]"))
				owner.stats.changeStat(stat, stat_up)
			if(I.perk)
				owner.stats.addPerk(I.perk)
			for(var/mob/living/carbon/human/H in viewers(owner))
				SEND_SIGNAL(H, COMSIG_HUMAN_ODDITY_LEVEL_UP, owner, O)