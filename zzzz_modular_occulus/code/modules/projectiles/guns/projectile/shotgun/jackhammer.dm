/obj/item/weapon/gun/projectile/shotgun/bojevic/jackhammer //yes im this lazy
	name = "FS SG \"Ironhammer\""
	desc = "An icon. A symbol of power. The hammer that will strike down your foes. \
			It's a fully automatic magazine-fed shotgun designed for subduing unarmored threats. \
			Based off an ancient prototype, this weapon is more than capable of keeping the peace. \
			Has rather considerable recoil. Compatible only with special M12 8-round drum magazines."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/jackhammer.dmi'
	icon_state = "jackhammer"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 10000
	damage_multiplier = 0.8 //same as bojevic
	penetration_multiplier = 0.6
	recoil_buildup = 15
	one_hand_penalty = 15
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
