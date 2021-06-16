/obj/item/device/propaganda_chip
	origin_tech = list(TECH_MAGNET = 3)

	/* Changes from original file: origin_tech was listed as TECH_MAGNETS,
	   which was a non-existent tech that broke the destructive analyzer.
	*/

/obj/item/device/spy_sensor
	origin_tech = list(TECH_MAGNET = 5, TECH_COVERT = 2)

	/* Changes from original file: origin_tech was listed as TECH_MAGNETS,
	   which was a non-existent tech that broke the destructive analyzer.
	*/
/obj/item/jammer
	name = "radio jammer"
	desc = "Device used to disrupt nearby radio communication."
	icon = 'icons/obj/device.dmi'
	icon_state = "jammer"
	var/active = FALSE
	var/range = 12

/obj/item/jammer/Destroy()
	GLOB.active_jammers -= src
	return ..()

/obj/item/jammer/attack_self(mob/user)
	to_chat(user,"<span class='notice'>You [active ? "deactivate" : "activate"] the [src].</span>")
	active = !active
	if(active)
		GLOB.active_jammers |= src
	else
		GLOB.active_jammers -= src