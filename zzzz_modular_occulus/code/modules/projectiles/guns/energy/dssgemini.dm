/obj/item/gun/energy/gun/gemini
	name = "DSS PDW E \"Gemini\""
	desc = "\"Darkflare Security System\" brand laser personal defense weapon. The twin-barrel design allows for more damage per trigger pull, at the cost of a weaker beam."
	icon = 'zzzz_modular_occulus/icons/obj/guns/energy/gemini.dmi'
	item_state = "zzzz_modular_occulus/icons/obj/guns/energy/gemini.dmi"
	icon_state = "DS_gemini"
	charge_meter = FALSE
	w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 4, MATERIAL_PLASTEEL = 2)
	damage_multiplier = 0.7
	rarity_value = 8
	init_firemodes = list(
		list(mode_name="stun", burst=2, projectile_type=/obj/item/projectile/beam/stun, modifystate="energystun", item_modifystate="stun", fire_sound='sound/weapons/Taser.ogg', icon="stun"),
		list(mode_name="kill", burst=2, projectile_type=/obj/item/projectile/beam, modifystate="energykill", item_modifystate="kill", fire_sound='sound/weapons/Laser.ogg', icon="kill"),
		)

/obj/item/gun/energy/gun/gemini/proc/update_mode()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	if(current_mode.name == "stun")
		overlays += "stun_overlay"
	else
		overlays += "lethal_overlay"

/obj/item/gun/energy/gun/gemini/update_icon()
	overlays.Cut()
	if(cell && cell.charge >= charge_cost) //no overlay if we dont have any power
		update_mode()