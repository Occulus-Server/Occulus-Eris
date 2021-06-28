/obj/machinery/vending
	shut_up = 1//Shush. We don't need these

/obj/machinery/vending/coffee
	products = list(/obj/item/weapon/reagent_containers/food/drinks/coffee = 25,/obj/item/weapon/reagent_containers/food/drinks/tea/black = 25,
					/obj/item/weapon/reagent_containers/food/drinks/tea/green = 25,/obj/item/weapon/reagent_containers/food/drinks/h_chocolate = 25)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/ice = 10)
	prices = list(/obj/item/weapon/reagent_containers/food/drinks/coffee = 30, /obj/item/weapon/reagent_containers/food/drinks/tea/black = 30 ,
					/obj/item/weapon/reagent_containers/food/drinks/tea/green = 30, /obj/item/weapon/reagent_containers/food/drinks/h_chocolate = 40)
	vendor_department = DEPARTMENT_CIVILIAN

/obj/machinery/vending/snack
	vendor_department = DEPARTMENT_CIVILIAN

/obj/machinery/vending/cola
	products = list(/obj/item/weapon/reagent_containers/food/drinks/cans/cola = 10,/obj/item/weapon/reagent_containers/food/drinks/cans/space_mountain_wind = 10,
					/obj/item/weapon/reagent_containers/food/drinks/cans/dr_gibb = 10,/obj/item/weapon/reagent_containers/food/drinks/cans/starkist = 10,
					/obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle = 10,/obj/item/weapon/reagent_containers/food/drinks/cans/space_up = 10,
					/obj/item/weapon/reagent_containers/food/drinks/cans/iced_tea = 10, /obj/item/weapon/reagent_containers/food/drinks/cans/grape_juice = 10)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/cans/thirteenloko = 5, /obj/item/weapon/reagent_containers/food/snacks/liquidfood = 6)
	prices = list(/obj/item/weapon/reagent_containers/food/drinks/cans/cola = 30,/obj/item/weapon/reagent_containers/food/drinks/cans/space_mountain_wind = 30,
					/obj/item/weapon/reagent_containers/food/drinks/cans/dr_gibb = 30,/obj/item/weapon/reagent_containers/food/drinks/cans/starkist = 30,
					/obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle = 32,/obj/item/weapon/reagent_containers/food/drinks/cans/space_up = 30,
					/obj/item/weapon/reagent_containers/food/drinks/cans/iced_tea = 30,/obj/item/weapon/reagent_containers/food/drinks/cans/grape_juice = 30,
					/obj/item/weapon/reagent_containers/food/drinks/cans/thirteenloko = 50, /obj/item/weapon/reagent_containers/food/snacks/liquidfood = 60)
	vendor_department = DEPARTMENT_CIVILIAN

/obj/machinery/vending/engineering
	vendor_department = DEPARTMENT_ENGINEERING

/obj/machinery/vending/tool
	vendor_department = DEPARTMENT_ENGINEERING

/obj/machinery/vending/cigarette
	products = list(/obj/item/weapon/storage/fancy/cigarettes = 10,/obj/item/weapon/storage/box/matches = 10,/obj/item/weapon/flame/lighter/random = 4)
	contraband = list(/obj/item/clothing/mask/smokable/cigarette/cigar = 4, /obj/item/weapon/flame/lighter/zippo = 4,)
	premium = list(/obj/item/weapon/storage/fancy/cigar = 5,/obj/item/weapon/storage/fancy/cigarettes/killthroat = 5 )
	prices = list(/obj/item/clothing/mask/smokable/cigarette/cigar = 200, /obj/item/weapon/storage/fancy/cigarettes = 100 ,/obj/item/weapon/storage/box/matches = 30,/obj/item/weapon/flame/lighter/random = 30,
				/obj/item/weapon/flame/lighter/zippo = 250)

/obj/machinery/vending/boozeomat
	req_access = list(access_bar)
	vendor_department = DEPARTMENT_CIVILIAN

/obj/machinery/vending/boozeomat/public
	vendor_department = DEPARTMENT_CIVILIAN
	req_access = null
	prices = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/gin = 400,/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey = 400,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/tequilla = 600,/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka = 200,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/vermouth = 200,/obj/item/weapon/reagent_containers/food/drinks/bottle/rum = 200,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/wine = 200,/obj/item/weapon/reagent_containers/food/drinks/bottle/cognac = 600,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/kahlua = 200,/obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer = 60,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/small/ale = 60,/obj/item/weapon/reagent_containers/food/drinks/bottle/orangejuice = 100,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/tomatojuice = 100,/obj/item/weapon/reagent_containers/food/drinks/bottle/limejuice = 100,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/cream = 200,/obj/item/weapon/reagent_containers/food/drinks/cans/tonic = 60,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/cola = 100, /obj/item/weapon/reagent_containers/food/drinks/bottle/space_up = 100,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/space_mountain_wind = 100, /obj/item/weapon/reagent_containers/food/drinks/cans/sodawater = 100,
		/obj/item/weapon/reagent_containers/food/drinks/flask/barflask = 100, /obj/item/weapon/reagent_containers/food/drinks/flask/vacuumflask = 200,
		/obj/item/weapon/reagent_containers/food/drinks/drinkingglass = 60,/obj/item/weapon/reagent_containers/food/drinks/ice = 5,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/melonliquor = 200,/obj/item/weapon/reagent_containers/food/drinks/bottle/bluecuracao = 200,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe = 400,/obj/item/weapon/reagent_containers/food/drinks/bottle/grenadine = 100)

/obj/machinery/vending/serbomat
	name = "BulletHeaven"
	desc = "All the gun food you'll ever need."
	icon = 'zzzz_modular_occulus/icons/obj/vending.dmi'
	icon_state = "serbomat"
	product_ads = "Don't dial 911, dial .357!;Coming soon: Pink and blue tracer bullets so you can protect your family in the dark!;Did you bring your protection?;Exercise your right to carry today!"		//Need to add more
	no_criminals = TRUE
	products = list(
					/obj/item/ammo_magazine/slpistol/rubber = 10,
					/obj/item/ammo_magazine/pistol/rubber = 20,
					/obj/item/ammo_magazine/hpistol/rubber = 10,
					/obj/item/ammo_magazine/smg/rubber =10,
					/obj/item/ammo_magazine/ammobox/pistol/rubber = 20,
					/obj/item/ammo_magazine/slmagnum/rubber = 10,
					/obj/item/ammo_magazine/magnum/rubber = 5,
					/obj/item/ammo_magazine/msmg/rubber = 5,
					/obj/item/ammo_magazine/ammobox/magnum/rubber = 10,
					/obj/item/ammo_magazine/cspistol/rubber = 5,
					/obj/item/ammo_magazine/ammobox/clrifle_small/rubber = 5,
					/obj/item/ammo_casing/shotgun/beanbag/prespawned = 20,
					/obj/item/weapon/storage/box/shotgunammo/beanbags = 5,
					/obj/item/weapon/storage/box/shotgunammo/rubbershot = 5,
					/obj/item/weapon/cell/small/high = 10,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/fs_cheap_guns/generic = 5, // OCCULUS EDIT - pew pew
					/obj/item/weapon/storage/deferred/crate/clown_crime = 2,
					/obj/item/weapon/storage/deferred/crate/clown_crime/wolf = 2,
					/obj/item/weapon/storage/deferred/crate/clown_crime/hoxton = 2,
					/obj/item/weapon/storage/deferred/crate/clown_crime/chains = 2
					)
	prices = list(
					/obj/item/ammo_magazine/slpistol/rubber = 90,
					/obj/item/ammo_magazine/pistol/rubber = 200,
					/obj/item/ammo_magazine/hpistol/rubber = 260,
					/obj/item/ammo_magazine/smg/rubber = 500,
					/obj/item/ammo_magazine/ammobox/pistol/rubber = 300,
					/obj/item/ammo_magazine/slmagnum/rubber = 100,
					/obj/item/ammo_magazine/magnum/rubber = 220,
					/obj/item/ammo_magazine/msmg/rubber = 550,
					/obj/item/ammo_magazine/ammobox/magnum/rubber = 360,
					/obj/item/ammo_magazine/cspistol/rubber = 250,
					/obj/item/ammo_magazine/ammobox/clrifle_small/rubber = 900,
					/obj/item/ammo_casing/shotgun/beanbag/prespawned = 75,
					/obj/item/weapon/storage/box/shotgunammo/beanbags = 575,
					/obj/item/weapon/storage/box/shotgunammo/rubbershot = 575,
					/obj/item/weapon/cell/small/high = 500,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/fs_cheap_guns/generic = 2500, // OCCULUS EDIT - pew pew
					/obj/item/weapon/storage/deferred/crate/clown_crime = 1800,
					/obj/item/weapon/storage/deferred/crate/clown_crime/wolf = 1800,
					/obj/item/weapon/storage/deferred/crate/clown_crime/hoxton = 1800,
					/obj/item/weapon/storage/deferred/crate/clown_crime/chains = 1800
					)
	idle_power_usage = 211
	auto_price = FALSE

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
					/obj/item/weapon/storage/hypospraykit/regular = 1,
					/obj/item/weapon/storage/hypospraykit/fire = 1,
					/obj/item/weapon/storage/hypospraykit/brute = 1,
					/obj/item/weapon/storage/hypospraykit/toxin = 1,
					/obj/item/weapon/storage/hypospraykit/o2 = 1,
					/obj/item/hypospray/mkii = 4,
					/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small = 9
					)

	contraband = list(
					/obj/item/weapon/reagent_containers/pill/tox = 3,
					/obj/item/weapon/reagent_containers/pill/antitox = 6,
					/obj/item/weapon/reagent_containers/pill/stox = 4
					)

	idle_power_usage = 211 //refrigerator - believe it or not, this is actually the average power consumption of a refrigerated vending machine according to NRCan.
	auto_price = FALSE

/obj/machinery/vending/wallmed/lobby
	products = list(
		/obj/item/device/scanner/health = 5,
		/obj/item/stack/medical/bruise_pack = 5,
		/obj/item/stack/medical/ointment = 5,
		/obj/item/stack/medical/advanced/bruise_pack = 2,
		/obj/item/stack/medical/advanced/ointment = 2,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/antitoxin = 10,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/tricordrazine = 5,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/spaceacillin = 5,
		/obj/item/weapon/implantcase/death_alarm = 2,
		/obj/item/weapon/implanter = 2,
		/obj/item/stack/nanopaste = 1
		)

/obj/machinery/vending/weapon_machine
	prices = list(

					/obj/item/weapon/gun/projectile/revolver/havelock = 600,
					/obj/item/weapon/gun/projectile/giskard = 600,
					/obj/item/weapon/gun/projectile/mk58 = 900,
					/obj/item/weapon/gun/projectile/automatic/atreides = 1200,
					/obj/item/weapon/gun/projectile/shotgun/pump = 1400,
					/obj/item/weapon/gun/energy/gun/martin = 600,
					/obj/item/clothing/accessory/holster/armpit = 200,
					/obj/item/clothing/accessory/holster/waist = 200,
					/obj/item/clothing/accessory/holster/hip = 200,//Occulus Edit: This was missing
					/obj/item/weapon/tool/knife/tacknife = 400,
					/obj/item/clothing/head/armor/helmet = 1000,
					/obj/item/clothing/suit/armor/vest = 1500,
					/obj/item/weapon/gun/projectile/automatic/slaught_o_matic = 300,//Occulus Edit: Ahahaha what? No
					/obj/item/weapon/tool/knife/tacknife = 600,//Occulus Edit: We have a bullet vendor
					/obj/item/weapon/storage/box/smokes = 200)

//all these are just to update the bill validator lights
/obj/machinery/vending/serbomat/New()
	..()
	update_icon()

/obj/machinery/vending/serbomat/power_change()
	..()
	update_icon()

/obj/machinery/vending/serbomat/malfunction()
	spawn(20)		//2 seconds is enough time for the icon to change OK.
		update_icon()
	..()		//there is a return statement in ..() so we need that last

/obj/machinery/vending/serbomat/attack_hand()
	spawn(20)
		update_icon()
	..()		//there is a return statement in ..() so we need that last
//this concludes the edits to make bill validator lights work right.

/obj/machinery/vending/serbomat/update_icon()		//bill validator lights

	var/bv_head = "billval-ready"		//"bill validator head" - baseline state if nothing else.

	//let's start with getting the BV state.
	if(stat & BROKEN)
		bv_head = "billval-standby"
	if(stat & NOPOWER)
		bv_head = "billval-offline"

//First, switch it to the lighting plane so we can get the lights working.
	set_plane(ABOVE_LIGHTING_PLANE)

//store that real fast, that's the one we want...
	var/glowplane = plane

//and revert it back to how it was before.
	set_plane(initial(plane))

//now we actually do the lighting magic!
	var/image/overlay = image(icon, bv_head)
	overlay.plane = glowplane
	overlay.layer = ABOVE_LIGHTING_LAYER
	overlay.alpha = 200
	overlays.Cut()		//clear out any overlays we may have
	overlays += overlay		//and apply the overlay.

	. = ..()	//And we go back to how things were.

/obj/machinery/vending/snack
	name = "Getmore Chocolate Corp"
	desc = "A snack machine courtesy of the Getmore Chocolate Corporation."
	product_slogans = "Try our new nougat bar!;Twice the calories for half the price!"
	product_ads = "The healthiest!;Award-winning chocolate bars!;Mmm! So good!;Oh my god it's so juicy!;Have a snack.;Snacks are good for you!;Have some more. Getmore!;Best quality snacks straight from mars.;We love chocolate!;Try our new jerky!;We are legally required to disclose that we are under investigation by the Solarian Federal Bureau of Labor Protection."
	icon_state = "snack"
	products = list(/obj/item/weapon/reagent_containers/food/snacks/candy = 6,/obj/item/weapon/reagent_containers/food/drinks/dry_ramen = 6,/obj/item/weapon/reagent_containers/food/snacks/chips =6,
					/obj/item/weapon/reagent_containers/food/snacks/sosjerky = 6,/obj/item/weapon/reagent_containers/food/snacks/no_raisin = 6,/obj/item/weapon/reagent_containers/food/snacks/spacetwinkie = 6,
					/obj/item/weapon/reagent_containers/food/snacks/cheesiehonkers = 6, /obj/item/weapon/reagent_containers/food/snacks/tastybread = 6)
	contraband = list(/obj/item/weapon/reagent_containers/food/snacks/syndicake = 8, /obj/item/weapon/storage/ration_pack = 1)
	prices = list(/obj/item/weapon/reagent_containers/food/snacks/candy = 60,/obj/item/weapon/reagent_containers/food/drinks/dry_ramen = 80,/obj/item/weapon/reagent_containers/food/snacks/chips = 70,
					/obj/item/weapon/reagent_containers/food/snacks/sosjerky = 75,/obj/item/weapon/reagent_containers/food/snacks/no_raisin = 80,/obj/item/weapon/reagent_containers/food/snacks/spacetwinkie = 60,
					/obj/item/weapon/reagent_containers/food/snacks/cheesiehonkers = 90, /obj/item/weapon/reagent_containers/food/snacks/tastybread = 100,
					/obj/item/weapon/reagent_containers/food/snacks/syndicake = 80, /obj/item/weapon/storage/ration_pack = 500)
