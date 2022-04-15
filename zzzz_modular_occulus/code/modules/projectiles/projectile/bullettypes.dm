/obj/item/projectile/bullet/pellet/shotgun/rubber
	name = "rubber pellet"
	icon_state = "birdshot-1"
	damage_types = list(BRUTE = 1) //No more crew skeeting without medkits!
	agony = 9 //Whoever the hell had this at 15 is going to suffer multiple shots to the groin.
	pellets = 8
	range_step = 2
	spread_step = 10
	armor_penetration = 0
	knockback = 0
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/pellet/fragment/rubber/stinger	//used for the stinger grenade
	name = "rubber pellet"
	icon_state = "birdshot-1"
	damage_types = list(BRUTE = 1)
	agony = 17
	armor_penetration = 0
	knockback = 0
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/pellet/fragment/rubber/stinger/weak
	damage_types = list(BRUTE = 1)
	agony = 5

//Rubberizing rubber rounds

/obj/item/projectile/bullet/srifle/rubber
	penetrating = 0
	damage_types = list(BRUTE = 6)
	agony = 27

/obj/item/projectile/bullet/clrifle/rubber
	penetrating = 0
	damage_types = list(BRUTE = 6)
	agony = 16

/obj/item/projectile/bullet/lrifle/rubber
	penetrating = 0
	damage_types = list(BRUTE = 6)
	agony = 22

/obj/item/projectile/bullet/magnum/rubber
	damage_types = list(BRUTE = 12)
	agony = 28

/obj/item/projectile/bullet/shotgun/beanbag
	damage_types = list(BRUTE = 17)

/obj/item/projectile/bullet/pistol/rubber
	damage_types = list(BRUTE = 6)
	agony = 22

/obj/item/projectile/bullet/pellet/shotgun/rubber
	damage_types = list(BRUTE = 2) //The official consensus is that getting PB'd by rubbers should be an owie.
	agony = 8 //Whoever the hell had this at 15 is going to suffer multiple shots to the groin.

// nanite bullet types

/obj/item/projectile/bullet/whitenail
	damage_types = list(BRUTE = 25)
	armor_penetration = 20
	penetrating = 1
	sharp = TRUE
	can_ricochet = FALSE
	embed = FALSE

/obj/item/projectile/bullet/whitenail/rubber
	damage_types = list(BRUTE = 5)
	agony = 20
	armor_penetration = 0
	penetrating = 0
	sharp = FALSE

/obj/item/projectile/bullet/greyclaw
	name = "grey claw slug"
	icon_state = "slug"
	damage_types = list(BRUTE = 58)
	armor_penetration = 20
	knockback = 1
	step_delay = 1.1
	sharp = TRUE
	can_ricochet = FALSE
	embed = FALSE

/obj/item/projectile/bullet/greyclaw/rubber
	name = "grey claw rubber slug"
	damage_types = list(BRUTE = 15)
	agony = 60
	armor_penetration = 0
	penetrating = 0
	sharp = FALSE

/obj/item/projectile/bullet/pellet/shotgun/greyclaw
	damage_types = list(BRUTE = 6)
	pellets = 7
	armor_penetration = 20
	penetrating = 1
	sharp = TRUE
	can_ricochet = FALSE 
	embed = FALSE

/obj/item/projectile/bullet/pellet/shotgun/greyclaw/rubber
	damage_types = list(BRUTE = 1)
	agony = 7
	sharp = FALSE


//Should do about 75 damage at 1 tile distance (adjacent), and 50 damage at 3 tiles distance.
//Overall less damage than slugs in exchange for more damage at very close range and more embedding
/obj/item/projectile/bullet/pellet/energy
	name = "energy blast"
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile.dmi'
	icon_state = "flux-1"
	damage_types = list(BURN = 25)
	pellets = 3
	base_spread = 50
	range_step = 3
	spread_step = 60
	knockback = 0
/obj/item/projectile/bullet/pellet/energy/Initialize()
	. = ..()
	icon_state = "flux-[rand(1,3)]"