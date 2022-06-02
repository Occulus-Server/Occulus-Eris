/obj/effect/spider/attackby(obj/item/I, mob/user)
	if(I.attack_verb.len)
		visible_message(SPAN_WARNING("\The [src] have been [pick(I.attack_verb)] with \the [I][(user ? " by [user]." : ".")]"))
	else
		visible_message(SPAN_WARNING("\The [src] have been attacked with \the [I][(user ? " by [user]." : ".")]"))

	var/damage = I.force / 4.0

	if(QUALITY_WIRE_CUTTING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_WIRE_CUTTING, FAILCHANCE_NORMAL,  required_stat = STAT_COG))
			new /obj/item/stack/unrefinedsilk(loc)
			damage = 15

	if(QUALITY_WELDING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_INSTANT, QUALITY_WELDING, FAILCHANCE_ZERO))
			damage = 15

	health -= damage
	healthcheck()