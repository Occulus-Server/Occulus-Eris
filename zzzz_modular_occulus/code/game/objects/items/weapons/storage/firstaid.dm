/obj/item/weapon/storage/hypospraykit
	name = "hypospray kit"
	desc = "It's a kit containing a hypospray and specific treatment chemical-filled vials."
	icon = 'zzzz_modular_occulus/icons/obj/storage.dmi'
	icon_state = "firstaid-mini"
	item_icons = list(slot_l_hand_str = 'zzzz_modular_occulus/icons/mob/left_hand.dmi', slot_r_hand_str = 'zzzz_modular_occulus/icons/mob/right_hand.dmi')
	throw_speed = 3
	throw_range = 7
	rarity_value = 10
	spawn_tags = SPAWN_TAG_FIRSTAID
	bad_type = /obj/item/weapon/storage/hypospraykit
	var/empty = 0
	item_state = "firstaid"



/obj/item/weapon/storage/hypospraykit/regular
	icon_state = "firstaid-mini"
	desc = "A hypospray kit with general use vials."

/obj/item/weapon/storage/hypospraykit/regular/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/tricord(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/tricord(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/tricord(src)

/obj/item/weapon/storage/hypospraykit/fire
	name = "burn treatment hypospray kit"
	desc = "A specialized hypospray kit for burn treatments. Apply with sass."
	icon_state = "burn-mini"
	item_state = "firstaid-ointment"

/obj/item/weapon/storage/hypospraykit/fire/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/burn(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/kelotane(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/kelotane(src)

/obj/item/weapon/storage/hypospraykit/toxin
	name = "toxin treatment hypospray kit"
	icon_state = "toxin-mini"
	item_state = "firstaid-toxin"

/obj/item/weapon/storage/hypospraykit/toxin/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/toxin(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/antitoxin(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/antitoxin(src)

/obj/item/weapon/storage/hypospraykit/o2
	name = "oxygen deprivation hypospray kit"
	icon_state = "oxy-mini"
	item_state = "firstaid-o2"

/obj/item/weapon/storage/hypospraykit/o2/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/oxygen(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/dexalin(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/dexalin(src)


/obj/item/weapon/storage/hypospraykit/brute
	name = "brute trauma hypospray kit"
	icon_state = "brute-mini"
	item_state = "firstaid-brute"

/obj/item/weapon/storage/hypospraykit/brute/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/brute(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/bicaridine(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/small/bicaridine(src)

/obj/item/weapon/storage/hypospraykit/tactical
	name = "combat hypospray kit"
	desc = "A hypospray kit best suited for combat situations. Contains combat drugs, caution reccomended."
	icon_state = "tactical-mini"
	rarity_value = 100

/obj/item/weapon/storage/hypospraykit/tactical/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/combat(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/combat(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/combat(src)

/obj/item/weapon/storage/hypospraykit/cmo
	name = "deluxe hypospray kit"
	desc = "A kit containing a Deluxe hypospray MKII and Vials."
	icon_state = "tactical-mini"

/obj/item/weapon/storage/hypospraykit/cmo/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/CMO(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/tricord(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/antitoxin(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/bicaridine(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/dexalin(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypovial/large/kelotane(src)