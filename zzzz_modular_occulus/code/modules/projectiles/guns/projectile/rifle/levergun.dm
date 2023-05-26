/obj/item/gun/projectile/shotgun/leveraction
	name = "lever-action shotgun"
	desc = "A vintage Winchester design. Old, yet reliable."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/levergun.dmi'
	icon_state = "levergun"
	item_state = "levergun"
	max_shells = 4
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	flags =  CONDUCT
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	handle_casings = HOLD_CASINGS
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 1000
	init_recoil = CARBINE_RECOIL(20)
	damage_multiplier = 0.8
	var/sawn_result = /obj/item/gun/projectile/shotgun/leveraction/sawn	//snowflake way to make this not hardcoded
	var/cansaw = TRUE

/obj/item/gun/projectile/shotgun/leveraction/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/gun/projectile/shotgun/leveraction/attack_self(mob/living/user as mob)
	if(world.time >= recentpumpmsg + 10)
		pump(user)
		recentpumpmsg = world.time

/obj/item/gun/projectile/shotgun/leveraction/proc/pump(mob/M as mob)
	var/turf/newloc = get_turf(src)
	playsound(M, 'sound/weapons/shotgunpump.ogg', 60, 1)

	if(chambered)//We have a shell in the chamber
		chambered.forceMove(newloc) //Eject casing
		chambered = null

	if(loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC

	update_icon()

/obj/item/gun/projectile/shotgun/leveraction/attackby(var/obj/item/A as obj, mob/user as mob)
	if(QUALITY_SAWING in A.tool_qualities)
		if(cansaw)
			to_chat(user, SPAN_NOTICE("You begin to shorten the barrel of \the [src]."))
			if(A.use_tool(user, src, WORKTIME_FAST, QUALITY_SAWING, FAILCHANCE_NORMAL, required_stat = STAT_COG))
				qdel(src)
				var/thingy_that_gets_spawned_to_represent_the_thing_getting_sawed = new sawn_result(usr.loc)
				user.put_in_hands(thingy_that_gets_spawned_to_represent_the_thing_getting_sawed)
				to_chat(user, SPAN_WARNING("You shorten the barrel of \the [src]!"))
			else
				to_chat(user, SPAN_WARNING("You have already shortened the barrel of \the [src]!"))
	else
		..()

/datum/design/autolathe/gun/leveraction
	name = "lever-action shotgun"
	build_path = /obj/item/gun/projectile/shotgun/leveraction

/obj/item/computer_hardware/hard_drive/portable/design/guns/fs_leveraction
	disk_name = "Frozen Star - .50 Lever-Action Shotgun"
	icon_state = "frozenstar"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/leveraction = 3,
		/datum/design/autolathe/ammo/shotgun_pellet,
		/datum/design/autolathe/ammo/shotgun,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks,
		/datum/design/autolathe/ammo/shotgun_flash,
		)