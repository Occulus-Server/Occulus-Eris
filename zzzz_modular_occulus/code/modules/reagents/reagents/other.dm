/*/datum/chemical_reaction/rejuvenating_agent
	result = "rejuvetaning_agent"
	required_reagents = list("cleaner" = 2, "pacid" = 1, "sulfur" = 1, "uncap nanites" = 1)
	result_amount = 1
*/

/datum/reagent/resuscitator
		reagent_type = "Stimulator" //For some reason this doesn't inherit a reagent type unless we do this...????

/datum/reagent/nitrogen
	name = "Nitrogen"
	id = "nitrogen"
	description = "A colorless, odorless, tasteless gas."
	taste_description = null
	color = "#808080"

/datum/reagent/liquid_dark_matter
	name = "Liquid Dark Matter"
	id = "ldm"
	description = "Sucks everything into the detonation point."
	reagent_state = LIQUID
	color = "#210021"
	taste_description = "compressed bitterness"

/datum/reagent/sorium
	name = "Sorium"
	id = "sorium"
	description = "Sends everything flying from the detonation point."
	reagent_state = LIQUID
	color = "#5A64C8"
	taste_description = "air and bitterness"

/datum/reagent/tartrate
	id = "tartrate"
	name = "Chlorified Tartrate"
	description = "Mix with enough Aluminum Nitrate for tasty results!"
	color = "#EA67B1"

datum/reagent/nitrate
	id = "nitrate"
	name = "Nitrate"
	description = "Nitrate, not that interesting."
	reagent_state = LIQUID
	color = "#D8DFE3"

/datum/reagent/aluminum_nitrate
	id = "aluminum_nitrate"
	name = "Aluminum Nitrate"
	description = "Aluminum Nitrate, now that's interesting!"
	reagent_state = LIQUID
	color = "#E1CFE3"

/datum/reagent/ammonium_nitrate
	id = "ammonium_nitrate"
	name = "Ammonium Nitrate"
	description = "Ammonium Nitrate, even more interesting!"
	reagent_state = LIQUID
	color = "#d0bcd2"

/datum/reagent/babelizine
	id = "babelizine"
	name = "Babelizine"
	description = "Similar to an enzyme produced by the incredibly rare Babel Fish, might have great linguistic applications"
	color = "#E5F58E"
	metabolism = 0.2 * REM

/datum/reagent/babelizine/on_mob_life(var/mob/living/M as mob, var/alien)
	M.universal_understand = 1
	..()

/datum/reagent/babelizine/on_mob_delete(var/mob/living/M)
	if(istype(M))
		M.universal_understand = 0
		to_chat(M, "<span class='warning'>You no longer feel attuned to the spoken word.</span>")

/datum/reagent/babelizine/on_mob_death(var/mob/M)
	holder.remove_reagent(src.id, src.volume)

/datum/reagent/drug/delight			//Joyflower chem, used to make Bliss
	name = "Delight"
	id = "delight"
	description = "A chemical naturally made in Joy Flowers, its known to make people smile"
	taste_description = "sweet"
	reagent_state = LIQUID
	color = "#ffc0cb"
	metabolism = REM * 0.5
	overdose = REAGENTS_OVERDOSE * 2
	sanity_gain = 0.5
	addiction_chance = 5

/datum/reagent/drug/bliss
	id = "bliss"
	name = "Bliss"
	description = "Looks as though it would metabolize into the ultimate hallucinogenic cocktail"
	taste_description = "sweet"
	color = "#ffc0eb"
	metabolism = 0.25 * REM
	var/init = 0
	overdose = 15
	addiction_chance = 60

/datum/reagent/drug/bliss/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(!init)
		to_chat(M, "<span class='warning'>Everything seems to turn glossy and wonderful.</span>")
		init = 1
	if(prob(5))
		if(prob(98))
			var/list/bliss_messages = list("You feel as if everything is great",
			"The world seems bright and sparkly", "Everyone enjoys being with you.",
			"You feel like theres nothing you can't do", "You feel a weight lifting off your chest",
			"Nothing can go wrong for you",
			"All your troubles seem to wash away")

			to_chat(M, "<font color='#e3209b'>[pick(bliss_messages)]</font>")
	sanity_gain = 4
	M.druggy = max(M.druggy, 5 * effect_multiplier)
	M.make_dizzy(10 * effect_multiplier)
	return ..()

/datum/reagent/frioline
	id = "frioline"
	name = "Frioline"
	description = "Could cause rapid and sustained decrease in body temperature"
	color = "#A0E1F7"
	metabolism = REM * 0.05	//Metabolized too fast to be useful, slowed to .05

/datum/reagent/frioline/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(M.bodytemperature > 310)
		to_chat(M, "<span class='notice'>You suddenly feel very cold.</span>")
	M.bodytemperature = max(165, M.bodytemperature - 30)
	return ..()

/datum/reagent/luxitol
	id = "luxitol"
	name = "Luxitol"
	description = "Mimics compounds in known connection with bioluminescence"
	color = "#61E34F"
	metabolism = 0.4 * REM

/datum/reagent/luxitol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.set_light(l_range = 4.5, l_power = 2.5, l_color = COLOR_YELLOW)
	return ..()

/datum/reagent/luxitol/on_mob_delete(var/mob/living/M)	//Needs testingx
	if(istype(M))
		M.set_light(0)
	return ..()

/datum/reagent/liquid_skin
	id = "liquid_skin"
	name = "Liquid Skin"
	description = "Fills in microscopic ridges on biotic surfaces and hardens"
	color = "#F7E9BE"

/datum/reagent/liquid_skin/touch_mob(var/mob/M, var/volume)
	if(istype(M, /mob/living))
		var/mob/living/carbon/human/L = M
		var/burned = L.getFireLoss() > 0
		if(burned)
			to_chat(usr, "In a strange sensation, you feel some burns stop hurting.")
			L.heal_organ_damage(0, min(15, volume / 4))

		if(get_active_mutation(L, MUTATION_NOPRINTS))
			if(!burned)
				to_chat(usr, "Another application of the substance does nothing weird to your hands.")
		else
			L.add_mutation( MUTATION_NOPRINTS)
			to_chat(usr, "Your fingers feel strange after the substance splashes on your hands.")
	return ..()

/datum/reagent/paralitol
	id = "paralitol"
	name = "Paralitol"
	description = "Seems as if it could work as an extreme muscle inhibitor"
	color = "#2F85CC"
	metabolism = 3 * REM

/datum/reagent/paralitol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.Weaken(12)
	M.stuttering = 50
	return ..()

/datum/reagent/bluespace_dust
	id = "bluespace_dust"
	name = "Sparkling Crystaline Dust"
	description = "Remnants of a bluespace crystal, they seem to shimmer when looked at"
	color = "#4ECBF5"
	reagent_state = SOLID

//Still teleports people into space. Need to figure out why.. But otherwise good to go.
/datum/reagent/liquid_bluespace
	id = "liquid_bluespace"
	name = "Liquid Bluespace"
	description = "Appears to bend local spacetime around the container"
	color = "#4ECBF5"
	metabolism = 0
	var/initial_time = 0
	addiction_chance = 100

/datum/reagent/liquid_bluespace/on_mob_life(var/mob/living/M as mob)
	if(!initial_time)
		initial_time = world.time

	if(world.time - initial_time >= 30) //three second startup lag
		if(!metabolism)
			metabolism = 1
			to_chat(M, "<span class='notice'>You begin to feel transcendental.</span>")

		if(M.z > 5 || M.z < 1) //no centcom teleport, also not dealing with other unknown sectors
			to_chat(M, "<span class='warning'>You feel the bluespace leave your body on this sector, nothing happens.</span>")
			src = null
			return

		var/valid_location = 0
		var/x = 0
		var/y = 0
		var/z = 0

		do
			var/list/params //list(x min, x max, y min, y max, sector)
			switch(M.z)
				if(1)
					params = list(69, 124, 56, 155, 1) //deck 5
				if(2)
					params = list(64, 128,  45, 159, 2) //deck 4
				if(3)
					params = list(67, 126, 50, 157, 3) //deck 3
				if(4)
					params = list(63, 124, 50, 153, 4) //deck 2
				if(5)
					params = list(62, 130, 52, 160, 5) //deck 1

			x = rand(params[1], params[2])
			y = rand(params[3], params[4])
			z = params[5]

			var/turf/new_loc = locate(x, y, z)
			//ensure they don't land inside rock somehow or space
			valid_location = (!istype(new_loc, /turf/simulated/mineral)|| !istype(new_loc, /turf/space))
		while(!valid_location)

		M.x = x
		M.y = y
		M.z = z

		if(prob(33))
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(3, 1, get_turf(M))
			s.start()
	..()

/datum/reagent/liquid_bluespace/on_mob_delete(var/mob/living/M)
	if(istype(M))
		M.vomit()
//		M.add_chemical_effect(CE_TOXIN, 30)
		M.Weaken(90)


