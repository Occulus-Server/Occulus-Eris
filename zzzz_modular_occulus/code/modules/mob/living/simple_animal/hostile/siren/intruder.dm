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
	agony_coefficient = 0.8
	ranged = 1
	rapid = 3
	retreat_distance = 3
	minimum_distance = 3
	fire_verb = "fires a bolt strange energy" //reminder that the attack message is "\red <b>[src]</b> [fire_verb] at [target]!"
	projectiletype = /obj/item/projectile/beam/siren
	speed = 4
	maxHealth = 100
	health = 100
	harm_intent_damage = 25
	melee_damage_lower = 20
	melee_damage_upper = 30
	attacktext = "slammed"
	environment_smash = ENVIRONMENT_SMASH_NONE
	mob_inaccuracy = 33		//percent chance for a ranged mob's shot to go wide.
	shot_variance = 20		//degree of shot widening.
	var/sounddelay = 0
	var/shockdelay = 0
	var/energy = 0
	var/special_ability_cooldown
	var/ability_cooldown = 20
	var/list/soundlist = list('zzzz_modular_occulus/sound/effects/dronehover.ogg')
	sirenspeechlist = list("")
	var/loot_table = list(/obj/item/cell/small/moebius/nuclear,
						/obj/spawner/tool_upgrade/rare,
						/obj/spawner/material/resources/rare)

/mob/living/simple_animal/hostile/siren/intruder/Life()
	. = ..()
	if(health >=15)
		soundloop()
	//	if(target_mob)	//Shockloop. Can't get lightning beams to work. Only the damage effects. This is a struggle. Will fix later.
	//		shockloop()

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
	visible_emote("unleashes arcs of electricity!")
	playsound(src, 'zzzz_modular_occulus/sound/effects/Lightningbolt.ogg', 90, 1)
	shockicon()
	for(var/mob/living/victim in view(src))
		tesla_zap(src, 5, 1200, FALSE, TRUE)

/mob/living/simple_animal/hostile/siren/intruder/proc/shockicon()
	if(icon_state == "intruder")
		icon_state = "intruder_shocking"
		sleep(32)
		icon_state = "intruder"

