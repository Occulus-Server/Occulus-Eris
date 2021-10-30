/mob/living/simple_animal/hostile/siren/composer
	name = "composer"
	desc = "A six legged creature, it is a mesh of organic and synthetic material, chittering strange noises, and regurgitating things it's heard."
	icon = 'zzzz_modular_occulus/icons/mob/siren/composer.dmi'
	icon_state = "sixleg"
	icon_living = "sixleg"
	icon_aggro = "sixleg"
	icon_dead = "sixleg-dead"
	icon_gib = "syndicate_gib"
	mouse_opacity = 2
	move_to_delay = 5
	ranged = 0
	vision_range = 5
	density = TRUE
	aggro_vision_range = 11
	idle_vision_range = 9
	speed = 4
	maxHealth = 80
	health = 80
	harm_intent_damage = 25
	melee_damage_lower = 20
	melee_damage_upper = 30
	attacktext = "slashed"
	environment_smash = 0
	retreat_distance = null
	minimum_distance = 1
	var/sounddelay = 0
	var/skremdelay = 0
	var/special_ability_cooldown
	var/ability_cooldown = 20
	var/list/soundlist = list('zzzz_modular_occulus/sound/effects/solonely.wav', 'zzzz_modular_occulus/sound/effects/whispers.wav')



/mob/living/simple_animal/hostile/siren/composer/Life()
	..()

	soundloop()
	if(target_mob)
		skremloop()


/mob/living/simple_animal/hostile/siren/composer/proc/skremloop()
	if( skremdelay == 0)
		special_ability()
		skremdelay = 40
		return
	else
		skremdelay = (skremdelay --)
		return

/mob/living/simple_animal/hostile/siren/composer/proc/soundloop()
	if( sounddelay == 0)
		visible_emote("mimics a distorted sound!")
		var/sound = pick(soundlist)
		playsound(src.loc, sound, 100, 1, 8, 8)
		sounddelay = 30
		return
	else
		sounddelay = (sounddelay --)
		return


//Shriek stuns our victims and make them deaf for a while
/mob/living/simple_animal/hostile/siren/composer/proc/special_ability()
	visible_emote("screams!")
	playsound(src, 'zzzz_modular_occulus/sound/effects/screech.wav', 90, 1)
	scremicon()
	for(var/mob/living/victim in view(src))
		if(isdeaf(victim))
			continue

		if(ishuman(victim))
			var/mob/living/carbon/human/H = victim
			if(istype(H.l_ear, /obj/item/clothing/ears/earmuffs) && istype(H.r_ear, /obj/item/clothing/ears/earmuffs))
				continue
		victim.Weaken(4)
		to_chat(victim, SPAN_WARNING("You hear loud and terrible scream!"))

/mob/living/simple_animal/hostile/siren/composer/proc/scremicon()

	if(icon_state == "sixleg")
		icon_state = "sixleg-skrem"
		spawn(16)
		icon_state = "sixleg"
		return
	return

/mob/living/simple_animal/hostile/siren/composer/New()
	..()


