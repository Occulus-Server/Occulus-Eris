//BIG CELLS - for APC, borgs and machinery.
/obj/item/weapon/cell/large
	price_tag = 1000

/obj/item/weapon/cell/large/high
	price_tag = 2000

/obj/item/weapon/cell/large/super
	price_tag = 4000

/obj/item/weapon/cell/large/hyper
	price_tag = 4500

/obj/item/weapon/cell/large/moebius
	price_tag = 1000

/obj/item/weapon/cell/large/moebius/high
	price_tag = 1500

/obj/item/weapon/cell/large/moebius/super
	price_tag = 2000

/obj/item/weapon/cell/large/moebius/hyper
	price_tag = 3000

/obj/item/weapon/cell/large/moebius/nuclear
	price_tag = 4000

/obj/item/weapon/cell/large/excelsior
	price_tag = 1000

//Meme cells - for fun and cancer

/obj/item/weapon/cell/large/potato
	name = "potato battery"
	desc = "A rechargable starch based power cell."
	origin_tech = list(TECH_POWER = 1)
	icon = 'icons/obj/power.dmi'
	icon_state = "potato_cell"
	charge = 100
	maxcharge = 300
	minor_fault = 1
	spawn_blacklisted = TRUE

/obj/item/weapon/cell/large/slime
	name = "charged slime core"
	desc = "A yellow slime core infused with phoron, it crackles with power."
	origin_tech = list(TECH_POWER = 2, TECH_BIO = 4)
	icon = 'icons/mob/slimes.dmi'
	icon_state = "yellow slime extract"
	maxcharge = 10000
	matter = null
	spawn_blacklisted = TRUE

//MEDIUM CELLS - for energy weapons and large devices

/obj/item/weapon/cell/medium
	price_tag = 200

/obj/item/weapon/cell/medium/high
	price_tag = 300

/obj/item/weapon/cell/medium/super
	price_tag = 300

/obj/item/weapon/cell/medium/hyper
	price_tag = 700

/obj/item/weapon/cell/medium/moebius
	price_tag = 200

/obj/item/weapon/cell/medium/moebius/high
	price_tag = 250


/obj/item/weapon/cell/medium/moebius/super
	price_tag = 300

/obj/item/weapon/cell/medium/moebius/hyper
	price_tag = 350

/obj/item/weapon/cell/medium/moebius/nuclear
	price_tag = 400

/obj/item/weapon/cell/medium/excelsior
	price_tag = 300

//SMALL CELLS - for small devices, such as flashlights, analyzers and HUDs.
/obj/item/weapon/cell/small
	price_tag = 100

/obj/item/weapon/cell/small/high
	price_tag = 150

/obj/item/weapon/cell/small/super
	price_tag = 200

/obj/item/weapon/cell/small/hyper
	price_tag = 400

/obj/item/weapon/cell/small/moebius
	price_tag = 50

/obj/item/weapon/cell/small/moebius/high
	price_tag = 200

/obj/item/weapon/cell/small/moebius/super
	price_tag = 200

/obj/item/weapon/cell/small/moebius/hyper
	price_tag = 300

/obj/item/weapon/cell/small/moebius/nuclear
	price_tag = 400

/obj/item/weapon/cell/small/moebius/pda
	price_tag = 50

/obj/item/weapon/cell/small/excelsior
	price_tag = 250

/obj/item/weapon/cell/disposable
	price_tag = 50
