//Extreme nerf to backgrounds. No net bonus

/datum/category_item/setup_option/background/origin/oberth
	desc = "You're a soldier by trade, whether with a PMC or actual government. Close-quarters combat isn't unfamiliar to you, but you're more used to having your hands around a rifle. \
			Even if that rifle is more of a shotgun."
	stat_modifiers = list(
		STAT_BIO = -2,
		STAT_COG = -2,
		STAT_MEC = -2,
		STAT_VIG = 5
	)


/datum/category_item/setup_option/background/origin/predstraza
	name = "Thug"
	desc = "You're an unsavory sort, aren't you? \
			Maybe you're a criminal, maybe you just got into a lot of fights. Either way, you know how to swing your weight around and how to not get caught off-guard. \
			...All those blows to your head may have knocked a few things loose, though..."
	stat_modifiers = list(
		STAT_BIO = -2,
		STAT_COG = -4,
		STAT_MEC = -1,
		STAT_ROB = 5


	)

/datum/category_item/setup_option/background/origin/crozet
	name = "Colonist"
	desc = "You're used to working a planet-side job, whether it's ranching, ship repairs, or good ol' ore-extraction. This fancy-shmancy spaceship stuff's a far cry from what you're used to, but it pays good."
	stat_modifiers = list(
		STAT_TGH = 5,
		STAT_MEC = -1,
		STAT_VIG = -2,
		STAT_COG = -4
	)

/datum/category_item/setup_option/background/origin/shimatengoku
	name = "Academic"
	desc = "You're more familiar with studying and practicing your trade than with how to kill a roach the size of a horse.\
			As a compensation, you're at least probably earning more than your peers...probably. \
			More specialized for work planet-side than on a ship barely held together by tape and prayer, you'll have to be extra-cautious to avoid unfortunate accidents..."
	stat_modifiers = list(
		STAT_ROB = -2,
		STAT_TGH = -2,
		STAT_BIO = 2,
		STAT_MEC = 2,
		STAT_VIG = -1,
		STAT_COG = 2
	)

/datum/category_item/setup_option/background/origin/end_point
	name = "Greasemonkey"
	desc = "To put it bluntly, you're good with machines. Real good. Maybe you specialize in engines, or electrician work, but you know your way around a workshop."
	stat_modifiers = list(
		STAT_BIO = -5,
		STAT_MEC = 5
	)

/datum/category_item/setup_option/background/origin/new_rome
	name = "Assistant"
	desc = "You've generally spent the majority of your life as the second note to more important people. \
			In your time, you've caught a few tricks. Jack-of-all-trades, master of none."
	stat_modifiers = list(
		STAT_ROB = 1,
		STAT_TGH = 1,
		STAT_BIO = 1,
		STAT_MEC = 1,
		STAT_VIG = -4,
		STAT_COG = -2
	)


/datum/category_item/setup_option/background/origin/hmss_destined
	name = "Crewman"
	desc = "You're not unfamiliar with working on spaceships. Maybe you've been working for NanoTrasen for some time, or maybe you used to be part of some navy.\
			 Either way, you know the general ins-and-outs of working on a ship."
	stat_modifiers = list(
		STAT_ROB = 1,
		STAT_TGH = 1,
		STAT_BIO = -2,
		STAT_MEC = 2,
		STAT_COG = -4
	)


/datum/category_item/setup_option/background/origin/first_expeditionary_fleet
	name = "Activist"
	desc = "You have a strong set of beliefs, and stick to them. You're not afraid to clash with authority when push comes to shove. \
			Maybe you're even on the CEV Northern Light because you're running from the law. Either way, you're still carrying out your campaign for justice."

	stat_modifiers = list(
		STAT_COG = 4,
		STAT_ROB = 1,
		STAT_BIO = 1,
		STAT_MEC = -3,
		STAT_BIO = -2,
		STAT_VIG = 1
	)

/datum/category_item/setup_option/background/origin/nss_forecaster
	name = "Nomad"
	desc = "You used to roam the stars. Maybe you still do. Why would you miss your home when your home is all around you? There's so much to see, and you are ready for all of it! \
			Your lack of settling down means that you don't have intimate knowledge of any particular subject, but you've always been able to get around that with your general knowledge and wit.\
			So far, at least."
	stat_modifiers = list(
		STAT_BIO = -2,
		STAT_COG = -4,
		STAT_MEC = 2,
		STAT_VIG = 2
	)

/datum/category_item/setup_option/background/origin/sich_prime
	desc = "Miscreant. You're used to having to do what it takes to survive. Pulling out bullets, picking pockets, and  picking locks... it's all the same to you with your nimble fingers."
	stat_modifiers = list(
		STAT_ROB = -2,
		STAT_TGH = -3,
		STAT_BIO = 3,
		STAT_MEC = 2
	)

/datum/category_item/setup_option/background/origin/medic
	name = "Medic"
	desc = "Be it by choice or cosmic design, most of your life has been spent tending to living things: plants, animals, or people. You have a strong understanding of what makes us all tick."
	stat_modifiers = list(
		STAT_MEC = -5,
		STAT_BIO = 5
	)
/*
/datum/category_item/setup_option/background/origin/medic
	name = "Medic"
	desc = "Be it by choice or cosmic design, most of your life has been spent tending to living things: plants, animals, or people. You have a strong understanding of what makes us all tick."
	stat_modifiers = list(
		STAT_MEC -5,
		STAT_BIO = 5
	)
*/
