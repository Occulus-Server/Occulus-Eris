/obj/item/gun/energy/laser/railgun
	name = "NT \"Reductor\" rail rifle"
	desc = "\"Moebius\" brand rail gun. This gun features a sleek and deadly design with the capability for lethal and non-lethal firing modes. A competant engineer can also overclock it using a wrench, \
	consuming the cell within for an extra bullet."
	icon = 'zzzz_modular_occulus/icons/obj/guns/energy/railgun.dmi'
	icon_state = "railgun"
	item_state = "railgun"
	item_charge_meter = TRUE
	fire_sound = 'zzzz_modular_occulus/sound/weapons/rail.ogg'
	item_charge_meter = TRUE
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	twohanded = TRUE
	flags = CONDUCT
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 6, TECH_ENGINEERING = 6)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 8, MATERIAL_SILVER = 10)
	charge_cost = 1250
	gun_tags = list(GUN_PROJECTILE, GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	suitable_cell = /obj/item/cell/large
	one_hand_penalty = 10
	fire_delay = 14 //Slow, on par with a shotgun pump then fire
	recoil_buildup = 12 //Big shots, big recoil.
	damage_multiplier = 1.2
	init_firemodes = list(
		list(mode_name="slug", mode_desc="fires a large metal chunk at light speeds", projectile_type=/obj/item/projectile/bullet/shotgun/railgun, icon="kill"),
		list(mode_name="non-lethal", mode_desc="fires a rubber pellet at light speed", projectile_type=/obj/item/projectile/bullet/shotgun/beanbag/railgun, icon="stun"),
		list(mode_name="grenade", mode_desc="fires an explosive synth-shell", projectile_type=/obj/item/projectile/bullet/grenade, charge_cost=30000, icon="grenade")
	)
	var/consume_cell = FALSE
	price_tag = 2250
	spawn_blacklisted = TRUE

/obj/item/gun/energy/laser/railgun/consume_next_projectile()
	if(!cell) return null
	if(!ispath(projectile_type)) return null
	if(consume_cell && !cell.checked_use(charge_cost))
		visible_message(SPAN_WARNING("\The [cell] of \the [src] burns out!"))
		qdel(cell)
		cell = null
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
		return new projectile_type(src)
	else if(!consume_cell && !cell.checked_use(charge_cost))
		return null
	else
		return new projectile_type(src)

/obj/item/gun/energy/laser/railgun/attackby(obj/item/I, mob/user)
	..()
	if(I.has_quality(QUALITY_BOLT_TURNING))
		if(I.use_tool(user, src, WORKTIME_SLOW, QUALITY_BOLT_TURNING, FAILCHANCE_VERY_HARD, required_stat = STAT_MEC))
			if(consume_cell)
				consume_cell = FALSE
				to_chat(user, SPAN_NOTICE("You secure the safety bolts and tune down the capacitor to safe levels, preventing the weapon from destroying empty cells for use as ammuniton."))
			else
				consume_cell = TRUE
				to_chat(user, SPAN_NOTICE("You loosen the safety bolts and overclock the capacitor to unsafe levels, allowing the weapon to destroy empty cells for use as ammunition."))

//Gauss-rifle type, snowflake launcher mixed with rail rifle and hydrogen gun code. Consumes matter-stack and cell charge to fire. - Rebel0 | Taken from Soj - Moca 
/obj/item/gun/energy/laser/railgun/gauss
	name = "NT \"Helios\" gauss rifle"
	desc = "A rather heavy rifle sporting a cell-loading mount, a adjustable recoil-compensating stock, a hand-crank to manually chamber the next round and a series of coils lining its front. \
	This strange gauss coil rifle has valves along the large, external coil mounts. To fire this gun it requires common venting lest it overheat."
	icon = 'zzzz_modular_occulus/icons/obj/guns/energy/gauss.dmi' // Sprite by Rebel0
	icon_state = "gauss"
	item_state = "gauss"
	fire_sound = 'zzzz_modular_occulus/sound/weapons/guns/fire/gaussrifle.ogg'
	w_class = ITEM_SIZE_HUGE
	matter = list(MATERIAL_PLASTEEL = 40, MATERIAL_STEEL = 15, MATERIAL_SILVER = 10, MATERIAL_GOLD = 6)
	charge_cost = 1000
	fire_delay = 30 // Technically a bit more, due to heat
	recoil_buildup = 30
	one_hand_penalty = 80 //guh
	zoom_factor = 1.8
	damage_multiplier = 1.2
	penetration_multiplier = 3
	pierce_multiplier = 2
	twohanded = TRUE
	slowdown_hold = 1.5
	init_firemodes = list(
		list(mode_name="powered-rod", mode_desc="fires a metal rod at incredible speeds", projectile_type=/obj/item/projectile/bullet/gauss, icon="kill"),
		list(mode_name="High-velocity scrap", mode_desc="fires a brittle, sharp piece of metal at high velocity", projectile_type=/obj/item/projectile/bullet/gauss/hyper, charge_cost=13000, icon="grenade"),
	)
	consume_cell = FALSE
	price_tag = 6000

	var/max_stored_matter = 5
	var/stored_matter = 0
	var/matter_type = MATERIAL_RSCRAP

	var/projectile_cost = 1
	var/overheat_damage = 30

	max_upgrades = 0 // Don't want to make this even more OP

/obj/item/gun/energy/laser/railgun/gauss/Initialize()
	..()
	AddComponent(/datum/component/heat, COMSIG_CLICK_CTRL, TRUE,  50,  55,  23, 0.01, 2)
	RegisterSignal(src, COMSIG_HEAT_VENT, .proc/ventEvent) //this sould just be a fluff message, proc can be anything
	RegisterSignal(src, COMSIG_HEAT_OVERHEAT, .proc/handleoverheat) //this can damge the user/melt the gun/whatever. this will never proc as the gun cannot fire above the special heat threshold and the special heat threshold should be smaller than the overheat threshold
	update_icon()
	START_PROCESSING(SSobj, src)

/obj/item/gun/energy/laser/railgun/gauss/Destroy()
	STOP_PROCESSING(SSobj, src)
	..()

/obj/item/gun/energy/laser/railgun/gauss/attackby(obj/item/I, mob/user)

	if(istype(I,/obj/item/gun_upgrade/mechanism/battery_shunt))
		to_chat(user, SPAN_WARNING("[src] cannot be fitted with a battery shunt!"))		//No shunts on this gun. It's powerful enough.
		return FALSE
	else if(!istype(I,/obj/item/stack/material))
		..()
	var/obj/item/stack/material/M = I
	if(istype(M) && M.material.name == matter_type)
		var/amount = min(M.get_amount(), round(max_stored_matter - stored_matter))
		if(M.use(amount))
			stored_matter += amount
		to_chat(user, "<span class='notice>You load [amount] [matter_type] into \the [src].</span>")
	else
		return ..()

/obj/item/gun/energy/laser/railgun/gauss/consume_next_projectile(mob/user)
	if(stored_matter < projectile_cost) return null
	if(!cell) return null
	if(!ispath(projectile_type)) return null
	if(consume_cell && !cell.checked_use(charge_cost))
		visible_message(SPAN_WARNING("\The [cell] of \the [src] burns out!"))
		qdel(cell)
		cell = null
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
		return new projectile_type(src)
	else if(!consume_cell && !cell.checked_use(charge_cost))
		return null

	var/datum/component/heat/H = GetComponent(/datum/component/heat)
	if((H.currentHeat > H.heatThresholdSpecial || stored_matter < projectile_cost || !..()))
		to_chat(user, "The [src] is currently overheating!")
		handleoverheat()
		return null

	stored_matter -= projectile_cost
	return new projectile_type(src)

/obj/item/gun/energy/laser/railgun/gauss/examine(user)
	. = ..()
	to_chat(user, "It holds [stored_matter]/[max_stored_matter] [matter_type].")
	to_chat(user, SPAN_NOTICE("Control-Click to manually vent this weapon's heat."))

/obj/item/gun/energy/laser/railgun/gauss/update_icon()
	cut_overlays()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

//Hydrogen gun snowflake variables for the Gauss
/obj/item/gun/energy/laser/railgun/gauss/proc/ventEvent()
	src.visible_message("[src]'s vents open valves atop of the exterior coil mounts, cooling itself down.")
	playsound(usr.loc, 'zzzz_modular_occulus/sound/weapons/guns/interact/gauss_vent.ogg', 50, 1)

/obj/item/gun/energy/laser/railgun/gauss/proc/handleoverheat()
	src.visible_message(SPAN_DANGER("[src] overheats, its exterior becoming blisteringly hot burning the skin down to the flesh!!"))
	var/mob/living/L = loc
	if(istype(L))
		if(L.hand == L.l_hand) // Are we using the left arm?
			L.apply_damage(overheat_damage, BURN, def_zone = BP_L_HAND)
		else // If not then it must be the right arm.
			L.apply_damage(overheat_damage, BURN, def_zone = BP_R_HAND)
