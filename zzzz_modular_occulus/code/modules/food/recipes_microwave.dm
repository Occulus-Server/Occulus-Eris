/datum/recipe/benzinexplosion
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/roachmeat/benzin
	)
	result = /obj/item/effect/mediumexplosion

/obj/item/effect/mediumexplosion //we didn't have this, apparently
	name = "default"
	desc = "if you see this, ping bear"

/obj/item/effect/mediumexplosion/Initialize()
	explosion(get_turf(loc), -1, 0, 2, 7) //scary, big flash, not too much actual damage besides aesthetic & destroys the tile it happened on
	qdel(src)