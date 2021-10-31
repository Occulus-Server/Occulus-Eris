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
