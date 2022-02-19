#define BUTTON_COOLDOWN 60 // cant delay the bomb forever
#define BUTTON_DELAY	20 // two seconds

/obj/machinery/bomb
	icon = 'icons/obj/assemblies.dmi'
	name = "X-12 Charge"
	icon = 'zzzz_modular_occulus/icons/obj/bomb.dmi'
	icon_state = "syndicate-bomb"
	desc = "A large and extremely dangerous explosive device. Can be bolted down with a wrench."

	anchored = FALSE
	density = FALSE
	layer = BELOW_MOB_LAYER //so people can't hide it and it's REALLY OBVIOUS
	use_power = NO_POWER_USE	//doesn't use APC power
	var/datum/wires/bomb/wires = null
	var/minimum_timer = 90
	var/timer_set = 90
	var/maximum_timer = 60000

	var/can_unanchor = TRUE

	var/open_panel = FALSE 	//are the wires exposed?
	var/active = FALSE		//is the bomb counting down?
	var/defused = FALSE		//is the bomb capable of exploding?
	var/beepsound = 'zzzz_modular_occulus/sound/items/timer.ogg'
	var/delayedbig = FALSE	//delay wire pulsed?
	var/delayedlittle  = FALSE	//activation wire pulsed?

	var/next_beep
	var/detonation_timer
	var/explode_now = FALSE


/obj/machinery/bomb/Process()
	if(!active)
		STOP_PROCESSING(SSmachines, src)
		detonation_timer = null
		next_beep = null
		return

	if(!isnull(next_beep) && (next_beep <= world.time))
		var/volume
		switch(seconds_remaining())
			if(0 to 5)
				volume = 100
			if(5 to 10)
				volume = 95
			if(10 to 15)
				volume = 90
			if(15 to 20)
				volume = 80
			if(20 to 25)
				volume = 70
			else
				volume = 60
		playsound(loc, beepsound, volume, 0)
		next_beep = world.time + 10

	if(active && !defused && ((detonation_timer <= world.time) || explode_now))
		active = FALSE
		timer_set = initial(timer_set)
		update_icon()
		try_detonate(TRUE)
	//Counter terrorists win
	else if(defused)
		STOP_PROCESSING(SSmachines, src)

/obj/machinery/bomb/Initialize()
	. = ..()
	wires = new /datum/wires/bomb(src)
	update_icon()

/obj/machinery/bomb/Destroy()
	QDEL_NULL(wires)
	STOP_PROCESSING(SSmachines, src)
	return ..()

/obj/machinery/bomb/examine(mob/user)
	. = ..()
	to_chat(user, "A digital display on it reads '[seconds_remaining()]' ")

/obj/machinery/bomb/update_icon()
	icon_state = "[initial(icon_state)][active ? "-active" : "-inactive"][open_panel ? "-wires" : ""]"

/obj/machinery/bomb/proc/seconds_remaining()
	if(active)
		. = max(0, round((detonation_timer - world.time) / 10))
	else
		. = timer_set

/obj/machinery/bomb/attackby(obj/item/I, mob/user, params)
	if((QUALITY_BOLT_TURNING in I.tool_qualities) && can_unanchor)
		if(!anchored)
			if(!isturf(loc) || loc == /turf/space)
				to_chat(user, "<span class='notice'>The bomb must be placed on solid ground to attach it.</span>")
			else
				to_chat(user, "<span class='notice'>You firmly wrench the bomb to the floor.</span>")
				anchored = TRUE
				if(active)
					to_chat(user, "<span class='notice'>The bolts lock in place.</span>")
		else
			if(!active)
				to_chat(user, "<span class='notice'>You wrench the bomb from the floor.</span>")
				anchored = FALSE
			else
				to_chat(user, "<span class='warning'>The bolts are locked down!</span>")

	else if(QUALITY_SCREW_DRIVING in I.tool_qualities)
		open_panel = !open_panel
		update_icon()
		to_chat(user, "<span class='notice'>You [open_panel ? "open" : "close"] the wire panel.</span>")

	else if((QUALITY_WIRE_CUTTING in I.tool_qualities) && open_panel)
		wires.Interact(user)


/obj/machinery/bomb/attack_hand(mob/user)
	if(..())
		return
	interact(user)

/obj/machinery/bomb/interact(mob/user)
	wires.Interact(user)
	if(!open_panel)
		if(!active)
			settings(user)
		else if(anchored)
			to_chat(user, "<span class='warning'>The bomb is bolted to the floor!</span>")

/obj/machinery/bomb/proc/activate()
	active = TRUE
	START_PROCESSING(SSmachines, src)
	next_beep = world.time + 10
	detonation_timer = world.time + (timer_set * 10)
	playsound(loc, 'sound/machines/click.ogg', 30, 1)

/obj/machinery/bomb/proc/settings(mob/user)
	var/new_timer = input(user, "Please set the timer.", "Timer", "[timer_set]") as num
	if(in_range(src, user) && isliving(user)) //No running off and setting bombs from across the station
		timer_set = clamp(new_timer, minimum_timer, maximum_timer)
		loc.visible_message("<span class='notice'>[icon2html(src, viewers(src))] timer set for [timer_set] seconds.</span>")
	if(alert(user,"Would you like to start the countdown now?",,"No","Yes") == "Yes" && in_range(src, user) && isliving(user))
		if(defused)
			visible_message("<span class='warning'>[icon2html(src, viewers(src))] Device error: User intervention required.</span>")
			return
		else
			visible_message("<span class='danger'>[icon2html(src, viewers(loc))] [timer_set] seconds until detonation, please clear the area.</span>")
			activate()
			update_icon()
			add_fingerprint(user)


/obj/machinery/bomb/proc/try_detonate(ignore_active = FALSE)
	if((active || ignore_active) && !defused)
		explosion(src, 1, 5, 11, 20)



//EMP CHARGE HERE


/obj/machinery/bomb/emp
	name = "Z-6 Ion Charge"
	icon_state = "emp-bomb"
	desc = "A large and menacing device known for disabling electronic equipment in a wide radius. Can be bolted down with a wrench."
	layer = BELOW_MOB_LAYER //so people can't hide it and it's REALLY OBVIOUS
	use_power = NO_POWER_USE	//doesn't use APC power
	minimum_timer = 60
	timer_set = 60

/obj/machinery/bomb/emp/try_detonate(ignore_active = FALSE)
	. = (active || ignore_active) && !defused
	if(.)
		empulse(get_turf(src), 14, 17, TRUE)
	qdel(src)


/obj/machinery/bomb/emp/update_icon()
	icon_state = "[initial(icon_state)][active ? "-active" : "-inactive"][open_panel ? "-wires" : ""]"