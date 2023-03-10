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
	tank = /obj/item/tank/jetpack/oxygen
	boots = /obj/item/clothing/shoes/magboots

/obj/item/clothing/suit/storage/toggle/labcoat/cmo
	spawn_blacklisted = TRUE	//no random command shit in maint

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
	desc = "A dress uniform worn by members of the solgov navy. Typically at formal events."

/obj/item/clothing/suit/storage/solgov/wo
	name = "solgov Warrent Officer dress uniform"
	icon_state = "whitedress_wo"
	item_state = "whitedress_wo"
	desc = "A dress uniform worn by members of the solgov navy. Typically at formal events. This one is styled in warrent officer colors."

/obj/item/clothing/suit/storage/solgov/ltcdr
	name = "solgov Officer dress uniform"
	icon_state = "whitedress_comm"
	item_state = "whitedress_comm"
	desc = "A dress uniform worn by members of the solgov navy. Typically at formal events. This one is styled in officer colors."

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

/obj/item/clothing/suit/storage/vest/merc/ees //Merc path because it has more storage
	name = "\improper EES Safety Harness"
	desc = "A heavy duty set of harnesses and pouches. Carries twice the amount of items that standard armor does. Produced exclusively for Einstein Engineering Solutions."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/icon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/suit/mob.dmi'
	icon_state = "ees"
	item_state = "armor_engineering"
	armor = list(
		melee = 20,
		bullet = 15,
		energy = 20,
		bomb = 10,
		bio = 0,
		rad = 30
	) //Sacrifices armor for more storage, also no arms coverage
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	item_flags = DRAG_AND_DROP_UNEQUIP
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0
	price_tag = 600
	rarity_value = 60
	style = STYLE_NEG_LOW

/obj/item/clothing/suit/storage/cyberjacket
	name = "crystaljacket"
	desc = "A stylish jacket featuring a proprietary liquid crystal liner that absorbs physical impacts exceptionally well. The liquid crystal layer also serves to provide a neat glow around the collar."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/jacket.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/suit/jacketmob.dmi'
	icon_state = "cyber"
	rarity_value = 6
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	style = STYLE_HIGH

/obj/item/clothing/suit/storage/cyberpunksleek
	desc = "A sleek overcoat made of neo-laminated fabric designed to repel energy weapons. It has an association with upper-class mobsters and gangs."
	armor = list(
		melee = 10,
		bullet = 10,
		energy = 20,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/cyberpunksleek_long
	desc = "A long overcoat made of neo-laminated fabric designed to repel energy weapons. It has an association with upper-class mobsters and gangs."
	armor = list(
		melee = 10,
		bullet = 10,
		energy = 20,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/toggle/bomber
		armor = list(
		melee = 15,
		bullet = 10,
		energy = 15,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/casah //Merc path because it has more storage
	name = "\improper CAS Assault Harness"
	desc = "A heavy duty set of harnesses and pouches attached to a protective plate. Sacrifices some plating for utility."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/icon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/suit/mob.dmi'
	icon_state = "casah"
	item_state = "casah"
	armor = list(
		melee = 25,
		bullet = 20,
		energy = 25,
		bomb = 10,
		bio = 0,
		rad = 0
	) //Sacrifices armor for more storage, also no arms coverage
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	item_flags = DRAG_AND_DROP_UNEQUIP
	heat_protection = UPPER_TORSO|LOWER_TORSO
	price_tag = 600
	rarity_value = 80


/obj/item/clothing/suit/storage/casah/New()
	..()
	pockets = new/obj/item/storage/internal(src)
	pockets.storage_slots = 3	//three
	pockets.max_w_class = ITEM_SIZE_SMALL		//fit only pocket sized items
	pockets.max_storage_space = 4

/obj/item/clothing/suit/storage/casah/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Assault Harness"] = "casah"
	options["Webbed Vest"] = "webvest_ironhammer"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(choice == "Webbed Vest")
		icon = 'icons/inventory/suit/icon.dmi'
		icon_override = 'icons/inventory/suit/mob.dmi'
	else
		icon = 'zzzz_modular_occulus/icons/inventory/suit/icon.dmi'
		icon_override = 'zzzz_modular_occulus/icons/inventory/suit/mob.dmi'

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/armor/vest/full/blueshield
	name = "\improper Guardian Tactical Vest"
	desc = "An intricately designed suit of armor made to be as light as possible while still providing full coverage protection. Typically used by bodyguards escorting clients through high risk areas."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/icon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/inventory/suit/mob.dmi'
	icon_state = "blueshield_armor"
	item_state = "blueshield_armor"
	slowdown = 0
	rarity_value = 40 // rarer than just full vests
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS // kneepads and shoulderpads, so it covers arms and legs
	armor = list(
		melee = 30,
		bullet = 30,
		energy = 25,
		bomb = 10,
		bio = 0,
		rad = 0
	)
