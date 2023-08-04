/datum/category_item/setup_option/background/fate/artistic
	name = "Artistic"
	desc = "You're artistic! \
			You're all weird and quirky and stuff, but you have an uncanny amount of creativity and the ability to channel all that into something tangible. \
			You can make full use of the Artist Bench, but that becomes your only way to fufill your desires."

	perks = list(PERK_ARTIST)

/datum/category_item/setup_option/background/fate/gun_nut
	name = "Gun Nut"
	desc = "You love guns! You skilled in gun production. \
			However you are poor in close quarters as a result."
	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -10,
		STAT_VIG = 5
	)
	perks = list(PERK_GUNSMITH)

/datum/category_item/setup_option/background/fate/desensitized
	name = "Desensitized"
	desc = "You have seen the worst the galaxy has had to offer. You are largely unbothered by dirt, blood, and gore. \
	In dangerous situations you are difficult to shake or unsettle. \
	However the bizzare and strange has little allure for you, vastly reducing your insight."
	stat_modifiers = list(
		STAT_VIG = 5,
		STAT_COG = -10
	)
	perks = list(PERK_DESENSITIZED)