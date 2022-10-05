/*
AUTOLATHE DATUMS
*/

//STUFF ADDED IN THE CHURCH EQUIPMENT PORT
/datum/design/autolathe/sword/nt_sword/name = "Mekhane Shortsword"
/datum/design/autolathe/sword/nt_longsword/name = "Mekhane Longsword"
/datum/design/autolathe/sword/nt_dagger/name = "Mekhane Dagger"
/datum/design/autolathe/sword/nt_halberd/name = "Mekhane Halberd"
/datum/design/autolathe/sword/nt_scourge/name = "Mekhane Scourge"
/datum/design/autolathe/shield/nt_shield/name = "Mekhane Shield"
/datum/design/autolathe/grenade/nt_explosive/name = "MEK OBG \"Nova\""
/datum/design/autolathe/grenade/nt_flashbang/name = "MEK FBG \"Pulsar\""
/datum/design/autolathe/grenade/nt_frag/name = "MEK DFG \"Flare\""
/datum/design/autolathe/grenade/nt_smokebomb/name = "MEK SG \"Nebula\""

// CLOTHING
/datum/design/bioprinter/nt_clothes/acolyte_armor/name = "MEK Acolyte Armor"
/datum/design/bioprinter/nt_clothes/agrolyte_armor/name = "MEK Agrolyte Armor"
/datum/design/bioprinter/nt_clothes/custodian_armor/name = "MEK Custodian Armor"
/datum/design/bioprinter/nt_clothes/preacher_coat/name = "MEK Preacher Longcoat"
/datum/design/bioprinter/nt_clothes/acolyte_jacket/name = "MEK Acolyte Jacket"
/datum/design/bioprinter/nt_clothes/sports_jacket/name = "MEK Sports Jacket"
/datum/design/bioprinter/nt_clothes/acolyte_uniform/name = "MEK Acolyte Garment"
/datum/design/bioprinter/nt_clothes/sports_uniform/name = "MEK Sport Clothes"
/datum/design/bioprinter/nt_clothes/church_uniform/name = "MEK Church Garment"
/datum/design/bioprinter/belt/utility/neotheology/name = "Mekhanite utility belt"
/datum/design/bioprinter/belt/security/neotheology/name = "Mekhanite tactical belt"

// UTILITIES
/datum/design/autolathe/device/grenade/nt_cleaner/name = "MEK \"Cleansing Tide\" Pod"
/datum/design/autolathe/device/grenade/nt_weedkiller/name = "MEK \"Kudzu Killer\" Pod"
/datum/design/autolathe/device/headset_church/name = "Mekhane Radio Encryption Key"

// OTHER STUFF
/datum/design/autolathe/firstaid/nt/name = "Mekhanite Medkit"

/*
THIS IS WHERE THE ACTUAL TWEAKING OF STUFF GOES
*/

//WEAPONS

/* DAMAGE VALUES FOR REFERENCE
WEAPON_FORCE_PAINFUL		15
WEAPON_FORCE_DANGEROUS		20
WEAPON_FORCE_ROBUST			26
WEAPON_FORCE_BRUTAL			33
WEAPON_FORCE_LETHAL			40

ARMOR_PEN_GRAZING			5
ARMOR_PEN_SHALLOW			10
ARMOR_PEN_MODERATE			15
ARMOR_PEN_DEEP				20
ARMOR_PEN_EXTREME			25
ARMOR_PEN_MASSIVE			30
*/

// A lot of the church weapons seem very focused on ignoring armor and fighting against other people. We really shouldn't be expecting that to happen here.
/obj/item/gun/matter/launcher/nt_sprayer
	name = "MEK BCR \"Street Sprayer\""
	desc = "\"Mekhane\" brand cleansing carbine. Uses solid biomass as ammo and dispense cleansing liquid on hit."

/obj/item/tool/sword/nt
	name = "Mekhane Shortsword"
	force = WEAPON_FORCE_ROBUST	// Buffed one notch up
	armor_penetration = ARMOR_PEN_GRAZING	// Nerfed down two notches
	w_class = ITEM_SIZE_NORMAL // These specifically fit on toolbelts

/obj/item/tool/sword/nt/longsword
	name = "Mekhane Longsword"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MODERATE	// Nerfed down two notches

/obj/item/tool/knife/dagger/nt	// This is relatively in line with all the other daggers.
	name = "Mekhane Dagger"
	force = WEAPON_FORCE_PAINFUL
	armor_penetration = ARMOR_PEN_EXTREME	// Nerfed down a notch

/obj/item/tool/sword/nt/halberd
	name = "Mekhane Halberd"
	force = WEAPON_FORCE_LETHAL	// Buffed two notches up, now it's stronger than the fire axe
	armor_penetration = ARMOR_PEN_DEEP	// Nerfed down two notches

/obj/item/tool/sword/nt/scourge	// This is absolutely an armor shredding specialist, so its kinda fine as is. REMAINS UNTOUCHED.
	name = "Mekhane Scourge"
	force = WEAPON_FORCE_PAINFUL
	force_extended = WEAPON_FORCE_DANGEROUS
	armor_penetration = ARMOR_PEN_DEEP
	armor_penetration_extended = ARMOR_PEN_HALF

/obj/item/shield/riot/nt
	name = "Mekhane Shield"


// GRENADES
/obj/item/grenade/explosive/nt/name = "MEK OBG \"Nova\""
/obj/item/grenade/flashbang/nt/name = "MEK FBG \"Pulsar\""
/obj/item/grenade/smokebomb/nt/name = "MEK SG \"Nebula\""
/obj/item/grenade/frag/nt/name = "MEK DFG \"Flare\""

// HEALING ITEMS

/obj/item/stack/medical/advanced/bruise_pack/nt
	name = "Mekhanite Bruisepack"
	singular_name = "Mekhanite Bruisepack"
	desc = "An advanced bruisepack for severe injuries."

/obj/item/stack/medical/advanced/ointment/nt
	name = "Mekhanite Burnpack"
	singular_name = "Mekhanite Burnpack"
	desc = "An advanced treatment kit for severe burns."

/obj/item/tool/hammer/mek
	name = "Mekhane Electro-Mace"
	desc = "The pinnacle of Mekhane's might, this thunderous weapon is amped up when the user is wielding it securely. Takes medium size cells. Its electrifying effects are affected by modifications."
	icon = 'zzzz_modular_occulus/icons/obj/mek_melee.dmi'
	icon_state = "electromace"
	force = WEAPON_FORCE_ROBUST // gets 10 more agony damage when wielded, plus whatever wielding bonus it receives
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	armor_penetration = ARMOR_PEN_EXTREME
	aspects = list(SANCTIFIED)
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	tool_qualities = list(QUALITY_HAMMERING = 30)
	matter = list(MATERIAL_BIOMATTER = 75, MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 5)
	degradation = 0.7
	suitable_cell = /obj/item/cell/medium
	use_power_cost = 2
	item_icons = list(
		slot_l_hand_str = 'zzzz_modular_occulus/icons/obj/mek_melee.dmi',
		slot_r_hand_str = 'zzzz_modular_occulus/icons/obj/mek_melee.dmi',
		slot_back_str = 'zzzz_modular_occulus/icons/obj/mek_melee.dmi'
		)
	item_state_slots = list(
		slot_l_hand_str = "left",
		slot_r_hand_str = "right",
		slot_back_str = "backnew"
		)

/obj/item/tool/hammer/mek/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone) //crappy copypasta of baton code
	var/battery_consumption = use_power_cost * 25
	var/modified_shocky_damage = force / 2.6

	if(wielded && cell)
		if(cell.checked_use(battery_consumption))
			target.stun_effect_act(0, modified_shocky_damage, hit_zone, src)	//magic numbers, 0 duration stun, 10 agony damage which is a quarter of a baton's
			playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
	. = ..()

/obj/item/tool/hammer/mek/update_icon()
	..()
	var/battery_consumption = use_power_cost * 25
	if(!cell)
		icon_state = "nobattery"
	else if(wielded && cell.checked_use(battery_consumption))
		icon_state = "electromace_on"
	else
		icon_state = "electromace"

/obj/item/tool/hammer/mek/update_wield_icon() // Janky snowflake override to remain modular
	var/battery_consumption = use_power_cost * 25
	if(wielded && cell)
		if(cell.checked_use(battery_consumption))
			item_state_slots = list(
				slot_l_hand_str = "doblelefton",
				slot_r_hand_str = "doblerighton",
				slot_back_str = "backnew"
				)
	else
		item_state_slots = list(
			slot_l_hand_str = "dobleleft",
			slot_r_hand_str = "dobleright",
			slot_back_str = "backnew"
			)

/obj/item/tool/hammer/mek/update_unwield_icon()
	if(!wielded)
		item_state_slots = list(
			slot_l_hand_str = "left",
			slot_r_hand_str = "right",
			slot_back_str = "backnew"
			)

/datum/design/autolathe/sword/mek_hammer
	name = "Mekhane Electro-Mace"
	build_path = /obj/item/tool/hammer/mek


/obj/item/computer_hardware/hard_drive/portable/design/nt/hammer
	disk_name = "Mekhane Armory - Mekhane Electro-Mace"
	icon_state = "neotheology"
	designs = list(
		/datum/design/autolathe/sword/mek_hammer,
		/datum/design/autolathe/tool_upgrade/sanctifier
	)

/datum/design/bioprinter/cahor
	build_path = /obj/item/reagent_containers/food/drinks/bottle/ntcahors
	materials = list(MATERIAL_BIOMATTER = 10, MATERIAL_GLASS = 1)


/datum/design/bioprinter/nt_clothes/NTvoid
	name = "Mekhane voidsuit"

/*
CHURCH DISKS
*/

/obj/item/computer_hardware/hard_drive/portable/design/nt
	disk_name = "Mekhane Armory - Blank"

/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter_public
	disk_name = "Mekhane Bioprinter Pack"

/obj/item/computer_hardware/hard_drive/portable/design/nt/melee
	disk_name = "Mekhane Armory - Basic Melee Weapons"

/obj/item/computer_hardware/hard_drive/portable/design/nt/longsword
	disk_name = "Mekhane Armory - Mekhane Longsword"

/obj/item/computer_hardware/hard_drive/portable/design/nt/scourge
	disk_name = "Mekhane Armory - Mekhane Scourge"

/obj/item/computer_hardware/hard_drive/portable/design/nt/halberd
	disk_name = "Mekhane Armory - Mekhane Halberd"

/obj/item/computer_hardware/hard_drive/portable/design/nt/shield
	disk_name = "Mekhane Armory - Mekhane Shield"

/obj/item/computer_hardware/hard_drive/portable/design/nt/firstaid
	disk_name = "Mekhane Armory - Advanced Medkit"

/obj/item/computer_hardware/hard_drive/portable/design/nt/grenades
	disk_name = "Mekhane Armory - Grenades Pack"

/obj/item/computer_hardware/hard_drive/portable/design/nt/crusader
	disk_name = "Mekhane Armory - Crusader Armor"

/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter_clothes
	disk_name = "Mekhane Bio-Fabric Designs"

/obj/item/computer_hardware/hard_drive/portable/design/nt/excruciator
	disk_name = "Mekhane Armory - MEK Energy Weapons"
	designs = list(
		/datum/design/autolathe/excruciator,
		/datum/design/autolathe/diffuser,
		/datum/design/autolathe/gun/nt_svalinn
	)

/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter
	disk_name = "Mekhanite Bioprinter Products and Utilities"
	designs = list(
		/datum/design/bioprinter/cahor,
		/datum/design/bioprinter/meat,
		/datum/design/bioprinter/milk,
		/datum/design/bioprinter/soap,

		/datum/design/bioprinter/ez,
		/datum/design/bioprinter/l4z,
		/datum/design/bioprinter/rh,

		/datum/design/bioprinter/medical/bruise,
		/datum/design/bioprinter/medical/splints,
		/datum/design/bioprinter/medical/ointment,
		/datum/design/bioprinter/medical/advanced/bruise,
		/datum/design/bioprinter/medical/advanced/ointment,

		/datum/design/autolathe/gun/nt_sprayer,
		/datum/design/autolathe/device/grenade/nt_cleaner,
		/datum/design/autolathe/device/grenade/nt_weedkiller,

		/datum/design/bioprinter/holyvacuum

	)

/obj/item/computer_hardware/hard_drive/portable/design/carpets
	disk_name = "Mekhanite Bio-Fabric Flooring"
	icon_state = "neotheology"
	license = -1
	spawn_blacklisted = TRUE
	designs = list(
		/datum/design/bioprinter/carpet,
		/datum/design/bioprinter/carpet/bcarpet,
		/datum/design/bioprinter/carpet/blucarpet,
		/datum/design/bioprinter/carpet/gaycarpet,
		/datum/design/bioprinter/carpet/oracarpet,
		/datum/design/bioprinter/carpet/purcarpet,
		/datum/design/bioprinter/carpet/sblucarpet,
		/datum/design/bioprinter/carpet/turcarpet
	)


/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_dominion
	disk_name = "Mekhane Armory - MEK PL \"Dominion\""
	rarity_value = 75

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_purger
	disk_name = "Mekhane Armory - MEK PL \"Purger\""
	rarity_value = 75

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_nemesis
	disk_name = "EC01 - Nemesis"
	rarity_value = 90

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_themis
	disk_name = "EC02 - Themis"
	rarity_value = 90

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_svalinn
	disk_name = "Mekhane Armory - MEK LP \"Svalinn\""

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_protector
	disk_name = "GL01 - Protector Grenade Launcher"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_heavysniper
	disk_name = "60 Penetrator AMR"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_mk58
	disk_name = "MK58 Handgun Pack"

/obj/item/computer_hardware/hard_drive/portable/design/nt/cruciform_upgrade
	disk_name = "Mekhane Armory - Cruciform Upgrades"

/obj/item/computer_hardware/hard_drive/portable/design/nt_boards
	disk_name = "Mekhane Circuit Pack"
	designs = list(
		/datum/design/autolathe/circuit/bioprinter,
		/datum/design/autolathe/circuit/solidifier,
		/datum/design/autolathe/circuit/biogen,
		/datum/design/autolathe/circuit/biogen_console,
		/datum/design/autolathe/circuit/biogen_port,
		/datum/design/autolathe/circuit/bioreactor_loader,
		/datum/design/autolathe/circuit/bioreactor_metrics,
		/datum/design/autolathe/circuit/bioreactor_port,
		/datum/design/autolathe/circuit/bioreactor_biotank,
		/datum/design/autolathe/circuit/bioreactor_unloader,
		/datum/design/autolathe/circuit/bioreactor_platform
	)

/*
* Voidsuit overrides
*/

/obj/item/clothing/head/space/void/NTvoid
	name = "MEK combat voidsuit helmet"
	desc = "A voidsuit helmet commonly used by the Mekhane. Combat rated. When worn you can hear soft breathing in your ear."
	armor = list(
		melee = 45,
		bullet = 30,
		energy = 35,
		bomb = 100,
		bio = 200,
		rad = 50
	)

/obj/item/clothing/suit/space/void/NTvoid
	name = "MEK combat voidsuit"
	desc = "A voidsuit commonly used by the Mekhane. Combat rated. When worn a faint heartbeat can be felt within the suit."
	armor = list(
		melee = 45,
		bullet = 30,
		energy = 35,
		bomb = 100,
		bio = 200,
		rad = 50
	)

/*
* Mods
*/

/obj/item/gun_upgrade/barrel/excruciator
	name = "Mekhane \"EXCRUCIATOR\" giga lens"