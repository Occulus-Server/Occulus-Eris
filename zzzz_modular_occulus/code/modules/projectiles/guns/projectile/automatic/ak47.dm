// God forgive my sins.

obj/item/gun/projectile/automatic/ak47/cursed
	name = "Modified AR .30 \"Kalamiti\""
	desc = "You've taken it too far, this time. \
			This is a ruined copy of an ancient semi-automatic rifle. Extensive modification has removed the stock, added a non-magnifying scope, and a fun-switch. \
			Any added accuracy from the sights are ruined by the fact that you lack a buttstock, and the gun is significantly lighter. \
			Short of ripping off the dust cover, this is as bad as it gets. There is no fire selector. There is also no safety."
	icon = 'zzzz_modular_occulus/icons/obj/guns/projectile/cursed47.dmi'
	w_class = ITEM_SIZE_NORMAL
	recoil_buildup = 30	//you knew what you were getting into.

	origin_tech = list(TECH_COMBAT = 3)	//worth studying, if only to learn from your mistakes.
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 10)

	init_firemodes = list(
		FULL_AUTO_400	//FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK FUCK
	)

	price_tag = 1000

/obj/item/gun/projectile/automatic/ak47/cursed/attackby(obj/item/W, mob/user)
	if(QUALITY_SCREW_DRIVING in W.tool_qualities)
		to_chat(user, SPAN_NOTICE("You begin to rechamber \the [src]."))
		if(!ammo_magazine && W.use_tool(user, src, WORKTIME_NORMAL, QUALITY_SCREW_DRIVING, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
			if(caliber == CAL_LRIFLE)
				caliber = CAL_SRIFLE
				to_chat(user, SPAN_WARNING("You successfully rechamber \the [src] to .20 Caliber, because you thought your life was too easy."))
			else if(caliber == CAL_SRIFLE)
				caliber = CAL_CLRIFLE
				mag_well = MAG_WELL_IH
				to_chat(user, SPAN_WARNING("You successfully rechamber \the [src] to .25 Caseless. No wall is safe from you, now."))
			else if(caliber == CAL_CLRIFLE)
				caliber = CAL_LRIFLE
				mag_well = MAG_WELL_RIFLE
				to_chat(user, SPAN_WARNING("You successfully rechamber \the [src] to .30 Caliber. How wise!"))
		else
			to_chat(user, SPAN_WARNING("You cannot rechamber a loaded firearm!"))
			return
	..()