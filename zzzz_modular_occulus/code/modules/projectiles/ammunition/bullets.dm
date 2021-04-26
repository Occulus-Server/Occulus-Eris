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
