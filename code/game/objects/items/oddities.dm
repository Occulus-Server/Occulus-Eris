//This is set of item created to work with Eris stat and perk systems
//The idea here is simple, you find oddities in random spawners, you use them, and they grant you stats, or even perks.
//After use, the object is claimed, and cannot be used by someone else
//If rebalancing is needed, keep in mind spawning rate of those items, it might be good idea to change that as well
//Clockrigger 2019

/obj/item/weapon/oddity
	name = "Oddity"
	desc = "Strange item of uncertain origin."
	icon = 'icons/obj/oddities.dmi'
	icon_state = "gift3"
	item_state = "electronic"
	w_class = ITEM_SIZE_SMALL

	//spawn_values
	spawn_blacklisted = TRUE
	spawn_tags = SPAWN_TAG_ODDITY
	rarity_value = 10
	bad_type = /obj/item/weapon/oddity

	//You choose what stat can be increased, and a maximum value that will be added to this stat
	//The minimum is defined above. The value of change will be decided by random
	var/random_stats = TRUE
	var/list/oddity_stats
	var/sanity_value = 1
	var/datum/perk/oddity/perk

/obj/item/weapon/oddity/Initialize()
	. = ..()
	AddComponent(/datum/component/atom_sanity, sanity_value, "")

	if(oddity_stats)
		if(random_stats)
			for(var/stat in oddity_stats)
				oddity_stats[stat] = rand(1, oddity_stats[stat])
		AddComponent(/datum/component/inspiration, oddity_stats, perk)
	//OCCULUS EDIT START - REEE GIMME PERKS
	if(!perk)
		perk = pick(subtypesof(/datum/perk/oddity))
	//OCCULUS EDIT END

/obj/item/weapon/oddity/examine(user)
	..()
	if(perk)
		var/datum/perk/oddity/OD = GLOB.all_perks[perk]
		to_chat(user, SPAN_NOTICE("Strange words echo in your head: <span style='color:orange'>[OD]. [OD.desc]"))


//Oddities are separated into categories depending on their origin. They are meant to be used both in maints and derelicts, so this is important
//This is done by subtypes, because this way even densiest code monkey will not able to misuse them
//They are meant to be put in appropriate random spawners

//Common - you can find those everywhere
/obj/item/weapon/oddity/common
	bad_type = /obj/item/weapon/oddity/common
	spawn_blacklisted = FALSE

/obj/item/weapon/oddity/common/blueprint
	name = "strange blueprint"
	desc = "There's no telling what this design is supposed to be. Whatever could be built from this likely wouldn't work."
	icon_state = "blueprint"
	oddity_stats = list(
		STAT_COG = 5,
		STAT_MEC = 7,
	)
	rarity_value = 15

/obj/item/weapon/oddity/common/coin
	name = "strange coin"
	desc = "It appears to be more of a collectible than any sort of actual currency. What metal it's made from seems to be a mystery."
	icon_state = "coin"
	w_class = ITEM_SIZE_TINY //Now you can fit them on your ear
	oddity_stats = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
	)

/obj/item/weapon/oddity/common/photo_landscape
	name = "alien landscape photo"
	desc = "There is some ire about the planet in this photograph."
	icon_state = "photo_landscape"
	oddity_stats = list(
		STAT_COG = 5,
		STAT_TGH = 5,
	)

/obj/item/weapon/oddity/common/photo_coridor
	name = "surreal maint photo"
	desc = "The corridor in this photograph looks familiar, though something seems wrong about it; it's as if everything in it was replaced with an exact replica of itself."
	icon_state = "photo_corridor"
	oddity_stats = list(
		STAT_MEC = 5,
		STAT_TGH = 5,
	)

/obj/item/weapon/oddity/common/photo_eyes
	name = "observer photo"
	desc = "Just looking at this photo sparks a primal fear in your heart."
	icon_state = "photo_corridor"
	oddity_stats = list(
		STAT_ROB = 6,
		STAT_TGH = 6,
		STAT_VIG = 6,
	)
	rarity_value = 18

/obj/item/weapon/oddity/common/old_newspaper
	name = "old newspaper"
	desc = "It contains a report on some old and strange phenomenon. Maybe it's lies, maybe it's corporate experiments gone wrong."
	icon_state = "old_newspaper"
	oddity_stats = list(
		STAT_MEC = 4,
		STAT_COG = 4,
		STAT_BIO = 4,
	)

/obj/item/weapon/oddity/common/paper_crumpled
	name = "torn-out page"
	desc = "This ALMOST makes sense."
	icon_state = "paper_crumpled"
	oddity_stats = list(
		STAT_MEC = 6,
		STAT_COG = 6,
		STAT_BIO = 6,
	)
	rarity_value = 18

/obj/item/weapon/oddity/common/paper_omega
	name = "collection of obscure reports"
	desc = "Even the authors seem to be rather skeptical about their findings. The reports are not connected to each other, but their results are similar."
	icon_state = "folder-omega" //changed from "paper_omega"
	oddity_stats = list(
		STAT_MEC = 8,
		STAT_COG = 8,
		STAT_BIO = 8,
	)
	rarity_value = 27

/obj/item/weapon/oddity/common/book_eyes
	name = "observer book"
	desc = "This book details information on some cyber creatures. Who did this, how this is even possible?"
	icon_state = "book_eyes"
	oddity_stats = list(
		STAT_ROB = 9,
		STAT_TGH = 9,
		STAT_VIG = 9,
	)
	rarity_value = 30

/obj/item/weapon/oddity/common/book_omega
	name = "occult book"
	desc = "Most of the stories in this book seem to be the ramblings of a madman, but you can't help but keep reading."
	icon_state = "book_omega"
	oddity_stats = list(
		STAT_BIO = 6,
		STAT_ROB = 6,
		STAT_VIG = 6,
	)
	rarity_value = 18

/obj/item/weapon/oddity/common/book_bible
	name = "old bible"
	desc = "Oh, how quickly we forgot."
	icon_state = "book_bible"
	oddity_stats = list(
		STAT_ROB = 5,
		STAT_VIG = 5,
	)

/obj/item/weapon/oddity/common/old_money
	name = "old money"
	desc = "It's not like the organization that issued this exists anymore."
	icon_state = "old_money"
	w_class = ITEM_SIZE_TINY //So you cnan fit in on your ear slot too
	oddity_stats = list(
		STAT_ROB = 4,
		STAT_TGH = 4,
	)
	rarity_value = 8

/obj/item/weapon/oddity/common/healthscanner
	name = "odd health scanner"
	desc = "It's broken and stuck on some really strange readings. Was this thing even remotely humanoid?"
	icon_state = "healthscanner"
	item_state = "electronic"
	oddity_stats = list(
		STAT_COG = 8,
		STAT_BIO = 8,
	)
	rarity_value = 23

/obj/item/weapon/oddity/common/old_pda
	name = "broken pda"
	desc = "An old Nanotrasen era PDA. These were issued to their employees all throughout the galaxy."
	icon_state = "old_pda"
	item_state = "electronic"
	oddity_stats = list(
		STAT_COG = 6,
		STAT_MEC = 6,
	)
	rarity_value = 15

/obj/item/weapon/oddity/common/towel
	name = "trustworthy towel"
	desc = "It's always good to have one with you."
	icon_state = "towel"
	oddity_stats = list(
		STAT_ROB = 6,
		STAT_TGH = 6,
	)
	rarity_value = 15

/obj/item/weapon/oddity/common/teddy
	name = "teddy bear"
	desc = "He will be there for you, even in tough times."
	icon_state = "teddy"
	oddity_stats = list(
		STAT_ROB = 7,
		STAT_TGH = 7,
		STAT_VIG = 7,
	)
	rarity_value = 20

/obj/item/weapon/oddity/common/old_knife
	name = "old knife"
	desc = "Is this blood older then you? You can't tell, and will never know."
	icon_state = "old_knife"
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5)
	force = WEAPON_FORCE_DANGEROUS
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	slot_flags = SLOT_BELT
	sharp = TRUE
	edge = TRUE

	oddity_stats = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_VIG = 5,
	)
	spawn_tags = SPAWN_TAG_ODDITY_WEAPON
	rarity_value = 22

/obj/item/weapon/oddity/common/old_id
	name = "old id"
	desc = "There is a story behind this name. Untold, and cruel in fate."
	icon_state = "old_id"
	oddity_stats = list(
		STAT_VIG = 9,
	)

/obj/item/weapon/oddity/common/old_radio
	name = "old radio"
	desc = "Close your eyes, bring it closer and listen. You can almost hear it, in the edge of your consciousness. The World is ticking."
	icon_state = "old_radio"
	oddity_stats = list(
		STAT_COG = 9,
		STAT_VIG = 9,
	)
	rarity_value = 23

/obj/item/weapon/oddity/common/paper_bundle
	name = "paper bundle"
	desc = "Somewhere there is a truth, hidden under all of this scrap."
	icon_state = "paper_bundle"
	oddity_stats = list(
		STAT_BIO = 6,
		STAT_ROB = 6,
		STAT_VIG = 6,
	)
	rarity_value = 16

/obj/item/weapon/oddity/techno
	name = "Unknown technological part"
	desc = "Technological part forged in the Cube's image. Its purpose is buried beneath the flakes of rust on its surface."
	icon_state = "techno_part1"

/obj/item/weapon/oddity/techno/Initialize()
	icon_state = "techno_part[rand(1,7)]"
	.=..()

/obj/item/weapon/oddity/common/photo_crime
	name = "crime scene photo"
	desc = "It is unclear whether this is a victim of suicide or murder. His face is frozen in a look of agony and terror, and you shudder to think at what his last moments might have been."
	icon_state = "photo_crime"
	oddity_stats = list(
		STAT_COG = 7,
		STAT_VIG = 7,
	)
	rarity_value = 23

/obj/item/weapon/oddity/common/book_unholy
	name = "unholy book"
	desc = "A tome of odd liturgies and rituals. The diagrams in this book don't make any sense. Circles enclose an impossibly detailed mosaic of chrome motifs smeared against the ancient pages."
	icon_state = "book_skull"
	oddity_stats = list(
		STAT_COG = 7,
		STAT_MEC = 7,
	)
	rarity_value = 24

/obj/item/weapon/oddity/common/disk
	name = "broken design disk"
	desc = "This disk is corrupted and completely unusable. It has a hand-drawn picture of some strange mechanism on it - looking at it for too long makes your head hurt."
	icon_state = "disc"
	oddity_stats = list(
		STAT_MEC = 9,
	)

/obj/item/weapon/oddity/common/mirror
	name = "cracked mirror"
	desc = "Luminescent streaks of color wander across this thousand-cracked speculum's surface as it's tilted, obscuring your look of scrutiny."
	icon_state = "mirror"
	oddity_stats = list(
		STAT_COG = 4,
		STAT_VIG = 4,
	)
	rarity_value = 8

/obj/item/weapon/oddity/common/lighter
	name = "rusted lighter"
	desc = "This zippo ligher has been rusted shut. It smells faintly of sulphur and blood."
	icon_state = "syndicate_lighter"
	oddity_stats = list(
		STAT_TGH = 9,
	)

/obj/item/weapon/oddity/common/device
	name = "odd device"
	desc = "Something about this gadget both disturbs and interests you. It's manufacturer's name has been mostly smudged away, but you can see a strange mechanism as their logo."
	icon_state = "device"
	oddity_stats = list(
		STAT_MEC = 8,
		STAT_COG = 8,
	)
	rarity_value = 19

/obj/item/weapon/oddity/artwork/get_item_cost(export)
	. = ..()
	GET_COMPONENT(comp_sanity, /datum/component/atom_sanity)
	. += comp_sanity.affect * 100
	GET_COMPONENT(comp_insp, /datum/component/inspiration)
	var/list/true_stats = comp_insp.calculate_statistics()
	for(var/stat in true_stats)
		. += true_stats[stat] * 50

//NT Oddities
/obj/item/weapon/oddity/nt
	bad_type = /obj/item/weapon/oddity/nt
	spawn_blacklisted = TRUE
	random_stats = FALSE

/obj/item/weapon/oddity/nt/seal
	name = "High Inquisitor's Seal"
	desc = "An honorary badge given to the most devout of NeoTheologian preachers by the High Inquisitor. Such a badge is a rare sight indeed - rumor has it that the badge imbues the holder with the power of the Angels themselves."
	icon_state = "nt_seal"
	oddity_stats = list(
		STAT_COG = 12,
		STAT_VIG = 12,
		STAT_ROB = 8
	)
	price_tag = 8000
	perk = /datum/perk/nt_oddity/holy_light
