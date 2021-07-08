var/roach_counter = 0

/mob/living/carbon/superior_animal/roach

	var/min_size = 0.75
	var/max_size = 1.25

/mob/living/carbon/superior_animal/roach/roachling

	// Roachlings are untouched. Being even smaller would just be annoying

	min_size = 1
	max_size = 1

/mob/living/carbon/superior_animal/roach/hunter		// Jager

	min_size = 0.95
	max_size = 1.2

/mob/living/carbon/superior_animal/roach/fuhrer
	density = TRUE
	min_size = 1
	max_size = 1.3

/mob/living/carbon/superior_animal/roach/kaiser

	// Kaisers are untouched. They're scary enough

	min_size = 1
	max_size = 1

/mob/living/carbon/superior_animal/roach/support	// Seuche

	min_size = 0.75
	max_size = 1

/mob/living/carbon/superior_animal/roach/nanite		// Kraftwerk

	min_size = 0.9
	max_size = 1.25

/mob/living/carbon/superior_animal/roach/tank 		// Panzer

	min_size = 1
	max_size = 1.5 // chunky boy

/mob/living/carbon/superior_animal/roach/toxic		// Gestrahlte

	// Giant pulsing bugs. Make them horrifying

	min_size = 1.15
	max_size = 1.4

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
