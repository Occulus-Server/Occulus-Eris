//
// STAT BOOSTERS
//

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

//
// PERK ADDERS
//

/obj/item/weapon/holochip/medical/celerity
	name = "holochip - Celerity v0.91b"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes movement augmenting software."
	contained_modules = list(/datum/soulcrypt_module/perkadder/celerity)

/obj/item/weapon/holochip/cargo/marketpro
	name = "holochip - Synergy ERP"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes ERP software."
	contained_modules = list(/datum/soulcrypt_module/perkadder/marketpro)

//
// NANOUI MODULES
//

/obj/item/weapon/holochip/security/warrant
	name = "holochip - Warrant Assistant"
	contained_modules = list(/datum/soulcrypt_module/warrant)

//
// SQUAWK MODULES
//

/obj/item/weapon/holochip/command/deathalarm
	name = "holochip - Death Alarm"
	contained_modules = list(/datum/soulcrypt_module/squawk/death_alarm)

/obj/item/weapon/holochip/command/helpmaint
	name = "holochip - Emergency Beacon"
	contained_modules = list(/datum/soulcrypt_module/squawk/help_maint)

//
// LANGUAGE MODULES
//

/obj/item/weapon/holochip/science/jive
	name = "holochip - Language: Jive"
	contained_modules = list(/datum/soulcrypt_module/language/jive)

/obj/item/weapon/holochip/science/sol
	name = "holochip - Language: Sol Common"
	contained_modules = list(/datum/soulcrypt_module/language/sol)

/obj/item/weapon/holochip/science/yiff
	name = "holochip - Language: Yueldisch"
	contained_modules = list(/datum/soulcrypt_module/language/yiff)

//
// HONK
//

/obj/item/weapon/storage/box/holochip
	name = "box of assorted holochips"
	desc = "Contains trial versions of several soulcrypt sofwares."

/obj/item/weapon/storage/box/holochip/populate_contents()
	new /obj/item/weapon/holochip/command/helpmaint(src)
	new /obj/item/weapon/holochip/medical/celerity(src)
	new /obj/item/weapon/holochip/medical/surgery(src)
	new /obj/item/weapon/holochip/science/yiff(src)

/datum/supply_pack/randomised/holochips
	num_contained = 3
	contains = list(/obj/item/weapon/holochip/medical/celerity,
                /obj/item/weapon/holochip/science/sol,
                /obj/item/weapon/holochip/science/jive,
                /obj/item/weapon/holochip/command/helpmaint,
                /obj/item/weapon/holochip/science/yiff,
                /obj/item/weapon/holochip/command/deathalarm,
                /obj/item/weapon/holochip/science/smart,
                /obj/item/weapon/holochip/security/tough,
                /obj/item/weapon/holochip/security/combat
                )
	name = "Assorted Holochips"
	cost = 6000
	crate_name = "Assorted Holochip Crate"
	containertype = /obj/structure/closet/crate
	group = "Medical / Science"

/datum/supply_pack/soulcrypt
	name = "Soulcrypts crate"
	contains = list(/obj/item/weapon/implant/core_implant/soulcrypt,
					/obj/item/weapon/implant/core_implant/soulcrypt,
					/obj/item/weapon/implant/core_implant/soulcrypt
					)
	cost = 50000
	containertype = /obj/structure/closet/crate/medical
	crate_name = "Soulcrypts crate"
	group = "Medical / Science"
