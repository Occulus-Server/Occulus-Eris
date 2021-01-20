/obj/item/weapon/gun/projectile/shotgun/leveraction/magnum
	name = "lever-action rifle"
	desc = "A vintage USARC design. Old, yet reliable."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/magnumlever.dmi'
	icon_state = "leveraction"
	max_shells = 5
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)
	load_method = SINGLE_CASING
	ammo_type = /obj/item/projectile/bullet/magnum/rubber
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	matter = list(MATERIAL_PLASTIC = 6, MATERIAL_STEEL = 18)
	price_tag = 600
	recoil_buildup = 20
	one_hand_penalty = 15 //full sized shotgun level

/obj/item/weapon/gun/projectile/shotgun/leveraction/magnum/attackby(var/obj/item/A as obj, mob/user as mob)
	if(QUALITY_SAWING in A.tool_qualities)
		to_chat(user, SPAN_NOTICE("You begin to shorten the barrel of \the [src]."))
		if(A.use_tool(user, src, WORKTIME_FAST, QUALITY_SAWING, FAILCHANCE_NORMAL, required_stat = STAT_COG))
			qdel(src)
			new /obj/item/weapon/gun/projectile/shotgun/leveraction/sawn/magnum(usr.loc)
			to_chat(user, SPAN_WARNING("You shorten the barrel of \the [src]!"))
	else
		..()

/datum/design/autolathe/gun/leveraction/magnum
	name = "lever-action rifle"
	build_path = /obj/item/weapon/gun/projectile/shotgun/leveraction/magnum

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/fs_leveraction_rifle
	disk_name = "Frozen Star - .40 Lever-Action Rifle"
	icon_state = "frozenstar"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/leveraction/magnum = 3,
		/datum/design/autolathe/ammo/magnum_ammobox,
		/datum/design/autolathe/ammo/magnum_ammobox/rubber,
		/datum/design/autolathe/ammo/magnum_ammobox/practice = 0,
		)