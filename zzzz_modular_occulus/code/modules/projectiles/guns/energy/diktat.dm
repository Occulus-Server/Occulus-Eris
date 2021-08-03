/obj/item/weapon/gun/energy/plasma/diktat
	name = "CAT \"Diktat\""
	desc = "A \"Catalyser\" energy gun, The Diktat refines energy into an overly energetic plasma, spewing balls of nigh-unquenchable energy."
	icon = 'zzzz_modular_occulus/icons/obj/guns/energy/diktat.dmi'
	icon_state = "diktat"
	charge_meter = FALSE
	item_state = null
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
	twohanded = TRUE
	var/emagged = 0

	init_firemodes = list(
		list(mode_name="melt", projectile_type=/obj/item/projectile/plasma, fire_delay=10, charge_cost=100, icon="kill", projectile_color = "#FF0000"),
		list(mode_name="INCINERATE", projectile_type=/obj/item/projectile/plasma/heavy, fire_delay=15, charge_cost=250, icon="destroy", projectile_color = "#FFFFFF"),
		list(mode_name="full auto", projectile_type=/obj/item/projectile/plasma/light, mode_type = /datum/firemode/automatic, fire_delay=5  , charge_cost=125, icon="auto", projectile_color = "#9F87FF"),
	)

/obj/item/weapon/gun/energy/plasma/diktat/emag_act(var/remaining_charges, var/mob/user)
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

/obj/item/weapon/gun/energy/plasma/diktat/on_update_icon()
	set_item_state("-[item_modifystate]")
	cut_overlays()
	var/ratio = 0

	if(cell)
		ratio = cell.charge / cell.maxcharge
		ratio = min(max(round(ratio, 0.25) * 100, 25), 100)
		add_overlay("[initial(icon_state)]-[ratio]")