/obj/item/weapon/gun/projectile/revolver/tauceti
	name = "OR REV \"Tau Ceti Special\""
	desc = "The iconic weapon of the Oberth Republic, and homeland security's nightmare. A five-chamber revolver that fires .50 caliber shotgun shells, made entirely of plastic polymers to foil security sensors. Due to its small size, it's concealable in nearly any pocket or case. Because of its origin, it has no official name, but is called the 'Tau Ceti Special' by those in the Republic, named after the 2421 terrorist attack on Tau Ceti where it was prominently used in mass-executions."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/taucetispecial.dmi'
	icon_state = "taucetispecial"
	item_state = "taucetispecial"
	max_shells = 5
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_NORMAL
	can_dual = TRUE
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING
	mag_well = MAG_WELL_RIFLE
	handle_casings = HOLD_CASINGS
	unload_sound = 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/rev_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/rev_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	matter = list(MATERIAL_PLASTIC = 20)
	price_tag = 300
	rarity_value = 16
	recoil_buildup = 10 //it's a one-handed shotgun lmao