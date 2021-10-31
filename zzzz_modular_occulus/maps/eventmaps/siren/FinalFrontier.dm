#include "FinalFrontier.dmm"

//MINING-1 // CLUSTER
/obj/effect/overmap/sector/finalfrontier
	name = "UTEV Final Frontier"
	desc = "A Sol gov Exploration Vessel."
	generic_waypoints = list(
		"nav_finalfrontier_1",
		"nav_finalfrontier_2"
	)
	known = 1
	in_space = 0

	name_stages = list( "unknown object", "UTEV Final Frontier")

/obj/effect/overmap/sector/finalfrontier/Initialize()
	. = ..()
	icon_stages = list(pick("asteroid0", "asteroid1", "asteroid2", "asteroid3"), "object", "poi")

/obj/map_data/finalfrontier
	name = "finalfrontier Level"
	is_player_level = TRUE
	is_contact_level = TRUE
	generate_asteroid = TRUE
	is_accessable_level = TRUE
	custom_z_names = TRUE
	height = 1


/obj/effect/shuttle_landmark/finalfrontier/nav1
	name = "UTSEV Final Frontier airlock"
	icon_state = "shuttle-green"
	landmark_tag = "nav_finalfrontier_1"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/finalfrontier/nav2
	name = "UTSEV Final Frontier distance off"
	icon_state = "shuttle-green"
	landmark_tag = "nav_finalfrontier_2"
	base_area = /area/space
	base_turf = /turf/space

//MINING-1 // CLUSTER
/obj/effect/overmap/sector/asteroid
	name = "unknown spatial phenomenon"
	desc = "A large asteroid. Mineral content detected."
	generic_waypoints = list(
		"nav_asteroid_1",
		"nav_asteroid_2"
	)
	known = 1
	in_space = 0

	name_stages = list("asteroid", "unknown object", "unknown spatial phenomenon")

/obj/effect/overmap/sector/asteroid/Initialize()
	. = ..()
	icon_stages = list(pick("asteroid0", "asteroid1", "asteroid2", "asteroid3"), "object", "poi")

/obj/effect/shuttle_landmark/asteroid/nav1
	name = "Asteroid Landing zone #1"
	icon_state = "shuttle-green"
	landmark_tag = "nav_asteroid_1"
	base_area = /area/mine/explored
	base_turf = /turf/simulated/floor/asteroid

/obj/effect/shuttle_landmark/asteroid/nav2
	name = "Asteroid Landing zone #2"
	icon_state = "shuttle-green"
	landmark_tag = "nav_asteroid_2"
	base_area = /area/mine/explored
	base_turf = /turf/simulated/floor/asteroid

