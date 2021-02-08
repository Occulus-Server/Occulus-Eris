/obj/item/weapon/gun/projectile/shotgun/leveraction/sawn/magnum
	name = "sawn-off lever-action rifle"
	desc = "Why would you do this? This is the definition of undercompensating."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/magnumleversawn.dmi'
	icon_state = "leveraction_sawed"
	max_shells = 4
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	caliber = CAL_MAGNUM
	ammo_type = /obj/item/projectile/bullet/magnum/rubber
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_STEEL = 12)	//less stuff out of it due to being sawed
	price_tag = 300	//becomes less valuable when you ruin it
	damage_multiplier = 1 //34 damage, 6 or so less than the unsawn version.
	armor_penetration = 1.05 //Around 15 armor penetration, less punchthrough because of the shorter barrel.
	sawn_result = null
