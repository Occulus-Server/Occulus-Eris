/obj/item/dice
	name = "d6"
	desc = "A dice with six sides."
	icon = 'icons/obj/dice.dmi'
	icon_state = "d66"
	w_class = ITEM_SIZE_TINY
	attack_verb = list("diced")
	price_tag = 1
	spawn_tags = SPAWN_TAG_DICE
	var/sides = 6
	// Occulus Edit: refactor dice & qol
	var/result = 0 
	var/comment = ""


/obj/item/dice/Initialize(mapload)
	. = ..()

	var/starting = rand(1, sides)
	icon_state = "[name][starting]"
	result = starting 


/obj/item/dice/examine(mob/user)
	..(user)
	to_chat(user, SPAN_NOTICE("Alt-click, use in hand or throw to roll the dice"))
// Occulus Edit End
/obj/item/dice/d2
	name = "d2"
	desc = "A dice with two sides. Coins are undignified!"
	icon_state = "d2"
	sides = 2

/obj/item/dice/d4
	name = "d4"
	desc = "A dice with four sides. The nerd's caltrop."
	icon_state = "d44"
	sides = 4

/obj/item/dice/d8
	name = "d8"
	desc = "A dice with eight sides. It feels... lucky."
	icon_state = "d88"
	sides = 8

/obj/item/dice/d10
	name = "d10"
	desc = "A dice with ten sides. Useful for percentages."
	icon_state = "d1010"
	sides = 10

/obj/item/dice/d12
	name = "d12"
	desc = "A dice with twelve sides. There's an air of neglect about it."
	icon_state = "d1212"
	sides = 12

/obj/item/dice/d20
	name = "d20"
	desc = "A dice with twenty sides. The prefered dice to throw at the GM."
	icon_state = "d2020"
	sides = 20

/obj/item/dice/d100
	name = "d100"
	desc = "A dice with hundred sides. Can be used as a golfball."
	icon_state = "d10010"
	sides = 10

// Occulus Edit - Refactor the code to reduce copy paste and add alt click. - Everything below

/obj/item/dice/proc/roll_dice()
	result = rand(1, sides)
	comment = ""
	if (result == 1 && sides == 20)
		comment = "Ouch, bad luck."
	else if (result == 20 && sides == 20)
		comment = "Nat 20!"
	icon_state = "[name][result]"

/obj/item/dice/attack_self(mob/user as mob)
	roll_dice()
	user.visible_message(SPAN_NOTICE("[user] has thrown [src]. It lands on [result]. [comment]"), \
						 SPAN_NOTICE("You throw [src]. It lands on a [result]. [comment]"), \
						 SPAN_NOTICE("You hear [src] landing on a [result]. [comment]"))

/obj/item/dice/throw_impact(atom/hit_atom, var/speed)
	..()
	roll_dice()
	src.visible_message(SPAN_NOTICE("\The [src] lands on [result]. [comment]"))

/obj/item/dice/AltClick(mob/user)
	if(user.incapacitated())
		to_chat(user, SPAN_WARNING("You can't do that right now!"))
		return
	if(!in_range(src, user))
		return
	roll_dice()
	src.visible_message("[user] has rolled [src]. It lands on [result]. [comment]")	
