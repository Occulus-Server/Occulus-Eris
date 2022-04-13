/obj/item/tool/retractor
	tool_qualities = list(QUALITY_RETRACTING = 30, QUALITY_BOLT_TURNING = 5)

/obj/item/tool/bonesetter
	tool_qualities = list(QUALITY_BONE_SETTING = 30, QUALITY_BOLT_TURNING = 5)

/obj/item/tool/surgicaldrill
	tool_qualities = list(QUALITY_DRILLING = 30, QUALITY_SCREW_DRIVING = 5)

/obj/item/tool/hemostat
	tool_qualities = list(QUALITY_CLAMPING = 30, QUALITY_BOLT_TURNING = 5)

/obj/item/tool/scalpel
	max_health = 100

/obj/item/tool/scalpel/laser
	spawn_blacklisted = TRUE

/obj/item/tool/incisionmanager
	name = "incision management system"
	desc = "This advanced surgical tool greatly simplifies and speeds up most surgical procedures as well as providing a small heads-up display with helpful tips for novice and experienced practitioners alike"
	hitsound = WORKSOUND_DRIVER_TOOL
	worksound = WORKSOUND_PULSING
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTIC = 2, MATERIAL_GOLD = 1)
	flags = CONDUCT
	origin_tech = list(TECH_MATERIAL = 3, TECH_BIO = 4)
	tool_qualities = list(QUALITY_CLAMPING = 40, QUALITY_BONE_SETTING = 40, QUALITY_RETRACTING = 40, QUALITY_DRILLING = 40, QUALITY_BOLT_TURNING = 5, QUALITY_SCREW_DRIVING = 5)
	spawn_tags = SPAWN_TAG_SURGERY_TOOL
	max_upgrades = 2

	use_power_cost = 0.1
	suitable_cell = /obj/item/cell/small

	icon = 'zzzz_modular_occulus/icons/obj/_tools.dmi'
	icon_state = "ims_icon"
	item_icons = list(
		slot_l_hand_str = 'zzzz_modular_occulus/icons/obj/_tools.dmi',
		slot_r_hand_str = 'zzzz_modular_occulus/icons/obj/_tools.dmi'
		)
	item_state_slots = list(
		slot_l_hand_str = "ims_left",
		slot_r_hand_str = "ims_right"
		)
	spawn_blacklisted = TRUE
