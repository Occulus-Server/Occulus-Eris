/datum/storyteller
	variance = 0.45 //Tripling potential varience. Since right now storytellers are kinda... easy to predict

/*The Guide is the default storyteller
It is set as storyteller base in __defines/gamemode.dm
*/
/datum/storyteller/guide
	config_tag = "guide"
	name = "The Guide"
	welcome = "Let me share with you the terrible wonders I have come to know."
	description = "Offers a well balanced experience that has a little of everything. Considered the default experience"

/datum/storyteller/sentinel
	config_tag = "sentinel"
	name = "The Sentinel"
	welcome = "A strict regimen is paramount, if one is to master the brutal arithmetic of combat."
	description = "A PvE focused storyteller that pulls no punches, but doesn't try and overwhelm you. Defend the gates. Identical to guide, but generates no antagonists or round-ending events."
	gain_mult_roleset = 0
	tag_weight_mults = list(TAG_ROUNDENDING = 0)
/*The Mentor is designed to teach new players the ropes of the Northern Light.
It generates points about half as a fast as guide
*/
/datum/storyteller/mentor
	config_tag = "mentor"
	name = "The Mentor"
	welcome = "A moment of clarity in the eye of the storm."
	description = "A patient storyteller that has half the event gain of guide. Intended for new players learning the ropes."

	gain_mult_mundane = 1
	gain_mult_moderate = 0.5
	gain_mult_major = 0.5
	gain_mult_roleset = 0.5
	points = list(
	EVENT_LEVEL_MUNDANE = 10, //Mundane
	EVENT_LEVEL_MODERATE = 20, //Moderate
	EVENT_LEVEL_MAJOR = 40, //Major
	EVENT_LEVEL_ROLESET = 0 //Roleset
	)
/*The Healer is designed for RP-heavy rounds.
It generates no antagonists and disables the most destructive major events.
*/
/datum/storyteller/healer
	config_tag = "healer"
	name = "The Healer"
	welcome = "A moment of respite. A chance to steel oneself against the coming horrors."
	description = "A peaceful storyteller that generates no antagonists nor round-domineering events. Even at the cusp of hell, time to relax is needed."

	gain_mult_mundane = 1
	gain_mult_moderate = 0.5
	gain_mult_major = 0.5
	gain_mult_roleset = 0 //Healer does not generate antagonists.

	tag_weight_mults = list(TAG_COMBAT = 0.75, TAG_NEGATIVE = 0.5, TAG_POSITIVE = 2, TAG_ROUNDENDING = 0)

	points = list(
	EVENT_LEVEL_MUNDANE = 25, //Mundane
	EVENT_LEVEL_MODERATE = 50, //Moderate
	EVENT_LEVEL_MAJOR = 80, //Major
	EVENT_LEVEL_ROLESET = 0 //Roleset
	)
/* The warrior is designed for highly active rounds.
It generates half again as many events as default, as well as more antagonists.
*/
/datum/storyteller/warrior
	config_tag = "warrior"
	name = "The Warrior"
	welcome = "Great adversity has a beauty - it is the fire that tempers."
	description = "Aggressive storyteller with a focus on generating antagonists that will do battle with the crew. Generates fewer random combat events in favor of antagonists."

	gain_mult_mundane = 0.8
	gain_mult_moderate = 0.85
	gain_mult_major = 0.6 //STFU MY SHIT IS ON WHAT'S NEW SCOOBY DOO
	gain_mult_roleset = 1.2

	tag_weight_mults = list(TAG_COMBAT = 0.6, TAG_DESTRUCTIVE = 0.6)

	repetition_multiplier = 1 //Fine, since we want antags to spawn and not much else to happen that isn't combat or destructive.

	//Generates few events after spawning antagonists.
	points = list(
	EVENT_LEVEL_MUNDANE = 0, //Mundane
	EVENT_LEVEL_MODERATE = 10, //Moderate
	EVENT_LEVEL_MAJOR = 0, //Major
	EVENT_LEVEL_ROLESET = 220 //Roleset. Spawn one antag immediately, and another quickly.
	)


/* The Tyrant is designed for rounds with moderate to high population.
It generates a large number of events, but doesn't generate antagonists.
*/
/datum/storyteller/tyrant
	config_tag = "tyrant"
	name = "The Tyrant"
	welcome = "The bulwarks groan with laughter in the dark."
	description = "Ruthless storyteller that inspires unity in the crew by trying to crush them. Generates no antagonists."

	gain_mult_mundane = 2
	gain_mult_moderate = 2
	gain_mult_major = 2.2
	gain_mult_roleset = 0

	tag_weight_mults = list(TAG_COMBAT = 1.6, TAG_DESTRUCTIVE = 1.2)

	repetition_multiplier = 0.75 //We want a variety of things to happen. The default setting causes infestation to gain a hilariously high weight over time

	//Tyrant generates a LOT of events, but never creates antagonists
	points = list(
	EVENT_LEVEL_MUNDANE = 25, //Mundane
	EVENT_LEVEL_MODERATE = 50, //Moderate
	EVENT_LEVEL_MAJOR = 80, //Major
	EVENT_LEVEL_ROLESET = 0 //Roleset
	)

/datum/storyteller/sleeper
	votable = FALSE //admin-only