#define BUTTON_COOLDOWN 60 // cant delay the bomb forever
#define BUTTON_DELAY	20 // two seconds

/obj/machinery/syndicatebomb
	icon = 'icons/obj/assemblies.dmi'
	name = "syndicate bomb"
	icon_state = "syndicate-bomb"
	desc = "A large and menacing device. Can be bolted down with a wrench."

	anchored = FALSE
	density = FALSE
	layer = BELOW_MOB_LAYER //so people can't hide it and it's REALLY OBVIOUS

	var/datum/wires/syndicatebomb/wires = null
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

/obj/machinery/syndicatebomb/proc/try_detonate(ignore_active = FALSE)
	. = (active || ignore_active) && !defused
	if(.)
		explosion(src, 3, 9, 17)




/obj/machinery/syndicatebomb/Process()
	if(!active)
		STOP_PROCESSING(SSobj, src)
		detonation_timer = null
		next_beep = null
		return

	if(!isnull(next_beep) && (next_beep <= world.time))
		var/volume
		switch(seconds_remaining())
			if(0 to 5)
				volume = 50
			if(5 to 10)
				volume = 40
			if(10 to 15)
				volume = 30
			if(15 to 20)
				volume = 20
			if(20 to 25)
				volume = 10
			else
				volume = 5
		playsound(loc, beepsound, volume, 0)
		next_beep = world.time + 10

	if(active && !defused && ((detonation_timer <= world.time) || explode_now))
		active = FALSE
		timer_set = initial(timer_set)
		update_icon()
		try_detonate(TRUE)
	//Counter terrorists win
	else if(!active || defused)
		if(defused)
			STOP_PROCESSING(SSobj, src)

/obj/machinery/syndicatebomb/Initialize()
	. = ..()
	wires = new /datum/wires/syndicatebomb(src)
	update_icon()

/obj/machinery/syndicatebomb/Destroy()
	QDEL_NULL(wires)
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/machinery/syndicatebomb/examine(mob/user)
	. = ..()
	. += "A digital display on it reads \"[seconds_remaining()]\"."

/obj/machinery/syndicatebomb/update_icon()
	icon_state = "[initial(icon_state)][active ? "-active" : "-inactive"][open_panel ? "-wires" : ""]"

/obj/machinery/syndicatebomb/proc/seconds_remaining()
	if(active)
		. = max(0, round((detonation_timer - world.time) / 10))
	else
		. = timer_set

/obj/machinery/syndicatebomb/attackby(obj/item/I, mob/user, params)
	if((QUALITY_BOLT_TURNING in I.tool_qualities) && can_unanchor)
		if(!anchored)
			if(!isturf(loc) || loc == /turf/space)
				to_chat(user, "<span class='notice'>The bomb must be placed on solid ground to attach it.</span>")
			else
				to_chat(user, "<span class='notice'>You firmly wrench the bomb to the floor.</span>")
				I.play_tool_sound(src)
				anchored = TRUE
				if(active)
					to_chat(user, "<span class='notice'>The bolts lock in place.</span>")
		else
			if(!active)
				to_chat(user, "<span class='notice'>You wrench the bomb from the floor.</span>")
				I.play_tool_sound(src)
				anchored = FALSE
			else
				to_chat(user, "<span class='warning'>The bolts are locked down!</span>")

	else if(QUALITY_SCREW_DRIVING in I.tool_qualities)
		open_panel = !open_panel
		update_icon()
		to_chat(user, "<span class='notice'>You [open_panel ? "open" : "close"] the wire panel.</span>")

	else if((QUALITY_WIRE_CUTTING in I.tool_qualities) && open_panel)
		wires.Interact(user)


/obj/machinery/syndicatebomb/interact(mob/user)
	wires.Interact(user)
	if(!open_panel)
		if(!active)
			settings(user)
		else if(anchored)
			to_chat(user, "<span class='warning'>The bomb is bolted to the floor!</span>")

/obj/machinery/syndicatebomb/proc/activate()
	active = TRUE
	START_PROCESSING(SSobj, src)
	next_beep = world.time + 10
	detonation_timer = world.time + (timer_set * 10)
	playsound(loc, 'sound/machines/click.ogg', 30, 1)

/obj/machinery/syndicatebomb/proc/settings(mob/user)
	var/new_timer = input(user, "Please set the timer.", "Timer", "[timer_set]") as num
	if(in_range(src, user) && isliving(user)) //No running off and setting bombs from across the station
		timer_set = clamp(new_timer, minimum_timer, maximum_timer)
		loc.visible_message("<span class='notice'>[icon2html(src, viewers(src))] timer set for [timer_set] seconds.</span>")
	if(alert(user,"Would you like to start the countdown now?",,"Yes","No") == "Yes" && in_range(src, user) && isliving(user))
		if(defused || active)
			if(defused)
				visible_message("<span class='warning'>[icon2html(src, viewers(src))] Device error: User intervention required.</span>")
			return
		else
			visible_message("<span class='danger'>[icon2html(src, viewers(loc))] [timer_set] seconds until detonation, please clear the area.</span>")
			activate()
			update_icon()
			add_fingerprint(user)


