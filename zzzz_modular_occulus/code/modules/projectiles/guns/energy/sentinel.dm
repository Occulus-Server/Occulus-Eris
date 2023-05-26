/obj/item/gun/energy/laser/sentinel
	name = "CAT \"Sentinel\""
	desc = "A \"Catalyzer\" gun designed around most popular laser weaponry. Its unique core grants it an extended charging limit."
	icon = 'zzzz_modular_occulus/icons/obj/guns/energy/sentinel.dmi'
	icon_state = "sentinel"
	item_state = null
	charge_meter = FALSE
	item_charge_meter = FALSE
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 5)
	zoom_factor = 0
	damage_multiplier = 0.5
	charge_cost = 125
	suitable_cell = /obj/item/cell/large
	cell_type = /obj/item/cell/large
	recoil_buildup = 2
	price_tag = 2500
	rarity_value = 12
	projectile_type = /obj/item/projectile/beam/midlaser
	overcharge_max = 30
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE,
		FULL_AUTO_400
	)
	twohanded = TRUE
	spawn_blacklisted = TRUE
	var/emagged = 0

/obj/item/gun/energy/laser/sentinel/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE,
		list(mode_name="hypercharge mode", mode_type = /datum/firemode/charge, projectile_type=/obj/item/projectile/beam/heavylaser , icon="charge", projectile_color = "#4415ff"),
		FULL_AUTO_400
		)
		return 1
	else
		to_chat(user, SPAN_WARNING("It is already emagged!"))

/obj/item/gun/energy/laser/sentinel/on_update_icon()
	overlays.Cut()
	var/ratio = 0

	if(cell)
		ratio = cell.charge / cell.maxcharge
		ratio = min(max(round(ratio, 0.25) * 100, 25), 100)
		if(charge_cost > cell.charge)
			add_overlay("[initial(icon_state)]-0")
		else
			add_overlay("[initial(icon_state)]-[ratio]")

	if(wielded)
		item_state_slots[slot_l_hand_str] = "lefthand"  + wielded_item_state
		item_state_slots[slot_r_hand_str] = "righthand" + wielded_item_state
	else
		item_state_slots[slot_l_hand_str] = "lefthand"
		item_state_slots[slot_r_hand_str] = "righthand"