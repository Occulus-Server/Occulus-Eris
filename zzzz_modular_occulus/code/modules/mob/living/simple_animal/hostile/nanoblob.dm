/mob/living/simple_animal/hostile/nanoblob //Occulus edit
	name = "nanoblob"
	desc = "A hostile nanoswarm hive in the shape of a cute blob."
	icon = 'zzzz_modular_occulus/icons/mob/nanoblob.dmi'
	icon_state = "nanoblob"
	speak_chance = 5
	turns_per_move = 3
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	speed = 4
	maxHealth = 50
	health = 50
	speak = list(
				"Rwesitance is fwutile.",
				"Assimiwait. Assimiwait.",
				"Youw biowogical uniwiss will soonw addew to ouws.",
				"OwO, I nowticed youw biomattaw!",
				"Stwuggle ownly makes you tiwed"
				)

	harm_intent_damage = 8
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "glomps"
	attack_sound = 'sound/weapons/bite.ogg'
	//Space carp aren't affected by atmos.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	environment_smash = 1

	faction = "nanoblob"
	var/mob/living/owner

/mob/living/simple_animal/hostile/nanoblob/death()
	visible_message("<span class='alert'>[src] dies!</span>")
	new /obj/effect/decal/cleanable/nanoblob_remains(src.loc)
	qdel(src)
	return

/obj/effect/decal/cleanable/nanoblob_remains
	name = "nanobot puddle"
	desc = "a puddle of dead nanobots."
	icon = 'zzzz_modular_occulus/icons/mob/nanoblob.dmi'
	icon_state = "nanopuddle"

/mob/living/simple_animal/hostile/nanoblob/New(loc, mob/living/L as mob)
	..()
	if(istype(L))
		owner = L

/mob/living/simple_animal/hostile/nanoblob/allow_spacemove()
	return ..()	//No drifting in space for space carp!	//original comments do not steal

/mob/living/simple_animal/hostile/nanoblob/FindTarget()
	. = ..()
	if(.)
		emote("slushes towards [.]")

/mob/living/simple_animal/hostile/nanoblob/Found(var/atom/A)//This is here as a potential override to pick a specific target if available
	if(istype(A) && A == owner)
		return 0
	return ..()

/mob/living/simple_animal/hostile/nanoblob/AttackingTarget()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(15))
			L.Stun(1)
			L.visible_message(SPAN_DANGER("\the [src] glomps \the [L]!"))
