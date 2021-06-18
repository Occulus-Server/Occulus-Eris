///// Dorms Elevator/////

//// This code is for the elevator to remove the player from the round and delete all items outside of the preserve items list.

/obj/machinery/button/remote/elevator_panel/proc/despawn_passenger(var/mob/living/user)
	var/mob/living/passenger = user

	for(var/obj/item/W in passenger)
		if (istype(W, /obj/item/weapon/storage))
			for(var/T in preserve_items)
				for (var/obj/item/w_storage in W.contents)
					if (istype(w_storage, T))
						passenger.drop_from_inventory(w_storage)
						continue
		else
			for(var/T in preserve_items)
				if(istype(W, T))
					passenger.drop_from_inventory(W)
					continue

	log_and_message_admins("[key_name(passenger)]" + "[passenger.mind ? " ([passenger.mind.assigned_role])" : ""]" + " ended their shift via the elevator to the dormitories.")
	announce.autosay("[passenger.real_name]" + "[passenger.mind ? ", [passenger.mind.assigned_role]" : ""]" + ", [on_store_message]", "[on_store_name]")

	passenger.ghostize()

	//When the passenger is put into storage, their respawn time is reduced.
	//This check exists for the benefit of people who get put into cryostorage while SSD and come back later
	if (passenger.in_perfect_health())
		if (passenger.mind && passenger.mind.key)
			//Whoever inhabited this body is long gone, we need some black magic to find where and who they are now
			var/mob/M = key2mob(passenger.mind.key)
			if (istype(M))
				if (!(M.get_respawn_bonus("CRYOSLEEP")))
					//We send a message to the passenger's current mob - probably a ghost, but who knows.
					to_chat(M, SPAN_NOTICE("Because you returned to the dorms, your crew respawn time has been reduced by [CRYOPOD_SPAWN_BONUS_DESC]."))
					M << 'sound/effects/magic/blind.ogg' //Play this sound to a player whenever their respawn time gets reduced

				//Going safely to cryo will allow the patient to respawn more quickly
				M.set_respawn_bonus("CRYOSLEEP", CRYOPOD_SPAWN_BONUS)

	// This despawn is not a gib() in this sense, it is used to remove objectives tied on these despawned mobs in cryos
	passenger.despawn()



//// This code is for the buttons and airlock in the elevator in the dorms area that offers players
//// an alternative method of leaving the round without having to cryo.

/obj/machinery/button/remote/elevator_panel
	name = "Elevator Panel"
	desc = "An elevator panel used to return to the dorms once a shift is over."

	var/cooldown = 24 SECONDS
	var/cooldown_timer
	var/elevator_moving = FALSE
	var/list/preserve_items = list(
		/obj/item/weapon/hand_tele,
		/obj/item/weapon/card/id/captains_spare,
		/obj/item/device/aicard,
		/obj/item/device/mmi,
		/obj/item/device/paicard,
		/obj/item/weapon/gun,
		/obj/item/weapon/pinpointer,
		/obj/item/clothing/suit,
		/obj/item/clothing/shoes/magboots,
		/obj/item/blueprints,
		/obj/item/clothing/head/space,
		/obj/item/weapon/storage/internal
	)
	var/obj/item/device/radio/intercom/announce
	var/on_store_message = "has clocked out of their shift and returned to the dormitories."
	var/on_store_name = "Elevator Announcer"

/obj/machinery/button/remote/elevator_panel/New()
	announce = new /obj/item/device/radio/intercom(src)
	update_icon()
	..()

/obj/machinery/button/remote/elevator_panel/trigger()
	var/elevator_prompt
	var/turf/T = get_turf(src)

	if(world.time - cooldown_timer > cooldown) //Cooldown timer so the button can't be spammed.
		elevator_prompt = alert(usr, "Using the elevator will end your shift and remove you from the round.\nAre you sure you want to head to your dorm for the day?\n(Everyone inside the elevator with you will end their shift and be removed as well!)", "End your shift and head to your dorm?", "End shift", "Stay on shift")
		if(elevator_prompt == "End shift") //If the prompt is accepted
			for(var/obj/machinery/door/airlock/D in range(src, 5)) //Check all airlocks (D) in 5 tile range of the button
				if (D.id_tag == id) //Find the ones with the same IDtag as the button
					D.close()
					sleep(15)
					if (!D.command_completed("close")) //Check that the door closed succesfully. If it didn't, the door is malfunctioning.
						T.audible_message("<font color = #F63812><B>Elevator Coms</B> states, \"Error. The elevator airlock appears to be out of service. Please contact your local engineering department or try again.\"</font>")
						return
					else //If it did close successfully, we're ready to bolt and go to the dorms.
						cooldown_timer = world.time //Now that we've confirmed we can start the elevator, the button cooldown will begin.
						D.lock()
						elevator_moving = TRUE //The elevator is now in use. Until this is set back to False, the elevator call button will not work.
			sleep(15)	//Wait 1.5 seconds before proceeding
			playsound(src, 'zzzz_modular_occulus/sound/effects/elevator_going_up.ogg', 70, 0)
			sleep(10)
			visible_message("<span class='notice'>The elevator hums and creaks as it makes its way to the dormitory floor.</span>")
			sleep(185)	//Wait 6 seconds before proceeding
			for (var/mob/living/mobsgoingup in get_area(src))
				despawn_passenger(mobsgoingup)
			sleep(20)
			elevator_moving = FALSE //The elevator is no longer in use. Calling it will now work.
		else
	else
		to_chat(usr, SPAN_DANGER("The elevator is currently in use. Please wait before you can use it again."))

//			T.audible_message("<font color = #F63812><B>Elevator Coms</B> states, \"Error. The elevator is currently out of service. Please contact your local engineering department.\"</font>")

/obj/machinery/button/remote/elevator_call_button
	name = "Elevator Call Button"
	desc = "An button used to call the elevator down to the current floor."
	var/cooldown = 24 SECONDS
	var/cooldown_timer

/obj/machinery/button/remote/elevator_call_button/trigger()
	for(var/obj/machinery/door/airlock/D in range(src, 5))
		if (D.id_tag == id && D.locked)
			for(var/obj/machinery/button/remote/elevator_panel/B in range(src, 5))
				if (B.elevator_moving == FALSE)
					if(world.time - cooldown_timer > cooldown)
						cooldown_timer = world.time
						visible_message("<span class='notice'>The elevator has been called. Please wait...</span>")
						playsound(src, 'zzzz_modular_occulus/sound/effects/elevator_going_down.ogg', 70, 0)
						sleep(220)
						for(D in range(src, 5))
							if (D.id_tag == id)
								D.unlock()
								sleep(10)
								D.open()
					else
						to_chat(usr, SPAN_DANGER("The elevator is currently in transit. Please wait for it to arrive."))
				else
					to_chat(usr, SPAN_DANGER("The elevator is currently in use. Please wait for it to reach the dormitories before calling it again."))
		else if (D.id_tag == id && !D.locked)
			D.open()


//// This is the code for the elevator area.

/area/eris/elevator
	name = "elevator"
	forced_ambience = list('zzzz_modular_occulus/sound/ambience/elevatormusic.ogg')
	requires_power = FALSE
	flags = AREA_FLAG_CRITICAL

/area/eris/elevator/Entered(A)
	..()
	if(isliving(A))
		to_chat(usr, SPAN_DANGER("WARNING!! You will be ghosted and removed from the round while inside the elevator if someone else in the elevator presses the elevator button. Leave the elevator immediately if you do not want to risk being removed from the current round."))