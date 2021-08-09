// LORE OVERRIDES FOR ODDITIES AND STUFF GO HERE

/obj/item/weapon/oddity/common/coin
	w_class = ITEM_SIZE_TINY //Now you can fit them on your ear

/obj/item/weapon/oddity/common/book_bible
	desc = "and though you stand before the gates of hell, with death at your side - be not afraid. For I am with you." //Neotheo didn't overtake christianity in our lore

/obj/item/weapon/oddity/common/old_money
	w_class = ITEM_SIZE_TINY //So you can fit in on your ear slot too

/obj/item/weapon/oddity/common/old_pda
	desc = "An old model of PDA Nanotrasen used to produce, you have to wonder how it ended up here." //NT never got overthrown in our lore

/obj/item/weapon/oddity/common/old_id
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/oddity/nt/seal
	name = "Mekhanite Seal"
	desc = "An honorary badge given to the most devout of the Children of Mekhane."
	oddity_stats = list(
		STAT_BIO = 6,
		STAT_VIG = 6,
		STAT_ROB = 4
	)// Nerf its stats to the ground
	price_tag = 5000//price tag brought inline with secret doc value

/obj/item/weapon/oddity/common/isometrics_lost
	name = "greatest hits album"
	desc = "A compilation of Isometric's greatest hits. Some of the songs on here are from albums you've never listened to. The entire collection is dedicated in loving memory to a name you don't recognize. Groovy."
	icon = 'zzzz_modular_occulus/icons/obj/oddities.dmi'
	icon_state = "isometrics"
	oddity_stats = list(
		STAT_COG = 4,
		STAT_BIO = 5,
		STAT_VIG = 8,
	)
	rarity_value = 26

/obj/item/weapon/oddity/techno
	prob_perk = 0 //So that way unknown techno parts dont get perks.