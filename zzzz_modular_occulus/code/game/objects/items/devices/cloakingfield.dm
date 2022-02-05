//Goon Cloaking field tbd for antag use -RadiantFlash
//Contents
//Cloak field generator
//Remote for said generator

/obj/item/cloak_gen
	name = "cloaking field generator"
	desc = "It's humming softly."
	icon = 'icons/obj/items/device.dmi'
	icon_state = "cloakgen_off"
	var/range = 3
	var/maxrange = 5
	var/active = 0
	var/icon_to_use = "noise2"
	var/list/fields = new/list()

/obj/item/cloak_gen/New()
	..()
	var/obj/item/remote/cloak_gen/remote = new /obj/item/remote/cloak_gen(src.loc)
	remote.my_gen = src

/obj/item/cloak_gen/disposing()
	//DEBUG_MESSAGE("Disposing() was called for [src] at [log_loc(src)].")
	if (src.active)
		src.turn_off()
	..()
	return

/obj/item/cloak_gen/attack_self()
	to_chat(usr, SPAN_NOTICE("<span class='alert'>I need to place it on the ground to use it.</span>"))

	// Shouldn't be required, but there have been surplus crate-related bugs in the past (Convair880).
/obj/item/cloak_gen/attackby(obj/item/W as obj, mob/user as mob)
	if (!W || !istype(W, /obj/item/remote/cloak_gen/))
		..()
		return
	if (istype(W, /obj/item/remote/cloak_gen/))
		var/obj/item/remote/cloak_gen/R = W
		if (!R.my_gen)
			to_chat(user, "Connection to [src.name] established")
			R.my_gen = src
		else
			var/choice = alert("Remote is already linked to a generator. Reset and establish new connection?", "Connection override", "Yes", "No")
			if (choice == "Yes")
				R.my_gen = src
				to_chat(user,"Connection to [src.name] established")
	return

/obj/item/cloak_gen/pickup(var/mob/living/M)
	if(active) turn_off()

/obj/item/cloak_gen/proc/get_cloaked_icon(turf/T)
	var/icon/turf = icon(T.icon, T.icon_state, T.dir)
	var/icon/noise = icon('icons/misc/old_or_unused.dmi', icon_to_use, dir=pick(cardinal))
	turf.Blend(noise,ICON_MULTIPLY)
	return turf

/obj/item/cloak_gen/proc/turn_on()
	if (active) return

	if (!isturf(loc))
		if (usr && ismob(usr))
			to_chat(usr, SPAN_NOTICE( "<span class='alert'>The field generator must be on the floor to be activated.</span>"))
		return

	active = 1
	anchored = 1

	if (usr && ismob(usr))
	to_chat(usr, SPAN_NOTICE( "<span class='notice'>You activate the cloak field generator.</span>"))

	for(var/turf/T in range(range,src))
		if(!isturf(T)) continue
		var/obj/overlay/O = new/obj/overlay(T)
		fields += O
		O.icon = get_cloaked_icon(T)
		O.layer = EFFECTS_LAYER_4
		O.anchored = 1
		O.set_density(0)
		O.name = T.name

/obj/item/cloak_gen/proc/turn_off()
	if (!active) return

	active = 0
	anchored = 0
	if (usr && ismob(usr))
		to_chat(usr, SPAN_NOTICE( "<span class='notice'>You deactivate the cloak field generator.</span>"))
	for(var/A in fields)
		qdel(A)

/obj/item/remote/cloak_gen
	name = "cloaking field generator remote"
	desc = "A remote control for a cloaking field generator."
	icon = 'icons/obj/porters.dmi'
	icon_state = "remote"
	item_state = "electronic"
	w_class = 2.0
	var/obj/item/cloak_gen/my_gen = null
	var/anti_spam = 0 // Creating and deleting overlays en masse can cause noticeable lag (Convair880).

/obj/item/remote/cloak_gen/attack_self()
	if (isliving(usr))
		if (my_gen)
			if (my_gen.active)
				src.anti_spam = world.time
				my_gen.turn_off()
			else
				if (src.anti_spam && world.time < src.anti_spam + 100)
					to_chat(usr,"The cloaking field generator is recharging!", "red")
					return
				src.anti_spam = world.time
				my_gen.turn_on()
		else
			to_chat(usr, SPAN_NOTICE("<span class='alert'>No signal detected. Swipe remote on a cloaking generator to establish a connection.</span>"))
	return

/obj/item/remote/cloak_gen/verb/set_pattern()
	set src in view(1)
	if (!isliving(usr) || !my_gen) return
	var/input = input(usr,"Select cloaking pattern:","Set pattern","Noise") in list("Noise","Linear","Chaos","Cubic","Interference","Rotating")
	switch(input)
		if("Linear")
			my_gen.icon_to_use = "noise1"
		if("Noise")
			my_gen.icon_to_use = "noise2"
		if("Chaos")
			my_gen.icon_to_use = "noise3"
		if("Cubic")
			my_gen.icon_to_use = "noise4"
		if("Interference")
			my_gen.icon_to_use = "noise5"
		if("Rotating")
			my_gen.icon_to_use = "noise6"
	if(my_gen.active)
		my_gen.turn_off()
		my_gen.turn_on()
	to_chat(usr, SPAN_NOTICE("<span class='notice'>You set the pattern to '[input]'.</span>"))

/obj/item/remote/cloak_gen/verb/set_range()
	set src in view(1)
	if (!isliving(usr) || !my_gen) return
	var/input = input(usr,"Range 0-[my_gen.maxrange]:","Set range",my_gen.range) as num
	if(input > my_gen.maxrange || input < 0)
		to_chat(usr, SPAN_NOTICE("<span class='alert'>Invalid setting.</span>"))
		return
	my_gen.range = input
	if(my_gen.active)
		my_gen.turn_off()
		my_gen.turn_on()
	to_chat(usr, SPAN_NOTICE("<span class='notice'>You set the range to [my_gen.range].</span>"))

/obj/item/remote/cloak_gen/verb/increase_range()
	set src in view(1)
	if (!isliving(usr) || !my_gen) return
	if (my_gen.range + 1 > my_gen.maxrange)
		to_chat(usr, SPAN_NOTICE("<span class='alert'>Maximum range reached ([my_gen.maxrange]).</span>"))
		return
	my_gen.range++
	if(my_gen.active)
		my_gen.turn_off()
		my_gen.turn_on()
	to_chat(usr, SPAN_NOTICE("<span class='notice'>You set the range to [my_gen.range].</span>"))

/obj/item/remote/cloak_gen/verb/decrease_range()
	set src in view(1)
	if (!isliving(usr) || !my_gen) return
	if (my_gen.range - 1 < 0)
		to_chat(usr, SPAN_NOTICE("<span class='alert'>Minimum range reached (0).</span>"))
		return
	my_gen.range--
	if(my_gen.active)
		my_gen.turn_off()
		my_gen.turn_on()
	to_chat(usr, SPAN_NOTICE("<span class='notice'>You set the range to [my_gen.range].</span>"))

/obj/item/remote/cloak_gen/verb/turn_on()
	set src in view(1)
	if (!isliving(usr) || !my_gen || my_gen.active) return
	my_gen.turn_on()
	to_chat(usr, SPAN_NOTICE("<span class='notice'>You turn the cloaking field generator on.</span>"))

/obj/item/remote/cloak_gen/verb/turn_off()
	set src in view(1)
	if (!isliving(usr) || !my_gen || !my_gen.active) return
	my_gen.turn_off()
	to_chat(usr, SPAN_NOTICE("<span class='notice'>You turn the cloaking field generator off.</span>"))
