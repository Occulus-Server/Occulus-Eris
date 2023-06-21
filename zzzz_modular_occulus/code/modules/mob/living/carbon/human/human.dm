///earcheck()
///Returns a number between 0 and 1
/mob/living/carbon/human/earcheck()
	return ear_protection

/atom/proc/siren_ex_act()
	return

/mob/living/carbon/human/siren_ex_act(severity, epicenter)
	if(!blinded)
		if (HUDtech.Find("flash"))
			flick("flash", HUDtech["flash"])

	var/shielded = 0
	var/b_loss
	var/f_loss
	var/bomb_defense = getarmor(null, ARMOR_BOMB) + mob_bomb_defense
	var/target_turf = get_turf_away_from_target_simple(src, epicenter, 8)
	var/throw_distance = 8 - 2*severity
	throw_at(target_turf, throw_distance, 5)
	Weaken(severity) // If they don't get knocked out , weaken them for a bit.

	switch (severity)
		if (1.0)
			b_loss += 500
			if (!prob(bomb_defense))
				gib()
				return
			else
				var/atom/target = get_edge_target_turf(src, get_dir(src, get_step_away(src, src)))
				throw_at(target, 200, 4)
			//return
//				var/atom/target = get_edge_target_turf(user, get_dir(src, get_step_away(user, src)))
				//user.throw_at(target, 200, 4)

		if (2.0)
			if (!shielded)
				b_loss += 50

			if (!istype(l_ear, /obj/item/clothing/ears/earmuffs) && !istype(r_ear, /obj/item/clothing/ears/earmuffs))
				ear_damage += 30
				ear_deaf += 120
			if (prob(70) && !shielded)
				Paralyse(10)

		if(3.0)
			b_loss += 50
			if (!istype(l_ear, /obj/item/clothing/ears/earmuffs) && !istype(r_ear, /obj/item/clothing/ears/earmuffs))
				ear_damage += 15
				ear_deaf += 60
			if (prob(50) && !shielded)
				Paralyse(10)
	if (bomb_defense)
		b_loss = max(b_loss - bomb_defense, 0)
		f_loss = max(f_loss - bomb_defense, 0)

	var/organ_hit = BP_CHEST //Chest is hit first
	var/exp_damage
	while (b_loss > 0)
		b_loss -= exp_damage = rand(0, b_loss)
		src.apply_damage(exp_damage, BRUTE, organ_hit)
		organ_hit = pickweight(list(BP_HEAD = 0.2, BP_GROIN = 0.2, BP_R_ARM = 0.1, BP_L_ARM = 0.1, BP_R_LEG = 0.1, BP_L_LEG = 0.1))  //We determine some other body parts that should be hit
