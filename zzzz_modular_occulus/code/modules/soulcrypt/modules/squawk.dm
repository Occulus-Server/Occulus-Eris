/datum/soulcrypt_module/squawk
	name = "squawker"
	description = "A module that sends radio messages telling people where you are."
	activation_message = "Emergency beacon activated!"
	activates = TRUE
	uses_energy = FALSE
	has_energy_upkeep = FALSE
	energy_cost = 0
	causes_wear = FALSE	// Enable when we flesh out repair mechanics!
	wear_cause_amount = 10
	can_activate_while_incapacitated = TRUE
	var/squawk_message = "is at"
	var/fail_message = "is-zzzzt in-in-in..."

/datum/soulcrypt_module/squawk/perform()
	var/mob/M = owner.wearer
	var/area/t = get_area(M)
	var/obj/item/device/radio/headset/a = new /obj/item/device/radio/headset(null)
	a.autosay("[M.real_name] [squawk_message] [t.name]!", "[M.real_name]'s [name]")
	qdel(a)
	active = FALSE
	if(!activates)	// Is this something we have to trigger manually?
		uninstall()	// If not, lets assume this is a single-use automatic death alarm.

/datum/soulcrypt_module/squawk/on_emp()
	if(!check_can_activate())
		return
	var/mob/M = owner.wearer
	var/obj/item/device/radio/headset/a = new /obj/item/device/radio/headset(null)
	a.autosay("[M.real_name] [fail_message]", "[M.real_name]'s [name]")
	qdel(a)
	if(has_cooldown)
		cooldown_time = world.time + (cooldown_delay * 2)	// Getting EMP'd will force a cooldown with double the normal duration!
	if(!activates)	// Is this something we have to trigger manually?
		uninstall()	// If not, lets assume this is a single-use automatic death alarm.

/datum/soulcrypt_module/squawk/on_death()
	if(!activates)
		activate()

/datum/soulcrypt_module/squawk/death_alarm
	name = "Soulcrypt Death Alarm"
	description = "A death alarm in soulcrypt program form! Passively monitors for user death. Consumes no resources other than program space."
	squawk_message = "has died in"
	fail_message = "has died-zzzzt in-in-in..."
	activates = FALSE

/datum/soulcrypt_module/squawk/help_maint
	name = "Emergency Soulcrypt Beacon"
	description = "A convenient way to yell for help without the effort of yelling, or actually looking up where you are! Consumes a big chunk of energy on use."
	squawk_message = "is requesting assistance in"
	fail_message = "is reques-zzzzt ass-ass-ass..."
	has_cooldown = TRUE
	cooldown_delay = 120 SECONDS
	uses_energy = TRUE
	energy_cost = 50

/datum/soulcrypt_module/squawk/help_maint/stat_text()
	return "Trigger Emergency Beacon"
