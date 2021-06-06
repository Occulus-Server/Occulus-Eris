/obj/item/weapon/gun/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, state = GLOB.default_state)
	var/list/data = ui_data(user)

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "weapon_stats_updated.tmpl", name, 700, 550, state = state)
		ui.auto_update_layout = 1
		ui.set_initial_data(data)
		ui.open()