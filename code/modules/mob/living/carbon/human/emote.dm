/mob/living/carbon/human/emote(var/act,var/m_type=1,var/message = null)
	var/param = null

	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	var/muzzled = istype(src.wear_mask, /obj/item/clothing/mask/muzzle) || istype(src.wear_mask, /obj/item/grenade)
	//var/m_type = 1

	for (var/obj/item/implant/I in src)
		if (I.implanted)
			I.trigger(act, src)

	if(src.stat == 2.0 && (act != "deathgasp"))
		return

	var/cloud_emote = ""

	switch(act)
		if ("airguitar")
			if (!src.restrained())
				message = "is strumming the air and headbanging like a safari chimp."
				m_type = 1

		if ("blink")
			message = "blinks."
			m_type = 1

		if ("blink_r")
			message = "blinks rapidly."
			m_type = 1

		if ("bow")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "bows to [param]."
				else
					message = "bows."
			m_type = 1

		if ("custom")
			var/input = sanitize(input("Choose an emote to display.") as text|null)
			if (!input)
				return
			var/input2 = input("Is this a visible or hearable emote?") in list("Visible","Hearable")
			if (input2 == "Visible")
				m_type = 1
			else if (input2 == "Hearable")
				if (src.miming)
					return
				m_type = 2
			else
				alert("Unable to use this emote, must be either hearable or visible.")
				return
			return custom_emote(m_type, message)

		if ("me")

			//if(silent && silent > 0 && findtext(message,"\"",1, null) > 0)
			//	return //This check does not work and I have no idea why, I'm leaving it in for reference.

			if (src.client)
				if (client.prefs.muted & MUTE_IC)
					to_chat(src, "\red You cannot send IC messages (muted).")
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if (stat)
				return
			if(!(message))
				return
			return custom_emote(m_type, message)

		if("pain")
			if(!message)
				if(miming)
					message = "appears to be in pain!"
					m_type = 1 // Can't we get defines for these?
				else
					message = "twists in pain."
					m_type = 1

			cloud_emote = "cloud-pain"

		if ("salute")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "salutes to [param]."
				else
					message = "salutes."
			m_type = 1

		if ("choke")
			if(miming)
				message = "clutches [gender_datums[src.identifying_gender].his] throat desperately!" // OCCULUS EDIT - adjusting for gender rework
				m_type = 1
			else
				if (!muzzled)
					message = "chokes!"
					m_type = 2
				else
					message = "makes a strong noise."
					m_type = 2

		if ("clap")
			if (!src.restrained())
				message = "claps."
				m_type = 2
				if(miming)
					m_type = 1
		if ("flap")
			if (!src.restrained())
				message = "flaps [gender_datums[src.identifying_gender].his] wings." // OCCULUS EDIT - adjusting for gender rework
				m_type = 2
				if(miming)
					m_type = 1

		if ("aflap")
			if (!src.restrained())
				message = "flaps [gender_datums[src.identifying_gender].his] wings ANGRILY!" // OCCULUS EDIT - adjusting for gender rework
				m_type = 2
				if(miming)
					m_type = 1

		if ("drool")
			message = "drools."
			m_type = 1

		if ("eyebrow")
			message = "raises an eyebrow."
			m_type = 1

		if ("chuckle")
			if(miming)
				message = "appears to chuckle."
				m_type = 1
			else
				if (!muzzled)
					message = "chuckles."
					m_type = 2
				else
					message = "makes a noise."
					m_type = 2

		if ("twitch")
			message = "twitches violently."
			m_type = 1

		if ("twitch_s")
			message = "twitches."
			m_type = 1

		if ("faint")
			message = "faints."
			if(src.sleeping)
				return //Can't faint while asleep
			src.sleeping += 10 //Short-short nap
			m_type = 1

		if ("cough")
			if(miming)
				message = "appears to cough!"
				m_type = 1
			else
				if (!muzzled)
					message = "coughs!"
					m_type = 2
				else
					message = "makes a strong noise."
					m_type = 2

		if ("frown")
			message = "frowns."
			m_type = 1

		if ("nod")
			message = "nods."
			m_type = 1

		if ("blush")
			message = "blushes."
			m_type = 1

		if ("wave")
			message = "waves."
			m_type = 1

		if ("gasp")
			if(miming)
				message = "appears to be gasping!"
				m_type = 1
			else
				if (!muzzled)
					message = "gasps!"
					m_type = 2
				else
					message = "makes a weak noise."
					m_type = 2
			cloud_emote = "cloud-gasp"

		if ("deathgasp")
			if(stats.getPerk(PERK_TERRIBLE_FATE))
				message = "their inert body emits a strange sensation and a cold invades your body. Their screams before dying recount in your mind."
			else
				message = "[species.death_message]"
			m_type = 1

		if ("giggle")
			if(miming)
				message = "giggles silently!"
				m_type = 1
			else
				if (!muzzled)
					message = "giggles."
					m_type = 2
				else
					message = "makes a noise."
					m_type = 2

		if ("glare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "glares at [param]."
			else
				message = "glares."

		if ("stare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "stares at [param]."
			else
				message = "stares."

		if ("look")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break

			if (!M)
				param = null

			if (param)
				message = "looks at [param]."
			else
				message = "looks."
			m_type = 1

		if ("grin")
			message = "grins."
			m_type = 1

		if ("cry")
			if(miming)
				message = "cries."
				m_type = 1
			else
				if (!muzzled)
					message = "cries."
					m_type = 2
				else
					message = "makes a weak noise. [gender_datums[src.identifying_gender].his] [src.identifying_gender == "gender neutral (they/them)" ? "frown" : "frowns"]." // OCCULUS EDIT - adjusting for gender rework
					m_type = 2

		if ("sigh")
			if(miming)
				message = "sighs."
				m_type = 1
			else
				if (!muzzled)
					message = "sighs."
					m_type = 2
				else
					message = "makes a weak noise."
					m_type = 2

		if ("laugh")
			if(miming)
				message = "acts out a laugh."
				m_type = 1
			else
				if (!muzzled)
					message = "laughs."
					m_type = 2
					if(gender != MALE)//Occulus Edit: Cit laughs
						playsound(src, 'zzzz_modular_occulus/sound/voice/womanlaugh.ogg', 50, 1, -1)//Occulus Edit: Cit laughs
					else//Occulus Edit: Cit laughs
						playsound(src, pick('zzzz_modular_occulus/sound/voice/manlaugh1.ogg','zzzz_modular_occulus/sound/voice/manlaugh2.ogg'), 50, 1, -1)//Occulus Edit: Cit laughs
				else
					message = "makes a noise."
					m_type = 2

		if ("mumble")
			message = "mumbles!"
			m_type = 2
			if(miming)
				m_type = 1

		if ("grumble")
			if(miming)
				message = "grumbles!"
				m_type = 1
			if (!muzzled)
				message = "grumbles!"
				m_type = 2
			else
				message = "makes a noise."
				m_type = 2

		if ("groan")
			if(miming)
				message = "appears to groan!"
				m_type = 1
			else
				if (!muzzled)
					message = "groans!"
					m_type = 2
				else
					message = "makes a loud noise."
					m_type = 2

		if ("moan")
			if(miming)
				message = "appears to moan!"
				m_type = 1
			else
				message = "moans!"
				m_type = 2

		if ("johnny")
			var/M
			if (param)
				M = param
			if (!M)
				param = null
			else
				if(miming)
					message = "takes a drag from a cigarette and blows \"[M]\" out in smoke."
					m_type = 1
				else
					message = "says, \"[M], please. He had a family.\" [src.name] takes a drag from a cigarette and blows his name out in smoke."
					m_type = 2

		if ("point")
			if (!src.restrained())
				var/mob/M = null
				if (param)
					for (var/atom/A as mob|obj|turf|area in view(null, null))
						if (param == A.name)
							M = A
							break

				if (!M)
					message = "points."
				else
					pointed(M)

				if (M)
					message = "points to [M]."
				else
			m_type = 1

		if ("raise")
			if (!src.restrained())
				message = "raises a hand."
			m_type = 1

		if("shake")
			message = "shakes [gender_datums[src.identifying_gender].his] head." // OCCULUS EDIT - adjusting for gender rework
			m_type = 1

		if ("shrug")
			message = "shrugs."
			m_type = 1

		if ("signal")
			if (!src.restrained())
				var/t1 = round(text2num(param))
				if (isnum(t1))
					if (t1 <= 5 && (!src.r_hand || !src.l_hand))
						message = "raises [t1] finger\s."
					else if (t1 <= 10 && (!src.r_hand && !src.l_hand))
						message = "raises [t1] finger\s."
			m_type = 1

		if ("smile")
			message = "smiles."
			m_type = 1

		if ("shiver")
			message = "shivers."
			m_type = 2
			if(miming)
				m_type = 1

		if ("pale")
			message = "goes pale for a second."
			m_type = 1

		if ("tremble")
			message = "trembles in fear!"
			m_type = 1

		if ("sneeze")
			if (miming)
				message = "sneezes."
				m_type = 1
			else
				if (!muzzled)
					message = "sneezes."
					m_type = 2
				else
					message = "makes a strange noise."
					m_type = 2

		if ("sniff")
			message = "sniffs."
			m_type = 2
			if(miming)
				m_type = 1

		if ("snore")
			if (miming)
				message = "sleeps soundly."
				m_type = 1
			else
				if (!muzzled)
					message = "snores."
					m_type = 2
				else
					message = "makes a noise."
					m_type = 2

		if ("whimper")
			if (miming)
				message = "appears hurt."
				m_type = 1
			else
				if (!muzzled)
					message = "whimpers."
					m_type = 2
				else
					message = "makes a weak noise."
					m_type = 2

		if ("wink")
			message = "winks."
			m_type = 1

		if ("yawn")
			if (!muzzled)
				message = "yawns."
				m_type = 2
				if(miming)
					m_type = 1

		if ("collapse")
			Paralyse(2)
			message = "collapses!"
			m_type = 2
			if(miming)
				m_type = 1

		if("hug")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					message = "hugs [M]."
				else
					message = "hugs [gender_datums[src.identifying_gender].himself]." // OCCULUS EDIT - adjusting for gender rework

		if ("handshake")
			m_type = 1
			if (!src.restrained() && !src.r_hand)
				var/mob/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					if (M.canmove && !M.r_hand && !M.restrained())
						message = "shakes hands with [M]."
					else
						message = "holds out [gender_datums[src.identifying_gender].his] hand to [M]." // OCCULUS EDIT - adjusting for gender rework

		if("dap")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M)
					message = "gives daps to [M]."
				else
					message = "sadly can't find anybody to give daps to, and daps [gender_datums[src.identifying_gender].himself]. Shameful." // OCCULUS EDIT - adjusting for gender rework

		if ("scream")
			if (miming)
				message = "acts out a scream!"
				m_type = 1
			else
				if (!muzzled)
					message = "screams!"
					m_type = 2
				else
					message = "makes a very loud noise."
					m_type = 2
			cloud_emote = "cloud-scream"

///////////// OCCULUS EDIT START - Fun emotes!

		if("snap")
			m_type = 2
			var/mob/living/carbon/human/H = src
			var/obj/item/organ/external/L = H.get_organ("l_hand")
			var/obj/item/organ/external/R = H.get_organ("r_hand")
			var/left_hand_good = 0
			var/right_hand_good = 0
			if(L && (!(L.status & ORGAN_DESTROYED)) && (!(L.status & ORGAN_SPLINTED)) && (!(L.status & ORGAN_BROKEN)))
				left_hand_good = 1
			if(R && (!(R.status & ORGAN_DESTROYED)) && (!(R.status & ORGAN_SPLINTED)) && (!(R.status & ORGAN_BROKEN)))
				right_hand_good = 1

			if(!left_hand_good && !right_hand_good)
				to_chat(usr, "You need at least one hand in good working order to snap your fingers.")
				return

			message = "snaps [gender_datums[src.identifying_gender].his] fingers." // OCCULUS EDIT - adjusting for gender rework
			playsound(src, 'zzzz_modular_occulus/sound/effects/fingersnap.ogg', 50, 1, -3)

		// Animal noises

		if("bark")
			message = "lets out a bark."
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/bark2.ogg', 50, 1, -1)
		if("bork")
			m_type = 2
			message = "lets out a bork."
			playsound(src, 'zzzz_modular_occulus/sound/voice/bork.ogg', 50, 1, -1)
		if ("mrow")
			m_type = 2
			message = "lets out a mrow."
			playsound(src, 'zzzz_modular_occulus/sound/voice/mrow.ogg', 50, 1, -1)
		if("hiss")
			message = "lets out a hiss."
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/hiss.ogg', 50, 1, -1)
		if("rattle")
			message = "rattles!"
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/rattle.ogg', 50, 1, -1)
		if("squeak")
			message = "lets out a squeak."
			m_type = 2
			playsound(src, 'sound/effects/mousesqueek.ogg', 50, 1, -1)
		if("baa")
			message = "lets out a baa."
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/baa.ogg', 50, 1, -1)
		if("bleat")
			message = "bleats."
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/baa2.ogg', 50, 1, -1)
		if("purr")
			message = "purrs."
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/cat_purr.ogg', 50, 1, -1)
		if("purrlong")
			message = "purrs."
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/cat_purr_long.ogg', 50, 1, -1)
		if("coyawoo")
			message = "lets out a howl!"
			m_type = 2
			var/soundpick = pick('zzzz_modular_occulus/sound/voice/coyoteawoo.ogg','zzzz_modular_occulus/sound/voice/coyoteawoo2.ogg', 'zzzz_modular_occulus/sound/voice/coyoteawoo3.ogg','zzzz_modular_occulus/sound/voice/coyoteawoo4.ogg','zzzz_modular_occulus/sound/voice/coyoteawoo5.ogg')
			playsound(src, soundpick, 50, 1, -1)
		if("foxbark")
			message = "lets out a foxy bark!"
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/foxbark.ogg', 50, 1, -1)
		if("gecker")
			message = "geckers!"
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/geck.ogg', 50, 1, -1)
		if("growl")
			message = "growls!"
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/growl.ogg', 50, 1, -1)
		if("yowl")
			message = "yowls!"
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/lynx.ogg', 50, 1, -1)
		if("merp")
			message = "merps."
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/merp.ogg', 50, 1, -1)
		if("weh")
			message = "wehs!"
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/weh_1.ogg', 50, 1, -1)
		if("wolfhowl")
			message = "howls!"
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/wolfhowl.ogg', 50, 1, -1)
		if("yap")
			message = "yaps!"
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/yap.ogg', 50, 1, -1)
		if("cackle")
			message = "cackles worryingly!"
			m_type = 2
			playsound(src, 'zzzz_modular_occulus/sound/voice/YeenCackle.ogg', 50, 1, -1)
///////////// OCCULUS EDIT END - Fun emotes!

		if ("help")
			to_chat(src, {"baa, bark, bleat,  blink, blink_r,blush, bork, bow-(none)/mob, burp, cackle, choke, chuckle,
clap, collapse, cough, coyawoo, cry, custom, deathgasp, drool, eyebrow,fastsway/qwag, foxbark,
frown, gasp, gecker, giggle, growl, groan, grumble, handshake, hiss, hug-(none)/mob,
glare-(none)/mob, grin, laugh, look-(none)/mob, merp, moan, mumble, mrow, nod, pale,
point-atom, purr, purrlong, raise, rattle, salute, shake, shiver, shrug, squeak, sigh,
signal-#1-10, smile, sneeze, sniff, snore, stare-(none)/mob, stopsway/swag, sway/wag, swish,
tremble, twitch, twitch_s, whimper, wink, wolfhowl, yawn, yap, yowl."})//Occulus Edit

		else
			to_chat(src, "\blue Unusable emote '[act]'. Say *help for a list.")





	if (message)
		log_emote("[name]/[key] : [message]")
		custom_emote(m_type, message)

	if(cloud_emote)
		var/image/emote_bubble = image('icons/mob/emote.dmi', src, cloud_emote, ABOVE_MOB_LAYER)
		flick_overlay(emote_bubble, clients, 30)
		QDEL_IN(emote_bubble, 3 SECONDS)


/mob/living/carbon/human/verb/pose()
	set name = "Set Pose"
	set desc = "Sets a description which will be shown when someone examines you."
	set category = "IC"

	if(suppress_communication)
		return FALSE

	pose =  sanitize(input(usr, "This is [src]. [gender_datums[src.identifying_gender].he] [src.identifying_gender == "gender neutral (they/them)" ? "are" : "is"]...", "Pose", null)  as text) // OCCULUS EDIT - adjusting for gender rework
