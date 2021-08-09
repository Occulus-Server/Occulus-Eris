/obj/item/weapon/tool
	max_health = 300

/obj/item/weapon/tool/pickaxe
	max_health = 500

/obj/item/weapon/tool/shovel
	max_health = 500

/obj/item/weapon/tool/omnitool
	desc = "A Fuel-powered monster of a tool. Its welder part is most advanced one, capable of welding things without harmfull glow and sparks, so no protection needed. The complexity of this tool means that regular maintainence is required."
	max_health = 200

/obj/item/weapon/tool/scalpel
	max_health = 100

/obj/item/weapon/tool/screwdriver/combi_driver
	use_power_cost = 0.54
	desc = "Drive screws, drive bolts, drill bones - you can do everything with it! But it drains power cells quickly."

/obj/item/weapon/tool/saw/circular //tier 3
	desc = "For heavy duty cutting. Drains power quickly."
	use_power_cost = 0.45

/obj/item/weapon/tool/saw/circular/advanced //tier 4, focusing on armor penetration
	desc = "You think you can cut anything with it. More power effecient than a regular circular saw."
	use_power_cost = 0.29

/obj/item/weapon/tool/multitool/advanced
	name = "advanced multitool"
	desc = "Used for pulsing wires to test which to cut. You can use this on airlocks, APCs or even lockers to try to hack them. This version is a bit more bulky and uses a medium cell."
	icon = 'zzzz_modular_occulus/icons/obj/tools.dmi'
	icon_state = "adv_multitool"
	tool_qualities = list(QUALITY_PULSING = 60) //double for needing luck
	matter = list(MATERIAL_PLASTIC = 6, MATERIAL_GLASS = 5, MATERIAL_GOLD = 1, MATERIAL_SILVER = 1)
	origin_tech = list(TECH_MAGNET = 5, TECH_ENGINEERING = 2)
	use_power_cost = 0.50 //Dosnt use much power but it is pulling form a medium - > large
	//workspeed = 1.2 - commited out do to 60plusing allowing for high speeds + upgrades
	max_upgrades = 4 //To keep in line with other advanced tools
	rarity_value = 24 //Base multy tool is 12, so twice as rare
	suitable_cell = /obj/item/weapon/cell/medium //We have a cell so we can take upgrades

/obj/item/weapon/tool/bonesetter/adv
	name = "clamp bone setter"
	desc = "An advanced bone clamping tool, allows for more precise settling of bones with less wrist force required."
	icon_state = "bone setter"
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_STEEL = 6, MATERIAL_GLASS = 3)
	tool_qualities = list(QUALITY_BONE_SETTING = 60)
	degradation = 0.75
	spawn_tags = SPAWN_TAG_SURGERY_TOOL

/obj/item/weapon/tool/cautery/adv
	name = "high powered electrocautery"
	desc = "An electrocautery with self-regulating heat transfer capabilities, allows for quicker and more precise cauterization of surgical incisions."
	matter = list(MATERIAL_STEEL = 12, MATERIAL_GLASS = 4)
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 2)
	tool_qualities = list(QUALITY_CAUTERIZING = 60)
	spawn_tags = SPAWN_TAG_SURGERY_TOOL

/obj/item/weapon/tool/hemostat/adv
	name = "precise hemostat"
	desc = "An advanced hemostat with better vein clamping strength and an adaptive tip tuned to also allow easier extraction of shrapnel, organs, and implants."
	matter = list(MATERIAL_STEEL = 6)
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 3)
	tool_qualities = list(QUALITY_CLAMPING = 60)
	spawn_tags = SPAWN_TAG_SURGERY_TOOL

/obj/item/weapon/tool/retractor/adv
	name = "extended retractor"
	desc = "Retracts surgical incisions with greater precision and speed than normal."
	matter = list(MATERIAL_STEEL = 8)
	tool_qualities = list(QUALITY_RETRACTING = 60)
	spawn_tags = SPAWN_TAG_SURGERY_TOOL
