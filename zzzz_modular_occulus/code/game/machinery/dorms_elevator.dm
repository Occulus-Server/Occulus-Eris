///// Dorms Elevator/////

//// This code is for the elevator to remove the player from the round and delete all items outside of the preserve items list.

/obj/machinery/button/remote/elevator_panel/proc/despawn_passenger(var/mob/living/user)
	var/mob/living/passenger = user
	var/obj/machinery/computer/cryopod/elevator_storage/lostFound

	for(var/obj/machinery/computer/cryopod/elevator_storage/D in range(usr, 5))
		lostFound = D
	for(var/obj/item/W in passenger) // For every object (that we call W) on the passenger...
		if (istype(W, /obj/item/modular_computer/pda)) // If the object is a PDA...
			var/obj/item/modular_computer/pda/found_pda = W // Give it the "found_pda" variable...
			if (found_pda.card_slot.stored_card != null && istype(found_pda.card_slot.stored_card, /obj/item/card/id/captains_spare)) // Check that there is an ID inside AND it is the captain's spare...
				found_pda.card_slot.stored_card.forceMove(lostFound) // If so, move it to the Lost and Found unit.
			else if (found_pda.card_slot.stored_card != null) // If the ID is NOT a captain's spare, but there is an ID inside the PDA...
				var/obj/item/card/id/PDA_ID = found_pda.card_slot.stored_card // This is required to get qdel to work...
				found_pda.card_slot.stored_card = null // Set it to NULL (or else it won't delete properly...)
				qdel(PDA_ID) // And delete it.
		else if (istype(W, /obj/item/implant)) // If the object is an implant...
			var/obj/item/implant/found_implant = W // Give it a variable name...
			found_implant.uninstall() // Uninstall first, since we can't delete it without doing this first...
			qdel(found_implant) // Then delete it.
		else if (istype(W, /obj/item/storage || /obj/item/clothing/suit/storage)) //If the object is either a bag or suit with storage...
			for(var/T in preserve_items) // We assign every preserved item to the variable T...
				for (var/obj/item/w_storage in W.contents) //We assign the variable "w_storage" to every singe item inside the bag or suit...
					if (istype(w_storage, /obj/item/storage)) // If the item in the bag turns out to be a storage container...
						for (var/obj/item/ww_storage in w_storage.contents) // We assign all items inside the storage container to "ww_storage"...
							if (istype(ww_storage, T)) // Check if the item in that container is part of the preserved items...
								passenger.drop_from_inventory(ww_storage) // If so, drop it.
								ww_storage.forceMove(lostFound) // Then move it to the Lost and Found unit.
								lostFound.frozen_items += ww_storage // And add it to the list of currently inventoried items.
					else if (istype(w_storage, T)) // If it is not a storage container, check if it's a preserved item...
						passenger.drop_from_inventory(w_storage) // Drop it.
						w_storage.forceMove(lostFound) // And move it to the Lost and Found unit.
						lostFound.frozen_items += w_storage // And add it to the list of currently inventoried items.
						continue
		else
			for(var/T in preserve_items) // If the object is not a PDA, implant, suit, vest or storage container...
				if(istype(W, T)) // And is part of the preserved list...
					passenger.drop_from_inventory(W) // Drop it.
					W.forceMove(lostFound) // Then move it to the Lost and Found unit.
					lostFound.frozen_items += W // And add it to the list of currently inventoried items.
					continue

	log_and_message_admins("[key_name(passenger)]" + "[passenger.mind ? " ([passenger.mind.assigned_role])" : ""]" + " ended their shift via the elevator to the dormitories.")
	announce.autosay("[passenger.real_name]" + "[passenger.mind ? ", [passenger.mind.assigned_role]" : ""]" + ", [on_store_message]", "[on_store_name]")

	passenger.ghostize()

	//When the passenger is put into storage, their respawn time is reduced.
	//This check exists for the benefit of people who get put into cryostorage while SSD and come back later
	if(passenger.mind && passenger.mind.key)
		//Whoever inhabited this body is long gone, we need some black magic to find where and who they are now
		var/mob/M = key2mob(passenger.mind.key)
		if(istype(M) && !M.get_respawn_bonus("CRYOSLEEP"))
			if(M.in_perfect_health())
				//We send a message to the occupant's current mob - probably a ghost, but who knows.
				to_chat(M, SPAN_NOTICE("Because your body was put into cryostorage in good health, your crew respawn time has been reduced by [(CRYOPOD_HEALTHY_RESPAWN_BONUS)/600] minutes."))
				M.set_respawn_bonus("CRYOSLEEP", CRYOPOD_HEALTHY_RESPAWN_BONUS)
			else
				to_chat(M, SPAN_NOTICE("Because your body was put into cryostorage in poor health, your crew respawn time has been reduced by [(CRYOPOD_WOUNDED_RESPAWN_BONUS)/600] minutes."))
				M.set_respawn_bonus("CRYOSLEEP", CRYOPOD_WOUNDED_RESPAWN_BONUS)
			M << 'sound/effects/magic/blind.ogg' //Play this sound to a player whenever their respawn time gets reduced

	// This despawn is not a gib() in this sense, it is used to remove objectives tied on these despawned mobs in cryos
	passenger.despawn()
	for (var/obj/item/W in get_area(src)) // For every item inside the elevator area... (The area that the elevator airlock is in)
		if (!istype(W, /obj/item/device/radio/intercom)) //Stop eating my fucking intercom you cockwaffle
			W.forceMove(lostFound) // Move the items to the lost and found unit in order to clean up the elevator.
			lostFound.frozen_items += W // And add them to the inventory list.



//// This code is for the elevator lost and found unit.

/obj/machinery/computer/cryopod/elevator_storage
	name = "Elevator Lost and Found Unit"
	desc = "An interface that sweeps up any lost and found items from the elevator and stores them for easy retrieval."
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "cellconsole"
	light_power = 1.5
	light_color = COLOR_LIGHTING_BLUE_MACHINERY
	density = FALSE
	interact_offline = 1
	var/list/preserve_items = list(
		/obj/item/hand_tele,
		/obj/item/card/id/captains_spare,
		/obj/item/device/aicard,
		/obj/item/device/mmi,
		/obj/item/device/paicard,
		/obj/item/gun,
		/obj/item/pinpointer,
		/obj/item/clothing/suit,
		/obj/item/clothing/shoes/magboots,
		/obj/item/blueprints,
		/obj/item/clothing/head/space,
		/obj/item/storage/internal
		)


//// This code is for the buttons and airlock in the elevator in the dorms area that offers players
//// an alternative method of leaving the round without having to cryo.

/obj/machinery/button/remote/elevator_panel
	name = "Elevator Panel"
	desc = "An elevator panel used to return to the dorms once a shift is over."
	icon = 'zzzz_modular_occulus/icons/obj/dorms_elevator.dmi'
	icon_state = "elevator_panel_idle"

	var/cooldown = 24 SECONDS
	var/cooldown_timer
	var/elevator_moving = FALSE // This is the variable that checks against the world timer and is TRUE only while the elevator is in transit.
	var/list/preserve_items = list(
		/obj/item/hand_tele,
		/obj/item/card/id/captains_spare,
		/obj/item/device/aicard,
		/obj/item/device/mmi,
		/obj/item/device/paicard,
		/obj/item/gun,
		/obj/item/pinpointer,
		/obj/item/clothing/suit,
		/obj/item/clothing/shoes/magboots,
		/obj/item/blueprints,
		/obj/item/clothing/head/space,
		/obj/item/storage/internal
	)
	var/obj/item/device/radio/intercom/announce
	var/on_store_message = "has clocked out of their shift and returned to the dormitories."
	var/on_store_name = "Elevator Announcer"
	var/panel_state = "elevator_panel_idle" //We use this to track what the last active icon the code should choose update_icon() is called.

/obj/machinery/button/remote/elevator_panel/on_update_icon()
	icon_state = panel_state


/obj/machinery/button/remote/elevator_panel/attack_hand(mob/user as mob)
	icon_state = panel_state
	trigger(user)
	update_icon()

/obj/machinery/button/remote/elevator_panel/New()
	announce = new /obj/item/device/radio/intercom(src)
	update_icon()
	..()

/obj/machinery/button/remote/elevator_panel/proc/going_down()
	var/turf/T = get_turf(src)

	for(var/obj/machinery/door/airlock/D in range(src, 5)) //Check all airlocks (D) in 5 tile range of the button
		if (D.id_tag == id) //Find the ones with the same IDtag as the button
			D.close()
			sleep(15)
			if (!D.command_completed("close")) //Check that the door closed succesfully. If it didn't, the door is malfunctioning.
				T.audible_message("<font color = #F63812><B>Elevator Coms</B> states, \"Error. The elevator airlock appears to be out of service. Please contact your local engineering department or check for obstructions.\"</font>")
				playsound(src, 'sound/machines/buzz-two.ogg', 50, 0)
				return
			else //If it did close successfully, we move on to the next part of the process.
				D.lock()
				sleep(5)
				if (!D.command_completed("close") && !D.command_completed("lock")) //Check that the door closed succesfully again and has locked this time to mitigate people pressing the button while standing on the airlock. If it didn't, the door is malfunctioning.
					T.audible_message("<font color = #F63812><B>Elevator Coms</B> states, \"Error. The elevator airlock appears to be out of service. Please contact your local engineering department or check for obstructions.\"</font>")
					D.unlock()
					playsound(src, 'sound/machines/buzz-two.ogg', 50, 0)
					return
				else//If it did close and lock sucesfully, we are ready to go down to the pool!
					cooldown_timer = world.time //Now that we've confirmed we can start the elevator, the button cooldown will begin.
					elevator_moving = TRUE //The elevator is now in use. Until this is set back to False, the elevator call button will not work.
					panel_state = "elevator_panel_floor6"
					update_icon()
	sleep(15)	//Wait 1.5 seconds before proceeding
	playsound(src, 'zzzz_modular_occulus/sound/effects/elevator_going_up.ogg', 70, 0)
	sleep(10)
	visible_message("<span class='notice'>The elevator hums and creaks as it makes its way to deck 1.</span>")
	sleep(27)
	panel_state = "elevator_panel_floor5"
	update_icon()
	sleep(33) //Sleep times vary here in order to slightly simulate the elevator speeding up and slowing down as it departs and arrives.
	panel_state = "elevator_panel_floor4"
	update_icon()
	sleep(32)
	panel_state = "elevator_panel_floor3"
	update_icon()
	sleep(32)
	panel_state = "elevator_panel_floor2"
	update_icon()
	sleep(33)
	panel_state = "elevator_panel_floor1"
	update_icon()
	sleep(35)
	T.audible_message("<font color = #00BA6E><B>Elevator Coms</B> states, \"Deck one, pool.\"</font>")
	for(var/obj/machinery/door/airlock/D in range(src, 5)) // On arrival, unlock the airlock and open it as an elevator would once it arrives to a floor.
		if (D.id_tag == id)
			D.unlock()
			sleep(15)
			update_icon()
			D.open()
	sleep(50) // Give people enough time to leave the elevator before it can be called.
	panel_state = "elevator_panel_idle"
	elevator_moving = FALSE //The elevator is no longer in use. Calling it will now work.

/obj/machinery/button/remote/elevator_panel/proc/going_up()
	var/turf/T = get_turf(src)

	for(var/obj/machinery/door/airlock/D in range(src, 5)) //Check all airlocks (D) in 5 tile range of the button
		if (D.id_tag == id) //Find the ones with the same IDtag as the button
			D.close()
			sleep(15)
			if (!D.command_completed("close")) //Check that the door closed succesfully. If it didn't, the door is malfunctioning.
				T.audible_message("<font color = #F63812><B>Elevator Coms</B> states, \"Error. The elevator airlock appears to be out of service. Please contact your local engineering department or check for obstructions.\"</font>")
				playsound(src, 'sound/machines/buzz-two.ogg', 50, 0)
				return
			else //If it did close successfully, we move on to the next part of the process.
				D.lock()
				sleep(5)
				if (!D.command_completed("close") && !D.command_completed("lock")) //Check that the door closed succesfully again and has locked this time to mitigate people pressing the button while standing on the airlock. If it didn't, the door is malfunctioning.
					T.audible_message("<font color = #F63812><B>Elevator Coms</B> states, \"Error. The elevator airlock appears to be out of service. Please contact your local engineering department or check for obstructions.\"</font>")
					D.unlock()
					playsound(src, 'sound/machines/buzz-two.ogg', 50, 0)
					return
				else//If it did close and lock sucesfully, we are ready to go up to the dorms!
					cooldown_timer = world.time //Now that we've confirmed we can start the elevator, the button cooldown will begin.
					elevator_moving = TRUE //The elevator is now in use. Until this is set back to False, the elevator call button will not work.
					panel_state = "elevator_panel_floor1"
					update_icon()
	sleep(15)	//Wait 1.5 seconds before proceeding
	playsound(src, 'zzzz_modular_occulus/sound/effects/elevator_going_up.ogg', 70, 0)
	sleep(10)
	visible_message("<span class='notice'>The elevator hums and creaks as it makes its way to the dormitory floor.</span>")
	sleep(27)
	panel_state = "elevator_panel_floor2"
	update_icon()
	sleep(33) //Sleep times vary here in order to slightly simulate the elevator speeding up and slowing down as it departs and arrives.
	panel_state = "elevator_panel_floor3"
	update_icon()
	sleep(32)
	panel_state = "elevator_panel_floor4"
	update_icon()
	sleep(32)
	panel_state = "elevator_panel_floor5"
	update_icon()
	sleep(33)
	panel_state = "elevator_panel_floor6"
	update_icon()
	sleep(25)
	T.audible_message("<font color = #00BA6E><B>Elevator Coms</B> states, \"Deck six, dorms.\"</font>")
	sleep(10)
	for (var/mob/living/mobsgoingup in get_area(src))
		despawn_passenger(mobsgoingup)
	sleep(22)
	panel_state = "elevator_panel_idle"
	elevator_moving = FALSE //The elevator is no longer in use. Calling it will now work.

/obj/machinery/button/remote/elevator_panel/trigger()
	var/elevator_prompt_floor
	var/elevator_prompt_warning

	if(world.time - cooldown_timer > cooldown) //Cooldown timer so the button can't be spammed.

		elevator_prompt_floor = alert(usr, "Please select the deck you would like to go to.", "Elevator Panel", "Deck 1 - Pool", "Deck 6 - Dorms")
		if (elevator_prompt_floor == "Deck 1 - Pool" && Adjacent(usr))
			for(var/obj/machinery/door/airlock/D in range(src, 5))
				if (D.id_tag == id && !D.locked)
					D.open()
					return
				else
					going_down()
					return
		else
			elevator_prompt_warning = alert(usr, "Using the elevator will end your shift and remove you from the round.\nAre you sure you want to head to your dorm for the day?\n(Everyone inside the elevator with you will end their shift and be removed as well!)", "End your shift and head to your dorm?", "Stay on shift", "End shift")
			if(elevator_prompt_warning == "End shift" && Adjacent(usr)) //If the prompt is accepted and the player is adjacent to the elevator button.
				for(var/obj/machinery/door/airlock/D in range(src, 5))
					if (D.id_tag == id && D.locked && D.command_completed("close"))
						for (var/mob/living/mobsgoingup in get_area(src))
							despawn_passenger(mobsgoingup)
							return
					else
						going_up()
						return
			else
	else
		to_chat(usr, SPAN_DANGER("The elevator is currently in use. Please wait before you can use it again."))

/obj/machinery/button/remote/elevator_call_button
	name = "Elevator Call Button"
	desc = "An button used to call the elevator down to the current floor."
	var/cooldown = 24 SECONDS
	var/cooldown_timer
	var/obj/machinery/computer/cryopod/elevator_storage/lostFound

/obj/machinery/button/remote/elevator_call_button/trigger()
	for(var/obj/machinery/door/airlock/D in range(src, 5))
		if (D.id_tag == id && D.locked) //Gotta check if the airlock is locked. This is how we know whether the elevator is at our floor or at the dorms.
			for(var/obj/machinery/button/remote/elevator_panel/B in range(src, 5))
				if (B.elevator_moving == FALSE) //If the elevator is no longer moving I.E., the timer it sets has finished, then we are ready to call it back down.
					if(world.time - cooldown_timer > cooldown)
						cooldown_timer = world.time //Setting our own timer here so the button can't be spammed.
						visible_message("<span class='notice'>The elevator has been called. Please wait...</span>")
						playsound(src, 'zzzz_modular_occulus/sound/effects/elevator_going_down.ogg', 70, 0)
						B.icon_state = "elevator_panel_floor6"
						update_icon()
						sleep(37) //Sleep times vary here in order to slightly simulate the elevator speeding up and slowing down as it departs and arrives.
						B.icon_state = "elevator_panel_floor5"
						update_icon() //While technically no IC players will ever see the panel change as it's coming back down, ghosts will. It's a small addition but it makes the world feel that little bit more alive.
						sleep(35)
						B.icon_state = "elevator_panel_floor4"
						update_icon() // Additionally, this seemingly useless part should not be removed as a future update may possibly include players coming down the elevator on spawn.
						sleep(32)
						B.icon_state = "elevator_panel_floor3"
						update_icon()
						sleep(32)
						B.icon_state = "elevator_panel_floor2"
						update_icon()
						sleep(35)
						B.icon_state = "elevator_panel_floor1"
						update_icon()
						sleep(40)
						for(D in range(src, 5)) // On arrival, unlock the airlock and open it as an elevator would once it arrives to a floor.
							if (D.id_tag == id)
								D.unlock()
								sleep(15)
								B.icon_state = "elevator_panel_idle"
								update_icon()
								D.open()
					else
						to_chat(usr, SPAN_DANGER("The elevator is currently in transit. Please wait for it to arrive."))
				else
					to_chat(usr, SPAN_DANGER("The elevator is currently in use. Please wait for it to reach the dormitories before calling it again."))
		else if (D.id_tag == id && !D.locked) //We gotta check again wether the ID tags match, or else the button will open all airlocks in range.
			D.open()




//// This is the code for the elevator area.

/area/eris/elevator
	name = "Elevator"
	sound_env = SMALL_SOFTFLOOR
	forced_ambience = list('zzzz_modular_occulus/sound/ambience/elevatormusic.ogg')
	requires_power = FALSE
	flags = AREA_FLAG_CRITICAL //A departure area is a critical area and should be protected. Edit: This does fuck-all lmfao

/area/eris/elevator/Entered(A)
	..()
	if(isliving(A)) // Don't spam ghosts with this message. Only living players.
		to_chat(usr, SPAN_DANGER("WARNING!! You will be ghosted and removed from the round while inside the elevator if someone else in the elevator presses the elevator button. Leave the elevator immediately if you do not want to risk being removed from the current round."))