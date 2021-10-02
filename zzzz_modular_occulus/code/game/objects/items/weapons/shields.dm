/obj/item/weapon/shield/riot/bastion
	name = "bastion shield"
	desc = "A modified Riot shield, allowing for swift deployment to encamp into and prevent harm behind it."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "riot"
	item_state = "riot"
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_BULKY
	origin_tech = list(TECH_MATERIAL = 2)
	matter = list(MATERIAL_PHORONGLASS = 5, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 10, MATERIAL_OSMIUM = 2)
	price_tag = 500
	attack_verb = list("shoved", "bashed")
	var/structure_form_type = /obj/structure/shield_deployed

/obj/item/weapon/shield/riot/bastion/attack_self(mob/user)
	deploy(user)

/obj/item/weapon/shield/riot/bastion/proc/deploy(var/mob/user)
	var/turf/T = get_turf(src) //When held, this will still find the user's location
	if (istype(T))
		var/obj/structure/shield_deployed/R = new structure_form_type(user.loc)
		R.add_fingerprint(user)
		R.dir = user.dir
		if(user.dir != NORTH)
			R.layer = ABOVE_MOB_LAYER
		qdel(src)

/obj/structure/shield_deployed
	name = "Bastion shield"
	desc = "A deployed Bastion shield, ready for encampment. "
	icon = 'icons/obj/tables.dmi'
	icon_state = "solid_flip0"
	density = TRUE
	anchored = TRUE
	throwpass = 1
	climbable = TRUE
	var/max_health = 1000
	var/health = 1000
	var/reinforced = FALSE
	var/item_form_type = /obj/item/weapon/shield/riot/bastion


/obj/structure/shield_deployed/attackby(obj/item/I, mob/living/user)
	if(I.has_quality(QUALITY_WELDING))
		if(health == max_health)
			to_chat(user, SPAN_NOTICE("\The [src] is already fully repaired!"))
			return
		if(health < max_health)
			to_chat(user, SPAN_NOTICE("You start reparing \the [src]."))
			if(do_after(user, 10))
				health = max_health
				to_chat(user, SPAN_NOTICE("\The [src] is now fully repaired!"))
				return
	if(I.has_quality(QUALITY_BOLT_TURNING))
		if(get_dir(loc, usr) == dir)
			return
		if(reinforced == FALSE)
			to_chat(user, SPAN_NOTICE("You start reinforcing \the [src]!"))
			if(do_after(user, 10))
				reinforced = TRUE
				to_chat(user, SPAN_NOTICE("\The [src] is reinforced in place and expanded!"))
				return
		if(reinforced == TRUE)
			if(user.loc != loc)
				if(do_after(user, 50))
					reinforced = FALSE
					to_chat(user,SPAN_NOTICE("You collapse \the [src], allowing it to be picked up."))
					return
			else
				if(do_after(user, 10))
					reinforced = FALSE
					to_chat(user,SPAN_NOTICE("You collapse \the [src], allowing it to be picked up."))
					return

/obj/structure/shield_deployed/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0)) return 1
	if(istype(mover,/obj/item/projectile))
		if(locate(/mob/living/) in get_turf(loc))
			return (check_cover(mover,target))
		
		var/obj/item/projectile/P = mover
		var/chance = 50
		if(get_dist(P.starting, loc) <= 1)
			return 1
		if(health >= 1)
			if(reinforced == TRUE)
				chance += 30
			if(prob(chance))
				health -= 10
				visible_message(SPAN_WARNING("[P] hits \the [src]!"))
				return 0
		else
			return 1
	if (health >= 1)
		if (get_dir(loc, target) == dir)
			return !density
		else
			return 1
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/shield_deployed) in get_turf(mover))
		return 1
	return 0

/obj/structure/shield_deployed/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover
	if(health >= 1)
		cover = get_turf(src)
	else if(health == 0)
		cover = get_step(loc, get_dir(from, loc))
	if(!cover)
		return 1
	if(get_dist(P.starting, loc) <= 1) //Tables won't help you if people are THIS close
		return 1
	if(get_turf(P.original) == cover)
		var/chance = 20
		if(reinforced == TRUE)			
			chance += 30	
		if(health>=1)
			if(get_dir(loc, from) == dir)	
				chance += 30
			else
				return 1
		if(health==0)
			chance = 0
		if(prob(chance))
			health -= P.get_structure_damage()/2
			if (health > 0)
				visible_message(SPAN_WARNING("[P] hits \the [src]!"))
				return 0
			else
				//visible_message(SPAN_WARNING("[src] breaks down!"))
				//break_to_parts()
				return 1
	return 1

/obj/structure/shield_deployed/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSTABLE))
		return 1
	if (get_dir(loc, target) == dir)
		return !density
	else
		return 1

/obj/structure/shield_deployed/proc/collapse()
	visible_message("[usr] collapses [src].")
	new item_form_type(get_turf(src))
	qdel(src)

/obj/structure/shield_deployed/MouseDrop(over_object, src_location, over_location)
	..()
	if(!CanMouseDrop(over_object))	return
	if(!(ishuman(usr) || isrobot(usr)))	return
	if(reinforced)	
		to_chat(usr, SPAN_NOTICE("\The [src] needs collapsed first!"))
		return
	if(health < max_health)
		to_chat(usr, SPAN_NOTICE("\The [src] is damaged and needs repaired first!"))
		return
	if(get_dir(loc, usr) == dir)
		to_chat(usr, SPAN_NOTICE("You cant pick it up from this side!"))
		return

	collapse()

