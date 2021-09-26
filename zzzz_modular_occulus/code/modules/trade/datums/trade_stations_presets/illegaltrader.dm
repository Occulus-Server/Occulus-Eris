/datum/trade_station/illegaltrader
	name_pool = list("NSTB 'Arau'" = "Null-Space Trade Beacon 'Arau'. The Trade Beacon is sending an automatized message. \"Hey there, Friends. Are you interested in our completely legal goods?")
	offer_types = list(
		/obj/item/organ_module/active/simple/armblade,
		/obj/item/organ_module/active/simple/wolverine,
		/obj/item/organ_module/active/simple/armsmg/hurricane,
		/obj/item/organ_module/active/simple/armsmg/tornado,
		/obj/item/organ_module/active/simple/armsmg/typhoon,
		/obj/item/organ_module/armor,
		/obj/item/part/armor,
		/obj/item/part/gun,
		/obj/item/weapon/beartrap,
		/obj/item/weapon/bluespace_harpoon,
		/obj/item/weapon/emp_mine,
		/obj/item/weapon/grenade/empgrenade,
		/obj/item/weapon/grenade/frag,
		/obj/item/weapon/grenade/flashbang,
		/obj/item/weapon/gun/energy/captain,
		/obj/item/weapon/gun/energy/chameleon,
		/obj/item/weapon/gun/projectile/automatic/c20r/moebius,
		/obj/item/weapon/gun/projectile/automatic/whitenail,
		/obj/item/weapon/gun_upgrade/barrel/isotope_diffuser,
		/obj/item/weapon/gun_upgrade/barrel/mag_accel,
		/obj/item/weapon/gun_upgrade/barrel/overheat,
		/obj/item/weapon/gun_upgrade/barrel/toxin_coater,
		/obj/item/weapon/gun_upgrade/mechanism/battery_shunt,
		/obj/item/weapon/gun_upgrade/mechanism/overdrive,
		/obj/item/weapon/hand_tele,
		/obj/item/weapon/hatton,
		/obj/item/weapon/mine,
		/obj/item/weapon/tool/sword/katana/nano

	)
	assortiment = list(
		"Ballistics" = list(
			/obj/item/weapon/gun/projectile/selfload,
			/obj/item/weapon/gun/projectile/automatic/c20r = custom_good_amount_range(list(-3, 1)),
			/obj/item/weapon/gun/energy/crossbow = custom_good_amount_range(list(-3, 1))
		),
		"Useful stuff" = list(
			/obj/item/weapon/reagent_containers/hypospray/autoinjector/hyperzine,
			/obj/item/clothing/glasses/powered/night,
			/obj/item/clothing/suit/space/void/merc = custom_good_amount_range(list(-3, 1)),
			/obj/item/weapon/rig/merc/empty = custom_good_amount_range(list(-3, 1))
		),
		"Energy" = list(
			/obj/item/weapon/gun/energy/resolute,
			/obj/item/weapon/gun/energy/stalwart,
		),
	)
