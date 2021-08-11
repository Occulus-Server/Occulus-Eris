/obj/item/weapon/gun/energy/shrapnel/corsair/enforcer
	name = "CAT \"Enforcer\""
	desc = "A \"Catalyzer\" energy gun, The Enforcer uses a catalytic conversion system to turn energy into a hard, rubbery mass"
	icon = 'zzzz_modular_occulus/icons/obj/guns/energy/enforcer.dmi'
	icon_state = "enforcer"
	init_firemodes = list(
		list(mode_name="Single shot", mode_desc="Fires a pistol synth-shot", projectile_type=/obj/item/projectile/bullet/pistol/rubber, fire_delay=5, charge_cost=100, icon="stun"),
		list(mode_name="Spread shot", mode_desc="Fires a rubber synth-shot", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/rubber, fire_delay=10, charge_cost=500, icon="charge"),
		list(mode_name="Auto shot", projectile_type=/obj/item/projectile/bullet/pistol/rubber, mode_type = /datum/firemode/automatic, fire_delay=1.5  , charge_cost=125, icon="auto"),
	)

/obj/item/weapon/gun/energy/shrapnel/corsair/enforcer/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		init_firemodes = list(
			list(mode_name="Single shot", mode_desc="Fires a rubber synth-shot", projectile_type=/obj/item/projectile/bullet/pistol/rubber, fire_delay=5, charge_cost=100, icon="stun"),
			list(mode_name="Spread shot", mode_desc="Fires several rubber synth-shots", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/rubber, fire_delay=10, charge_cost=500, icon="charge"),
			list(mode_name="Auto shot", projectile_type=/obj/item/projectile/bullet/pistol/rubber, mode_type = /datum/firemode/automatic, fire_delay=1.5  , charge_cost=125, icon="auto"),
			list(mode_name="Auto spread", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/rubber, mode_type = /datum/firemode/automatic, fire_delay=6  , charge_cost=500, icon="auto"),
		)
		return 1
	else
		to_chat(user, SPAN_WARNING("It is already emagged!"))

