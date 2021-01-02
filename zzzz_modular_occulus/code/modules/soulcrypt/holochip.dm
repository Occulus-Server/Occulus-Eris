// STAT BOOSTERS

/obj/item/weapon/holochip/security/combat
	name = "holochip - Aegis Combat Assist"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes reflex augmenting software."
	contained_modules = list(/datum/soulcrypt_module/statboost/aegiscombat)

/obj/item/weapon/holochip/security/tough
	name = "holochip - Aegis Survival Optimizer"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes survivability augmenting software."
	contained_modules = list(/datum/soulcrypt_module/statboost/aegissurvival)

/obj/item/weapon/holochip/medical/surgery
	name = "holochip - AnatomyPro"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes surgery-assisting software."
	contained_modules = list(/datum/soulcrypt_module/statboost/medical)

/obj/item/weapon/holochip/science/smart
	name = "holochip - Wolfram Analytica"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes cognition enhancing software."
	contained_modules = list(/datum/soulcrypt_module/statboost/science)

// PERK ADDERS

/obj/item/weapon/holochip/medical/celerity
	name = "holochip - Celerity v0.91b"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes movement augmenting software."
	contained_modules = list(/datum/soulcrypt_module/perkadder/celerity)

/obj/item/weapon/holochip/cargo/marketpro
	name = "holochip - Synergy ERP"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes ERP software."
	contained_modules = list(/datum/soulcrypt_module/perkadder/marketpro)
