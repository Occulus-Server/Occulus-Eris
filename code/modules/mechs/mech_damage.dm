/mob/living/exosuit/apply_effect(effect = 0, effecttype = STUN, armor_value = 0, check_protection = TRUE)
	if(!effect || (armor_value >= 100))
		return 0
	if(LAZYLEN(pilots) && !prob(body.pilot_coverage))
		if(effect > 0 && effecttype == IRRADIATE)
			effect = max((1 - (getarmor(null, ARMOR_RAD) / 100)) * effect / (armor_value + 1),0)
		var/mob/living/pilot = pick(pilots)
		return pilot.apply_effect(effect, effecttype, armor_value)
	if(!(effecttype in list(AGONY, STUTTER, EYE_BLUR, DROWSY, STUN, WEAKEN)))
		. = ..()

/mob/living/exosuit/resolve_item_attack(obj/item/I, mob/living/user, def_zone)
	if(!I.force)
		user.visible_message(SPAN_NOTICE("\The [user] bonks \the [src] harmlessly with \the [I]."))
		return

	if(LAZYLEN(pilots) && !prob(body.pilot_coverage))
		var/mob/living/pilot = pick(pilots)
		return pilot.resolve_item_attack(I, user, def_zone)

	return def_zone //Careful with effects, mechs shouldn't be stunned

/mob/living/exosuit/getarmor(def_zone, type)
	. = ..()
	if(body?.armor_plate)
		var/body_armor = body.armor_plate?.armor.getRating(type)
		if(body_armor) . += body_armor

/mob/living/exosuit/updatehealth()
	if(body) maxHealth = body.mech_health
	health = maxHealth - (getFireLoss() + getBruteLoss())

/mob/living/exosuit/adjustFireLoss(amount, obj/item/mech_component/MC = pick(list(arms, legs, body, head)))
	if(MC)
		MC.take_burn_damage(amount)
		MC.update_health()

/mob/living/exosuit/adjustBruteLoss(amount, obj/item/mech_component/MC = pick(list(arms, legs, body, head)))
	if(MC)
		MC.take_brute_damage(amount)
		MC.update_health()

/mob/living/exosuit/proc/zoneToComponent(zone)
	switch(zone)
		if(BP_EYES, BP_HEAD) return head
		if(BP_L_ARM, BP_R_ARM) return arms
		if(BP_L_LEG, BP_R_LEG) return legs
		else return body


/mob/living/exosuit/apply_damage(damage = 0, damagetype = BRUTE, def_zone = null, sharp = FALSE, edge = FALSE, obj/used_weapon = null)
	. = ..()
	updatehealth()

/mob/living/exosuit/getFireLoss()
	var/total = 0
	for(var/obj/item/mech_component/MC in list(arms, legs, body, head))
		total += MC.burn_damage
	return total

/mob/living/exosuit/getBruteLoss()
	var/total = 0
	for(var/obj/item/mech_component/MC in list(arms, legs, body, head))
		total += MC.brute_damage
	return total

/mob/living/exosuit/emp_act(severity)
	var/ratio = getarmor(null, ARMOR_ENERGY)

	if(ratio >= 1)
		for(var/mob/living/m in pilots)
			to_chat(m, SPAN_NOTICE("Your Faraday shielding absorbed the pulse!"))
		return
	else if(ratio > 0)
		for(var/mob/living/m in pilots)
			to_chat(m, SPAN_NOTICE("Your Faraday shielding mitigated the pulse!"))

		emp_damage += round((12 - (severity*3))*( 1 - ratio))
		if(severity <= 3)
			for(var/obj/item/thing in list(arms,legs,head,body))
				thing.emp_act(severity)
			if(!hatch_closed || !prob(body.pilot_coverage))
				for(var/thing in pilots)
					var/mob/pilot = thing
					pilot.emp_act(severity)

// Occulus Edit: Exosuit falling Borrowed from robot_damage!

/mob/living/exosuit/get_fall_damage(turf/from, turf/dest)
	//Exosuits should not be falling! Their bulky inarticulate frames lack shock absorbers, and gravity turns their armor plating against them
	//Falling down a floor is extremely painful for robots, and for anything under them, including the floor

	var/damage = maxHealth*0.66 //Two-thirds of their health.
	//A percentage is used here to simulate different robots having different masses. The bigger they are, the harder they fall

	//Mechs falling two floors will be wreaked
	if (from && dest)
		damage *= abs(from.z - dest.z)

	return damage

/mob/living/exosuit/fall_impact(turf/from, turf/dest)
	apply_damage(get_fall_damage(from, dest), BRUTE)
	Stun(5)
	updatehealth()
	//Wreck the contents of the tile
	for (var/atom/movable/AM in dest)
		if (AM != src)
			AM.ex_act(3)

	//Damage the tile itself
	dest.ex_act(2)

	//Damage surrounding tiles
	for (var/turf/T in range(1, src))
		if (T == dest)
			continue

		T.ex_act(3)

	//And do some screenshake for everyone in the vicinity
	for (var/mob/M in range(20, src))
		var/dist = get_dist(M, src)
		dist *= 0.5
		if (dist <= 1)
			dist = 1 //Prevent runtime errors

		shake_camera(M, 10/dist, 2.5/dist, 0.12)

	playsound(src, 'sound/weapons/heavysmash.ogg', 100, 1, 20,20)
	spawn(1)
		playsound(src, 'sound/weapons/heavysmash.ogg', 100, 1, 20,20)
	spawn(2)
		playsound(src, 'sound/weapons/heavysmash.ogg', 100, 1, 20,20)
	playsound(src, pick(robot_talk_heavy_sound), 100, 1, 5,5)
