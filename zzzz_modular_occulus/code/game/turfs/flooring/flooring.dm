/decl/flooring/tiling
	flags = TURF_HAS_CORNERS | TURF_HAS_INNER_CORNERS | TURF_REMOVE_CROWBAR | TURF_CAN_BREAK | TURF_CAN_BURN | TURF_HIDES_THINGS | TURF_RIPPABLE
	// Added TURF_RIPPABLE to tiling so you can tear off any tiles, but not plating. Doing it the other way around doesn't work.

/decl/flooring/tiling/steel/burned1
	name = "floor"
	icon_base = "burnedstraight"
	icon = 'zzzz_modular_occulus/icons/turf/flooring/plating.dmi'
	build_type = /obj/item/stack/tile/floor/steel
	footstep_sound = "floor"

/decl/flooring/tiling/steel/burned2
	name = "floor"
	icon_base = "burnedcornerinv"
	icon = 'zzzz_modular_occulus/icons/turf/flooring/plating.dmi'
	build_type = /obj/item/stack/tile/floor/steel
	footstep_sound = "floor"

/decl/flooring/tiling/steel/burned3
	name = "floor"
	icon_base = "burnedcorner"
	icon = 'zzzz_modular_occulus/icons/turf/flooring/plating.dmi'
	build_type = /obj/item/stack/tile/floor/steel
	footstep_sound = "floor"