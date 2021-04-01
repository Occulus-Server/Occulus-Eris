/obj/item/weapon/storage/hypospraykit
	name = "mid 'apollo' kit"
	desc = "It's a kit containing a miu 'apollo' and specific treatment chemical-filled vials."
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
	desc = "A Medical Injection Device 'Apollo' kit with general use vials."

/obj/item/weapon/storage/hypospraykit/regular/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/tricord(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/tricord(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/tricord(src)

/obj/item/weapon/storage/hypospraykit/fire
	name = "burn treatment mid 'apollo' kit"
	desc = "A specialized Medical Injection Device 'Apollo' kit for burn treatments. Apply with sass."
	icon_state = "burn-mini"
	item_state = "firstaid-ointment"
	rarity_value = 45

/obj/item/weapon/storage/hypospraykit/fire/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/burn(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/kelotane(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/paracetamol(src)

/obj/item/weapon/storage/hypospraykit/toxin
	name = "toxin treatment mid 'apollo' kit"
	icon_state = "toxin-mini"
	item_state = "firstaid-toxin"
	rarity_value = 45

/obj/item/weapon/storage/hypospraykit/toxin/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/toxin(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/antitoxin(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/antitoxin(src)

/obj/item/weapon/storage/hypospraykit/o2
	name = "oxygen deprivation mid. 'apollo' kit"
	icon_state = "oxy-mini"
	item_state = "firstaid-o2"
	rarity_value = 45

/obj/item/weapon/storage/hypospraykit/o2/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/oxygen(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/dexalin(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/dexalin(src)


/obj/item/weapon/storage/hypospraykit/brute
	name = "brute trauma mid 'apollo' kit"
	icon_state = "brute-mini"
	item_state = "firstaid-brute"
	rarity_value = 75

/obj/item/weapon/storage/hypospraykit/brute/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/brute(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/kelotane(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/paracetamol(src)

/obj/item/weapon/storage/hypospraykit/tactical
	name = "combat mid 'ares' kit"
	desc = "A Medical Injection Device 'Ares' kit best suited for combat situations. Contains combat drugs, caution reccomended."
	icon_state = "tactical-mini"
	rarity_value = 100

/obj/item/weapon/storage/hypospraykit/tactical/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/combat(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/combat(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/small/combat(src)

/obj/item/weapon/storage/hypospraykit/cmo
	name = "mid 'hecate' kit"
	desc = "A kit containing a Medical Injection Device 'Hecate' and cartridges."
	icon_state = "tactical-mini"
	spawn_blacklisted = TRUE

/obj/item/weapon/storage/hypospraykit/cmo/populate_contents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/CMO(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/tricord(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/antitoxin(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/polystem(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/dexalin(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/hypocartridge/large/kelotane(src)
