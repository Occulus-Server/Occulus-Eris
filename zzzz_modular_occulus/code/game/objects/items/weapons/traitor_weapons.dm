/obj/item/twohanded/garrote // 12TC traitor item
	name = "fiber wire"
	desc = "A length of razor-thin wire with an elegant wooden handle on either end.<br>You suspect you'd have to be behind the target to use this weapon effectively."
	icon = 'zzzz_Modular_occulus/icons/obj/weapons.dmi'
	icon_state = "garrot_wrap"
	w_class = ITEM_SIZE_TINY
	var/mob/living/carbon/human/strangling
	var/improvised = 0
	var/garrote_time

/obj/item/twohanded/garrote/Destroy()
	strangling = null
	return ..()

/mob/living/proc/grabbedby(mob/living/carbon/user, supress_message = FALSE)
	if(user == src || anchored)
		return 0
	if(!(status_flags & CANPUSH))
		return 0

	for(var/obj/item/weapon/grab/G in grabbed_by)
		if(G.assailant == user)
			to_chat(user, "<span class='notice'>You already grabbed [src].</span>")
			return


	var/obj/item/weapon/grab/G = new /obj/item/weapon/grab(user, src)
	if(buckled)
		to_chat(user, "<span class='notice'>You cannot grab [src]; they are buckled in!</span>")
	if(!G)	//the grab will delete itself in New if src is anchored
		return 0
	user.put_in_active_hand(G)
	G.synch()
	LAssailant = user

	playsound(src.loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
	if(!supress_message)
		visible_message("<span class='warning'>[user] has grabbed [src] passively!</span>")

	return G


/obj/item/twohanded/garrote/update_icon()
	if(strangling) // If we're strangling someone we want our icon to stay wielded
		icon_state = "garrot_unwrap"
		return

	icon_state = "garrot_[wielded ? "un" : ""]wrap"

/obj/item/twohanded/garrote/improvised // Made via tablecrafting
	name = "garrote"
	desc = "A length of cable with a shoddily-carved wooden handle tied to either end.<br>You suspect you'd have to be behind the target to use this weapon effectively."
	icon_state = "garrot_I_wrap"
	improvised = 1

/obj/item/twohanded/garrote/improvised/update_icon()
	if(strangling)
		icon_state = "garrot_I_unwrap"
		return

	icon_state = "garrot_I_[wielded ? "un" : ""]wrap"

/obj/item/twohanded/garrote/wield(mob/living/carbon/user)
	if(strangling)
		user.visible_message("<span class='info'>[user] removes the [src] from [strangling]'s neck.</span>", \
				"<span class='warning'>You remove the [src] from [strangling]'s neck.</span>")

		strangling = null
		update_icon()
		STOP_PROCESSING(SSobj, src)

	else
		..()

/obj/item/twohanded/garrote/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(garrote_time > world.time) // Cooldown
		return

	if(!istype(user, /mob/living/carbon/human)) // swap_hand is a proc of /mob/living, user is simply /mob
		return

	var/mob/living/carbon/human/U = user

	if(wielded)
		to_chat(user, "<span class = 'warning'>You must use both hands to garrote [M]!</span>")
		return

	if(!istype(M, /mob/living/carbon/human))
		to_chat(user, "<span class = 'warning'>You don't think that garroting [M] would be very effective...</span>")
		return

	if(M.dir != U.dir)
		to_chat(user, "<span class='warning'>You cannot use [src] on [M] from that angle!</span>")
		return

	if(improvised && (M.targeted_organ == BP_HEAD && length(user.get_covering_equipped_items(HEAD))) || (M.wear_mask && (M.targeted_organ == BP_MOUTH))) // Improvised garrotes are blocked by mouth-covering items.
		to_chat(user, "<span class = 'warning'>[M]'s neck is blocked by something they're wearing!</span>")

	if(strangling)
		to_chat(user, "<span class = 'warning'>You cannot use [src] on two people at once!</span>")
		return

	unwield(U)
	U.swap_hand() // For whatever reason the grab will not properly work if we don't have the free hand active.
	var/obj/item/weapon/grab/G = M.grabbedby(U, 1)
	U.swap_hand()
	if(G && istype(G))
		if(improvised) // Improvised garrotes start you off with a passive grab, but keep you stunned like an agressive grab.
			M.Stun(1)
		else
			G.state = GRAB_NECK
			G.hud.icon_state = "kill"
			G.hud.name = "kill"
			M.silent = max(M.silent, 10)

	garrote_time = world.time + 10
	START_PROCESSING(SSobj, src)
	strangling = M
	update_icon()

	playsound(src.loc, 'sound/weapons/cablecuff.ogg', 15, 1, -1)

	M.visible_message("<span class='danger'>[U] comes from behind and begins garroting [M] with the [src]!</span>", \
				  "<span class='userdanger'>[U] begins garroting you with the [src]![improvised ? "" : " You are unable to speak!"]</span>", \
				  "You hear struggling and wire strain against flesh!")

	return

/obj/item/twohanded/garrote/Process()
	if(!strangling)
		// Our mark got gibbed or similar
		update_icon()
		STOP_PROCESSING(SSobj, src)
		return


	if(!istype(loc, /mob/living/carbon/human))
		strangling = null
		update_icon()
		STOP_PROCESSING(SSobj, src)
		return

	var/mob/living/carbon/human/user = loc
	var/obj/item/weapon/grab/G

	if(src == user.r_hand && istype(user.l_hand, /obj/item/weapon/grab))
		G = user.l_hand

	else if(src == user.l_hand && istype(user.r_hand, /obj/item/weapon/grab))
		G = user.r_hand

	else
		user.visible_message("<span class='warning'>[user] loses their grip on [strangling]'s neck.</span>", \
				 "<span class='warning'>You lose your grip on [strangling]'s neck.</span>")

		strangling = null
		update_icon()
		STOP_PROCESSING(SSobj, src)

		return

	if(!G.affecting)
		user.visible_message("<span class='warning'>[user] loses their grip on [strangling]'s neck.</span>", \
				"<span class='warning'>You lose your grip on [strangling]'s neck.</span>")

		strangling = null
		update_icon()
		STOP_PROCESSING(SSobj, src)

		return

	if(G.state < GRAB_NECK) // Only possible with improvised garrotes, essentially this will stun people as if they were aggressively grabbed. Allows for resisting out if you're quick, but not running away.
		strangling.Stun(3)

	if(improvised)
		strangling.stuttering = max(strangling.stuttering, 3)
		strangling.apply_damage(2, OXY, "head")
		return


	strangling.silent = max(strangling.silent, 10) // Non-improvised effects
	strangling.apply_damage(4, OXY, "head")

/obj/item/weapon/pen/edagger
	icon = 'zzzz_modular_occulus/icons/obj/weapons.dmi'
	origin_tech = "combat=3;syndicate=1"
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut") //these wont show up if the pen is off
	sharp = 0
	var/on = 0
	var/brightness_on = 2
	light_color = "#B40000"

/obj/item/weapon/pen/edagger/attack_self(mob/living/user)
	if(on)
		on = 0
		force = initial(force)
		sharp = 0
		w_class = initial(w_class)
		name = initial(name)
		hitsound = initial(hitsound)
		embed_mult = initial(embed_mult)
		throwforce = initial(throwforce)
		playsound(user, 'sound/weapons/saberoff.ogg', 5, 1)
		to_chat(user, "<span class='warning'>[src] can now be concealed.</span>")
		set_light(0)
	else
		on = 1
		force = 18
		sharp = 1
		w_class = ITEM_SIZE_NORMAL
		name = "energy dagger"
		hitsound = 'sound/weapons/blade1.ogg'
		embed_mult = 40 //rule of cool
		throwforce = 35
		playsound(user, 'sound/weapons/saberon.ogg', 5, 1)
		to_chat(user, "<span class='warning'>[src] is now active.</span>")
		set_light(brightness_on, 1)
	update_icon()

/obj/item/weapon/pen/edagger/update_icon()
	if(on)
		icon_state = "epen"
		item_state = "epen"
	else
		icon_state = initial(icon_state) //looks like a normal pen when off.
		item_state = initial(item_state)
