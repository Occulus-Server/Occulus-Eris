/obj/item/weapon/gun/energy/shrapnel/corsair/enforcer
	name = "CAT \"Enforcer\""
	desc = "A \"Catalyser\" energy gun, The Enforcer uses a catalytic conversion system to turn energy into a hard, rubbery mass"
	icon = 'icons/obj/guns/energy/shrapnel.dmi'
	icon_state = "eshotgun"
	item_charge_meter = TRUE
	item_state = "eshotgun"
	init_firemodes = list(
		list(mode_name="Lethal", mode_desc="Fires a pistol synth-shot", projectile_type=/obj/item/projectile/bullet/pistol/rubber, fire_delay=5, charge_cost=100, icon="stun"),
		list(mode_name="Rubber", mode_desc="Fires a rubber synth-shot", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/rubber, fire_delay=10, charge_cost=500, icon="charge"),
		list(mode_name="full auto", projectile_type=/obj/item/projectile/bullet/pistol/rubber, mode_type = /datum/firemode/automatic, fire_delay=3  , charge_cost=125, icon="auto"),
	)

/obj/item/weapon/gun/energy/shrapnel/corsair/enforcer/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		init_firemodes = list(
			list(mode_name="Lethal", mode_desc="Fires a pistol synth-shot", projectile_type=/obj/item/projectile/bullet/pistol/rubber, fire_delay=5, charge_cost=100, icon="stun"),
			list(mode_name="Rubber", mode_desc="Fires a rubber synth-shot", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/rubber, fire_delay=10, charge_cost=500, icon="charge"),
			list(mode_name="full auto", projectile_type=/obj/item/projectile/bullet/pistol/rubber, mode_type = /datum/firemode/automatic, fire_delay=3  , charge_cost=125, icon="auto"),
			list(mode_name="full auto", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/rubber, mode_type = /datum/firemode/automatic, fire_delay=6  , charge_cost=500, icon="auto"),
		)
		return 1
	else
		to_chat(user, SPAN_WARNING("It is already emagged!"))