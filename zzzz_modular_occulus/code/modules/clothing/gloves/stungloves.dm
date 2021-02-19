/obj/item/clothing/gloves/stungloves/makeshift //STUNGLOVES RETURN! MUAAHAHAHAHAHAHA!
	name = "Modified Insulated Gloves"
	desc = "These type of gloves will normally protect the wearer from electric shock. This pair appears to have been modified beyond repair with a set of wires, and a cell port."
	icon = 'zzzz_modular_occulus/icons/inventory/hands/gloves.dmi'
	icon_state = "stunglove"
	item_state = "stunglove"
	icon_override = 'zzzz_modular_occulus/icons/mob/gloves.dmi'
	action_button_name = "Toggle Stun Glove"
	price_tag = 100
	rarity_value = 30
	//siemens_coefficient = 1 Jamini Edit: Original stungloves didn't protect you from shocks as a balance concern. Additionally adding wiring to conduct electricity would probably make your glove armor less effective
	stunforce = 0
	agonyforce = 15 //Maint gremlins not as good as Aegis. Glove stuns at over 100 Halloss. Req 7 consequetive hits to knock unconscious at 15 agony.
	suitable_cell = /obj/item/weapon/cell/medium
	status = FALSE		//whether the thing is on or not
	hitcost = 85		//power cost. Makeshift uses less power, due to shoddy craftsmanship. Jamini: Shouldn't this be more? Most makeshift things are less effecient
	var/icon_state_active = "stunglove_active"

/obj/item/clothing/gloves/stungloves/makeshift/update_icon()
	if(status)
		icon_state = icon_state_active
	else
		icon_state = icon_state
	update_wear_icon()

	if(ismob(usr))
		usr.update_action_buttons()

/obj/item/clothing/gloves/stungloves/makeshift/examine(mob/user)
	if(cell)
		to_chat(user, SPAN_NOTICE("Stun Glove is [round(cell.percent())]% charged."))
	else
		to_chat(user, SPAN_WARNING("Stun Glove does not have a power source installed."))

/obj/item/clothing/gloves/stungloves/makeshift/Touch(mob/living/L, var/proximity)
	if(!status)
		return FALSE
	if(!istype(L) || !proximity)
		return ..()
	if(isrobot(L))
		return ..()

	var/mob/living/user = loc
	var/agony = agonyforce
	var/stun = stunforce
	var/obj/item/organ/external/affecting = null
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		affecting = H.get_organ(user.targeted_organ)

	//stun effects
	if(affecting)
		L.visible_message(SPAN_DANGER("[L] has been shocked in the [affecting.name] with [src] by [user]!")) //Not punching. SHOCKING!
	else
		L.visible_message(SPAN_DANGER("[L] has been shocked with [src] by [user]!"))
	playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)

	if(deductcharge(hitcost))
		L.stun_effect_act(stun, agony, user.targeted_organ, src)
		msg_admin_attack("[key_name(user)] stunned [key_name(L)] with the [src].")
		user.attack_log += "\[[time_stamp()]\] <font color='red'>Stunned [key_name(L)] with [src]</font>"
		L.attack_log += "\[[time_stamp()]\] <font color='orange'>Was stunned by [key_name(L)] with [src]</font>"

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.forcesay(hit_appends)
