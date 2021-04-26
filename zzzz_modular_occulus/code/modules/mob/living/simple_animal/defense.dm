/mob/living/simple_animal/bullet_act(var/obj/item/projectile/Proj)
	..()	//makes the regular bullet_act apply
	adjustBruteLoss(Proj.agony)	//applies pain damage as brute damage to simplemobs
