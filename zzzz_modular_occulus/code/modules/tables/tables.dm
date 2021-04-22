/obj/structure/table/attack_generic(var/mob/user, var/damage, var/attack_verb, var/wallbreaker)
	if(istype(user))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.do_attack_animation(src)
		visible_message(SPAN_DANGER("[user] smashes into [src]!"))
		take_damage(damage)
		return 1
