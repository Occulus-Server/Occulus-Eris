/*/datum/chemical_reaction/rejuvenating_agent
	result = "rejuvetaning_agent"
	required_reagents = list("cleaner" = 2, "pacid" = 1, "sulfur" = 1, "uncap nanites" = 1)
	result_amount = 1
*/

/datum/reagent/resuscitator
		reagent_type = "Stimulator" //For some reason this doesn't inherit a reagent type unless we do this...????


/datum/reagent/liquid_dark_matter
	name = "Liquid Dark Matter"
	description = "Sucks everything into the detonation point."
	reagent_state = LIQUID
	color = "#210021"
	taste_description = "compressed bitterness"

/datum/reagent/sorium
	name = "Sorium"
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


/datum/reagent/babelizine
	id = "babelizine"
	name = "Babelizine"
	description = "Similar to an enzyme produced by the incredibly rare Babel Fish, might have great linguistic applications"
	color = "#E5F58E"
	metabolism = 0.2 * REM

/datum/reagent/babelizine/on_mob_life(var/mob/living/M as mob, var/alien)
	M.universal_understand = 1
	..()

/datum/reagent/babelizine/on_remove(var/atom/A)
	if(istype(A, /mob/living))
		var/mob/living/M = A
		M.universal_understand = 0
		to_chat(M, "<span class='warning'>You no longer feel attuned to the spoken word.</span>")

/datum/reagent/babelizine/on_mob_death(var/mob/M)
	holder.remove_reagent(src.id, src.volume)


/datum/reagent/malaxitol
	id = "malaxitol"
	name = "Malaxitol"
	description = "Analysis indicates it could greatly speed up the rate at which other reagents are metabolized"
	color = "#A155ED"
	metabolism = 2 * REM

/datum/reagent/malaxitol/on_mob_life(var/mob/living/M as mob, var/alien)
	for(var/datum/reagent/R in M.reagents.reagent_list)
		if(R.id == src.id)
			continue
		R.on_mob_life(M, alien)

	..()

/datum/reagent/the_stuff
	id = "the_stuff"
	name = "The Stuff"
	description = "Looks as though it would metabolize into the ultimate hallucinogenic cocktail"
	color = "#1A979D"
	metabolism = 10 * REM
	var/init = 0

/datum/reagent/the_stuff/on_mob_life(var/mob/living/M as mob, var/alien)
	if(!init)
		to_chat(M, "<span class='warning'>You start tripping balls.</span>")
		init = 1
	var/drugs = list("space_drugs", "serotrotium", "psilocybin", "nuka_cola", "atomicbomb", "hippiesdelight")
	for(var/drug in drugs)
		M.reagents.add_reagent(drug, 1)
	M.reagents.add_reagent("mindbreaker", 0.2)
	return ..()

/datum/reagent/frioline
	id = "frioline"
	name = "Frioline"
	description = "Could cause rapid and sustained decrease in body temperature"
	color = "#A0E1F7"

/datum/reagent/frioline/on_mob_life(var/mob/living/M as mob, var/alien)
	if(M.bodytemperature > 310)
		to_chat(M, "<span class='notice'>You suddenly feel very cold.</span>")
	M.bodytemperature = max(165, M.bodytemperature - 30)
	return ..()

/datum/reagent/luxitol
	id = "luxitol"
	name = "Luxitol"
	description = "Mimics compounds in known connection with bioluminescence"
	color = "#61E34F"
	metabolism = 0.2 * REM

/datum/reagent/luxitol/on_mob_life(var/mob/living/M as mob, var/alien)
	M.set_light(10)
	return ..()

/datum/reagent/luxitol/on_remove(var/atom/A)
	if(istype(A, /mob))
		var/mob/M = A
		M.set_light(0)
	return ..()

/datum/reagent/liquid_skin
	id = "liquid_skin"
	name = "Liquid Skin"
	description = "Fills in microscopic ridges on biotic surfaces and hardens"
	color = "#F7E9BE"

/datum/reagent/liquid_skin/touch_mob(var/mob/M, var/volume)
	if(istype(M, /mob/living))
		var/mob/living/L = M
		var/burned = L.getFireLoss() > 0
		if(burned)
			L << "<span class='notice'>In a strange sensation, you feel some burns stop hurting.</span>"
			L.heal_organ_damage(0, min(15, volume / 4))

		if (mFingerprints in L.mutations)
			if(!burned)
				L << "<span class='warning'>Another application of the substance does nothing weird to your hands.</span>"
		else
			L.mutations.Add(mFingerprints)
			L << "<span class='notice'>Your fingers feel strange after the substance splashes on your hands.</span>"
	return ..()

/datum/reagent/paralitol
	id = "paralitol"
	name = "Paralitol"
	description = "Seems as if it could work as an extreme muscle inhibitor"
	color = "#2F85CC"
	metabolism = 3 * REM

/datum/reagent/paralitol/on_mob_life(var/mob/living/M as mob, var/alien)
	M.Weaken(2)
	M.stuttering = 50
	return ..()

/datum/reagent/mortemol
	id = "mortemol"
	name = "Mortemol"
	description = "Further testing required, could potentially reanimate dead cells if delivered with enough force"
	color = "#000000"
	metabolism = 5 * REM //gotta balance it somehow
	data = list(0) //use data? Might cause problems with blood dialysis

/datum/reagent/mortemol/touch_mob(var/mob/M, var/volume) //requires a splash to start effects because dead humans don't process reagents
	if(!istype(M, /mob/living/carbon))
		return 0

	var/mob/living/carbon/C = M
	if(holder)
		if(!istype(holder.my_atom, /obj/effect/effect/smoke/chem))
			if(C.reagents)
				if(C.stat && !(data[1]))
					data[1] = 1
					C.reagents.add_reagent(id, volume, data)
					C.rejuvenate()
					C.rejuvenate() //I like C.rejuvenate()
					C.visible_message("<span class='notice'>[C] seems to wake from the dead!</span>")
				else
					C.reagents.add_reagent(id, volume)

/datum/reagent/mortemol/on_mob_life(var/mob/living/M as mob, var/alien)
	if(data[1])
		M.halloss = 100
		M.stuttering = 1

	return ..()

/datum/reagent/mortemol/on_remove(var/atom/A)
	if(data[1])
		if(istype(A, /mob))
			var/mob/M = A
			to_chat(M, "<span class='notice'>You feel the last traces of chemicals leave your body as you return to death once more...</span>")
			M.death(0)
		//Reagent giveth, and reagent taketh away

/datum/reagent/mortemol/on_mob_death(var/mob/M)
	if(data[1])
		return
	else
		if(istype(M, /mob/living/carbon))
			var/mob/living/carbon/C = M
			data[1] = 1
			C.rejuvenate()
			C.rejuvenate() //Necessary to call twice in testing
			C.visible_message("<span class='notice'>[C] seems to wake from the dead!</span>")

/datum/reagent/oxyphoromin
	id = "oxyphoromin"
	name = "Oxyphoromin"
	description = "Extreme painkiller derived of Oxycodone, dangerous in high doses"
	color = "#540E5C"
	metabolism = 5 * REM
	overdose = 15

/datum/reagent/oxyphoromin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.add_chemical_effect(CE_PAINKILLER, 600)
	M.eye_blurry = min(M.eye_blurry + 10, 250)
//	M.confuse(5)

/datum/reagent/oxyphoromin/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.druggy = max(M.druggy, 60)
//	M.hallucination = max(M.hallucination, 3)

/*
//Temporarily disabled till I have more time to look at this. Need to adjust coordinates to reflect safe and unsafe XYZ.
/datum/reagent/liquid_bluespace
	id = "liquid_bluespace"
	name = "Liquid Bluespace"
	description = "Appears to bend local spacetime around the container"
	color = "#4ECBF5"
	metabolism = 0
	var/initial_time = 0

/datum/reagent/liquid_bluespace/on_mob_life(var/mob/living/M as mob)
	if(!initial_time)
		initial_time = world.time

	if(world.time - initial_time >= 30) //three second startup lag
		if(!metabolism)
			metabolism = 1
			to_chat(M, "<span class='notice'>You begin to feel transcendental.</span>")

		if(M.z > 5 || M.z == 2 || M.z < 1) //no centcomm teleport, also not dealing with other unknown sectors
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
					params = list(95, 209, 76, 246, 1) //main station
				if(3)
					params = list(113, 141, 110, 143, 3) //telecomms station
				if(4)
					params = list(58, 95, 34, 80, 4) //engineering outpost
				if(5)
					if(prob(50))
						params = list(35, 73, 89, 120, 5) //mining station
					else
						params = list(65, 99, 121, 182, 5) //research station

			x = rand(params[1], params[2])
			y = rand(params[3], params[4])
			z = params[5]

			var/turf/new_loc = locate(x, y, z)
			//ensure they don't land inside rock unless on mining asteroid
			valid_location = (!istype(new_loc, /turf/simulated/mineral) || z == 5 || z == 4)
		while(!valid_location)

		M.x = x
		M.y = y
		M.z = z

		if(prob(33))
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(3, 1, get_turf(M))
			s.start()
	..()

/datum/reagent/liquid_bluespace/on_remove(var/atom/A)
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = A
		H.vomit()
*/

/datum/reagent/gaseous
	reagent_state = GAS

/datum/reagent/gaseous/proc/initial_reaction(var/obj/item/weapon/reagent_containers/container, var/turf/T, var/volume, var/message)
	var/datum/effect/effect/system/smoke_spread/chem/effect = new/datum/effect/effect/system/smoke_spread/chem()
	var/datum/reagents/R = new/datum/reagents()
	R.my_atom = container
	R.add_reagent(src.id, volume)
	effect.set_up(R, 17, 0, T, 0)
	effect.start()
	spawn(1)
		container.reagents.clear_reagents()
	return ..()

/datum/reagent/gaseous/on_transfer(var/volume)
	initial_reaction(src.holder, src.holder.my_atom, volume, null)
	return 0


/datum/reagent/gaseous/occaecosone
	id = "occaecosone"
	name = "Occaecosone"
	description = "Would react very negatively with proteins in biotic eyes"
	color = "#213E73"
/* Need to fix some incorrect Vars related to organs/eyes.
/datum/reagent/gaseous/occaecosone/touch_turf(var/turf/T)
	var/mob_affected = 0
	for(var/mob/living/L in T.contents)
		mob_affected = 1
		if(istype(L, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = L
			if(!gaseous_reagent_check(H)) //protective clothing check
				var/obj/item/organ/eyes = H.internal_organs_by_name["eyes"]
				if(!(eyes.status & ORGAN_ROBOT))
					eyes.take_damage(50)
					H << "<span class='warning'><b>The gas stings your eyes like you have never felt before!</b></span>"
		else if(!istype(L, /mob/living/silicon))
			L.eye_blind = 500

	if(mob_affected)
		src = null


/datum/reagent/gaseous/occaecosone/touch_mob(var/mob/M, var/volume)
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		if(!gaseous_reagent_check(H)) //protective clothing check
			var/obj/item/organ/eyes = H.internal_organs_by_name["eyes"]
			if(!(eyes.status & ORGAN_ROBOT))
				eyes.take_damage(50)
				H << "<span class='warning'><b>The gas stings your eyes like you have never felt before!</b></span>"
	else if(!istype(M, /mob/living/silicon))
		M.eye_blind = 500
	src = null
*/

//It is POSSIBLE but very hard to "stop, drop, and roll" out the fire from an unprotected ignisol encounter before going into crit
//I really just like the idea of scientists running out of a lab on fire to the science shower - DrBrock
/datum/reagent/gaseous/ignisol
	id = "ignisol"
	name = "Ignisol"
	description = "Creates highly flammable reaction with biotic substances"
	color = "#F78431"

/*/datum/reagent/gaseous/ignisol/touch_turf(var/turf/T)
	var/mob_affected = 0
	for(var/mob/living/L in T.contents)
		mob_affected = 1
		if(istype(L, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = L
			if(!gaseous_reagent_check(H)) //protective clothing check
				H.on_fire = 1
				H.adjust_fire_stacks(20)
				H.update_fire()
		else
			if(!istype(L, /mob/living/silicon))
				L.on_fire = 1
				L.adjust_fire_stacks(20)

	if(mob_affected)
		src = null
*/
/datum/reagent/gaseous/ignisol/touch_mob(var/mob/M, var/volume)
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		if(!gaseous_reagent_check(H)) //protective clothing check
			H.on_fire = 1
			H.adjust_fire_stacks(20)
			H.update_fire()
	else
		if(istype(M, /mob/living) && !istype(M, /mob/living/silicon))
			var/mob/living/L = M
			L.on_fire = 1
			L.adjust_fire_stacks(20)
	src = null

