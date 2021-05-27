/datum/power/occultist
	var/madnesscost = 10 // Cost for the occultist to evolve this power.
	var/activecost = 0
	var/verbpath //the verb we add if we add a verb

/datum/power/occultist/proc/addPower(var/mob/living/carbon/human/themaster)
	to_chat(themaster, "DEBUG. Adding: [src] to the occultist")

// T1 Powers

/datum/power/occultist/glassification
	name = "Glassification"
	desc = "Forces the user to suffer a glassification breakdown"
	verbpath = /mob/living/carbon/human/proc/Glassification

/mob/living/carbon/human/proc/Glassification()
	set category = "Occultist"
	set desc = "Pierce the veil"

	sanity.level = 20
	sanity.breakdown_time = world.time + SANITY_COOLDOWN_BREAKDOWN
	sanity.breakdowns += new /datum/breakdown/negative/glassification()

/datum/power/occultist/voidmother_embrace
	name = "Embrace of the Voidmother"
	desc = "Permanently boosts your positive breakdown chance by 20%"

/datum/power/occultist/voidmother_embrace/addPower(var/mob/living/carbon/human/themaster)
	themaster.sanity.positive_prob += 20
	..()

/datum/power/occultist/riteofhealing
	name = "Rite of Healing"
	desc = "Heals you fully, at cost of a great deal of pain."
	verbpath = /mob/living/carbon/human/proc/RiteofHealing

/mob/living/carbon/human/proc/RiteofHealing()
	set category = "Occultist"
	set desc = "Recover our mortal coil"

	heal_overall_damage(40,40)
	stun_effect_act(0, 200, BP_CHEST)
	weakened = 10
	visible_message(
		SPAN_DANGER("[src]'s flesh begins to hiss and bubble as their wounds mend!"),
		SPAN_DANGER("A wave of agony envelops you as your wounds begin to close!")
		)


/datum/power/occultist/horrifying
	name = "Horrifying Visage"
	desc = "Infuses you with the aspect of the ship itself, causing you to drain sanity from anyone that observes you."

/datum/power/occultist/horrifying/addPower(var/mob/living/carbon/human/themaster)
	themaster.sanity_damage += 5
	..()

/datum/power/occultist/vblade
	name = "Voidmother's Blade"
	desc = "Transforms an oddity into a weapon for our cause."

/datum/power/occultist/amoung
	name = "Among Them"
	desc = "Causes roaches to see you as one of their own."

/datum/power/occultist/amoung/addPower(var/mob/living/carbon/human/themaster)
	themaster.faction = "roach"
	..()

// T2 Powers


/datum/power/occultist/tranquility
	name = "Tranquility"
	desc = "End a breakdown immediately"
	activecost = 1

/datum/power/occultist/candle
	name = "Like a Candle"
	desc = "Grants target a glimpse into the power of the void."
	activecost = 5

/datum/power/occultist/wail
	name = "Unearthly Wail"
	desc = "Allows you to unleash a blood-curdling wail, draining sanity."
	activecost = 1

/datum/power/occultist/darkness
	name = "Bring Darkness"
	desc = "Breaks all lights around you."
	activecost = 1

/datum/power/occultist/banish
	name = "Banish Swarm"
	desc = "Banishes all roaches within 15 tiles of you to the nearest burrow."
	activecost = 1

/datum/power/occultist/callswarm
	name = "Call Swarm"
	desc = "Calls a swarm of roaches to your location. They are not friendly to you."
	activecost = 1

/datum/power/occultist/rust
	name = "Rust"
	desc = "Causes one object in your hand to rust and become useless."
	activecost = 1

/datum/power/occultist/vfaith
	name = "Voidmother's Faith"
	desc = "Restores your sanity to full"
	activecost = 1

//T3 Powers

/datum/power/occultist/decay
	name = "Decay"
	desc = "Makes all objects on your person and in the inventory of your grabbed target rust and become useless."
	activecost = 4
	madnesscost = 40

/datum/power/occultist/vshield
	name = "Voidmother's Shield"
	desc = "Grants you a black, oily substance that functions as powerful armor... permanently"
	madnesscost = 40

/datum/power/occultist/initiate
	name = "Rite of Initiation"
	desc = "Induct a new Occultist to our ranks."
	activecost = 4
	madnesscost = 40

/datum/power/occultist/kingofbeasts
	name = "King of Beasts"
	desc = "Summons a friendly kaiser roach to your location."
	activecost = 4
	madnesscost = 40

/datum/power/occultist/viel
	name = "Tear the Veil"
	desc = "Rends the veil asunder for yourself and one other person."
	activecost = 6
	madnesscost = 40

/datum/power/occultist/truthinblood
	name = "Truth in Blood"
	desc = "Covers the ground around you in blood and gore."
	activecost = 4
	madnesscost = 40

/datum/power/occultist/breakfaith
	name = "Break the faith"
	desc = "Subvert an Obelisk to our cause."
	activecost = 4
	madnesscost = 40

/datum/power/occultist/breakreality
	name = "Unseat Reality"
	desc = "Bring down the walls of reality around you."
	activecost = 4
	madnesscost = 40

/datum/power/occultist/embracecorruption
	name = "Embrace Corruption"
	desc = "Sacrifice yourself to bring about a true fusion of man and machine."
	activecost = 0
	madnesscost = 40

/datum/power/occultist/underworld
	name = "Path to the Underworld"
	desc = "Teleport yourself and anyone grabbed by you to the under-tunnels."
	activecost = 4
	madnesscost = 40

/datum/power/occultist/theskies
	name = "The Skies are Buried Deep"
	desc = "Reveals the truth to everyone who can see you."
	activecost = 4
	madnesscost = 40