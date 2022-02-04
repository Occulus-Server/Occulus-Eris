/mob/living/simple_animal/bullet_act(var/obj/item/projectile/Proj)
	..()	//makes the regular bullet_act apply
	adjustBruteLoss(Proj.agony * agony_coefficient)	//applies pain damage as brute damage to simplemobs, affected by their agony coefficient

//
//AGONY COEFFICIENT TWEAKS
//

/mob/living/simple_animal/hostile/hivebot
	agony_coefficient = 0.5 //combat robot

/mob/living/simple_animal/hostile/onestar_custodian
	agony_coefficient = 0.8 //civilian robot

/mob/living/simple_animal/hostile/roomba
	agony_coefficient = 0.8 //civilian robot

/mob/living/simple_animal/hostile/stranger
	agony_coefficient = 0.5 //they deserve to not be an absolute joke considering they were not meant to be hurt by rubbers at all

/mob/living/simple_animal/hostile/retaliate/malf_drone
	agony_coefficient = 0.5 //combat robot
