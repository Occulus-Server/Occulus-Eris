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
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	handle_casings = HOLD_CASINGS
	unload_sound = 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/rev_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/rev_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 1000
	rarity_value = 16
	recoil_buildup = 10 //it's a one-handed shotgun lmao

/*
/obj/item/weapon/gun/projectile/revolver/tauceti/verb/spin_cylinder()
	set name = "Spin cylinder"
	set desc = "Fun when you're bored out of your skull."
	set category = "Object"

	chamber_offset = 0
	visible_message(SPAN_WARNING("\The [usr] spins the cylinder of \the [src]!"), \
	SPAN_NOTICE("You hear something metallic spin and click."))
	playsound(src.loc, 'sound/weapons/revolver_spin.ogg', 100, 1)
	loaded = shuffle(loaded)
	if(rand(1,max_shells) > loaded.len)
		chamber_offset = rand(0,max_shells - loaded.len)

/obj/item/weapon/gun/projectile/revolver/tauceti/consume_next_projectile()
	if(chamber_offset)
		chamber_offset--
		return
	return ..()

/obj/item/weapon/gun/projectile/revolver/tauceti/load_ammo(obj/item/A, mob/user)
	chamber_offset = 0
	return ..()

/obj/item/weapon/gun/projectile/revolver/tauceti/tauceti/proc/update_charge()
	if(!drawChargeMeter)
		return
	cut_overlays()
	if(loaded.len==0)
		add_overlays("[icon_state]_off")
	else
		add_overlays("[icon_state]_on")


/obj/item/weapon/gun/projectile/revolver/tauceti/tauceti/on_update_icon()
	update_charge()

/obj/item/weapon/gun/projectile/revolver/tauceti/tauceti/generate_guntags()
	..()
	gun_tags |= GUN_REVOLVER
	*/