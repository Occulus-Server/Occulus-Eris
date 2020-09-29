/obj/item/weapon/gun/energy/plasma/brigador
	slot_flags = SLOT_BELT|SLOT_HOLSTER //Why does a double barrel shotgun fit in a holster but not this?
	one_hand_penalty = 0 // Some genius forgot to set this variable from the parent plasma rifle type, which sets it to 10.
	init_firemodes = list(
		list(mode_name="burn", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/Laser.ogg', icon="kill", fire_delay=8, charge_cost=15, projectile_color = "#00FFFF"),
		list(mode_name="stun", projectile_type=/obj/item/projectile/plasma/stun, fire_sound='sound/weapons/Taser.ogg', icon="stun", fire_delay=2,charge_cost=12.5, projectile_color = "#0000FF"),
	)