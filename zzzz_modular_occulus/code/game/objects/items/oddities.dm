// LORE OVERRIDES FOR ODDITIES AND STUFF GO HERE

/obj/item/oddity
	price_tag = 100

/obj/item/oddity/common/blueprint
	oddity_stats = list(
		STAT_COG = 2,
		STAT_MEC = 3
	)
	rarity_value = 15
	price_tag = 300


/obj/item/oddity/common/coin
	w_class = ITEM_SIZE_TINY
	oddity_stats = list(
		STAT_ROB = 2,
		STAT_TGH = 2
	)

/obj/item/oddity/common/photo_landscape
	oddity_stats = list(
		STAT_COG = 2,
		STAT_TGH = 2,
	)

/obj/item/oddity/common/photo_coridor
	oddity_stats = list(
		STAT_MEC = 2,
		STAT_TGH = 2,
	)

/obj/item/oddity/common/photo_eyes
	oddity_stats = list(
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_VIG = 2,
	)


/obj/item/oddity/common/old_newspaper
	desc = "It contains an article on some old and strange phenomenon. The date on it is all wrong however..."
	oddity_stats = list(
		STAT_MEC = 1,
		STAT_COG = 1,
		STAT_BIO = 1,
	)


/obj/item/oddity/common/paper_crumpled
	desc = "This ALMOST makes sense, why?"
	oddity_stats = list(
		STAT_MEC = 2,
		STAT_COG = 2,
		STAT_BIO = 2,
	)
	price_tag = 300

/obj/item/oddity/common/paper_omega
	oddity_stats = list(
		STAT_MEC = 3,
		STAT_COG = 3,
		STAT_BIO = 3,
	)
	price_tag = 600

/obj/item/oddity/common/book_eyes
	name = "observer book"
	desc = "This book details information on some cyber creatures. Who did this, how this is even possible?"
	icon_state = "book_eyes"
	oddity_stats = list(
		STAT_ROB = 3,
		STAT_TGH = 3,
		STAT_VIG = 3,
	)
	price_tag = 600

/obj/item/oddity/common/book_omega
	oddity_stats = list(
		STAT_BIO = 2,
		STAT_ROB = 2,
		STAT_VIG = 2,
	)
	price_tag = 300

/obj/item/oddity/common/book_bible
	desc = "and though you stand before the gates of hell, with death at your side - be not afraid. For I am with you." //Neotheo didn't overtake christianity in our lore
	oddity_stats = list(
		STAT_ROB = 2,
		STAT_VIG = 2,
	)


/obj/item/oddity/common/old_money
	w_class = ITEM_SIZE_TINY //So you can fit in on your ear slot too
	desc = "Did the the organization that issued this ever exist?"
	oddity_stats = list(
		STAT_ROB = 1,
		STAT_TGH = 1,
	)

/obj/item/oddity/common/healthscanner
	oddity_stats = list(
		STAT_COG = 3,
		STAT_BIO = 3,
	)

/obj/item/oddity/common/old_pda
	desc = "An old model of PDA Nanotrasen used to produce, you have to wonder how it ended up here." //NT never got overthrown in our lore
	oddity_stats = list(
		STAT_COG = 2,
		STAT_MEC = 2,
	)
	price_tag = 200

/obj/item/oddity/common/towel
	oddity_stats = list(
		STAT_ROB = 2,
		STAT_TGH = 2,
	)

/obj/item/oddity/common/teddy
	desc = "No matter where you stand, it's eyes seem to be following you."
	icon_state = "teddy"
	oddity_stats = list(
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_VIG = 2,
	)
	price_tag = 600

/obj/item/oddity/common/old_knife
	oddity_stats = list(
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_VIG = 2,
	)

/obj/item/oddity/common/old_id
	w_class = ITEM_SIZE_TINY
	oddity_stats = list(
		STAT_VIG = 3,
	)


/obj/item/oddity/common/old_radio
	desc = "Despite being broken, sometimes it crackles to life with a broadcast..."
	oddity_stats = list(
		STAT_COG = 3,
		STAT_VIG = 3,
	)

/obj/item/oddity/common/paper_bundle
	name = "paper bundle"
	desc = "Somewhere there is a truth, hidden under all of this scrap."
	icon_state = "paper_bundle"
	oddity_stats = list(
		STAT_BIO = 2,
		STAT_ROB = 2,
		STAT_VIG = 2,
	)
	price_tag = 600

/obj/item/oddity/techno
	desc = "Technological part made by The Cube. You have no idea what this could build."

/obj/item/oddity/broken_necklace
	oddity_stats = list(
		STAT_COG = 3,
		STAT_VIG = 3,
		STAT_ROB = 3,
		STAT_TGH = 3,
		STAT_BIO = 3,
		STAT_MEC = 3
	)
	price_tag = 8000

/obj/item/oddity/common/photo_crime
	oddity_stats = list(
		STAT_COG = 2,
		STAT_VIG = 2,
	)
	price_tag = 300

/obj/item/oddity/common/book_unholy
	desc = "A tome of odd liturgies and rituals. The diagrams in this book don't make any sense. Circles enclose an impossibly detailed mosaic of chrome motifs smeared against the ancient pages."
	oddity_stats = list(
		STAT_COG = 2,
		STAT_MEC = 2,
	)
	price_tag = 300

/obj/item/oddity/common/disk
	oddity_stats = list(
		STAT_MEC = 3,
	)

/obj/item/oddity/common/mirror
	oddity_stats = list(
		STAT_COG = 1,
		STAT_VIG = 1,
	)

/obj/item/oddity/common/lighter
	oddity_stats = list(
		STAT_TGH = 3,
	)

/obj/item/oddity/common/device
	oddity_stats = list(
		STAT_MEC = 3,
		STAT_COG = 3,
	)

/obj/item/oddity/artwork/get_item_cost(export)
	. = ..()
	GET_COMPONENT(comp_sanity, /datum/component/atom_sanity)
	. += comp_sanity.affect * 300
	GET_COMPONENT(comp_insp, /datum/component/inspiration)
	var/list/true_stats = comp_insp.calculate_statistics()
	for(var/stat in true_stats)
		. += true_stats[stat] * 150

/obj/item/oddity/nt/seal
	name = "Mekhanite Seal"
	desc = "An honorary badge given to the most devout of the Children of Mekhane."
	oddity_stats = list(
		STAT_BIO = 3,
		STAT_VIG = 3,
		STAT_ROB = 2
	)// Nerf its stats to the ground
	price_tag = 5000//price tag brought inline with secret doc value


/obj/item/oddity/hivemind/old_radio
	name = "warped radio"
	desc = "An old radio covered in growths. You can hear nothing from it, nothing but the sound of machinery and souls begging for release."
	icon_state = "warped_radio"
	oddity_stats = list(
		STAT_COG = 3,
		STAT_VIG = 3,
		STAT_MEC = 2,
	)
	price_tag = 3000

/obj/item/oddity/hivemind/old_pda
	oddity_stats = list(
		STAT_COG = 3,
		STAT_MEC = 3,
		STAT_VIG = 2
	)
	price_tag = 3000

/obj/item/oddity/hivemind/hive_core
	oddity_stats = list(
		STAT_COG = 3,
		STAT_VIG = 3,
		STAT_MEC = 3,
		STAT_BIO = 3
	)
	price_tag = 5000

/obj/item/oddity/secdocs
	oddity_stats = list(
		STAT_MEC = 3,
		STAT_COG = 3,
		STAT_BIO = 3,
	)
	random_stats = FALSE

//Occulus Unique

/obj/item/oddity/common/isometrics_lost
	name = "greatest hits album"
	desc = "A compilation of Isometric's greatest hits. Some of the songs on here are from albums you've never listened to. The entire collection is dedicated in loving memory to a name you don't recognize. Groovy."
	icon = 'zzzz_modular_occulus/icons/obj/oddities.dmi'
	icon_state = "isometrics"
	oddity_stats = list(
		STAT_COG = 2,
		STAT_BIO = 2,
		STAT_VIG = 3,
	)
	price_tag = 900
