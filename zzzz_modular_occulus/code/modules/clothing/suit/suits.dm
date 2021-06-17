/obj/item/clothing/suit/storage/captains_coat
	name = "captain's parade uniform"
	desc = "A black and gold trimmed coat with attached half-cape. The inside is made of high-quality red velvet. Ostentatious enough to tell everyone around you that you are the \"Captain\"."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/captain.dmi'
	icon_state = "captains_coat"
	item_state = "captains_coat"
	icon_override = 'zzzz_modular_occulus/icons/mob/suit.dmi'
	icon_override_female = 'zzzz_modular_occulus/icons/mob/suit_fem.dmi'
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(
		melee = 30,
		bullet = 35,
		energy = 30,
		bomb = 15,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.8
	spawn_blacklisted = TRUE	//no random captain shit in maint

/obj/item/clothing/suit/storage/toggle/captains_jacket
	name = "captain's jacket"
	desc = "A black jacket with gold trim verifying that you are the Captain. It can be buttoned up or unbuttoned."
	icon = 'zzzz_modular_occulus/icons/obj/clothing/suit.dmi'
	icon_state = "capjacket"
	item_state = "capjacket"
	icon_open = "capjacket_open"
	icon_closed = "capjacket"
	icon_override = 'zzzz_modular_occulus/icons/mob/suit.dmi'
	icon_override_female = 'zzzz_modular_occulus/icons/mob/suit_fem.dmi'
	body_parts_covered = UPPER_TORSO|ARMS
	blood_overlay_type = "coat"
	armor = list(
		melee = 30,
		bullet = 35,
		energy = 30,
		bomb = 30,
		bio = 15,
		rad = 0
	) // These are the same as the captain's coat so you can play fashion souls instead of minmaxing.
	spawn_blacklisted = TRUE //no random captain shit in maint

/obj/item/clothing/suit/space/void/captain
	name = "captain's voidsuit"
	desc = "A bulky, heavy-duty voidsuit for hazardous, low-pressure environments. Only for the most fashionable of corporate figureheads."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/captain.dmi'
	icon_state = "captains_voidsuit"
	item_state = "captains_voidsuit"
	icon_override = 'zzzz_modular_occulus/icons/mob/suit.dmi'
	icon_override_female = 'zzzz_modular_occulus/icons/mob/suit_fem.dmi'
	slowdown = 0.3
	armor = list(
		melee = 50,
		bullet = 40,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.7
	helmet = /obj/item/clothing/head/space/capspace
	spawn_blacklisted = TRUE	//no random captain shit in maint

/obj/item/clothing/suit/space/void/captain/equipped
	tank = /obj/item/weapon/tank/jetpack/oxygen
	boots = /obj/item/clothing/shoes/magboots

/obj/item/clothing/suit/storage/toggle/labcoat/cmo
	spawn_blacklisted = TRUE	//no random command shit in maint

/obj/item/clothing/suit/storage/cyberjacket
	name = "crystaljacket"
	desc = "A stylish jacket featuring a proprietary liquid crystal liner that absorbs physical impacts exceptionally well. The liquid crystal layer also serves to provide a neat glow around the collar."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/jacket.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/suit/jacketmob.dmi'
	icon_state = "cyber"
	rarity_value = 6
	armor = list(
		melee = 25,
		bullet = 5,
		energy = 0,
		bomb = 5,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	style = STYLE_HIGH

/obj/item/clothing/suit/storage/cyberjacket/red
	icon_state = "cyber_red"

/obj/item/clothing/suit/storage/cyberjacket/blue
	icon_state = "cyber_blue"

/obj/item/clothing/suit/storage/cyberjacket/green
	icon_state = "cyber_green"

/obj/item/clothing/suit/storage/cyberjacket/black
	icon_state = "cyber_black"

/obj/item/clothing/suit/storage/cyberjacket/white
	icon_state = "cyber_white"

/obj/item/clothing/suit/storage/cyberjacket/punk
	icon_state = "cyber_punk"

/obj/item/clothing/suit/storage/cyberjacket/copper
	icon_state = "cyber_copper"

/obj/item/clothing/suit/storage/solgov
	icon = 'zzzz_modular_occulus/icons/inventory/suit/solgovicon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/suit/solgovmob.dmi'

/obj/item/clothing/suit/storage/solgov/dressnco
	name = "solgov NCO dress unfirom"
	icon_state = "whitedress_snco"
	item_state = "whitedress_snco"

/obj/item/clothing/suit/storage/solgov/wo
	name = "solgov Warrent Officer dress uniform"
	icon_state = "whitedress_wo"
	item_state = "whitedress_wo"

/obj/item/clothing/suit/storage/solgov/ltcdr
	name = "solgov Officer dress uniform"
	icon_state = "whitedress_comm"
	item_state = "whitedress_comm"

/obj/item/clothing/suit/space/captain
	name = "captain's armor"
	desc = "A black jacket, white shirt, and grey pants with black boots. Affixed to the chest is a small pin. The whole outfit hums quietly."
	icon_state = "caparmor"
	icon = 'zzzz_modular_occulus/icons/inventory/suit/captain.dmi'
	icon_override = 'zzzz_modular_occulus/icons/mob/suit.dmi'
	item_state = "caparmor"
	armor = list(melee = 50,
		bullet = 40,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 50)
/*var/current_charges = 3 //held number of charges
	var/max_charges = 3 //max number of charges
	var/recharge_delay = 200 // time after damage before recharge, 20 seconds at 200
	var/recharge_cooldown = 0 //time since last been shot
	var/recharge_rate = 1 //How fast shield charges once it's started
	var/shield_state = "shield"
	var/shield_on = "shield"
	sprite_sheets = null //what does this mean radiant?

/obj/item/clothing/suit/space/captain/shielded/hit_reaction(mob/living/carbon/human/owner, attack_text)
	if(current_charges > 0)
		do_sparks(2, 1, src)
		owner.visible_message("<span class='danger'>[owner]'s shields deflect [attack_text] in a shower of sparks!</span>")
		current_charges--
		recharge_cooldown = world.time + recharge_delay
		processing_objects |= src
		if (current_charges <= 0)
			owner.visible_message("[owner]'s shield overloads, flickering off!")
			shield_state = "broken"
			owner.update_inv_wear_suit()
		return 1
	return 0

/obj/item/clothing/suit/space/captain/Destroy()
	processing_objects.Remove(src)
	return ..()

/obj/item/clothing/suit/space/captain
	if(world.time > recharge_cooldown && current_charges < max_charges)
		current_charges = Clamp((current_charges + recharge_rate), 0, max_charges)
		playsound(loc, 'sound/magic/charge.ogg', 50, 1)
		if(current_charges == max_charges)
			playsound(loc, 'sound/machines/ding.ogg', 50, 1) //change this to something less microwavey?
			processing_objects.Remove(src)
		shield_state = "[shield on]"
		if(istype(loc, /mob/living/carbon/human))
			var/mob/living/carbon/human/C = loc
			C.update_inv_wear_suit() */ // Commenting this out until we can figure out how to do this in this codebase. It's here to modify for later./
										// technically it's supposed to be some kind of charging armor system for 3 invincible charges but my brain is a potato and I don't know how to do it.