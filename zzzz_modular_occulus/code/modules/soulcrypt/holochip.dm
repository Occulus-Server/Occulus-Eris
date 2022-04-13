/obj/item/holochip
	matter = list(MATERIAL_GOLD = 1, MATERIAL_PLATINUM = 1)
//
// STAT BOOSTERS
//

/obj/item/holochip/security/combat
	name = "holochip - Aegis Combat Assist"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes reflex augmenting software."
	contained_modules = list(/datum/soulcrypt_module/statboost/aegiscombat)

/obj/item/holochip/security/tough
	name = "holochip - Aegis Survival Optimizer"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes survivability augmenting software."
	contained_modules = list(/datum/soulcrypt_module/statboost/aegissurvival)

/obj/item/holochip/medical/surgery
	name = "holochip - AnatomyPro"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes surgery-assisting software."
	contained_modules = list(/datum/soulcrypt_module/statboost/medical)

/obj/item/holochip/science/smart
	name = "holochip - Wolfram Analytica"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes cognition enhancing software."
	contained_modules = list(/datum/soulcrypt_module/statboost/science)

//
// PERK ADDERS
//

/obj/item/holochip/medical/celerity
	name = "holochip - Celerity v0.91b"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes movement augmenting software."
	contained_modules = list(/datum/soulcrypt_module/perkadder/celerity)

/obj/item/holochip/cargo/marketpro
	name = "holochip - Synergy ERP"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes ERP software."
	contained_modules = list(/datum/soulcrypt_module/perkadder/marketpro)

//
// NANOUI MODULES
//

/obj/item/holochip/security/warrant
	name = "holochip - Warrant Assistant"
	contained_modules = list(/datum/soulcrypt_module/warrant)

//
// SQUAWK MODULES
//

/obj/item/holochip/command/deathalarm
	name = "holochip - Death Alarm"
	contained_modules = list(/datum/soulcrypt_module/squawk/death_alarm)

/obj/item/holochip/command/helpmaint
	name = "holochip - Emergency Beacon"
	contained_modules = list(/datum/soulcrypt_module/squawk/help_maint)

//
// LANGUAGE MODULES
//

/obj/item/holochip/science/jive
	name = "holochip - Language: Jive"
	contained_modules = list(/datum/soulcrypt_module/language/jive)

/obj/item/holochip/science/sol
	name = "holochip - Language: Sol Common"
	contained_modules = list(/datum/soulcrypt_module/language/sol)

/obj/item/holochip/science/yiff
	name = "holochip - Language: Yueldisch"
	contained_modules = list(/datum/soulcrypt_module/language/yiff)

//
// MISC
//

/obj/item/holochip/security/painkiller
	name = "holochip - Painkiller"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes pain suppressing software."
	contained_modules = list(/datum/soulcrypt_module/painkiller)

//
// HONK
//

/obj/item/storage/box/holochip
	name = "box of assorted holochips"
	desc = "Contains trial versions of several soulcrypt sofwares."

/obj/item/storage/box/holochip/populate_contents()
	new /obj/item/holochip/command/helpmaint(src)
	new /obj/item/holochip/medical/celerity(src)
	new /obj/item/holochip/medical/surgery(src)
	new /obj/item/holochip/security/painkiller(src)
	new /obj/item/holochip/science/yiff(src)

/datum/supply_pack/randomised/holochips
	num_contained = 4
	contains = list(/obj/item/holochip/medical/celerity,
                /obj/item/holochip/science/sol,
                /obj/item/holochip/science/jive,
                /obj/item/holochip/command/helpmaint,
                /obj/item/holochip/science/yiff,
                /obj/item/holochip/command/deathalarm,
                /obj/item/holochip/science/smart,
                /obj/item/holochip/security/tough,
                /obj/item/holochip/security/combat,
                /obj/item/holochip/security/painkiller,
                /obj/item/holochip/medical/surgery,
                /obj/item/holochip/cargo/marketpro
                )
	name = "Assorted Holochips"
	cost = 3000
	crate_name = "Assorted Holochip Crate"
	containertype = /obj/structure/closet/crate
	group = "Medical / Science"

/datum/supply_pack/soulcrypt
	name = "Soulcrypts crate"
	contains = list(/obj/item/implant/core_implant/soulcrypt,
					/obj/item/implant/core_implant/soulcrypt,
					/obj/item/implant/core_implant/soulcrypt
					)
	cost = 20000
	containertype = /obj/structure/closet/crate/medical
	crate_name = "Soulcrypts crate"
	group = "Medical / Science"
