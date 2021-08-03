/obj/item/weapon/gun/energy/shrapnel/corsair
	name = "CAT \"Corsair\""
	desc = "A \"Catalyser\" energy gun that uses a catalytic conversion system to compile energy into a solid, sharpened mass."
	icon = 'zzzz_modular_occulus/icons/obj/guns/energy/corsair.dmi'
	icon_state = "corsair"
	charge_meter = FALSE
	item_state = null
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	flags =  CONDUCT
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2, TECH_ENGINEERING = 4)
	charge_cost = 25
	damage_multiplier = 0.5
	suitable_cell = /obj/item/weapon/cell/large
	cell_type = /obj/item/weapon/cell/large
	projectile_type = /obj/item/projectile/bullet
	recoil_buildup = 3
	fire_delay = 2 //Equivalent to a pump then fire time
	fire_sound = 'sound/weapons/guns/fire/energy_shotgun.ogg'
	init_firemodes = list(
		list(mode_name="Single shot", mode_desc="Fires a pistol synth-shot", projectile_type=/obj/item/projectile/bullet/pistol, fire_delay=5, charge_cost=100, icon="kill"),
		list(mode_name="Shotgun", mode_desc="Fires a splintering synth-shot", projectile_type=/obj/item/projectile/bullet/pellet/shotgun, fire_delay=10, charge_cost=500, icon="charge"),
		list(mode_name="full auto", projectile_type=/obj/item/projectile/bullet/pistol, mode_type = /datum/firemode/automatic, fire_delay=1.2  , charge_cost=125, icon="auto"),
	)
	consume_cell = FALSE
	price_tag = 2500
	rarity_value = 20
	spawn_tags = SPAWN_TAG_GUN_SHOTGUN_ENERGY
	twohanded = TRUE
	var/emagged = 0
	
/obj/item/weapon/gun/energy/shrapnel/corsair/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		init_firemodes = list(
			list(mode_name="Single shot", mode_desc="Fires a pistol synth-shot", projectile_type=/obj/item/projectile/bullet/pistol, fire_delay=5, charge_cost=100, icon="kill"),
			list(mode_name="Shotgun", mode_desc="Fires a splintering synth-shot", projectile_type=/obj/item/projectile/bullet/pellet/shotgun, fire_delay=10, charge_cost=500, icon="charge"),
			list(mode_name="Bunker Buster", mode_desc="Fires a high-caliber synth-shot", projectile_type=/obj/item/projectile/bullet/antim, fire_delay=20, charge_cost=1000, icon="destroy"),
			list(mode_name="full auto", projectile_type=/obj/item/projectile/bullet/pistol, mode_type = /datum/firemode/automatic, fire_delay=1.2  , charge_cost=125, icon="auto"),
		)
		return 1
	else
		to_chat(user, SPAN_WARNING("It is already emagged!"))

/obj/item/weapon/gun/energy/shrapnel/corsair/on_update_icon()
	set_item_state("-[item_modifystate]")
	cut_overlays()
	var/ratio = 0

	if(cell)
		ratio = cell.charge / cell.maxcharge
		ratio = min(max(round(ratio, 0.25) * 100, 25), 100)
		add_overlay("[initial(icon_state)]-[ratio]")
