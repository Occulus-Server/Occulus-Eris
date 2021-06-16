///// Dorms Elevator/////

//// This code is for the elevator to remove the player from the round and delete all items outside of the preserve items list.

/obj/machinery/button/remote/elevator_panel/proc/despawn_passenger(var/mob/living/user)
	var/mob/living/passenger = user

	for(var/obj/item/W in passenger)
		if(W in preserve_items)
			passenger.drop_from_inventory(W)

	log_and_message_admins("[key_name(passenger)]" + "[passenger.mind ? " ([passenger.mind.assigned_role])" : ""]" + " ended their shift via the elevator to the dormitories.")
	announce.autosay("[passenger.real_name]" + "[passenger.mind ? ", [passenger.mind.assigned_role]" : ""]" + ", [on_store_message]", "[on_store_name]")

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
	passenger.ghostize()
	passenger.despawn()



//// This code is for the buttons and airlock in the elevator in the dorms area that offers players
//// an alternative method of leaving the round without having to cryo.

/obj/machinery/button/remote/elevator_panel
	name = "Elevator Panel"
	desc = "An elevator panel used to return to the dorms once a shift is over."

	var/cooldown = 24 SECONDS
	var/cooldown_timer
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

	if(world.time - cooldown_timer > cooldown)
		cooldown_timer = world.time
		elevator_prompt = alert(src, "Warning! Using the elevator will end your shift and remove you from the round. Are you -sure- you want to head to your dorm for the day?\n(Everyone inside the elevator with you will end their shift and be removed as well!)", "End your shift and head to the dorms?", "End shift", "Stay on shift")
		if(elevator_prompt == "End shift")
			for(var/obj/machinery/door/airlock/D in SSmachines.machinery)
				if (D.id_tag == id)
					D.close()
					sleep(11)
					D.lock()
			sleep(10)	//Wait 1 seconds before proceeding
			playsound(src, 'zzzz_modular_occulus/sound/effects/elevator_going_up.ogg', 70, 0)
			sleep(10)
			visible_message("<span class='notice'>The elevator hums and creaks as it makes its way to the dormitory floor.</span>")
			sleep(185)	//Wait 6 seconds before proceeding
			for (var/mob/living/mobsgoingup in get_area(src))
				despawn_passenger(mobsgoingup)
		else
			T.audible_message("<font color = #F63812><B>Elevator Coms</B>: \"Error. The elevator is currently out of service. Please contact your local engineering department.\"</font>")
	else
		to_chat(usr, SPAN_DANGER("The elevator is currently in use. Please wait before you can use it again."))

/obj/machinery/button/remote/elevator_call_button
	name = "Elevator Call Button"
	desc = "An button used to call the elevator down to the current floor."
	var/cooldown = 24 SECONDS
	var/cooldown_timer

/obj/machinery/button/remote/elevator_call_button/trigger()
	for(var/obj/machinery/door/airlock/D in SSmachines.machinery)
		if (D.id_tag == id)
			if(D.locked)
				if(world.time - cooldown_timer > cooldown)
					cooldown_timer = world.time
					visible_message("<span class='notice'>The elevator has been called. Please wait...</span>")
					playsound(src, 'zzzz_modular_occulus/sound/effects/elevator_going_down.ogg', 70, 0)
					sleep(220)
					for(D in SSmachines.machinery)
						if (D.id_tag == id)
							D.unlock()
							sleep(10)
							D.open()
				else
					to_chat(usr, SPAN_DANGER("The elevator is currently in transit. Please wait for it to reach the dormitories before calling it."))
			else
				D.open()


//// This is the code for the elevator area.

/area/eris/elevator
	name = "elevator"
	forced_ambience = list('zzzz_modular_occulus/sound/ambience/elevatormusic.ogg')
	requires_power = 0
	flags = AREA_FLAG_CRITICAL

/area/eris/elevator/Entered(A)
	..()
	if(isliving(A))
		to_chat(usr, SPAN_DANGER("WARNING!! You will be ghosted and removed from the round while inside the elevator if someone else in the elevator presses the elevator button. Leave the elevator immediately if you do not want to risk being removed from the current round."))