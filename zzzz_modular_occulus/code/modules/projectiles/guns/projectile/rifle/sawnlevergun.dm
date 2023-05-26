/obj/item/gun/projectile/shotgun/leveraction/sawn
	name = "sawn-off lever-action shotgun"
	desc = "A favourite of bootleggers everywhere."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/sawnlevergun.dmi'
	icon_state = "sawnlevergun"
	item_state = "sawnlevergun"
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	can_dual = 1
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_WOOD = 8)	//less stuff out of it due to being sawed
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_PAINFUL
	price_tag = 800	//becomes less valuable when you ruin it
	damage_multiplier = 0.6 //slightly weaker due to sawn-off barrel
	penetration_multiplier = 0.8 //slightly weaker due to sawn-off barrel
	init_recoil = CARBINE_RECOIL(1.4)
	max_shells = 3	//one less shot due to shortened mag tube to go with the shortened barrel
	sawn_result = null
	cansaw = FALSE