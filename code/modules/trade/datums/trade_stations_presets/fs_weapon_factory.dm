/datum/trade_station/fs_factory
	name_pool = list("FSTB 'Kaida'" = "Frozen Star Trade Beacon 'Kaida'. Maybe they have an extra batch of weapons?")
	markup = 0.4
	assortiment = list(
		"Projectiles" = list(
			/obj/item/gun/projectile/automatic/ak47/fs,
			/obj/item/gun/projectile/automatic/atreides,
			/obj/item/gun/projectile/automatic/molly,
			/obj/item/gun/projectile/automatic/sol,
			/obj/item/gun/projectile/automatic/straylight,
			/obj/item/gun/projectile/automatic/wintermute,
			/obj/item/gun/projectile/automatic/z8,
			/obj/item/gun/projectile/avasarala,
			/obj/item/gun/projectile/selfload,
			/obj/item/gun/projectile/colt,
			/obj/item/gun/projectile/giskard,
			/obj/item/gun/projectile/lamia,
			/obj/item/gun/projectile/mandella,
			/obj/item/gun/projectile/olivaw,
			/obj/item/gun/projectile/paco,
			/obj/item/gun/projectile/revolver/consul,
			/obj/item/gun/projectile/revolver/deckard,
			/obj/item/gun/projectile/revolver/havelock,
			/obj/item/gun/projectile/revolver/mateba,
			/obj/item/gun/projectile/revolver,
			/obj/item/gun/projectile/shotgun/bull,
			/obj/item/gun/projectile/shotgun/pump/gladstone,
			/obj/item/gun/projectile/shotgun/pump,
		),
		"Ammunition" = list(
			/obj/item/ammo_magazine/ammobox/magnum = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/slmagnum = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/ammobox/magnum/rubber = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/slmagnum/rubber = custom_good_amount_range(list(1, 10)),

			/obj/item/ammo_magazine/m12,
			/obj/item/ammo_magazine/m12/beanbag,
			/obj/item/ammo_magazine/lrifle,
			/obj/item/ammo_magazine/smg,
			/obj/item/ammo_magazine/pistol,
			/obj/item/ammo_magazine/hpistol
		),
		category_data("Projectiles", list(SPAWN_FS_PROJECTILE)),
		category_data("Shotguns", list(SPAWN_FS_SHOTGUN)),
		category_data("Energy", list(SPAWN_FS_ENERGY)),
		"Grenades" = list(
			/obj/item/gun/projectile/shotgun/pump/grenade/lenar,
			/obj/item/grenade/chem_grenade/teargas,
			/obj/item/grenade/empgrenade/low_yield,
			/obj/item/grenade/flashbang,
			/obj/item/grenade/smokebomb
		),
	)
	offer_types = list(
	)
