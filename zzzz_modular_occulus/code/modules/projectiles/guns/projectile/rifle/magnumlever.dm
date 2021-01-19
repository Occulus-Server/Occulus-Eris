/obj/item/weapon/gun/projectile/shotgun/leveraction/magnum
	name = "lever-action rifle"
	desc = "A vintage USARC design. Old, yet reliable."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/magnumlever.dmi'
	icon_state = "leveraction"
	//item_state = "leveraction"
	max_shells = 5
	//w_class = ITEM_SIZE_HUGE
	//force = WEAPON_FORCE_PAINFUL
	//flags =  CONDUCT
	//slot_flags = SLOT_BACK
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)
	load_method = SINGLE_CASING
	ammo_type = /obj/item/projectile/bullet/magnum/rubber
	//handle_casings = HOLD_CASINGS
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	//bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	matter = list(MATERIAL_PLASTIC = 6, MATERIAL_STEEL = 18)
	price_tag = 600
	recoil_buildup = 20
	one_hand_penalty = 15 //full sized shotgun level

///obj/item/weapon/gun/projectile/shotgun/leveraction/consume_next_projectile()
	//if(chambered)
		//return chambered.BB
	//return null

///obj/item/weapon/gun/projectile/shotgun/leveraction/attack_self(mob/living/user as mob)
	//if(world.time >= recentpumpmsg + 10)
		//pump(user)
		//recentpumpmsg = world.time

///obj/item/weapon/gun/projectile/shotgun/leveraction/proc/pump(mob/M as mob)
	//var/turf/newloc = get_turf(src)
	//playsound(M, 'sound/weapons/shotgunpump.ogg', 60, 1)

	//if(chambered)//We have a shell in the chamber
		//chambered.forceMove(newloc) //Eject casing
		//chambered = null

	//if(loaded.len)
		//var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		//loaded -= AC //Remove casing from loaded list.
		//chambered = AC

	//update_icon()

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