// This whole file is an Occulus Edit

/obj/item/emp_mine
	name = "OS Type - 183 \"Hei'an\""
	desc = "Self-rechargeable EMP mine. It still works."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "empmine0"
	w_class = ITEM_SIZE_BULKY

	var/armed = FALSE

	var/cooldown = 60 SECONDS

	var/emp_range = 5

	var/cooldown_timer = 0


/obj/item/emp_mine/proc/arm()
	armed = TRUE
	//START_PROCESSING(SSobj, src)
	update_icon()


/obj/item/emp_mine/proc/disarm()
	armed = FALSE
	//STOP_PROCESSING(SSobj, src)
	update_icon()


/obj/item/emp_mine/on_update_icon()
	icon_state = "empmine[armed ? "1":"0"]"


/obj/item/emp_mine/Crossed(mob/AM)
	if(world.time - cooldown_timer > cooldown && isliving(AM) && armed == TRUE)
		cooldown_timer = world.time
		empulse(get_turf(src), emp_range, emp_range, TRUE)

/obj/item/emp_mine/attack_self(mob/user as mob)
	src.add_fingerprint(user)
	if(armed)
		disarm()
		to_chat(user, SPAN_NOTICE("You disarm \the [src]"))
	else
		cooldown_timer = world.time - cooldown + 100
		arm()
		to_chat(user, SPAN_WARNING("You arm \the [src]! You have 10 seconds to run away."))

/obj/item/emp_mine/attackby(obj/item/I, mob/user)
	if(QUALITY_PULSING in I.tool_qualities)

		if (armed)
			user.visible_message(
			SPAN_DANGER("[user] starts to carefully disarm \the [src]."),
			SPAN_DANGER("You begin to carefully disarm \the [src].")
			)
		if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_PULSING, FAILCHANCE_HARD,  required_stat = STAT_COG)) //disarming a mine with a multitool should be for smarties
			user.visible_message(
				SPAN_DANGER("[user] has disarmed \the [src]."),
				SPAN_DANGER("You have disarmed \the [src]!")
				)
			disarm()
		else
			if(prob(5))
				user.visible_message(
					SPAN_DANGER("the [src] trggers!"),
					SPAN_DANGER("You fail to disarm the [src] and it triggers!"))
		return
	else
		if (armed)   //now touching it with stuff that don't pulse will also be a bad idea
			user.visible_message(
				SPAN_DANGER("the [src] is hit with [I] and it triggers!"),
				SPAN_DANGER("You hit the [src] with [I] and it triggers!"))
			if(world.time - cooldown_timer > cooldown)
				cooldown_timer = world.time
				empulse(get_turf(src), emp_range, emp_range, TRUE)
		return

/obj/item/emp_mine/attack_hand(mob/user as mob)
	if (armed)
		user.visible_message(
				SPAN_DANGER("[user] extends its hand to reach the [src]!"),
				SPAN_DANGER("you extend your arms to pick it up, knowing that it will likely trigger when you touch it!")
				)
		if (do_after(user, 5))
			user.visible_message(
				SPAN_DANGER("[user] attempts to pick up the [src] only to hear a beep as it triggers in thier hands!"),//Occulus Edit: Russians
				SPAN_DANGER("you attempt to pick up the [src] only to hear a beep as it triggers in your hands!")//Occulus Edit: Russian grammar
				)
			empulse(get_turf(src), emp_range, emp_range, TRUE)
			disarm()
			return
	.=..()

//Pre-armed mine
/obj/item/emp_mine/armed/New()
	..()
	arm()

//End Occulus Edit