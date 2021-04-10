/obj/item/weapon/tool_upgrade/augment/folding
	name = "Collapsible tool kit"
	desc = "This small toolkit adjusts a tool so that it can be collapsed down to a smaller size. This reduces the lifespawn of the tool, but makes it take up less space."
	matter = list(MTERIAL_STEEL = 2, MATERIAL_PLASTIC = 2)
	icon = 'zzzz_modular_occulus/icons/obj/tool_upgrades.dmi'
	icon_state = "foldkit"
	price_tag = 120

/obj/item/weapon/tool_upgrade/augment/folding/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = 2,
	UPGRADE_BULK = -1
	)
	I.prefix = "collapsible"


/obj/item/weapon/tool_upgrade/augment/blade_addon
	name = "sharp edge"
	icon = 'zzzz_modular_occulus/icons/obj/tool_upgrades.dmi'
	icon_state = "edge"
	desc = "An attachment that fits on almost everything. It gives a simple sharp edge on the tool."
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_STEEL = 2)
	rarity_value = 20


/obj/item/weapon/tool_upgrade/augment/blade_addon/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_QUALITIES = list(QUALITY_CUTTING = 10, QUALITY_WIRE_CUTTING = 5)
	)
	I.prefix = "edged"
	I.negative_qualities = list(QUALITY_CUTTING, QUALITY_WIRE_CUTTING)

/obj/item/weapon/tool_upgrade/augment/wrench_addon
	name = "bolt gripper"
	icon = 'zzzz_modular_occulus/icons/obj/tool_upgrades.dmi'
	icon_state = "wrenching"
	desc = "An attachment that fits on almost everything. It adds a gripping components for bolts."
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_STEEL = 2)
	rarity_value = 20


/obj/item/weapon/tool_upgrade/augment/wrench_addon/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_QUALITIES = list(QUALITY_BOLT_TURNING = 10)
	)
	I.prefix = "wrenching"
	I.negative_qualities = list(QUALITY_BOLT_TURNING)

/obj/item/weapon/tool_upgrade/augment/multitool_addon
	name = "multitool attachment"
	icon = 'zzzz_modular_occulus/icons/obj/tool_upgrades.dmi'
	icon_state = "pulsing"
	desc = "An attachment that fits on almost everything. It adds simple mulitool to the device."
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_STEEL = 2)
	rarity_value = 20


/obj/item/weapon/tool_upgrade/augment/multitool_addon/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_QUALITIES = list(QUALITY_PULSING = 5)
	)
	I.prefix = "technical"
	I.negative_qualities = list(QUALITY_PULSING)

/obj/item/weapon/tool_upgrade/augment/prying_addon
	name = "prying head"
	icon = 'zzzz_modular_occulus/icons/obj/tool_upgrades.dmi'
	icon_state = "prying"
	desc = "An attachment for any tool with a long shaft. It adds a wedged head shaped for prying."
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_STEEL = 2)
	rarity_value = 20


/obj/item/weapon/tool_upgrade/augment/prying_addon/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_QUALITIES = list(QUALITY_PRYING = 10)
	)
	I.prefix = "wedging"
	I.required_qualities = list(QUALITY_BOLT_TURNING,QUALITY_HAMMERING,QUALITY_SHOVELING,QUALITY_DIGGING, QUALITY_EXCAVATION)
	I.negative_qualities = list(QUALITY_PRYING)

/obj/item/weapon/tool_upgrade/augment/screw_addon
	name = "screwdriver attachment"
	icon = 'zzzz_modular_occulus/icons/obj/tool_upgrades.dmi'
	icon_state = "screwdriver"
	desc = "An attachment that fits on almost everything. This adds a small screwdriver to any tool."
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_STEEL = 2)
	rarity_value = 20


/obj/item/weapon/tool_upgrade/augment/screw_addon/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_QUALITIES = list(QUALITY_SCREW_DRIVING = 5)
	)
	I.prefix = "screwdriving"
	I.negative_qualities = list(QUALITY_SCREW_DRIVING)

/obj/item/weapon/tool_upgrade/augment/digging_addon
	name = "adaz head"
	icon = 'zzzz_modular_occulus/icons/obj/tool_upgrades.dmi'
	icon_state = "digging"
	desc = "An adaz head. This attaches to any long tool to make it suitable for digging."
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_STEEL = 2)
	rarity_value = 20


/obj/item/weapon/tool_upgrade/augment/digging_addon/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_QUALITIES = list(QUALITY_DIGGING = 10, QUALITY_SHOVELING = 10, QUALITY_EXCAVATION = 5)
	)
	I.prefix = "digging"
	I.required_qualities = list(QUALITY_BOLT_TURNING,QUALITY_PRYING,QUALITY_HAMMERING)
	I.negative_qualities = list(QUALITY_DIGGING, QUALITY_SHOVELING, QUALITY_EXCAVATION)

