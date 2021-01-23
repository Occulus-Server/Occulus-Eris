/obj/machinery/vending/coffee
	products = list(/obj/item/weapon/reagent_containers/food/drinks/coffee = 25,/obj/item/weapon/reagent_containers/food/drinks/tea/black = 25,
					/obj/item/weapon/reagent_containers/food/drinks/tea/green = 25,/obj/item/weapon/reagent_containers/food/drinks/h_chocolate = 25)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/ice = 10)
	prices = list(/obj/item/weapon/reagent_containers/food/drinks/coffee = 30, /obj/item/weapon/reagent_containers/food/drinks/tea/black = 30 ,
					/obj/item/weapon/reagent_containers/food/drinks/tea/green = 30, /obj/item/weapon/reagent_containers/food/drinks/h_chocolate = 40)


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