/obj/item/weapon/gun/projectile/shotgun/leveraction/sawn/magnum
	name = "sawn-off lever-action rifle"
	desc = "Why would you do this? This is the definition of undercompensating."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/magnumleversawn.dmi'
	icon_state = "leveraction_sawed"
	caliber = CAL_MAGNUM
	ammo_type = /obj/item/projectile/bullet/magnum/rubber
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_STEEL = 12)	//less stuff out of it due to being sawed
	price_tag = 300	//becomes less valuable when you ruin it
