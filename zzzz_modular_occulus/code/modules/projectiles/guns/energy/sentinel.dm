/obj/item/weapon/gun/energy/laser/sentinel
	name = "CAT \"Sentinel\""
	desc = "A \"Catalyser\" gun designed around most popular laser weaponry. Its unique core grants it an extended charging limit."
	icon = 'icons/obj/guns/energy/laser.dmi'
	icon_state = "laser"
	item_state = "laser"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 5)
	zoom_factor = 0
	damage_multiplier = 0.5
	charge_cost = 125
	suitable_cell = /obj/item/weapon/cell/large
	cell_type = /obj/item/weapon/cell/large
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
	var/emagged = 0

/obj/item/weapon/gun/energy/laser/sentinel/emag_act(var/remaining_charges, var/mob/user)
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