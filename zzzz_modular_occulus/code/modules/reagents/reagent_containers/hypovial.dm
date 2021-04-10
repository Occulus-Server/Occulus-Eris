/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge // these have literally no fucking right to just be better beakers that you can shit out of a chemmaster
	name = "broken apollo cartridge"
	desc = "A specialized cartridge compatible with the MID 'Apollo'."
	icon = 'zzzz_modular_occulus/icons/obj/chemical.dmi'
	icon_state = "hypovial"
	w_class = ITEM_SIZE_SMALL
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge
	volume = 10
	rarity_value = 30
	possible_transfer_amounts = list(5,10,15)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/reagent_containers))
		return 	..()

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/Initialize()
	. = ..()
	update_icon()

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/update_icon()
	cut_overlays()

	if(reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance('zzzz_modular_occulus/icons/obj/reagentfillings.dmi', "hypovial[get_filling_state()]")
		filling.color = reagents.get_color()
		add_overlay(filling)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/Initialize()
	. = ..()
	update_icon()

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/update_icon()
	cut_overlays()

	if(reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance('zzzz_modular_occulus/icons/obj/reagentfillings.dmi', "hypoviallarge[get_filling_state()]")
		filling.color = reagents.get_color()
		add_overlay(filling)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/tiny
	name = "small mid apollo cartridge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/tiny
	//Shouldn't be possible to get this without adminbuse

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small
	name = "mid apollo cartridge"
	volume = 45
	rarity_value = 50
	possible_transfer_amounts = list(5,10,15)
/*
/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/bluespace
	name = "bluespace hypovial"
	icon_state = "hypovialbs"
	rarity_value = 100
	volume = 90
	possible_transfer_amounts = list(5,10,15)
*/
/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large
	name = "mid 'hecate' cartridge"
	desc = "A large MID Cartridge, for the MID 'Hecate'."
	icon_state = "hypoviallarge"
	rarity_value = 90
	volume = 90
	possible_transfer_amounts = list(5,10,15)
/*	unique_reskin = list("large hypovial" = "hypoviallarge",		//Saving for icon reference purely.
						"large red hypovial" = "hypoviallarge-b",
						"large blue hypovial" = "hypoviallarge-d",
						"large green hypovial" = "hypoviallarge-a",
						"large orange hypovial" = "hypoviallarge-k",
						"large purple hypovial" = "hypoviallarge-p",
						"large black hypovial" = "hypoviallarge-t"
						)
	cached_icon = "hypoviallarge"
*/
/*
/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/bluespace
	possible_transfer_amounts = list(5,10,15)
	name = "bluespace large hypovial"
	volume = 240
	rarity_value = 150
	icon_state = "hypoviallargebs"
*/
/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/polystem
	name = "red mid cartridge (polystem)"
	icon_state = "hypovial-b"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/polystem
	preloaded_reagents = list("polystem" = 45)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/paracetamol
	name = "grey mid cartridge (paracetamol)"
	icon_state = "hypovial-t"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/paracetamol
	preloaded_reagents = list("paracetamol" = 45)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/antitoxin
	name = "green mid cartridge (anti-Tox)"
	icon_state = "hypovial-a"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/antitoxin
	preloaded_reagents = list("anti_toxin" = 45)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/kelotane
	name = "orange mid cartridge (kelotane)"
	icon_state = "hypovial-k"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/kelotane
	preloaded_reagents = list("kelotane" = 45)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/dexalin
	name = "blue mid cartridge (dexalin)"
	icon_state = "hypovial-d"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/dexalin
	preloaded_reagents = list("dexalin" = 45)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/tricord
	name = "mid cartridge (tricordrazine)"
	icon_state = "hypovial"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/tricord
	preloaded_reagents = list("tricordrazine" = 45)


/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/CMO
	name = "mid 'hecate' cartridge"
	icon_state = "hypoviallarge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/CMO
	preloaded_reagents = list("nanosymbiotes" = 15, "oxyrush" = 15, "trauma_control_system" = 15)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/polystem
	name = "mid 'hecate' cartridge (polystem)"
	icon_state = "hypoviallarge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/polystem
	preloaded_reagents = list("polystem" = 45)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/antitoxin
	name = "mid 'hecate' cartridge (anti-tox)"
	icon_state = "hypoviallarge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/antitoxin
	preloaded_reagents = list("anti_toxin" = 45)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/kelotane
	name = "mid 'hecate' cartridge (kelotane)"
	icon_state = "hypoviallarge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/kelotane
	preloaded_reagents = list("kelotane" = 45)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/dexalin
	name = "mid 'hecate' cartridge (dexalin)"
	icon_state = "hypoviallarge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/dexalin
	preloaded_reagents = list("dexalin" = 45)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/tricord
	name = "mid 'hecate' cartridge (tricord)"
	icon_state = "hypoviallarge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/tricord
	preloaded_reagents = list("tricordrazine" = 45)

/obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/combat
	name = "combat mid 'ares' cartridge"
	icon_state = "hypovial-t"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/combat
	rarity_value = 100
	preloaded_reagents = list("synaptizine" = 5, "hyperzine" = 10, "oxycodone" = 10, "trauma_control_system" = 10, "nanosymbiotes" = 10)
