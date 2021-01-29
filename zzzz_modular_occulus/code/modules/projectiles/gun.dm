/obj/item/weapon/gun/ui_data(mob/user)
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
			data["attachments"] += list(list("name" = A.name, "icon" = getAtomCacheFilename(A)))


	return data