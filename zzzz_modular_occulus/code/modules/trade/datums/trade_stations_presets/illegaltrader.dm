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
		/obj/item/beartrap,
		/obj/item/bluespace_harpoon,
		/obj/item/emp_mine,
		/obj/item/grenade/empgrenade,
		/obj/item/grenade/frag,
		/obj/item/grenade/flashbang,
		/obj/item/gun/energy/captain,
		/obj/item/gun/energy/chameleon,
		/obj/item/gun/projectile/automatic/c20r/moebius,
		/obj/item/gun/projectile/automatic/whitenail,
		/obj/item/gun_upgrade/barrel/isotope_diffuser,
		/obj/item/gun_upgrade/barrel/mag_accel,
		/obj/item/gun_upgrade/barrel/overheat,
		/obj/item/gun_upgrade/barrel/toxin_coater,
		/obj/item/gun_upgrade/mechanism/battery_shunt,
		/obj/item/gun_upgrade/mechanism/overdrive,
		/obj/item/hand_tele,
		/obj/item/hatton,
		/obj/item/mine,
		/obj/item/tool/sword/katana/nano

	)
	inventory = list(
		"Ballistics" = list(
			/obj/item/gun/projectile/selfload,
			/obj/item/gun/projectile/automatic/c20r = custom_good_amount_range(list(-3, 1)),
			/obj/item/gun/energy/crossbow = custom_good_amount_range(list(-3, 1))
		),
		"Useful stuff" = list(
			/obj/item/reagent_containers/hypospray/autoinjector/hyperzine,
			/obj/item/clothing/glasses/powered/night,
			/obj/item/clothing/suit/space/void/merc = custom_good_amount_range(list(-3, 1)),
			/obj/item/rig/merc/empty = custom_good_amount_range(list(-3, 1))
		),
		"Energy" = list(
			/obj/item/gun/energy/resolute,
			/obj/item/gun/energy/stalwart,
		),
	)
