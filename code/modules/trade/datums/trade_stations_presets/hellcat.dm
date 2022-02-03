/datum/trade_station/fbv_hellcat
	name_pool = list("UTSC 'Hellcat'" = "United Terran Ship Cruiser 'Hellcat'. They are sending message, \"Greetings. This is the Hellcat. We're currently escorting the Caduceus and we will be departing the system shortly alongside them. We are willing to part with some extra supplies while we're still here.\"")
	icon_states = "ihs_destroyer"
	start_discovered = TRUE
	spawn_always = TRUE
	markup = 0.5
	forced_overmap_zone = list(
		list(15, 20),
		list(20, 25)
	)
	assortiment = list(
		"Enforce Equipment" = list(
			/obj/item/weapon/handcuffs,
			/obj/item/weapon/shield/riot,
			/obj/item/weapon/tool/baton/stun,//Occulus Edit
			/obj/machinery/deployable/barrier,
			/obj/machinery/shieldwallgen
		),
		"Energy weapons" = list(
			/obj/item/weapon/gun/energy/gun/martin,
			/obj/item/weapon/gun/energy/laser
		),
		"Ballistic weapons" = list(
			/obj/item/weapon/gun/projectile/paco,
			/obj/item/weapon/gun/projectile/selfload,
			/obj/item/weapon/gun/projectile/olivaw,
			/obj/item/weapon/gun/projectile/revolver/havelock,
			/obj/item/weapon/gun/projectile/revolver/consul,
			/obj/item/weapon/gun/projectile/automatic/ak47/fs/ih,
			/obj/item/weapon/gun/projectile/automatic/atreides,
			/obj/item/weapon/gun/projectile/shotgun/pump,
			/obj/item/weapon/gun/projectile/shotgun/pump/gladstone
		),
		"Ammunition" = list(
			/obj/item/weapon/grenade/empgrenade/low_yield,
			/obj/item/weapon/grenade/smokebomb,
			/obj/item/weapon/grenade/flashbang,
			/obj/item/ammo_magazine/ammobox/magnum,
			/obj/item/ammo_magazine/lrifle,
			/obj/item/ammo_magazine/smg,
			/obj/item/ammo_magazine/pistol,
			/obj/item/ammo_magazine/hpistol,
			/obj/item/ammo_magazine/ammobox/shotgun,
			/obj/item/ammo_magazine/ammobox/shotgun/buckshot,
			/obj/item/ammo_magazine/ammobox/shotgun/beanbags
		),
		"Armor" = list(
			/obj/item/clothing/suit/armor/heavy/riot,
			/obj/item/clothing/head/armor/riot_hud,
			/obj/item/clothing/suit/armor/vest,
			/obj/item/clothing/suit/armor/vest/security,
			/obj/item/clothing/head/armor/helmet,
			/obj/item/clothing/suit/armor/bulletproof,
			/obj/item/clothing/head/armor/bulletproof/ironhammer_full,
			/obj/item/clothing/suit/armor/laserproof/full,
			/obj/item/clothing/head/armor/laserproof
		),
	)

	offer_types = list(
	)
