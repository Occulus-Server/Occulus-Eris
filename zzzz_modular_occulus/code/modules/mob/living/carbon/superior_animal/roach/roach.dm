var/roach_counter = 0

/mob/living/carbon/superior_animal/roach/roachling

	melee_damage_lower = 1
	melee_damage_upper = 4
	min_size = 1 //Being even smaller would just be annoying
	max_size = 1.25 //But you can have some big babies

/mob/living/carbon/superior_animal/roach

	melee_damage_lower = 2
	melee_damage_upper = 6
	var/min_size = 0.75
	var/max_size = 1.25

/mob/living/carbon/superior_animal/roach/support	// Seuche
	//Damage same as Kampfers
	min_size = 0.75
	max_size = 1.25
	agony_coefficient = 1.2 //squishy-ish sacs, easy to pop I guess

/mob/living/carbon/superior_animal/roach/hunter		// Jager

	melee_damage_lower = 6//Time to make Jaegers actually scary
	melee_damage_upper = 20//Broken bones? Yes. Very possible. Up to 24 at maximum

	min_size = 0.95
	max_size = 1.2

/mob/living/carbon/superior_animal/roach/fuhrer
	density = TRUE
	min_size = 1
	max_size = 1.3

/mob/living/carbon/superior_animal/roach/kaiser
	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat/kaiser
	// Kaisers are untouched. They're scary enough

	min_size = 1
	max_size = 1

/mob/living/carbon/superior_animal/roach/support	// Seuche

	min_size = 0.75
	max_size = 1

/mob/living/carbon/superior_animal/roach/nanite		// Kraftwerk

	melee_damage_lower = 2//Ranged roach, but we're buffing everyone
	melee_damage_upper = 6//Ranged roach, but we are buffing everyone
	min_size = 0.9
	max_size = 1.25

/mob/living/carbon/superior_animal/roach/tank 		// Panzer
	melee_damage_lower = 4//These guys are already slow and dense. They can hit a bit harder
	melee_damage_upper = 10//Tanks, take them out at range
	min_size = 1
	max_size = 1.5 // chunky boy
	agony_coefficient = 0.8 //tonks, rubbers have trouble penetrating

/mob/living/carbon/superior_animal/roach/toxic		// Gestrahlte

	// Giant pulsing bugs. Make them horrifying
	melee_damage_lower = 4
	melee_damage_upper = 10 //Weaker than hunter
	min_size = 1
	max_size = 1.4
	agony_coefficient = 1.2 //squishy sacs, easy to pop

/mob/living/carbon/superior_animal/roach/fuhrer
	density = TRUE
	melee_damage_lower = 15 //We don't need to change this. Keeping this here for posterity
	melee_damage_upper = 30 //Fuhrer damage is in a good spot
	min_size = 1
	max_size = 1.3
	agony_coefficient = 0.8 //gives them a bit more dignity, needing an extra rubber or so to kill

/mob/living/carbon/superior_animal/roach/kaiser

	// Kaisers are untouched. They're scary enough

	min_size = 1
	max_size = 1


/mob/living/carbon/superior_animal/roach/proc/randomize_scale()

	// 50% chance to be larger or smaller.

	if (min_size != max_size) // Skip this code if they're the same -- roachlings, kaisers
		if (prob(50))
			// Time to change size!
			// First, rand only returns whole numbers. We'll need to divide again to get the proper fraction.
			var/temp_min = min_size * 100
			var/temp_max = max_size * 100

			var/spawn_size = (rand(temp_min, temp_max)) / 100

			// Now we have the fraction for the spawn size. Modify stats accordingly!

			if (spawn_size != 1)	// Don't make changes if there are no changes to make

				setMaxHealth(getMaxHealth() * spawn_size)
				health = getMaxHealth()

				melee_damage_lower *= spawn_size
				melee_damage_upper *= spawn_size
				sanity_damage *= spawn_size

				size_multiplier *= spawn_size

				meat_amount = round(meat_amount * spawn_size, 1)
				turns_per_move = round(turns_per_move * spawn_size, 1)
