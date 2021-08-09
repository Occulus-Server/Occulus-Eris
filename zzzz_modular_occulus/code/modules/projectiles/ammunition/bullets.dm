//a75 ammo

/obj/item/ammo_casing/a75
	icon = 'zzzz_modular_occulus/icons/obj/ammo.dmi'
	icon_state = "75"
	spent_icon = "75-spent"

/obj/item/ammo_casing/magnum
	maxamount = 15

//rubbershot shells

/obj/item/ammo_casing/shotgun/pellet/rubber
	name = "rubbershot shell"
	desc = "A .50 rubbershot shell."
//	icon = 'zzzz_modular_occulus\icons\obj\ammo.dmi'
	icon_state = "s-shell_rs"
	spent_icon = "s-shell_rs-spent"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun/rubber
	matter = list(MATERIAL_STEEL = 1)

/obj/item/ammo_casing/shotgun/pellet/rubber/prespawned
	amount = 5

// white nail rounds
#define CAL_NAIL 	"nanite nail"

/obj/item/ammo_casing/whitenail
	name = "white nail round"
	desc = "A round from a White Nail rifle. Typically does not retain its shape for long outside of the rifle."
	icon = 'zzzz_modular_occulus/icons/obj/ammo.dmi'
	icon_state = "nail_round"
	spent_icon = "nail_round_spent"
	caliber = CAL_NAIL
	projectile_type = /obj/item/projectile/bullet/whitenail
	is_caseless = TRUE
	maxamount = 1

/obj/item/ammo_casing/whitenail/rubber
	name = "white nail rubber round"
	desc = "A rubber round from a White Nail rifle. Typically does not retain its shape for long outside of the rifle."
	projectile_type = /obj/item/projectile/bullet/whitenail/rubber