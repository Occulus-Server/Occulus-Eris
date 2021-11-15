/obj/item/weapon/gun/energy/plasma/didact
	name = "CAT \"Didact\""
	desc = "A \"Catalyzer\" energy gun, The Didact refines energy into an overly energetic plasma, spewing balls of nigh-unquenchable energy."
	icon = 'zzzz_modular_occulus/icons/obj/guns/energy/didact.dmi'
	icon_state = "didact"
	item_charge_meter = FALSE
	charge_meter = FALSE
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 7, MATERIAL_URANIUM = 8)
	price_tag = 4500
	fire_sound = 'sound/weapons/pulse.ogg'
	suitable_cell = /obj/item/weapon/cell/large
	damage_multiplier = 0.5
	recoil_buildup = 2 
	sel_mode = 1
	spawn_blacklisted = TRUE
	twohanded = TRUE
	var/emagged = 0

	init_firemodes = list(
		list(mode_name="melt", projectile_type=/obj/item/projectile/plasma, fire_delay=10, charge_cost=100, icon="kill", projectile_color = "#FF0000"),
		list(mode_name="INCINERATE", projectile_type=/obj/item/projectile/plasma/heavy, fire_delay=15, charge_cost=250, icon="destroy", projectile_color = "#FFFFFF"),
		list(mode_name="full auto", projectile_type=/obj/item/projectile/plasma/light, mode_type = /datum/firemode/automatic, fire_delay=5  , charge_cost=125, icon="auto", projectile_color = "#9F87FF"),
	)

/obj/item/weapon/gun/energy/plasma/didact/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		init_firemodes = list(
			list(mode_name="melt", projectile_type=/obj/item/projectile/plasma, fire_delay=10, charge_cost=100, icon="kill", projectile_color = "#FF0000"),
			list(mode_name="INCINERATE", projectile_type=/obj/item/projectile/plasma/heavy, fire_delay=15, charge_cost=150, icon="destroy", projectile_color = "#FFFFFF"),
			list(mode_name="CONFLAGRATE", projectile_type=/obj/item/projectile/flamer_lob, damage_multiplier=0.8, fire_delay=6, charge_cost=300, icon="vaporize"),
			list(mode_name="full auto", projectile_type=/obj/item/projectile/plasma/light, mode_type = /datum/firemode/automatic, fire_delay=4  , charge_cost=125, icon="auto", projectile_color = "#9F87FF"),
	)
		return 1
	else
		to_chat(user, SPAN_WARNING("It is already emagged!"))

/obj/item/weapon/gun/energy/plasma/didact/on_update_icon()
	cut_overlays()
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