/obj/item/projectile/change_knockback(change)
	knockback = initial(knockback) + change
	if(knockback > 1)
		knockback = 1
	if(knockback < 0)
		knockback = 0

/obj/item/projectile/multiply_projectile_damage(newmult)
	for(var/i in damage_types)
		damage_types[i] *= newmult
	if(agony)
		agony *= newmult


/obj/item/projectile/plasma/blast/on_hit(atom/target)
	explosion(target, 0, 1, 2, 1)
	set_light(0)
	return TRUE

/obj/item/projectile/plasma/blast
	name = "plasma blast"
	icon_state = "pulse1_bl"