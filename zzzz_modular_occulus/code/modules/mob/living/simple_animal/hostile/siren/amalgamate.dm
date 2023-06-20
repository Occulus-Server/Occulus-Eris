/mob/living/simple_animal/hostile/siren/amalgamate
	name = "amalgamate"
	desc = "A swarm of undulating nanites shaping themselves roughly like a person. Water seems to upset it's programming."
	icon = 'zzzz_modular_occulus/icons/mob/siren/general.dmi'
	icon_state = "amalgamate"
	icon_living = "amalgamate"
	icon_aggro = "amalgamate"
	icon_dead = "sixleg-dead"
	icon_gib = "syndicate_gib"
	mouse_opacity = 2
	move_to_delay = 5
	vision_range = 5
	agony_coefficient = 0.3
	aggro_vision_range = 11
	retreat_distance = 0
	minimum_distance = 0
	speed = 4
	maxHealth = 80
	health = 80
	harm_intent_damage = 15
	melee_damage_lower = 5
	melee_damage_upper = 15
	attacktext = "engulfs"
	environment_smash = ENVIRONMENT_SMASH_NONE
	var/special_ability_cooldown
	var/ability_cooldown = 20
	var/sounddelay = 0
	var/attack_cooldown_time = 4 SECONDS
	var/attack_cooldown

/mob/living/simple_animal/hostile/siren/amalgamate/Initialize()
	. = ..()
	src.AddComponent(/datum/component/glomper)

/mob/living/simple_animal/hostile/siren/amalgamate/Life()	//This shall be our AI holy grail.
	. = ..()
	siphon()
	soundloop()
	GET_COMPONENT_FROM(G, /datum/component/glomper, src)
	if(G.Target && G.Target.stat >= UNCONSCIOUS)
		release()

/mob/living/simple_animal/hostile/siren/amalgamate/proc/soundloop()
	if( sounddelay == 0)
		visible_emote("chitters!")
		playsound(src.loc, 'zzzz_modular_occulus/sound/effects/nanitechittering.ogg', 100, 1, 8, 8)
		sounddelay = 8
	else
		sounddelay--
/mob/living/simple_animal/hostile/siren/amalgamate/death()
	..()
	qdel(src)

/mob/living/simple_animal/hostile/siren/amalgamate/AttackingTarget()
	if(!Adjacent(target_mob))
		return
	if(world.time >= attack_cooldown)
		glomp(target_mob)
		attack_cooldown = world.time + attack_cooldown_time

	if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return L
	if(istype(target_mob,/mob/living/exosuit))
		var/mob/living/exosuit/M = target_mob
		M.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return M
	if(istype(target_mob,/obj/machinery/bot))
		var/obj/machinery/bot/B = target_mob
		B.attack_generic(src,rand(melee_damage_lower,melee_damage_upper),attacktext)
		return B

/mob/living/simple_animal/hostile/siren/amalgamate/proc/Shortcircuit()
	release()
	do_sparks(3,0,src.loc)
	src.adjustBruteLoss(20)
	src.adjustFireLoss(20)
/mob/living/simple_animal/hostile/siren/amalgamate/emp_act(severity)
	Shortcircuit()



/datum/component/glomper
	var/mob/living/Target

/datum/component/glomper/Initialize()
	if(!istype(parent, /mob/living))
		return COMPONENT_INCOMPATIBLE

/datum/component/glomper/proc/attach(mob/NewTarget)
	if(istype(Target))
		detach()
	Target = NewTarget
	RegisterSignal(Target, COMSIG_MOVABLE_MOVED, .proc/follow)
	follow(Target.loc, Target.loc)

/datum/component/glomper/proc/detach()
	UnregisterSignal(Target, COMSIG_MOVABLE_MOVED)
	Target = null

/datum/component/glomper/proc/follow(oldloc, newloc)
	var/mob/living/P = parent
	P.forceMove(newloc)
	P.dir = Target.dir

/mob/living/simple_animal/hostile/siren/amalgamate/proc/glomp(mob/living/Target)
	GET_COMPONENT_FROM(G, /datum/component/glomper, src)
	if(!G)
	//Probably give a runtime here.
		return
	G.attach(Target)
	visible_message(SPAN_WARNING("[src] engulfs [G.Target]!"))
	G.Target.visible_message(SPAN_DANGER("You feel like you're being compressed and stretched at the same time!"))

/mob/living/simple_animal/hostile/siren/amalgamate/proc/release()
	GET_COMPONENT_FROM(G, /datum/component/glomper, src)
	if(!G)
		//Runtime again aaa
		return
	attack_cooldown = world.time + ranged_cooldown_time
	visible_message(SPAN_WARNING("[src] is no longer engulfing [G.Target]!"))
	G.detach()


/mob/living/simple_animal/hostile/siren/amalgamate/proc/siphon()
	GET_COMPONENT_FROM(G, /datum/component/glomper, src)
	if(!G)
		//Runtime again?! Impossible!!!!!!!!
		return
	if(!G.Target)
		return //Nothing to siphon.
	src.adjustOxyLoss(-8) //Heal yourself
	src.adjustBruteLoss(-8)
	src.adjustFireLoss(-8)
	adjustCloneLoss(-8)
	G.Target.adjustBruteLoss(rand(2,3))//Code here to drain health from target
	G.Target.adjustFireLoss(rand(1,2))

