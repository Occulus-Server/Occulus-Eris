//A different type of "oddity" that basically only allows you to guide a level up to guarantee at least a specific stat.It only ever has one stat with strength 1 and never has a perk.
// TODO: figure out how to make it not display "This item has a [strength] aspect of [stat]" on examine.

/obj/item/weapon/oddity/instructional
	name = "Instructional pamphlet"
	desc = "An instructional pamphlet to feed your brain."
	icon = 'zzzz_modular_occulus/icons/obj/oddities.dmi'
	icon_state = "instructional_debug"
	item_state = "electronic"
	w_class = ITEM_SIZE_SMALL
	rarity_value = 6 //6 compared to common oddity 10.
	//spawn_tags = SPAWN_TAG_INSTRUCTIONAL //whoever wrote the spawner code needs to never touch a compiler again
	bad_type = /obj/item/weapon/oddity/instructional

	random_stats = FALSE //we want this false so that we can have six types to guarantee a level up of that type
	sanity_value = 0 //Not intended to actually boost your sanity
	prob_perk = 0 //we want this zero because these aren't oddities so they shouldn't have perks.

/obj/item/weapon/oddity/instructional/Initialize()
	if(oddity_stats)
		AddComponent(/datum/component/inspiration/instructional, oddity_stats)

/obj/item/weapon/oddity/instructional/common //Opening up the possibility of rarer stuff later on that provides a better bonus?
	spawn_blacklisted = TRUE


/obj/item/weapon/oddity/instructional/common/bio
	name = "Default bio instructional"
	desc = "The default item for bio instructionals."
	icon_state = "instructional_debug"
	oddity_stats = list(STAT_BIO = 1)

/obj/item/weapon/oddity/instructional/common/bio/pamphlet
	name = "Medical Instructional Pamphlet"
	desc = "An NT-branded medical pamphlet containing basic medical knowledge, for your basic medical needs."
	icon_state = "instructional_bio_pamphlet"

/obj/item/weapon/oddity/instructional/common/bio/primer
	name = "Al-Anzari's Basic Primer to Medicine, 45th Edition"
	desc = "Too thick to use in an emergency, but it might make a decent doorstop."
	icon_state = "instructional_bio"

/obj/item/weapon/oddity/instructional/common/bio/aid
	name = "First Aid and You"
	desc = "The primer any doctor wishes their patients carried."
	icon_state = "instructional_bio_aid"



/obj/item/weapon/oddity/instructional/common/cog
	name = "Default cog"
	desc = "The default item for cog instructionals."
	icon_state = "instructional_debug"
	oddity_stats = list(STAT_COG = 1)

/obj/item/weapon/oddity/instructional/common/cog/book
	name = "Theorems on Entrope and Rhinemann Manifolds in Non-Euclidian Space"
	desc = "An overly complicated textbook. Watching paint dry might be more interesting."
	icon_state = "instructional_cog_book"

/obj/item/weapon/oddity/instructional/common/cog/python
	name = "Aerospace Engineering, Avian Biology, and Applications of Bluespace"
	desc =	"A surprisingly in-depth study on the effects of bluespace on the airspeed velocty on unencumbered Swallows."
	icon_state = "instructional_cog_python"

/obj/item/weapon/oddity/instructional/common/cog/nt
	name = "NT's Workplace Scientific Primer"
	desc = "A primer on basic scientific practices for the average NT workplace."
	icon_state = "instructional_cog"



/obj/item/weapon/oddity/instructional/common/mec
	name = "Default mec instructional"
	desc = "The default item for mec instructionals."
	icon_state = "instructional_debug"
	oddity_stats = list(STAT_MEC = 1)

/obj/item/weapon/oddity/instructional/common/mec/pamphlet
	name = "Screwdriving Monthly"
	desc = "The date on this engineering-related periodical is unreadable. Volume 212: 'Chisels as Screwdrivers?'."
	icon_state = "instructional_mec_pamphlet"

/obj/item/weapon/oddity/instructional/common/mec/ees
	name = "EES Tinkering Guide: Vol III"
	desc = "The third volume of an annual EES publication containing general mechanical instruction."
	icon_state = "instructional_mec"

/obj/item/weapon/oddity/instructional/common/mec/tape
	name = "Percussive Maintenance: Duct Tape Edition"
	desc = "A volume of a popular engineering magazine describing more uses for the engineer's first and last solution to any problem."
	icon_state = "instructional_mec_tape"

/* /obj/item/weapon/oddity/instructional/common/mec
	name = "Autolathe User Manual"
	desc = "The user manual for the model of autolathes on the ship, assuming science hasn't messed with them yet."
	icon_state = NULL //commented out because we want equal numbers but I don't want to lose this idea -Sigma
	*/


/obj/item/weapon/oddity/instructional/common/rob
	name = "Default rob instructional"
	desc = "The default item for rob instructionals."
	icon_state = "instructional_debug"
	oddity_stats = list(STAT_ROB = 1)

/obj/item/weapon/oddity/instructional/common/rob/aegis
	name = "Aegis Hand-to-Hand Combat Manual"
	desc = "A hand-to-hand combat manual published by Aegis' training division."
	icon_state = "instructional_rob"

/obj/item/weapon/oddity/instructional/common/rob/vaggie
	name = "lern 2 pUnch bettar"
	desc = "A torn booklet with a lot of pictures. It smells like anger, toolboxes, and roach blood."
	icon_state = "instructional_rob_vaggie"

/obj/item/weapon/oddity/instructional/common/rob/paul
	name = "Paul Grizzly's Wilderness Survival Guide"
	desc = "This one appears to be the 'punching bears with a crowbar' edition."
	icon_state = "instructional_rob_paul"



/obj/item/weapon/oddity/instructional/common/tgh
	name = "Default tgh instructional"
	desc = "The default item for tgh instructionals."
	icon_state = "instructional_debug"
	oddity_stats = list(STAT_TGH = 1)

/obj/item/weapon/oddity/instructional/common/tgh/slip
	name = "Steadying Yourself"
	desc = "The forward says: 'Losing your footing in a fight means losing the fight.'"
	icon_state = "instructional_tgh"

/obj/item/weapon/oddity/instructional/common/tgh/soldier
	name = "Lt.Col. Richard May's Guide to Winning A Fight"
	desc = "PAIN IS WEAKNESS LEAVING THE BODY, MAGGOT! NOW ON AUDIOBOOK!"
	icon_state = "instructional_tgh_soldier"

/obj/item/weapon/oddity/instructional/common/tgh/book
	name = "Selective Feeling"
	desc = "Selectively ignoring pain can be beneficial, but be careful."
	icon_state = "instructional_tgh_book"



/obj/item/weapon/oddity/instructional/common/vig
	name = "Default vig instructional"
	desc = "The default item for vig instructionals."
	icon_state = "instructional_debug"
	oddity_stats = list(STAT_VIG = 1)
	// spawn_tags = SPAWN_TAG_INSTRUCTIONAL_VIG // SPAWNERS AREN'T WORKING WHO WROTE THEIR CODE I WILL STRANGLE

/obj/item/weapon/oddity/instructional/common/vig/ross
	name = "Happy Little Accidents"
	desc = "An artbook by an old painter. Every day's a good day when you paint."
	icon_state = "instructional_vig_ross"

/obj/item/weapon/oddity/instructional/common/vig/audio
	name = "Worn Music Player"
	desc = "An old, chipped music player with attached headset. It comes preloaded with rain, forest noises, and other soothing sounds."
	icon_state = "instructional_vig_audio"

/obj/item/weapon/oddity/instructional/common/vig/mek
	name = "Holding Fast: Body and Soul"
	desc = "Some lesser known Mekhane preacher somehow got this book on mental and physical health published."
	icon_state = "instructional_vig_mek"

/datum/component/inspiration/instructional

/datum/component/inspiration/instructional/ //making a new component so the examine text can be different.

/datum/component/inspiration/instructional/on_examine(mob/user) //new component's examine text
	var/primary_stat = stats[1]
	to_chat(user, SPAN_NOTICE("This is a guide on how to improve your [primary_stat]."))