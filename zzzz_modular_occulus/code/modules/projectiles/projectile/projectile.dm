/obj/item/projectile/change_knockback(change)
	knockback = initial(knockback) + change
	if(knockback > 1)
		knockback = 1
	if(knockback < 0)
		knockback = 0

/obj/item/projectile/multiply_projectile_damage(newmult)
	for(var/i in damage_types)
		damage_types[i] *= newmult


/obj/item/projectile/plasma/blast/on_hit(atom/target)
	siren_explosion(target, -1, 0, 2, 1)	//make into siren_explosion in modular human.dm and modular explosion.dm?
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
	damage_types = list(BURN = 10, HALLOSS = 25)
	muzzle_type = /obj/effect/projectile/laser/muzzle
	tracer_type = /obj/effect/projectile/laser/tracer
	impact_type = /obj/effect/projectile/laser/impact

/obj/item/projectile/beam/siren/rapidlaser
	name = "energy beam"
	icon_state = "laser"
	damage_types = list(BURN = 7)
	muzzle_type = /obj/effect/projectile/laser/muzzle
	tracer_type = /obj/effect/projectile/laser/tracer
	impact_type = /obj/effect/projectile/laser/impact

/obj/item/projectile/oracle
	name = "strange energy"
	icon_state = "energy2"
	damage_types = list(BRUTE = 10)

/obj/item/projectile/oracle/on_hit(atom/target)
	if(iscarbon(target))
		var/mob/living/carbon/C = target
		C.reagents.add_reagent("liquid_bluespace", 2.5)
		to_chat(C, SPAN_DANGER("You feel like your're being compressed and pulled apart at the same time."))
	return TRUE

/obj/item/projectile/beam/sniper/siren
	name = "high energy beam"
	icon_state = "xray"
	damage_types = list(BURN = 45)
	armor_divisor = 2
	stutter = 3

	muzzle_type = /obj/effect/projectile/xray/muzzle
	tracer_type = /obj/effect/projectile/xray/tracer
	impact_type = /obj/effect/projectile/xray/impact
