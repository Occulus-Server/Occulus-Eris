//This is where we put new and modify old vending machines for Occulus!//

/obj/machinery/vending
	shut_up = 1//These ads are nothing but obnoxious

//Snacks, Food, Smokes, and Booze

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

/obj/machinery/vending/coffee
	products = list(/obj/item/weapon/reagent_containers/food/drinks/coffee = 25,/obj/item/weapon/reagent_containers/food/drinks/tea/black = 25,
					/obj/item/weapon/reagent_containers/food/drinks/tea/green = 25,/obj/item/weapon/reagent_containers/food/drinks/h_chocolate = 25)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/ice = 10)
	prices = list(/obj/item/weapon/reagent_containers/food/drinks/coffee = 30, /obj/item/weapon/reagent_containers/food/drinks/tea/black = 30 ,
					/obj/item/weapon/reagent_containers/food/drinks/tea/green = 30, /obj/item/weapon/reagent_containers/food/drinks/h_chocolate = 40)
	vendor_department = DEPARTMENT_CIVILIAN

/obj/machinery/vending/snack
	name = "Getmore Chocolate Corp"
	desc = "A snack machine courtesy of the Getmore Chocolate Corporation."
	product_slogans = "Try our new nougat bar!;Twice the calories for half the price!"
	product_ads = "The healthiest!;Award-winning chocolate bars!;Mmm! So good!;Oh my god it's so juicy!;Have a snack.;Snacks are good for you!;Have some more. Getmore!;Best quality snacks straight from mars.;We love chocolate!;Try our new jerky!;We are legally required to disclose that we are under investigation by the Solarian Federal Bureau of Labor Protection."
	icon_state = "snack"
	vendor_department = DEPARTMENT_CIVILIAN
	products = list(/obj/item/weapon/reagent_containers/food/snacks/shokoloud = 6,/obj/item/weapon/reagent_containers/food/drinks/dry_ramen = 6,/obj/item/weapon/reagent_containers/food/snacks/chips =6,
					/obj/item/weapon/reagent_containers/food/snacks/sosjerky = 6,/obj/item/weapon/reagent_containers/food/snacks/no_raisin = 6,/obj/item/weapon/reagent_containers/food/snacks/spacetwinkie = 6,
					/obj/item/weapon/reagent_containers/food/snacks/cheesiehonkers = 6, /obj/item/weapon/reagent_containers/food/snacks/tastybread = 6)
	contraband = list(/obj/item/weapon/reagent_containers/food/snacks/wok = 8, /obj/item/weapon/storage/ration_pack = 1)
	prices = list(/obj/item/weapon/reagent_containers/food/snacks/shokoloud = 60,/obj/item/weapon/reagent_containers/food/drinks/dry_ramen = 80,/obj/item/weapon/reagent_containers/food/snacks/chips = 70,
					/obj/item/weapon/reagent_containers/food/snacks/sosjerky = 75,/obj/item/weapon/reagent_containers/food/snacks/no_raisin = 80,/obj/item/weapon/reagent_containers/food/snacks/spacetwinkie = 60,
					/obj/item/weapon/reagent_containers/food/snacks/cheesiehonkers = 90, /obj/item/weapon/reagent_containers/food/snacks/tastybread = 100,
					/obj/item/weapon/reagent_containers/food/snacks/wok = 80, /obj/item/weapon/storage/ration_pack = 500)

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

/obj/machinery/vending/cigarette
	products = list(
		/obj/item/weapon/storage/fancy/cigarettes = 10,
		/obj/item/weapon/storage/fancy/cigcartons = 2,
		/obj/item/weapon/storage/fancy/cigarettes/dromedaryco = 5,
		/obj/item/weapon/storage/fancy/cigcartons/dromedaryco = 3,
		/obj/item/weapon/storage/box/matches = 10,
		/obj/item/weapon/flame/lighter/random = 4)
	contraband = list(
		/obj/item/clothing/mask/smokable/cigarette/cigar = 4,
		/obj/item/weapon/flame/lighter/zippo = 4,
		/obj/item/clothing/mask/vape/pipe = 3,
		/obj/item/clothing/mask/vape = 5,
		/obj/item/weapon/reagent_containers/glass/beaker/vial/vape/nicotine = 5,
		/obj/item/weapon/reagent_containers/glass/beaker/vial/vape/berry = 10,
		/obj/item/weapon/reagent_containers/glass/beaker/vial/vape/lemon = 10,
		/obj/item/weapon/reagent_containers/glass/beaker/vial/vape/banana = 10)
	premium = list(
		/obj/item/weapon/storage/fancy/cigar = 5,
		/obj/item/weapon/storage/fancy/cigarettes/killthroat = 5,
		/obj/item/weapon/storage/fancy/cigarettes/homeless = 3)
	prices = list(
		/obj/item/clothing/mask/smokable/cigarette/cigar = 200,
		/obj/item/weapon/storage/fancy/cigarettes = 100,
		/obj/item/weapon/storage/fancy/cigcartons = 800,
		/obj/item/weapon/storage/fancy/cigarettes/dromedaryco = 100,
		/obj/item/weapon/storage/fancy/cigcartons/dromedaryco = 800,
		/obj/item/weapon/storage/box/matches = 30,
		/obj/item/weapon/flame/lighter/random = 30,
		/obj/item/weapon/flame/lighter/zippo = 250,
		/obj/item/clothing/mask/vape/pipe = 500,
		/obj/item/clothing/mask/vape = 300,
		/obj/item/weapon/reagent_containers/glass/beaker/vial/vape/nicotine = 150,
		/obj/item/weapon/reagent_containers/glass/beaker/vial/vape/berry = 100,
		/obj/item/weapon/reagent_containers/glass/beaker/vial/vape/lemon = 100,
		/obj/item/weapon/reagent_containers/glass/beaker/vial/vape/banana = 100)


//Guns and Ammo

/obj/machinery/vending/weapon_machine
	products = list(
					/obj/item/weapon/reagent_containers/spray/pepper = 5,
					/obj/item/weapon/gun/projectile/revolver/havelock = 5,
					/obj/item/weapon/gun/projectile/giskard = 5,
					/obj/item/weapon/gun/projectile/mk58 = 5,
					/obj/item/weapon/gun/projectile/automatic/atreides = 3,
					/obj/item/weapon/gun/projectile/shotgun/pump = 3,
					/obj/item/weapon/gun/energy/gun/martin = 5,
					/obj/item/clothing/accessory/holster = 5,
					/obj/item/clothing/accessory/holster/waist = 5,
					/obj/item/clothing/accessory/holster/hip = 5,
					/obj/item/weapon/tool/knife/tacknife = 5,
					/obj/item/weapon/storage/box/smokes = 3,
					/obj/item/clothing/head/armor/helmet = 2,
					/obj/item/clothing/suit/armor/vest = 2)
	premium = list(
					/obj/item/weapon/gun/projectile/automatic/wintermute = 3,
					/obj/item/weapon/gun/projectile/automatic/sol = 3,
					/obj/item/weapon/gun/projectile/automatic/straylight = 3,
					/obj/item/weapon/gun/projectile/paco = 3,
					/obj/item/weapon/gun/projectile/revolver/deckard = 3,
					/obj/item/weapon/gun/projectile/shotgun/pump/regulator = 3,
					/obj/item/weapon/gun/energy/gun/gemini = 3)
	prices = list(
					/obj/item/weapon/reagent_containers/spray/pepper = 200,
					/obj/item/weapon/gun/projectile/revolver/havelock = 600,
					/obj/item/weapon/gun/projectile/giskard = 600,
					/obj/item/weapon/gun/projectile/mk58 = 900,
					/obj/item/weapon/gun/projectile/automatic/atreides = 1200,
					/obj/item/weapon/gun/projectile/shotgun/pump = 1400,
					/obj/item/weapon/gun/energy/gun/martin = 600,
					/obj/item/clothing/accessory/holster/armpit = 200,
					/obj/item/clothing/accessory/holster/waist = 200,
					/obj/item/clothing/accessory/holster/hip = 200,
					/obj/item/weapon/tool/knife/tacknife = 400,
					/obj/item/clothing/head/armor/helmet = 1000,
					/obj/item/clothing/suit/armor/vest = 1500,
					/obj/item/weapon/tool/knife/tacknife = 600,
					/obj/item/weapon/storage/box/smokes = 200,
					/obj/item/weapon/gun/projectile/automatic/wintermute = 3500,
					/obj/item/weapon/gun/projectile/automatic/sol = 2300,
					/obj/item/weapon/gun/projectile/automatic/straylight = 1400,
					/obj/item/weapon/gun/projectile/paco = 1500,
					/obj/item/weapon/gun/projectile/revolver/deckard = 3100,
					/obj/item/weapon/gun/projectile/shotgun/pump/regulator = 1500,
					/obj/item/weapon/gun/energy/gun/gemini = 2100)

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
					/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 5,
					/obj/item/ammo_magazine/ammobox/shotgun/rubbershot = 5,
					/obj/item/weapon/cell/small/high = 10,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/fs_cheap_guns/generic = 2
					)
	premium = list(
					/obj/item/weapon/storage/pouch/ammo = 5,
					/obj/item/ammo_magazine/ammobox/clrifle/rubber = 3,
					/obj/item/ammo_magazine/ammobox/lrifle/rubber = 3,
					/obj/item/ammo_magazine/ammobox/srifle/rubber = 3
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
					/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 575,
					/obj/item/ammo_magazine/ammobox/shotgun/rubbershot = 575,
					/obj/item/weapon/cell/small/high = 500,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/fs_cheap_guns/generic = 2500,
					/obj/item/weapon/storage/pouch/ammo = 750,
					/obj/item/ammo_magazine/ammobox/clrifle/rubber = 1500,
					/obj/item/ammo_magazine/ammobox/lrifle/rubber = 1500,
					/obj/item/ammo_magazine/ammobox/srifle/rubber = 1500
					)
	idle_power_usage = 211
	auto_price = FALSE

//Medical Vendors

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
	premium = list(
		/obj/item/weapon/storage/firstaid/regular = 5,
		/obj/item/weapon/storage/firstaid/adv = 3
		)
	prices = list(
		/obj/item/device/scanner/health = 50,
		/obj/item/stack/medical/bruise_pack = 100,
		/obj/item/stack/medical/ointment = 100,
		/obj/item/stack/medical/advanced/bruise_pack = 200,
		/obj/item/stack/medical/advanced/ointment = 200,
		/obj/item/stack/nanopaste = 1000,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/antitoxin = 100,
		/obj/item/weapon/reagent_containers/syringe/antitoxin = 200,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/tricordrazine = 150,
		/obj/item/weapon/reagent_containers/syringe/tricordrazine = 300,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/spaceacillin = 100,
		/obj/item/weapon/reagent_containers/syringe/spaceacillin = 200,
		/obj/item/weapon/implantcase/death_alarm = 500,
		/obj/item/weapon/implanter = 50,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/hyperzine = 500,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/drugs = 500,
		/obj/item/weapon/storage/firstaid/regular = 400,
		/obj/item/weapon/storage/firstaid/adv = 800,
		)

//Seed Vendors

/obj/machinery/vending/hydroseeds
	products = list(/obj/item/seeds/bananaseed = 3,/obj/item/seeds/berryseed = 3,/obj/item/seeds/carrotseed = 3,/obj/item/seeds/chantermycelium = 3,/obj/item/seeds/chiliseed = 3,
					/obj/item/seeds/cornseed = 3, /obj/item/seeds/eggplantseed = 3, /obj/item/seeds/potatoseed = 3, /obj/item/seeds/soyaseed = 3,
					/obj/item/seeds/sunflowerseed = 3,/obj/item/seeds/tomatoseed = 3,/obj/item/seeds/towermycelium = 3,/obj/item/seeds/wheatseed = 3,/obj/item/seeds/appleseed = 3,
					/obj/item/seeds/poppyseed = 3,/obj/item/seeds/sugarcaneseed = 3,/obj/item/seeds/ambrosiavulgarisseed = 3,/obj/item/seeds/peanutseed = 3,/obj/item/seeds/whitebeetseed = 3,/obj/item/seeds/watermelonseed = 3,/obj/item/seeds/limeseed = 3,
					/obj/item/seeds/lemonseed = 3,/obj/item/seeds/orangeseed = 3,/obj/item/seeds/grassseed = 3,/obj/item/seeds/cocoapodseed = 3,/obj/item/seeds/plumpmycelium = 2,
					/obj/item/seeds/cabbageseed = 3,/obj/item/seeds/grapeseed = 3,/obj/item/seeds/pumpkinseed = 3,/obj/item/seeds/cherryseed = 3,/obj/item/seeds/plastiseed = 3,/obj/item/seeds/riceseed = 3, /obj/item/seeds/tobaccoseed = 3,
					/obj/item/seeds/blueberryseed = 3, /obj/item/seeds/strawberryseed = 3, /obj/item/seeds/pineappleseed = 3, /obj/item/seeds/cinnamonseed = 3, /obj/item/seeds/mintseed = 3, /obj/item/seeds/joy = 2)

//Tool Vendors

/obj/machinery/vending/engineering
	vendor_department = DEPARTMENT_ENGINEERING

/obj/machinery/vending/tool
	vendor_department = DEPARTMENT_ENGINEERING

/obj/machinery/vending/assist
	name = "EES Devices and Circuits"
	desc = "For all your assembly and circuitry needs."
	products = list(
		/obj/item/device/assembly/prox_sensor = 5,
		/obj/item/device/assembly/mousetrap = 5,
		/obj/item/device/assembly/igniter = 3,
		/obj/item/device/assembly/signaler = 6,
		/obj/item/device/assembly/timer = 2,
		/obj/item/device/assembly/infra = 2,
		/obj/item/device/lighting/toggleable/flashlight = 5
	)
	contraband = list(
		/obj/item/device/assembly/voice = 1,
		/obj/item/device/electronics/integrated/integrated_circuit_printer = 1
	)
	prices = list(
		/obj/item/device/assembly/prox_sensor = 100,
		/obj/item/device/assembly/igniter = 100,
		/obj/item/device/assembly/signaler = 100,
		/obj/item/device/assembly/timer = 200,
		/obj/item/device/lighting/toggleable/flashlight = 200,
		/obj/item/device/assembly/voice = 600,
		/obj/item/device/electronics/integrated/integrated_circuit_printer = 3000
	)
	vendor_department = DEPARTMENT_ENGINEERING

/obj/machinery/vending/powermat
	premium = list(/obj/item/weapon/cell/large/hyper = 3,
					/obj/item/weapon/cell/medium/hyper = 3,
					/obj/item/weapon/cell/small/hyper = 3
					)
	prices = list(/obj/item/weapon/cell/large = 500,
					/obj/item/weapon/cell/large/high = 700,
					/obj/item/weapon/cell/medium = 300,
					/obj/item/weapon/cell/medium/high = 400,
					/obj/item/weapon/cell/small = 100,
					/obj/item/weapon/cell/small/high = 200,
					/obj/item/weapon/cell/large/super = 1200,
					/obj/item/weapon/cell/medium/super = 700,
					/obj/item/weapon/cell/small/super = 350,
					/obj/item/weapon/cell/large/hyper = 1700,
					/obj/item/weapon/cell/medium/hyper = 1000,
					/obj/item/weapon/cell/small/hyper = 500
					)

//Mekhane Theomat

/obj/machinery/vending/theomat
	premium = list(
					/obj/item/weapon/storage/belt/utility/neotheology = 3,
					/obj/item/weapon/storage/belt/tactical/neotheology = 3)
	prices = list(/obj/item/weapon/book/ritual/cruciform = 500,
					/obj/item/weapon/storage/fancy/candle_box = 200,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/ntcahors = 250,
					/obj/item/weapon/implant/core_implant/cruciform = 1000,
					/obj/item/weapon/storage/belt/utility/neotheology = 150,
					/obj/item/weapon/storage/belt/tactical/neotheology = 150)

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