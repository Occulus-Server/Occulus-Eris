/obj/item/projectile/change_knockback(change)
	knockback = initial(knockback) + change

/obj/item/projectile/multiply_projectile_damage(newmult)
	for(var/i in damage_types)
		damage_types[i] *= newmult
	if(agony)
		agony *= newmult

