/obj/item/weapon/gun/projectile/olivaw
	name = "FS MP .35 Auto \"Olivaw\""
	desc = "A popular \"Frozen Star\" machine pistol. This one has a two-round burst-fire mode and is chambered for .35 auto. It can use normal and high capacity magazines."
	icon = 'icons/obj/guns/projectile/olivawcivil.dmi'
	icon_state = "olivawcivil"
	item_state = "pistol"
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	can_dual = 1
	caliber = CAL_PISTOL
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_H_PISTOL
	magazine_type = /obj/item/ammo_magazine/pistol
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 800
	damage_multiplier = 1.2
	penetration_multiplier = 1.2
	recoil_buildup = 6
	init_firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=1.2, move_delay=null, 				icon="semi"),
		list(mode_name="2-round bursts", burst=2, fire_delay=0.2, move_delay=4,    	icon="burst"),
		)

//	spawn_tags = SPAWN_TAG_FS_PROJECTILE

/obj/item/weapon/gun/projectile/olivaw/on_update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "[initial(icon_state)]"	// OCCULUS EDIT - Now this is no longer hardcoded to use olivawcivil
	else
		icon_state = "[initial(icon_state)]_empty"	// OCCULUS EDIT - Now this is no longer hardcoded to use olivawcivil
