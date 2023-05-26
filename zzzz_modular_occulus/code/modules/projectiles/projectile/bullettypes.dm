/obj/item/projectile/bullet/pellet/shotgun/rubber
	name = "rubber pellet"
	icon_state = "birdshot-1"
	damage_types = list(BRUTE = 2, HALLOSS = 8) //No more crew skeeting without medkits!
	pellets = 8
	range_step = 2
	spread_step = 10
	knockback = 0
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/srifle/rubber
	penetrating = 0
	damage_types = list(BRUTE = 6, HALLOSS = 27)

/obj/item/projectile/bullet/clrifle/rubber
	penetrating = 0
	damage_types = list(BRUTE = 6, HALLOSS = 16)

/obj/item/projectile/bullet/lrifle/rubber
	penetrating = 0
	damage_types = list(BRUTE = 6, HALLOSS = 22)

/obj/item/projectile/bullet/magnum/rubber
	damage_types = list(BRUTE = 12, HALLOSS = 28)

/obj/item/projectile/bullet/shotgun/beanbag
	damage_types = list(BRUTE = 17)

/obj/item/projectile/bullet/pistol/rubber
	damage_types = list(BRUTE = 6, HALLOSS = 22)

// nanite bullet types

/obj/item/projectile/bullet/whitenail
	damage_types = list(BRUTE = 25)
	penetrating = 1
	sharp = TRUE
	can_ricochet = FALSE
	embed = FALSE

/obj/item/projectile/bullet/whitenail/rubber
	damage_types = list(BRUTE = 5, HALLOSS = 20)
	penetrating = 0
	sharp = FALSE

/obj/item/projectile/bullet/greyclaw
	name = "grey claw slug"
	icon_state = "slug"
	damage_types = list(BRUTE = 58)
	knockback = 1
	step_delay = 1.1
	sharp = TRUE
	can_ricochet = FALSE
	embed = FALSE

/obj/item/projectile/bullet/greyclaw/rubber
	name = "grey claw rubber slug"
	damage_types = list(BRUTE = 15, HALLOSS = 60)
	penetrating = 0
	sharp = FALSE

/obj/item/projectile/bullet/pellet/shotgun/greyclaw
	damage_types = list(BRUTE = 6)
	pellets = 7
	penetrating = 1
	sharp = TRUE
	can_ricochet = FALSE 
	embed = FALSE

/obj/item/projectile/bullet/pellet/shotgun/greyclaw/rubber
	damage_types = list(BRUTE = 1, HALLOSS = 7)
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

// railgun

/obj/item/projectile/bullet/shotgun/railgun
	damage_types = list(BRUTE = 35)
	hitscan = TRUE // it's a railgun
	nocap_structures = TRUE

/obj/item/projectile/bullet/shotgun/beanbag/railgun
	hitscan = TRUE // it's a railgun
	damage_types = list(BRUTE = 12, HALLOSS = 27) // It's a railgun, it's GOING to hurt

// GAUSS

/obj/item/projectile/bullet/gauss
	name = "gauss"
	icon_state = "gauss"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/ric4.ogg'
	damage_types = list(BRUTE = 32)
	check_armour = ARMOR_BULLET
	hitscan = TRUE
	nocap_structures = TRUE
	embed = FALSE
	can_ricochet = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/gauss/hyper
	name = "gauss"
	icon_state = "gauss"
	damage_types = list(BRUTE = 54) //Nyooom
	sharp = TRUE
