/datum/trade_station/serbfrigate
	icon_states = "serb_frigate"
	spawn_cost = 2
	spawn_probability = 10
	markup = 3
	name_pool = list(
		"STF 'Kovac'" = "Serbia Trade Frigate 'Kovac', *generic description for generic serbians alpha ape males that ain't killing you instantly*",
		"SV 'Zoric'" = "Serbia Vessel 'Zoric' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
	)
//Types of items sold by the station
	inventory = list(
		"Guns" = list(
			/obj/item/gun/projectile/boltgun/serbian = custom_good_amount_range(list(1, 10)),
			/obj/item/gun/projectile/shotgun/bojevic = custom_good_amount_range(list(-5, 2)),
			/obj/item/gun/projectile/automatic/ak47/sa = custom_good_amount_range(list(-5, 2)),
			/obj/item/gun/projectile/kovacs = custom_good_amount_range(list(-5, 2)),
			/obj/item/gun/projectile/automatic/lmg/pk = custom_good_amount_range(list(-8, 1)),
			/obj/item/ammo_magazine/sllrifle,
			/obj/item/ammo_magazine/lrifle,
			/obj/item/ammo_magazine/lrifle/pk = custom_good_amount_range(list(-4, 1)),
			/obj/item/ammo_magazine/m12/empty,
			/obj/item/ammo_magazine/ammobox/shotgun,
			/obj/item/ammo_magazine/ammobox/shotgun/buckshot,
			/obj/item/ammo_magazine/ammobox/shotgun/incendiaryshells
		),
	)
