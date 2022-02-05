/datum/wires/empbomb
	random = TRUE
	holder_type = /obj/machinery/empbomb
	wire_count = 5




/datum/wires/empbomb/GetWireName(index)
	switch(index)
		if(WIRE_BOOM)
			return "Explode"

		if(WIRE_UNBOLT)
			return "Unbolt"

		if(WIRE_DELAY)
			return "Delay"

		if(WIRE_PROCEED)
			return "Proceed"

		if(WIRE_ACTIVATE)
			return "Activate"

/datum/wires/empbomb/CanUse(mob/living/L)
	var/obj/machinery/bomb/P = holder
	if(P.open_panel)
		return TRUE
	return FALSE

/datum/wires/empbomb/UpdatePulsed(index)
	var/obj/machinery/empbomb/B = holder
	switch(index)
		if(WIRE_BOOM)
			if(B.active)
				holder.visible_message("<span class='danger'> An alarm sounds! It's go-</span>")
				B.explode_now = TRUE
		if(WIRE_UNBOLT)
			holder.visible_message("<span class='notice'> The bolts spin in place for a moment.</span>")
		if(WIRE_DELAY)
			if(B.delayedbig)
				holder.visible_message("<span class='notice'> The bomb has already been delayed.</span>")
			else
				holder.visible_message("<span class='notice'> The bomb chirps.</span>")
				playsound(B, 'sound/machines/chime.ogg', 30, 1)
				B.detonation_timer += 300
				B.delayedbig = TRUE
		if(WIRE_PROCEED)
			holder.visible_message("<span class='danger'> The bomb buzzes ominously!</span>")
			playsound(B, 'sound/machines/buzz-sigh.ogg', 30, 1)
			var/seconds = B.seconds_remaining()
			if(seconds >= 61) // Long fuse bombs can suddenly become more dangerous if you tinker with them.
				B.detonation_timer = world.time + 600
			else if(seconds >= 21)
				B.detonation_timer -= 100
			else if(seconds >= 11) // Both to prevent negative timers and to have a little mercy.
				B.detonation_timer = world.time + 100
		if(WIRE_ACTIVATE)
			if(!B.active && !B.defused)
				holder.visible_message("<span class='danger'> You hear the bomb start ticking!</span>")
				B.activate()
				B.update_icon()
			else if(B.delayedlittle)
				holder.visible_message("<span class='notice'> Nothing happens.</span>")
			else
				holder.visible_message("<span class='notice'> The bomb seems to hesitate for a moment.</span>")
				B.detonation_timer += 100
				B.delayedlittle = TRUE
	..()

/datum/wires/empbomb/UpdateCut(index, mended)
	var/obj/machinery/empbomb/B = holder
	switch(index)
		if(WIRE_EXPLODE)
			if(mended)
				B.defused = FALSE // Cutting and mending all the wires of an inactive bomb will thus cure any sabotage.
			else
				if(B.active)
					holder.visible_message("<span class='danger'> An alarm sounds! It's go-</span>")
					B.explode_now = TRUE
				else
					B.defused = TRUE
		if(WIRE_UNBOLT)
			if(!mended && B.anchored)
				holder.visible_message("<span class='notice'> The bolts lift out of the ground!</span>")
				playsound(B, 'sound/effects/stealthoff.ogg', 30, 1)
				B.anchored = FALSE
		if(WIRE_PROCEED)
			if(!mended && B.active)
				holder.visible_message("<span class='danger'> An alarm sounds! It's go-</span>")
				B.explode_now = TRUE
		if(WIRE_ACTIVATE)
			if(!mended && B.active)
				holder.visible_message("<span class='notice'> The timer stops! The bomb has been defused!</span>")
				B.active = FALSE
				B.defused = TRUE
				B.update_icon()
	..()