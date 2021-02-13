/obj/item/weapon/reagent_containers/glass/beaker/hypovial // these have literally no fucking right to just be better beakers that you can shit out of a chemmaster
	name = "broken hypovial"
	desc = "A specialized capsule compatible with most hyposprays."
	icon = 'zzzz_modular_occulus/icons/obj/chemical.dmi'
	icon_state = "hypovial"
	w_class = ITEM_SIZE_SMALL
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial
	volume = 10
	rarity_value = 30
	possible_transfer_amounts = list(1,2,5,10)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/Initialize()
	. = ..()
	update_icon()

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/update_icon()
	cut_overlays()

	if(reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance('zzzz_modular_occulus/icons/obj/reagentfillings.dmi', "hypovial[get_filling_state()]")
		filling.color = reagents.get_color()
		add_overlay(filling)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/Initialize()
	. = ..()
	update_icon()

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/update_icon()
	cut_overlays()

	if(reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance('zzzz_modular_occulus/icons/obj/reagentfillings.dmi', "hypoviallarge[get_filling_state()]")
		filling.color = reagents.get_color()
		add_overlay(filling)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/tiny
	name = "small hypovial"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/tiny
	//Shouldn't be possible to get this without adminbuse

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/small
	name = "hypovial"
	volume = 60
	rarity_value = 50
	possible_transfer_amounts = list(1,2,5,10,15)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/bluespace
	name = "bluespace hypovial"
	icon_state = "hypovialbs"
	rarity_value = 100
	volume = 120
	possible_transfer_amounts = list(1,2,5,10,15,20)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/large
	name = "large hypovial"
	desc = "A large hypovial, for deluxe hypospray models."
	icon_state = "hypoviallarge"
	rarity_value = 90
	volume = 120
	possible_transfer_amounts = list(1,2,5,10,15,20)
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
/obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/bluespace
	possible_transfer_amounts = list(1,2,5,10,20)
	name = "bluespace large hypovial"
	volume = 240
	rarity_value = 100
	icon_state = "hypoviallargebs"

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/bicaridine
	name = "red hypovial (bicaridine)"
	icon_state = "hypovial-b"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/bicaridine
	preloaded_reagents = list("bicaridine" = 30)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/antitoxin
	name = "green hypovial (Anti-Tox)"
	icon_state = "hypovial-a"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/antitoxin
	preloaded_reagents = list("anti_toxin" = 30)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/kelotane
	name = "orange hypovial (kelotane)"
	icon_state = "hypovial-k"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/kelotane
	preloaded_reagents = list("kelotane" = 30)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/dexalin
	name = "blue hypovial (dexalin)"
	icon_state = "hypovial-d"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/dexalin
	preloaded_reagents = list("dexalin" = 30)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/tricord
	name = "hypovial (tricordrazine)"
	icon_state = "hypovial"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/tricord
	preloaded_reagents = list("tricordrazine" = 30)


/obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/CMO
	name = "deluxe hypovial"
	icon_state = "hypoviallarge-cmos"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/CMO
	preloaded_reagents = list("nanosymbiotes" = 20, "oxyrush" = 20, "trauma_control_system" = 20)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/bicaridine
	name = "large red hypovial (bicaridine)"
	icon_state = "hypoviallarge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/bicaridine
	preloaded_reagents = list("bicaridine" = 60)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/antitoxin
	name = "large green hypovial (anti-tox)"
	icon_state = "hypoviallarge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/antitoxin
	preloaded_reagents = list("anti_toxin" = 60)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/kelotane
	name = "large orange hypovial (kelotane)"
	icon_state = "hypoviallarge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/kelotane
	preloaded_reagents = list("kelotane" = 60)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/dexalin
	name = "large blue hypovial (dexalin)"
	icon_state = "hypoviallarge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/dexalin
	preloaded_reagents = list("dexalin" = 60)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/tricord
	name = "large hypovial (tricord)"
	icon_state = "hypoviallarge"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/tricord
	preloaded_reagents = list("tricordrazine" = 60)

/obj/item/weapon/reagent_containers/glass/beaker/hypovial/combat
	name = "combat hypovial"
	icon_state = "hypovial-t"
	bad_type = /obj/item/weapon/reagent_containers/glass/beaker/hypovial/combat
	rarity_value = 100
	preloaded_reagents = list("synaptizine" = 10, "hyperzine" = 10, "oxycodone" = 10, "trauma_control_system" = 10, "nanosymbiotes" = 10)
