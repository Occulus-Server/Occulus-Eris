/datum/job/clubworker
	wage = WAGE_LABOUR_DUMB //Club workers make less than professional wages and are expected to make up the difference in tips.
	access = list(access_bar, access_kitchen, access_maint_tunnels, access_theatre)
	also_known_languages = list(LANGUAGE_JIVE = 0)
	perks = list(PERK_CLUB, /datum/perk/oddity/empath)
	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 10
	)
	alt_titles = list("Actor", "Bartender", "Bouncer", "Chef", "Clown", "Cook", "Entertainer", "Mime", "Musician")

/datum/job/clubmanager
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/service/manager
	also_known_languages = list(LANGUAGE_JIVE = 0)
	perks = list(PERK_CLUB, /datum/perk/oddity/market_prof, /datum/perk/oddity/empath)
	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15
	)
	/* The manager is not command, but is responsible for ensuring that his workers,
	custodians, and botanists get paid
	*/

/* OCCULUS EDIT: Actor has been merged with Club Worker.
/datum/job/actor
	outfit_type = /decl/hierarchy/outfit/job/service/actor/actor
	stat_modifiers = list(
		STAT_TGH = 30,
		STAT_VIG = 10
	)
*/

/decl/hierarchy/outfit/job/service/actor/actor
	name = OUTFIT_JOB_NAME("Actor")
	uniform = /obj/item/clothing/under/waiter
	id_type = /obj/item/card/id/white
	pda_type = /obj/item/modular_computer/pda/club_worker
	backpack_contents = list(/obj/item/bananapeel = 1, /obj/item/storage/fancy/crayons = 1, /obj/item/toy/waterflower = 1, /obj/item/stamp/clown = 1, /obj/item/handcuffs/fake = 1)

/obj/item/modular_computer/pda/club_worker
	scanner_type = /obj/item/computer_hardware/scanner/reagent
