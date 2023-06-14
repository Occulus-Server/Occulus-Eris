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
	siren_explosion(target, 0, 0, 2, 1)	//make into siren_explosion in modular human.dm and modular explosion.dm?
	set_light(0)
	return TRUE

/obj/item/projectile/plasma/blast
	name = "plasma blast"
	icon_state = "pulse1_bl"
	pass_flags = PASSGRILLE
	step_delay = 2

/obj/item/projectile/beam/siren
	name = "energy beam"
	icon_state = "laser"
	agony = 20
	damage_types = list(BURN = 10)
	muzzle_type = /obj/effect/projectile/laser/muzzle
	tracer_type = /obj/effect/projectile/laser/tracer
	impact_type = /obj/effect/projectile/laser/impact

/obj/item/projectile/beam/siren/rapidlaser
	name = "energy beam"
	icon_state = "laser"
	agony = 0
	damage_types = list(BURN = 7)
	muzzle_type = /obj/effect/projectile/laser/muzzle
	tracer_type = /obj/effect/projectile/laser/tracer
	impact_type = /obj/effect/projectile/laser/impact
