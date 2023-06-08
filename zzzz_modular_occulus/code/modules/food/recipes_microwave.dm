/datum/recipe/benzinexplosion
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/benzin
	)
	result = /obj/item/effect/mediumexplosion

/obj/item/effect/mediumexplosion //we didn't have this, apparently
	name = "default"
	desc = "if you see this, ping bear"

/obj/item/effect/mediumexplosion/Initialize()
	explosion(get_turf(loc), 1, 1, 2, 7) //scary, big flash, some actual damage. destroys the tile and machine it happened on
	qdel(src)

/obj/item/effect/lightexplosion/Initialize()
	explosion(get_turf(loc), -1, 0, 3, 7) //scary, big flash, noly aesthetic damage. reveals plating on tile it happened on
	qdel(src)