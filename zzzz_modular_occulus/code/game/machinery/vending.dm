/obj/machinery/vending/medical/occulus
	name = "MiniPharma Plus"
	desc = "Medical drug dispenser."
	icon_state = "med"
	icon_deny = "med-deny"
	req_access = list(access_medical_equip)
	product_ads = "Go save some lives!;The best stuff for your medbay.;Only the finest tools.;Natural chemicals!;This stuff saves lives.;Don't you want some?;Ping!"

	products = list(
					/obj/item/weapon/reagent_containers/glass/bottle/antitoxin = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/stoxin = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/toxin = 4,
					/obj/item/weapon/reagent_containers/syringe/spaceacillin = 4,
					/obj/item/weapon/reagent_containers/syringe = 12,
					/obj/item/device/scanner/health = 5,
					/obj/item/weapon/reagent_containers/glass/beaker = 4,
					/obj/item/weapon/reagent_containers/dropper = 2,
					/obj/item/stack/medical/advanced/bruise_pack = 3,
					/obj/item/stack/medical/advanced/ointment = 3,
					/obj/item/stack/medical/splint = 2,
					/obj/item/weapon/storage/hypospraykit/regular = 2,
					/obj/item/weapon/storage/hypospraykit/fire = 2,
					/obj/item/weapon/storage/hypospraykit/brute = 2,
					/obj/item/weapon/storage/hypospraykit/toxin = 2,
					/obj/item/weapon/storage/hypospraykit/o2 = 2
					)

	contraband = list(
					/obj/item/weapon/reagent_containers/pill/tox = 3,
					/obj/item/weapon/reagent_containers/pill/antitox = 6,
					/obj/item/weapon/reagent_containers/pill/stox = 4
					)

	idle_power_usage = 211 //refrigerator - believe it or not, this is actually the average power consumption of a refrigerated vending machine according to NRCan.
	auto_price = FALSE