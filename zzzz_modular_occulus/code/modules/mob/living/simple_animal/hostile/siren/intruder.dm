/mob/living/simple_animal/hostile/siren/intruder
	name = "intruder"
	desc = "A floating mechanical drone. It can be seen putting off sparks occasionally"
	icon = 'zzzz_modular_occulus/icons/mob/siren/general.dmi'
	icon_state = "intruder"
	icon_living = "intruder"
	icon_aggro = "intruder"
	icon_dead = "sixleg-dead"
	icon_gib = "syndicate_gib"
	mouse_opacity = 2
	move_to_delay = 8
	vision_range = 5
	aggro_vision_range = 11
	ranged = TRUE
	rapid = 3
	retreat_distance = 3
	minimum_distance = 3
	fire_verb = "fires a bolt strange energy" //reminder that the attack message is "\red <b>[src]</b> [fire_verb] at [target]!"
	projectiletype = /obj/item/projectile/beam/siren
	speed = 4
	maxHealth = 300
	health = 300
	harm_intent_damage = 25
	melee_damage_lower = 20
	melee_damage_upper = 30
	attacktext = "slammed"
	environment_smash = ENVIRONMENT_SMASH_NONE
	mob_inaccuracy = 33		//percent chance for a ranged mob's shot to go wide.
	shot_variance = 20		//degree of shot widening.
	var/initialcooldown
	var/initialvariance
	var/initialmovedelay
	var/initialinaccuracy
	var/initialrapid
	var/sounddelay = 0
	var/shockdelay = 0
	var/overcharged = FALSE
	var/special_ability_cooldown
	var/ability_cooldown = 20
	var/list/soundlist = list('zzzz_modular_occulus/sound/effects/dronehover.ogg')
	sirenspeechlist = list("")
	var/loot_table = list(/obj/item/cell/small/moebius/nuclear,
						/obj/spawner/tool_upgrade/rare,
						/obj/spawner/material/resources/rare)

/mob/living/simple_animal/hostile/siren/intruder/Life()
	. = ..()
	if(!overcharged)
		statupdate()
	if(health >=15)
		soundloop()
		if(target_mob)	//overcharge loop. makes it stronger the more damage it takes!
			shockloop()

/mob/living/simple_animal/hostile/siren/intruder/proc/statupdate()
	if(health >= (0.7 * maxHealth))
		move_to_delay = 6
		mob_inaccuracy = 25
		shot_variance = 15
		rapid = 5
		ranged_cooldown_time = 15 SECONDS
	if(health < (0.7 * maxHealth) && health >= (0.4* maxHealth))
		move_to_delay = 4
		mob_inaccuracy = 20
		shot_variance = 10
		rapid = 7
		ranged_cooldown_time = 10 SECONDS
	if(health < (0.4 * maxHealth))
		move_to_delay = 2
		mob_inaccuracy = 15
		shot_variance = 5
		rapid = 9
		ranged_cooldown_time = 5 SECONDS
/mob/living/simple_animal/hostile/siren/intruder/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /datum/effect/effect/system/spark_spread
	gibs(loc, null, /obj/effect/gibspawner/robot)
	var/lootdrop = pick(loot_table)
	new lootdrop(get_turf(src))
	if(lootdrop)
		visible_message("Something tumbles out of \the [src]'s remains!")
	qdel(src)

/mob/living/simple_animal/hostile/siren/intruder/proc/shockloop()
	if(shockdelay == 0)
		special_ability()
		shockdelay = 40
		return
	else
		shockdelay--
/mob/living/simple_animal/hostile/siren/intruder/proc/soundloop()
	if( sounddelay == 0)
		visible_emote("emits a droning sound!")
		playsound(src.loc, pick(soundlist), 100, 1, 8, 8)
		sounddelay = 30
	else
		sounddelay--

//sends out electric arcs. Maybe.
/mob/living/simple_animal/hostile/siren/intruder/proc/special_ability()
	visible_emote("overcharges it's servos with a burst of energy!")
	playsound(src, 'zzzz_modular_occulus/sound/effects/Lightningbolt.ogg', 90, 1)
	shockicon()
	overcharged = TRUE
	initialcooldown = ranged_cooldown_time
	initialvariance = shot_variance
	initialmovedelay = move_to_delay
	initialrapid = rapid
	initialinaccuracy = mob_inaccuracy
	var/shockrapid = (rapid*2)
	rapid = shockrapid
	var/shockinaccuracy = (mob_inaccuracy/2)
	mob_inaccuracy = shockinaccuracy
	var/shockvariance = (shot_variance/2)
	shot_variance = shockvariance
	var/shockspeed = (move_to_delay/2)
	move_to_delay = shockspeed
	var/shockcooldown = (ranged_cooldown_time/2)
	ranged_cooldown_time = shockcooldown
	addtimer(CALLBACK(src, .proc/returnstats), 10 SECONDS)

/mob/living/simple_animal/hostile/siren/intruder/proc/returnstats()
	overcharged = FALSE
	rapid = initialrapid
	mob_inaccuracy = initialinaccuracy
	shot_variance = initialvariance
	move_to_delay = initialmovedelay
	ranged_cooldown_time = initialcooldown

/mob/living/simple_animal/hostile/siren/intruder/proc/shockicon()
	if(icon_state == "intruder")
		icon_state = "intruder_shocking"
		sleep(32)
		icon_state = "intruder"

