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

/obj/item/projectile/bullet/pellet/shotgun/rubber/stinger	//used for the stinger grenade
	damage_types = list(BRUTE = 2)
	agony = 18
	pellets = 4
	base_spread = 0 //causes it to be treated as a shrapnel explosion instead of cone
	spread_step = 20
	silenced = 1 //embedding messages are still produced so it's kind of weird when enabled.
	no_attack_log = 1
	muzzle_type = null

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

// white nail bullet types

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