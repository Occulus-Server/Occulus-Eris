/obj/item/weapon/gun/energy/gun/glasgow
	name = "DSS PDW \"Glasgow\""
	desc = "The Glasgow is Deepflare Security Solution's shameless knockoff of the Martin. It is heavier, bulkier, more prone to deviation, burns through battery life, can't be easily concealed, and it has no indication when you're running out of charge...but it packs a hell of a punch. "
	icon = 'zzzz_modular_occulus/icons/obj/guns/energy/glasgow.dmi'
	icon_state = "DS_glasgow"
	item_state = "zzzz_modular_occulus/icons/obj/guns/energy/glasgow.dmi"
	charge_meter = FALSE
	w_class = ITEM_SIZE_NORMAL
	can_dual = 1
	charge_cost = 80
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 1)
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 4, MATERIAL_PLASTEEL = 2)
	price_tag = 600
	damage_multiplier = 1.4
	rarity_value = 8
	modifystate = null
	suitable_cell = /obj/item/weapon/cell/small
	cell_type = /obj/item/weapon/cell/small

/obj/item/weapon/gun/energy/gun/glasgow/proc/update_mode()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	if(current_mode.name == "stun")
		overlays += "stun_overlay"
	else
		overlays += "lethal_overlay"

/obj/item/weapon/gun/energy/gun/glasgow/update_icon()
	overlays.Cut()
	if(cell && cell.charge >= charge_cost) //no overlay if we dont have any power
		update_mode()