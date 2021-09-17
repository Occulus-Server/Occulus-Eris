/obj/item/weapon/gun/energy/resolute
	name = "DSS ECAR \"Resolute\""
	desc = "\"DeepFlare Security System\" energy carbine. The byzantine internal capacitor design requires this gun to fire in bursts of three. It has notably become a go to fire-arm for station security forces with it's stun capabilities."
	icon = 'zzzz_modular_occulus/icons/obj/guns/energy/resolute.dmi'
	item_state = "vulprifle"
	icon_state = "vulprifle"
	item_charge_meter = TRUE
	suitable_cell = /obj/item/weapon/cell/medium
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	one_hand_penalty = 10
	slot_flags = SLOT_BELT
	recoil_buildup = 5
	charge_cost = 30
	rarity_value = 12
	damage_multiplier = 1
	price_tag = 2500
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 7, MATERIAL_GOLD = 4)
	fire_sound = 'sound/weapons/Laser.ogg'
	rarity_value = 8
	init_firemodes = list(
		list(mode_name="stun", burst=3, projectile_type=/obj/item/projectile/beam/stun, fire_sound='sound/weapons/Taser.ogg', fire_delay=8, charge_cost=30, icon="stun", projectile_color = "#00FFFF"),
		list(mode_name="kill", burst=3, projectile_type=/obj/item/projectile/beam, fire_sound='sound/weapons/Laser.ogg', fire_delay=8, charge_cost=60, icon="kill", projectile_color = "#8bbdd9"),
		)

/obj/item/weapon/gun/energy/stalwart
	name = "DSS ESG \"Stalwart\""
	desc = "\"DeepFlare Security System\" tri-barrel energy scattergun. The stalwart comes with a built in bayonet and fires short tripple bursts of energized particles. "
	icon = 'zzzz_modular_occulus/icons/obj/guns/energy/stalwart.dmi'
	item_state = "vulpshotty"
	icon_state = "vulpshotty"
	item_charge_meter = TRUE
	suitable_cell = /obj/item/weapon/cell/medium
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_ROBUST
	one_hand_penalty = 10
	recoil_buildup = 25
	charge_cost = 180
	rarity_value = 12
	damage_multiplier = 1
	price_tag = 3500
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 7, MATERIAL_GOLD = 4)
	fire_sound = 'sound/weapons/guns/fire/energy_shotgun.ogg'
	rarity_value = 8
	init_firemodes = list(
		list(mode_name="kill", projectile_type=/obj/item/projectile/bullet/pellet/energy, fire_sound='sound/weapons/guns/fire/energy_shotgun.ogg', fire_delay=6, charge_cost=180, icon="kill" ),
		)