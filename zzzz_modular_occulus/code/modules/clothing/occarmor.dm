//Occultist Armor Set
/obj/item/clothing/suit/space/occultist //In line with the syndicate spacesuit except not able to be taken off. Maybe give it some other bonuses too?
	name = "occult robes"
	icon_state = "armor"
	item_state = "armor"
	icon = 'zzzz_modular_occulus/icons/obj/occultist/occicon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/obj/occultist/occmob.dmi'
	desc = "Of a plated, armored robe worn, set fabric of black. At reflects impossible it angles."
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_OCLOTHING
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL
	canremove = 0
	matter = list(MATERIAL_STEEL = 10, MATERIAL_A_CUBE_WITH_SEVEN_SIDES = 7, MATERIAL_LEATHER = 5)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS //It has gloves, hood, and shoes for the rest of them
	slowdown = 0.3 //Slightly faster than the red suit. Maybe do it at 0.2?
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 30,
		bio = 100,
		rad = 50
	) //These are the same stats as the blood red hardsuit.
	siemens_coefficient = 0.4
	can_breach = FALSE //This can't be taken off so we don't want it breaching.
	supporting_limbs = list()
	flags_inv = HIDEJUMPSUIT|HIDETAIL //Removed hide shoes and gloves because we want this so that you can see the shoes and stuff while keeping the spacesuit tags. Yes this is terrible, no there isn't a better way.
	spawn_blacklisted = TRUE
	//var/list/supporting_limbs = list(


/obj/item/clothing/head/space/occulthood
	name = "occult hood"
	icon_state = "hood"
	item_state = "hood"
	icon = 'zzzz_modular_occulus/icons/obj/occultist/occicon.dmi'
	icon_override = 'zzzz_modular_occulus/icons/obj/occultist/occmob.dmi'
	desc = "Fabric, made void-black of hood. Bigger the inside outside than the."
	slot_flags = SLOT_HEAD
	canremove = 0
	matter = list(MATERIAL_STEEL = 5, MATERIAL_THEY_WAIT_IN_THE_SHADOWS = 9, MATERIAL_GLASS = 10)
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.4
	ear_protection = 1
	spawn_blacklisted = TRUE
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT

	action_button_name = "Toggle Light" //reflavor this so I can make it purple to go in line with the guns - Sigma
	light_overlay = "helmet_light_occult" //Sadly this has to go in icons/obj/light_overlays because I can't figure out how to point it to a different one.
										  //Currently it's located in the icons/obj/light_overlays folder, proc is at /obj/item/clothing/head/on_update_icon(mob/user) -Sigma

/obj/item/clothing/head/space/occulthood/attack_self(mob/user) //Reflavoring because this is light from a place that does not know it.
	if(brightness_on)
		if(!isturf(user.loc))
			to_chat(user, "Your hood cannot hear you while it is in this [user.loc]")
			return
		on = !on
		to_chat(user, "With a whisper in a langauge that should not be, you [on ? "enkindle" : "extinguish"] the hood's unnatural light.")
		update_occult_flashlight(user)
	else
		return ..(user)

/obj/item/clothing/head/space/occulthood/proc/update_occult_flashlight(mob/user = null)
	if(on && !light_applied)
		set_light(brightness_on, l_color = "#5B0E4F")
		light_applied = 1
	else if(!on && light_applied)
		set_light(0)
		light_applied = 0
	update_icon(user)
	user.update_action_buttons()


/obj/item/clothing/gloves/occultgloves //We want them to not be snippable. Maybe make it some kind of rigsuit?
	name = "occult gloves"
	desc = "Plated and hand fabric protect those from little know. Is your reflection wrong."
	icon = 'zzzz_modular_occulus/icons/obj/occultist/occicon.dmi'
	item_state = "gloves"
	icon_state = "gloves"
	icon_override = 'zzzz_modular_occulus/icons/obj/occultist/occmob.dmi'
	slot_flags = SLOT_GLOVES
	siemens_coefficient = 1 //Insulated! You can't take them off so I don't think it's an issue.
	canremove = 0
	matter = list(MATERIAL_LEATHER = 10, MATERIAL_SPACE_IS_HUNGRY = 8, MATERIAL_STEEL = 2)
	spawn_blacklisted = TRUE
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT //make these like spacesuit so it can be a real spacesuit

/obj/item/clothing/gloves/occultgloves/attackby(obj/item/W, mob/user) //Overwrite the gloves clip proc because we don't want these clipped off at all.
	if(istype(W, /obj/item/tool/wirecutters) || istype(W, /obj/item/tool/scalpel)) //Same check as normal gloves.
		to_chat(user, SPAN_NOTICE("Your tool bends away from the [src] impossibly.")) //These are made of something that shouldn't exist, no snip for you. Using [src] for later modularness.

/obj/item/clothing/shoes/occultgreaves
	name = "occult greaves"
	desc = "Greaves protect to legs feet and. Be not fabric should this."
	icon = 'zzzz_modular_occulus/icons/obj/occultist/occicon.dmi'
	item_state = "shoes"
	icon_state = "shoes"
	icon_override = 'zzzz_modular_occulus/icons/obj/occultist/occmob.dmi'
	slot_flags = SLOT_FEET
	canremove = 0
	matter = list(MATERIAL_STEEL = 6, MATERIAL_BEQUIETITWILLHEARYOU = 1, MATERIAL_LEATHER = 3)
	armor = list(
		melee = 35,
		bullet = 35,
		energy = 35,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|NOSLIP //make these like spacesuit so it can be a real spacesuit
	spawn_blacklisted = TRUE //These shouldn't be a random spawn
