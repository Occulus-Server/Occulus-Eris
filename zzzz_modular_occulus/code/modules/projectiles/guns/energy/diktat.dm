/obj/item/weapon/gun/energy/plasma/diktat
	name = "CAT \"Diktat\""
	desc = "A \"Catalyser\" energy gun, The Diktat refines energy into an overly energetic plasma, spewing balls of nigh-unquenchable energy."
	icon = 'icons/obj/guns/energy/pulse.dmi'
	icon_state = "pulse"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 7, MATERIAL_URANIUM = 8)
	price_tag = 4500
	fire_sound = 'sound/weapons/pulse.ogg'
	suitable_cell = /obj/item/weapon/cell/large
	damage_multiplier = 0.5
	recoil_buildup = 2 
	twohanded = TRUE
	var/emagged = 0

	init_firemodes = list(
		list(mode_name="melt", projectile_type=/obj/item/projectile/plasma, fire_delay=10, charge_cost=75, icon="kill", projectile_color = "#FF0000"),
		list(mode_name="INCINERATE", projectile_type=/obj/item/projectile/plasma/heavy, fire_delay=15, charge_cost=250, icon="destroy", projectile_color = "#FFFFFF"),
		list(mode_name="full auto", projectile_type=/obj/item/projectile/plasma/light, mode_type = /datum/firemode/automatic, fire_delay=5  , charge_cost=125, icon="auto", projectile_color = "#9F87FF"),
	)

/obj/item/weapon/gun/energy/plasma/diktat/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		init_firemodes = list(
			list(mode_name="melt", projectile_type=/obj/item/projectile/plasma, fire_delay=10, charge_cost=75, icon="kill", projectile_color = "#FF0000"),
			list(mode_name="INCINERATE", projectile_type=/obj/item/projectile/plasma/heavy, fire_delay=15, charge_cost=150, icon="destroy", projectile_color = "#FFFFFF"),
			list(mode_name="CONFLAGRATE", projectile_type=/obj/item/projectile/flamer_lob, fire_delay=6, charge_cost=300, icon="vaporize"),
			list(mode_name="full auto", projectile_type=/obj/item/projectile/plasma/light, mode_type = /datum/firemode/automatic, fire_delay=4  , charge_cost=125, icon="auto", projectile_color = "#9F87FF"),
	)
		return 1
	else
		to_chat(user, SPAN_WARNING("It is already emagged!"))