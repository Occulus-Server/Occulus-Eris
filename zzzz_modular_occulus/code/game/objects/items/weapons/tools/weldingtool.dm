/obj/item/weapon/tool/weldingtool/electric
	name = "electric welding tool"
	desc = "an electric welding tool used for welding or cutting things. Required a lot of power compared to other tools in order to produce sufficiant heat."
	icon_state = "welder"
	item_state = "welder"
	rarity_value = 60
	origin_tech = list(TECH_ENGINEERING = 3)

	sparks_on_use = TRUE
	eye_hazard = TRUE

	use_power_cost = 2.4
	suitable_cell = /obj/item/weapon/cell/medium
	use_fuel_cost = 0
	max_fuel = 0

	glow_color = COLOR_TEAL


	icon = 'zzzz_modular_occulus/icons/obj/_tools.dmi'
	icon_state = "ewelder_icon"
	item_icons = list(
		slot_l_hand_str = 'zzzz_modular_occulus/icons/obj/_tools.dmi',
		slot_r_hand_str = 'zzzz_modular_occulus/icons/obj/_tools.dmi'
		)
	item_state_slots = list(
		slot_l_hand_str = "ewelder_left",
		slot_r_hand_str = "ewelder_right"
		)