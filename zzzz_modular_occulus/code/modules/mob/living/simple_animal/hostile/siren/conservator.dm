/mob/living/simple_animal/hostile/siren/conservator
	name = "conservator"
	desc = "A little salvage and repair biomechanical droid. It tends to biosynthetics every needs.  It seems skittish."
	icon = 'zzzz_modular_occulus/icons/mob/siren/conservator.dmi'
	icon_state = "repairbot"
	attacktext = "slice"
	density = FALSE
	mob_size = MOB_SMALL
	pass_flags = PASSTABLE | PASSGRILLE
	speed = 3
	vision_range = 5
	aggro_vision_range = 11
	maxHealth = 40
	health = 40
	move_to_delay = 10
	agony_coefficient = 1.5
	rapid = TRUE
	ranged = TRUE
	ranged_cooldown_time = 4 SECONDS
	retreat_distance = 4
	minimum_distance = 3
	fire_verb = "fires a bolt strange energy" //reminder that the attack message is "\red <b>[src]</b> [fire_verb] at [target]!"
	projectiletype = /obj/item/projectile/beam/siren
	var/atom/tele_target
	var/structure_capacity = 6
	var/loot_table = list(/obj/spawner/material/building,
						/obj/spawner/tool_upgrade/rare,
						/obj/spawner/material/resources/rare)

/mob/living/simple_animal/hostile/siren/conservator/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /datum/effect/effect/system/spark_spread
	gibs(loc, null, /obj/effect/gibspawner/robot)
	var/lootdrop = pick(loot_table)
	new lootdrop(get_turf(src))
	if(lootdrop)
		visible_message("Something tumbles out of \the [src]'s remains!")
	qdel(src)


/mob/living/simple_animal/hostile/siren/conservator/Life()
	..()
	if(stance == HOSTILE_STANCE_IDLE)
		if(prob(20) && (structure_capacity >= 1))
			if(!(locate(/obj/item/shocktrap) in get_turf(src)) && !(locate(/obj/structure/sirencade) in get_turf(src)))
				src.visible_message(SPAN_NOTICE("\The [src] begins to construct some sort of energy structure."))
				stop_automated_movement = 1
				stunned = 5
				spawn(40)
					var/list/conservatorconstruct = list(/obj/item/shocktrap, /obj/structure/sirencade)
					var/chosen = safepick(conservatorconstruct)
					new chosen(src.loc)
					structure_capacity--
					stop_automated_movement = 0

/obj/item/shocktrap
	name = "energetic latch"
	gender = PLURAL
	icon = 'zzzz_modular_occulus/icons/obj/traps.dmi'
	icon_state = "trap"
	desc = "A pulsating burst of seemingly contained energy projected above some sort of latch. It seems dangerious."
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list(MATERIAL_STEEL = 25)
	anchored = TRUE
	density = FALSE
	var/cooldown_timer = 0
	var/cooldown = 5 SECONDS
	var/last_armed

/obj/item/shocktrap/Crossed(AM as mob|obj)
	if(ishuman(AM))
		if(world.time > cooldown_timer)
			shock(AM, FALSE)
			visible_message(SPAN_DANGER("The energetic latch pulses violently!"))
			flashbang_without_the_bang(src.loc, AM)
			cooldown_timer = world.time + cooldown

/obj/item/shocktrap/proc/shock(mob/user as mob, using_hands = TRUE)
	if(in_range(src, user))//To prevent TK and mech users from getting shocked
		electrocute_mob(user, get_area(src), src, 0.7)
		var/area/temp_area = get_area(src)
		if(temp_area)
			var/obj/machinery/power/apc/temp_apc = temp_area.get_apc()
			if(temp_apc && temp_apc.terminal && temp_apc.terminal.powernet)
				temp_apc.terminal.powernet.trigger_warning()
		if(user.stunned)
			to_chat(user, SPAN_WARNING("You touch the energetic latch and got electrocuted!"))
			return TRUE

/obj/item/shocktrap/attackby(obj/item/W as obj, mob/user as mob)
	if(QUALITY_PULSING in W.tool_qualities)
		user.visible_message(
			SPAN_DANGER("[user] starts to carefully disarm \the [src]."),
			SPAN_DANGER("You begin to carefully disarm \the [src]."))
		spawn(50)
		qdel(src)
		user.visible_message(
			SPAN_DANGER("[user] has disarmed \the [src]."),
			SPAN_DANGER("You have disarmed \the [src]!"))

/obj/item/shocktrap/attack_hand(mob/user as mob)
	if(prob(50))
		if(world.time > cooldown_timer)
			visible_message(SPAN_DANGER("The energetic latch pulses violently!"))
			shock(user, FALSE)
			flashbang_without_the_bang()
			cooldown_timer = world.time + cooldown
			return
	else
		to_chat(user, SPAN_WARNING("You move your hand at the last moment and avoid touching the energy projection!"))
		return

/obj/structure/sirencade
	name = "energetic barrier"
	desc = "This space is blocked off by some kind of energy barrier"
	icon = 'zzzz_modular_occulus/icons/obj/traps.dmi'
	icon_state = "barricade"
	anchored = TRUE
	density = TRUE
	var/health = 250
	var/maxhealth = 250

/obj/structure/sirencade/attackby(obj/item/W as obj, mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	switch(W.damtype)
		if("fire")
			health -= W.force * 1
			user.visible_message("<span class='danger'>[user] bashes [src] with [W]!</span>", "<span class='danger'>You strike [src] with [W], damaging it!</span>")
			if(prob(25))
				new /datum/effect/effect/system/spark_spread
		if("brute")
			health -= W.force * 0.75
			user.visible_message("<span class='danger'>[user] bashes [src] with [W]!</span>", "<span class='danger'>You strike [src] with [W], damaging it!</span>")
			if(prob(25))
				new /datum/effect/effect/system/spark_spread
		else
	if(health <= 0)
		visible_message(SPAN_DANGER("The energetic barrier dissipates!"))
		qdel(src)
		return
	..()

/obj/structure/sirencade/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0))
		return 1
	if(istype(mover) && mover.checkpass(PASSGRILLE))	//all siren weapons hereby are now passglass. Buyers beware.
		return 1
/*	if(istype(mover,/obj/item/projectile))
		var/obj/item/projectile/P
		if(health >=1)
			damage(P.get_structure_damage())
			visible_message(SPAN_WARNING("[P] hits \the [src]!"))
			if(prob(20))
				new /datum/effect/effect/system/spark_spread
			return 0 */
	else
		return 0

/obj/structure/sirencade/bullet_act(var/obj/item/projectile/Proj)

	var/proj_damage = Proj.get_structure_damage()
	visible_message(SPAN_WARNING("[Proj] hits \the [src]!"))
	if(prob(20))
		new /datum/effect/effect/system/spark_spread
	if(!proj_damage) return

	..()
	damage(proj_damage)
	return

/obj/structure/sirencade/proc/damage(damage)
	health -= damage
	if(health <= 0)
		visible_message(SPAN_DANGER("The energetic barrier dissipates"))
		qdel(src)

/obj/structure/sirencade/ex_act(severity)
	switch(severity)
		if(1.0)
			visible_message(SPAN_DANGER("\The [src] is blown apart!"))
			qdel(src)
			return
		if(2.0)
			health -= 25
			if(health <= 0)
				visible_message(SPAN_DANGER("\The [src] is blown apart!"))
