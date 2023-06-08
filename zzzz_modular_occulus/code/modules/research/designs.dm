/datum/design/research/item/medical/augmentor
	name = "Self Augmentor"
	desc = "A self augmentation device allowing modules to be installed into one's self without surgery."
	build_path = /obj/item/augmentor/nt
	sort_string = "MBADF"

/datum/design/research/item/medical/e_armblade
	name = "Augmentor (Energy Blade)"
	desc = "A self augmentation device, this one holding an energetic armblade."
	build_path = /obj/item/augmentor/e_armblade
	sort_string = "MBADG"

/datum/design/research/item/medical/hurricane
	name = "Augmentor (Hurricane)"
	desc = "A self augmentation device, this one holding an Integrated .35 Auto PDW."
	build_path = /obj/item/augmentor/hurricane
	sort_string = "MBADH"

/datum/design/research/item/medical/typhoon
	name = "Augmentor (Typhoon)"
	desc = "A self augmentation device, this one holding an Integrated .40 Magnum Auto-Revolver."
	build_path = /obj/item/augmentor/typhoon
	sort_string = "MBADI"

/datum/design/research/item/medical/tornado
	name = "Augmentor (Tornado)"
	desc = "A self augmentation device, this one holding an Integrated .25 Caseless PDW."
	build_path = /obj/item/augmentor/tornado
	sort_string = "MBADJ"

/datum/design/research/item/holochip/suitsensors
	build_path = /obj/item/holochip/medical/suitsensors
	name = "Holochip, Suit Sensors"
	desc = "A one-use module containing software package for the suit sensors program"
	sort_string = "MFAAC"

/datum/design/research/item/holochip/surgery
	build_path = /obj/item/holochip/medical/surgery
	name = "Holochip, Anatomy Pro"
	desc = "A one-use module containing software package for surgical professionals"
	sort_string = "MFAAD"

/datum/design/research/item/holochip/smart
	build_path = /obj/item/holochip/science/smart
	name = "Holochip, Wolfram Analytica"
	desc = "A one-use module containing software package for data organization"
	sort_string = "MFAAE"

/datum/design/research/item/holochip/celerity
	build_path = /obj/item/holochip/medical/celerity
	name = "Holochip, Celerity"
	desc = "A one-use module containing software package for movement optimization"
	sort_string = "MFAAE"

/datum/design/research/item/holochip/alarm_mon
	build_path = /obj/item/holochip/engineering/alarm_mon
	name = "Holochip, Alarm Monitor"
	desc = "A one-use module containing software package for the alarm monitor program"
	sort_string = "MFAAG"

/datum/design/research/item/holochip/deathalarm
	build_path = /obj/item/holochip/command/deathalarm
	name = "Holochip, Death Alarm"
	desc = "A one-use module containing software package for the death alarm program"
	sort_string = "MFAAH"

/datum/design/research/item/holochip/helpmaint
	build_path = /obj/item/holochip/command/helpmaint
	name = "Holochip, Emergency Beacon"
	desc = "A one-use module containing software package for the emergency beacon program"
	sort_string = "MFAAI"

/datum/design/research/item/holochip/jive
	name = "holochip - Language: Jive"
	desc = "A one-use module containing a software package for Jive"
	build_path = /obj/item/holochip/science/jive
	sort_string = "MFAAJ"

/datum/design/research/item/holochip/sol
	name = "holochip - Language: Sol Common"
	desc = "A one-use module containing a software package for Solcom"
	build_path = /obj/item/holochip/science/sol
	sort_string = "MFAAK"

/datum/design/research/item/holochip/yiff
	name = "holochip - Language: Yueldisch"
	desc = "A one-use module containing a software package for Yueldisch"
	build_path = /obj/item/holochip/science/yiff
	sort_string = "MFAAL"


/datum/design/research/item/holochip/marketpro
	name = "holochip - Synergy ERP"
	desc = "A one-use module containing a software package for ERP software"
	build_path = /obj/item/holochip/cargo/marketpro
	sort_string = "MFAAM"

/datum/design/research/item/holochip/warrant
	name = "holochip - Warrant Assistant"
	desc = "A one-use module containing a software package for Warrant Assistant Software"
	build_path = /obj/item/holochip/security/warrant
	sort_string = "MFAAN"

/datum/design/research/item/holochip/combat
	name = "holochip - Aegis Combat Assist"
	desc = "A one-use module containing a software package for reflex augmentation"
	build_path = /obj/item/holochip/security/combat
	sort_string = "MFAAO"

/datum/design/research/item/holochip/tough
	name = "holochip - Aegis Survival Optimizer"
	desc = "A one-use module containing a software package for survival augmentation"
	build_path = /obj/item/holochip/security/tough
	sort_string = "MFAAP"

/datum/design/research/item/holochip/painkiller
	name = "holochip - Painkiller"
	desc = "A one-use module containing a painkilling software package"
	build_path = /obj/item/holochip/security/painkiller
	sort_string = "MFAAQ"

/datum/design/research/item/ims
	desc = "An advanced management system that greatly simplifies surgical procedures. It contains multiple attachments to perform more than one operation at a time."
	build_path = /obj/item/tool/incisionmanager
	category = "Medical"
	sort_string = "MBBZZ"

/datum/design/autolathe/tool/eweldertool
	name = "electric welding tool"
	build_path = /obj/item/tool/weldingtool/electric

/datum/design/autolathe/tool/circularsaw/advanced
	name = "advanced circular saw"
	build_path = /obj/item/tool/saw/circular/advanced

/datum/design/research/item/bastion
	name = "Prototype \"Bastion Shield\""
	desc = "An advanced shield, Able to be deployed to the ground along with casual carry."
	build_path = /obj/item/shield/riot/bastion
	category = "Combat"
	sort_string = "CSCAS"

// nanite weapons

/datum/design/research/item/weapon/whitenail // white nail
	name = "NT Prototype \"White Nail\""
	desc = "A state of the art prototype rifle that regenerates ammunition slowly over time using advanced nanite technology"
	build_path = /obj/item/gun/projectile/automatic/whitenail
	sort_string = "MGAAA"

/datum/design/research/item/weapon/whitenail/whitenailmag
	name = "White Nail Magazine"
	desc = "A bespoke container for ammunition for the White Nail prototype. Ammunition does not retain its shape for long outside of the rifle."
	build_path = /obj/item/ammo_magazine/whitenail
	sort_string = "MGAAB"

/datum/design/research/item/weapon/whitenail/whitenailmag/rubber
	name = "White Nail Rubber Magazine"
	desc = "A bespoke container for ammunition for the White Nail prototype. Ammunition does not retain its shape for long outside of the rifle. Generates less-lethal ammunition."
	build_path = /obj/item/ammo_magazine/whitenail/rubber
	sort_string = "MGAAC"

/datum/design/research/item/weapon/blacktalon // black talon
	name = "NT Prototype \"Black Talon\""
	desc = "A state of the art prototype handgun that regenerates ammunition slowly over time using advanced nanite technology"
	build_path = /obj/item/gun/projectile/automatic/whitenail/blacktalon
	sort_string = "MGABA"

/datum/design/research/item/weapon/blacktalon/blacktalonmag
	name = "Black Talon Magazine"
	desc = "A bespoke container for ammunition for the Black Talon prototype. Ammunition does not retain its shape for long outside of the rifle."
	build_path = /obj/item/ammo_magazine/blacktalon
	sort_string = "MGABB"

/datum/design/research/item/weapon/blacktalon/blacktalonmag/rubber
	name = "Black Talon Rubber Magazine"
	desc = "A bespoke container for ammunition for the White Nail prototype. Ammunition does not retain its shape for long outside of the rifle. Generates less-lethal ammunition."
	build_path = /obj/item/ammo_magazine/blacktalon/rubber
	sort_string = "MGABC"

/datum/design/research/item/weapon/greyclaw // grey claw
	name = "NT Prototype \"Grey Claw\""
	desc = "A state of the art prototype shotgun that regenerates ammunition slowly over time using advanced nanite technology"
	build_path = /obj/item/gun/projectile/automatic/whitenail/greyclaw
	sort_string = "MGACA"

/datum/design/research/item/weapon/greyclaw/greyclawmag
	name = "Grey Claw Magazine"
	desc = "A bespoke container for ammunition for the Grey Claw prototype. Ammunition does not retain its shape for long outside of the rifle."
	build_path = /obj/item/ammo_magazine/greyclaw
	sort_string = "MGACB"

/datum/design/research/item/weapon/greyclaw/greyclawmag/rubber
	name = "Grey Claw Rubber Magazine"
	desc = "A bespoke container for ammunition for the Grey Claw prototype. Ammunition does not retain its shape for long outside of the rifle. Generates less-lethal ammunition."
	build_path = /obj/item/ammo_magazine/greyclaw/rubber
	sort_string = "MGACC"

// Railguns

/datum/design/research/item/weapon/railgun
	name = "NT \"Reductor\" rail rifle"
	desc = "A prototype weapon capable of launching projectiles at high velocity."
	build_path = /obj/item/gun/energy/laser/railgun
	sort_string = "MGADA"

/datum/design/research/item/weapon/gauss
	name = "NT \"Helios\" gauss rifle"
	desc = "A prototype weapon that uses electro-magnetic fields to propel rods at hyper velocity."
	build_path = /obj/item/gun/energy/laser/railgun/gauss
	sort_string = "MGADB"