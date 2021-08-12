/area

	var/narrate //A text-based description of what this area is for.
	var/list/blurbed_stated_to = list() //This list of names is here to make sure we don't state our descriptive blurb to a person more than once.



/area/proc/do_area_blurb(var/mob/living/L)
	if(isnull(narrate))
		return

	if(L?.get_preference_value(/datum/client_preference/area_info_blurb) != GLOB.PREF_YES)
		return

	if(!(L.ckey in blurbed_stated_to))
		blurbed_stated_to += L.ckey
		to_chat(L, SPAN_NOTICE("[narrate]"))


/************
OKAY SO HERE'S HOW THIS WORKS

We have an area. When someone enters the area, it checks if this person has the preference enabled and if they haven't been in that area before. If both are false, it throws up a description.
The var is 'narrate'.

/area/eris/crew_quarters/bar
	name = "\improper Bar"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR
	narrate = "Reflective blue floors give the illusion of neon and glamour. The smell of alcohol is strong on the air. " < This is the important line.

ty ilu - bear
*/

/area/eris/crew_quarters/bar
	narrate = "Reflective blue floors give the illusion of neon and glamour. The smell of alcohol is strong on the air."

/area/eris/security/range
	name = "\improper Security - Firing Range"
	narrate = "The smell of gunpowder hovers in the air. Miniscule dents and pockets on the walls tell the story of past marksmanship."

/area/turret_protected/ai_upload
	narrate = "Cameras swivel to follow every single visible movement. The most costly room on the ship by a factor of ten."

/area/eris/crew_quarters/toilet/medbay
	narrate = "...It smells like piss."

/area/eris/maintenance/oldbridge
	narrate = "What used to be the bridge of a proud ship; now, a casket from which one stares longingly at the stars."

/area/eris/engineering/post
	narrate = "Stale air. It hurts to breathe. Nobody has been in here in a long time. Why are you?"

/area/eris/command/bridge
	narrate = "The full expanse of space lies before you, spread across the windows. Even at full power, the scanners fail to map even half of the dots of light making up the cosmic fillament."

/area/eris/crew_quarters/hydroponics/garden
	narrate = "There are shoeprints in the vegetation from folk coming and going. They used to grow flowers in here, she says."

/area/eris/command/courtroom
	narrate = "Maritime law only applies if you have the authority to enforce it. You find the authority here."

/area/eris/quartermaster/hangarsupply
	narrate = "The floors in the hangar are scuffed from the passage of countless technicians, crates, and boxes."

/area/eris/maintenance/section4deck4central
	narrate = "The constant trudge of boots on bare decking. The echos of bullets and traps in the side passages. A bit of light, but for how long?"

/area/eris/maintenance/section3deck5starboard
	narrate = "The crunch and whir of machinery scream the room's purpose. This is where old things go to die, and new materials are born again."