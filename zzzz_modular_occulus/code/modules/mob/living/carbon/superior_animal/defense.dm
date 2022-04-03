/mob/living/carbon/superior_animal/CanPass(var/atom/mover)

	if (istype(mover, /obj/item/projectile/bullet/pellet/fragment)) // Doesn't allow fragments to pass through
		return FALSE

	//But mobs can walk over the nondense ones.
	return ..()