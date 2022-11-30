/obj/item/gun
	var/knockback_change = 0 //allows the switching between boolean knockbacks - to-do: rewrite knockback

/obj/item/gun/ui_data(mob/user)
	var/list/data = list()
	data["damage_multiplier"] = damage_multiplier
	data["pierce_multiplier"] = pierce_multiplier
	data["penetration_multiplier"] = penetration_multiplier
	data["init_offset"] = init_offset

	data["fire_delay"] = fire_delay //time between shot, in ms
	data["burst"] = burst //How many shots are fired per click
	data["burst_delay"] = burst_delay //time between shot in burst mode, in ms

	data["force"] = force
	data["force_max"] = initial(force)*10
	data["muzzle_flash"] = muzzle_flash

	data["recoil_buildup"] = recoil_buildup
	data["recoil_buildup_max"] = initial(recoil_buildup)*10

	if(firemodes.len)
		var/list/firemodes_info = list()
		for(var/i = 1 to firemodes.len)
			data["firemode_count"] += 1
			var/datum/firemode/F = firemodes[i]
			firemodes_info += list(list(
				"index" = i,
				"current" = (i == sel_mode),
				"name" = F.name,
				"burst" = F.settings["burst"],
				"fire_delay" = F.settings["fire_delay"],
				"move_delay" = F.settings["move_delay"],
				))
		data["firemode_info"] = firemodes_info

	if(item_upgrades.len)
		data["attachments"] = list()
		for(var/atom/A in item_upgrades)
			data["attachments"] += list(list("name" = A.name, "icon" = SSassets.transport.get_asset_url(A)))


	return data

/obj/item/gun/Fire(atom/target, mob/living/user, clickparams, pointblank=0, reflex=0)
	if(!user || !target) return

	if(world.time < next_fire_time)
		if (!suppress_delay_warning && world.time % 3) //to prevent spam
			to_chat(user, SPAN_WARNING("[src] is not ready to fire again!"))
		return


	add_fingerprint(user)

	if(!special_check(user))
		return

	var/shoot_time = (burst - 1)* burst_delay
	user.setClickCooldown(shoot_time) //no clicking on things while shooting
	next_fire_time = world.time + shoot_time

	//actually attempt to shoot
	var/turf/targloc = get_turf(target) //cache this in case target gets deleted during shooting, e.g. if it was a securitron that got destroyed.
	for(var/i in 1 to burst)
		var/obj/projectile = consume_next_projectile(user)
		if(!projectile)
			handle_click_empty(user)
			break

		projectile.multiply_projectile_damage(damage_multiplier)

		projectile.multiply_projectile_penetration(penetration_multiplier)

		projectile.multiply_pierce_penetration(pierce_multiplier)

		projectile.multiply_projectile_step_delay(proj_step_multiplier)

		projectile.change_knockback(knockback_change)

		if(istype(projectile, /obj/item/projectile))
			var/obj/item/projectile/P = projectile
			P.adjust_damages(proj_damage_adjust)

		if(pointblank)
			process_point_blank(projectile, user, target)
		if(projectile_color)
			projectile.icon = get_proj_icon_by_color(projectile, projectile_color)
			if(istype(projectile, /obj/item/projectile))
				var/obj/item/projectile/P = projectile
				P.proj_color = projectile_color
		if(process_projectile(projectile, user, target, user.targeted_organ, clickparams))
			handle_post_fire(user, target, pointblank, reflex)
			update_icon()

		if(i < burst)
			sleep(burst_delay)

		if(!(target && target.loc))
			target = targloc
			pointblank = 0

	//update timing
	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	user.set_move_cooldown(move_delay)
	if(!twohanded && user.stats.getPerk(PERK_GUNSLINGER))
		next_fire_time = world.time + fire_delay - fire_delay * 0.33
	else
		next_fire_time = world.time + fire_delay

	if(muzzle_flash)
		set_light(0)