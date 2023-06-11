/mob/living/simple_animal/hostile/siren/amalgamate
	name = "amalgamate"
	desc = "A six legged creature, it is a mesh of organic and synthetic material, chittering strange noises, and regurgitating things it's heard."
	icon = 'zzzz_modular_occulus/icons/mob/siren/general.dmi'
	icon_state = "amalgamate"
	icon_living = "amalgamate"
	icon_aggro = "amalgamate"
	icon_dead = "sixleg-dead"
	icon_gib = "syndicate_gib"
	mouse_opacity = 2
	move_to_delay = 5
	vision_range = 5
	aggro_vision_range = 11
	speed = 4
	maxHealth = 80
	health = 80
	harm_intent_damage = 25
	melee_damage_lower = 20
	melee_damage_upper = 30
	attacktext = "slashed"
	environment_smash = ENVIRONMENT_SMASH_NONE
	var/sounddelay = 0
	var/skremdelay = 0
	var/special_ability_cooldown
	var/ability_cooldown = 20
	var/list/soundlist = list('zzzz_modular_occulus/sound/effects/solonely.wav', 'zzzz_modular_occulus/sound/effects/whispers.wav', 'zzzz_modular_occulus/sound/effects/malecrying.wav')
	var/mob/living/Victim = null // the person the slime is currently feeding on

/mob/living/simple_animal/hostile/siren/amalgamate/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	Feedon(target_mob)
/*
/mob/living/carbon/hostile/siren/amalgamate/handle_chemicals_in_body()
	chem_effects.Cut()

	if(touching) touching.metabolize()

	metabolism_effects.process()

	src.updatehealth()

	return //TODO: DEFERRED

/mob/living/simple_animal/hostile/siren/amalgamate/metabolize()

	var/metabolism_type = 0 //non-human mobs
	for(var/current in reagent_list)
		if(/datum/reagent/water == current)
		Feedstop()
		if(/datum/reagent/frioline == current)
		Feedstop()
		Shortcircuit()
		R.on_mob_life(parent, metabolism_type, metabolism_class)

	update_total()
*/
/mob/living/simple_animal/hostile/siren/amalgamate/proc/Shortcircuit()


/mob/living/simple_animal/hostile/siren/amalgamate/proc/Feedon(var/mob/living/M)
	Victim = M
	loc = M.loc
	canmove = 0
	anchored = TRUE

	regenerate_icons()

	while(Victim && !invalidFeedTarget(M) && stat != 2)
		canmove = 0

		if(Adjacent(M))
			UpdateFeed(M)

			if(iscarbon(M))
				Victim.adjustBruteLoss(rand(5,6))
				Victim.adjustFireLoss(rand(1,2))
				if(Victim.health <= 0)
					Feedstop()

			else if(isanimal(M))
				Victim.adjustBruteLoss(rand(4, 12))

			else
				to_chat(src, "<span class='warning'>[pick("This subject is incompatable", "This subject does not have a life energy", "This subject is empty", "I am not satisified", "I can not feed from this subject", "I do not feel energized", "This subject is not energy")]...</span>")
				Feedstop()
				break

			if(prob(15) && M.client && iscarbon(M))
				var/painMes = pick("You can feel your body becoming weak!", "You feel like you're about to die!", "You feel every part of your body screaming in agony!", "A low, rolling pain passes through your body!", "Your body feels as if it's falling apart!", "You feel extremely weak!", "A sharp, deep pain bathes every inch of your body!")
				if (ishuman(M))
					var/mob/living/carbon/human/H = M
					H.custom_pain(painMes)
				else if (iscarbon(M))
					var/mob/living/carbon/C = M
					if (!(C.species && (C.species.flags & NO_PAIN)))
						to_chat(M, SPAN_DANGER("[painMes]"))

			adjustOxyLoss(-8) //Heal yourself
			adjustBruteLoss(-8)
			adjustFireLoss(-8)
			adjustCloneLoss(-8)
			updatehealth()
			if(Victim)
				Victim.updatehealth()

			sleep(30) // Deal damage every 3 seconds
		else
			break

	canmove = 1
	anchored = 0

	if(M && invalidFeedTarget(M)) // This means that the slime drained the victim
		to_chat(src, SPAN_NOTICE("This subject does not have a strong enough life energy anymore..."))
	Victim = null

/mob/living/simple_animal/hostile/siren/amalgamate/proc/Feedstop()
	if(Victim)
		if(Victim.client) Victim << "[src] has let go of your head!"
		Victim = null

/mob/living/simple_animal/hostile/siren/amalgamate/proc/UpdateFeed(var/mob/M)
	if(Victim)
		if(Victim == M)
			loc = M.loc // simple "attach to head" effect!

/mob/living/simple_animal/hostile/siren/amalgamate/proc/invalidFeedTarget(var/mob/living/M)
	if (!M || !istype(M))
		return "This subject is incomparable..."
	if (isslime(M)) // No cannibalism... yet
		return "I cannot feed on other slimes..."
	if (!Adjacent(M))
		return "This subject is too far away..."
	if (iscarbon(M) && M.getCloneLoss() >= M.maxHealth - HEALTH_THRESHOLD_DEAD || isanimal(M) && M.stat == DEAD)
		return "This subject does not have an edible life energy..."
	for(var/mob/living/carbon/slime/met in view())
		if(met.Victim == M && met != src)
			return "The [met.name] is already feeding on this subject..."
	return 0