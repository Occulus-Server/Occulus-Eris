/obj/item/weapon/gun/energy/plasma/brigador/update_icon()
	overlays.Cut()
	..()
	if(cell)
		if(istype(cell, /obj/item/weapon/cell/small/excelsior))
			overlays += image(icon, "cell_excelsior")
			return TRUE
		if(istype(cell, /obj/item/weapon/cell/small/moebius/nuclear) || istype(cell, /obj/item/weapon/cell/small/moebius/pda))
			overlays += image(icon, "cell_nuclear")
			return TRUE
		if(istype(cell, /obj/item/weapon/cell/small/moebius/hyper) || istype(cell, /obj/item/weapon/cell/small/hyper))
			overlays += image(icon, "cell_hyper")
			return TRUE
		if(istype(cell, /obj/item/weapon/cell/small/moebius/super) || istype(cell, /obj/item/weapon/cell/small/super))
			overlays += image(icon, "cell_super")
			return TRUE
		if(istype(cell, /obj/item/weapon/cell/small/moebius/high) || istype(cell, /obj/item/weapon/cell/small/high))
			overlays += image(icon, "cell_moebius")
			return TRUE
		overlays += image(icon, "cell_guild")
		return TRUE

/obj/item/weapon/gun/energy/nt_svalinn
	name = "MEK PP \"Svalinn\""
	desc = "\"Mekhane\" brand plasma pistol. Small and easily concealable, it only can fire low-impact stun blasts. Ideal for personal defense."
	fire_sound='sound/weapons/Taser.ogg'
	projectile_type = /obj/item/projectile/plasma/light
	projectile_color = "#00FFFF"
	charge_cost = 15
	init_firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/plasma/stun, fire_sound='sound/weapons/Taser.ogg', icon="stun", fire_delay=2,charge_cost=12.5, projectile_color = "#0000FF"),
	)


/obj/item/weapon/gun/energy/plasma/brigador
	name = "Frozen Star PP \"Brigador\""
	desc = "\"Frozen Star\" brand energy pistol, for personal overprotection without the bulk of the Cassad."
	icon = 'icons/obj/guns/energy/brigador.dmi'
	icon_state = "brigador"
	charge_meter = FALSE
	w_class = ITEM_SIZE_NORMAL
	twohanded = FALSE
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	projectile_color = "#00FFFF"
	charge_cost = 15
	one_hand_penalty = 0
	fire_delay = 8

	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 8, MATERIAL_PHORON = 2, MATERIAL_SILVER = 3, MATERIAL_URANIUM = 3)

	init_firemodes = list(
		list(mode_name="burn", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/Laser.ogg', icon="kill", fire_delay=8, charge_cost=15, projectile_color = "#00FFFF"),
		list(mode_name="stun", projectile_type=/obj/item/projectile/plasma/stun, fire_sound='sound/weapons/Taser.ogg', icon="stun", fire_delay=2,charge_cost=12.5, projectile_color = "#0000FF"),
	)
