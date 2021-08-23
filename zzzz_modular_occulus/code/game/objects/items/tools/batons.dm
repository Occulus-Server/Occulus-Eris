/obj/item/weapon/tool/baton/stun
	name = "stunbaton"
	desc = "A stun baton for incapacitating people with."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "stunbaton"
	item_state = "baton"
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_PAINFUL
	switched_on_force = WEAPON_FORCE_PAINFUL
	switched_off_force = WEAPON_FORCE_PAINFUL
	sharp = FALSE
	edge = FALSE
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("beaten")
	price_tag = 500

	glow_color = COLOR_LIGHTING_ORANGE_BRIGHT
	suitable_cell = /obj/item/weapon/cell/medium
	passive_power_cost = 1
	use_power_cost = 0.8
	toggleable = TRUE

	switched_on_qualities = list(QUALITY_HAMMERING = 10, QUALITY_PULSING = 5)
	switched_off_qualities = list(QUALITY_HAMMERING = 10)

	var/stunforce = 0
	var/agonyforce = 40
	var/hitcost = 100
	var/obj/item/weapon/cell/starting_cell = /obj/item/weapon/cell/medium/high

	structure_damage_factor = STRUCTURE_DAMAGE_BLUNT
	max_upgrades = 2

/obj/item/weapon/tool/baton/stun/New()
	if(!cell && suitable_cell && starting_cell)
		cell = new starting_cell(src)
	update_icon()
	..()

/obj/item/weapon/tool/baton/stun/proc/deductcharge(var/power_drain)
	if(cell)
		. = cell.checked_use(power_drain) //try to use enough power
		if(!cell.check_charge(hitcost))	//do we have enough power for another hit?
			turn_off()

/obj/item/weapon/tool/baton/stun/on_update_icon()
	if(switched_on)
		icon_state = "[initial(icon_state)]_active"
	else if(!cell)
		icon_state = "[initial(icon_state)]_nocell"
	else
		icon_state = "[initial(icon_state)]"

	if(icon_state == "[initial(icon_state)]_active")
		set_light(1.5, 1)
	else
		set_light(0)

/obj/item/weapon/tool/baton/stun/attack_self(mob/user)
	if(cell && cell.check_charge(hitcost))
		playsound(loc, "sparks", 75, 1, -1)
	else
		turn_off()
		if(!cell)
			to_chat(user, SPAN_WARNING("[src] does not have a power source!"))
		else
			to_chat(user, SPAN_WARNING("[src] is out of charge."))
	add_fingerprint(user)
	..()

/obj/item/weapon/tool/baton/stun/turn_on(mob/user)
	.=..()
	if(.)
		playsound(loc, "sparks", 75, 1, -1)
//		START_PROCESSING(SSobj, src)

/obj/item/weapon/tool/baton/stun/attack(mob/M, mob/user)
	if(switched_on && (CLUMSY in user.mutations) && prob(50))
		to_chat(user, SPAN_DANGER("You accidentally hit yourself with the [src]!"))
		user.Weaken(30)
		deductcharge(hitcost)
		return
	return ..()

/obj/item/weapon/tool/baton/stun/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(isrobot(target))
		return ..()

	var/agony = agonyforce
	var/stun = stunforce
	var/obj/item/organ/external/affecting
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		affecting = H.get_organ(hit_zone)

	if(user.a_intent == I_HURT)
		. = ..()
		if (!.)	//item/attack() does it's own messaging and logs
			return 0	// item/attack() will return 1 if they hit, 0 if they missed.

		//whacking someone causes a much poorer electrical contact than deliberately prodding them.
		stun *= 0.5
		if(switched_on)		//Checks to see if the stunbaton is on.
			agony *= 0.5	//whacking someone causes a much poorer contact than prodding them.
		else
			agony = 0	//Shouldn't really stun if it's off, should it?
		//we can't really extract the actual hit zone from ..(), unfortunately. Just act like they attacked the area they intended to.
	else if(!switched_on)
		if(affecting)
			target.visible_message(SPAN_WARNING("[target] has been prodded in the [affecting.name] with [src] by [user]. Luckily it was off."))
		else
			target.visible_message(SPAN_WARNING("[target] has been prodded with [src] by [user]. Luckily it was off."))
	else
		if(affecting)
			target.visible_message(SPAN_DANGER("[target] has been prodded in the [affecting.name] with [src] by [user]!"))
		else
			target.visible_message(SPAN_DANGER("[target] has been prodded with [src] by [user]!"))
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)

	//stun effects
	if(switched_on && deductcharge(hitcost))
		target.stun_effect_act(stun, agony, hit_zone, src)
		msg_admin_attack("[key_name(user)] stunned [key_name(target)] with the [src].")

		if(ishuman(target))
			var/mob/living/carbon/human/H = target
			H.forcesay(hit_appends)

/obj/item/weapon/tool/baton/stun/emp_act(severity)
	if(cell)
		cell.emp_act(severity)	//let's not duplicate code everywhere if we don't have to please.
	..()

/obj/item/weapon/tool/baton/stun/robot
	bad_type = /obj/item/weapon/melee/baton/robot

/obj/item/weapon/tool/baton/stun/robot/attack_self(mob/user)
	//try to find our power cell
	var/mob/living/silicon/robot/R = loc
	if (istype(R))
		cell = R.cell
	return ..()

/obj/item/weapon/tool/baton/stun/robot/attackby(obj/item/weapon/W, mob/user)
	return

//Makeshift stun baton.
/obj/item/weapon/tool/baton/stun/improvised
	name = "stunprod"
	desc = "An improvised stun baton."
	icon_state = "stunprod"
	item_state = "prod"
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	stunforce = 0
	agonyforce = 40	//same force as a stunbaton, but uses way more charge.
	hitcost = 150
	attack_verb = list("poked")
	slot_flags = null
	starting_cell = null
	structure_damage_factor = STRUCTURE_DAMAGE_NORMAL

/obj/item/weapon/tool/baton/stun/excel
	name = "Expropriator"
	desc = "A cheap and effective way to feed the red tide."
	icon_state = "sovietbaton"
	item_state = "soviet"
	light_color = COLOR_LIGHTING_CYAN_BRIGHT
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	stunforce = 0
	agonyforce = 40
	hitcost = 100
	attack_verb = list("battered")
	slot_flags = SLOT_BELT
	structure_damage_factor = STRUCTURE_DAMAGE_NORMAL
	matter = list(MATERIAL_STEEL = 15, MATERIAL_PLASTEEL = 5)
	starting_cell = /obj/item/weapon/cell/medium/excelsior
