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

	name_stages = list( "Exploration Vessel", "UTEV Final Frontier")

/obj/effect/overmap/sector/finalfrontier/Initialize()
	. = ..()
	icon_stages = list("eris", "object", "poi")

/obj/map_data/finalfrontier
	name = "finalfrontier Level"
	is_player_level = TRUE
	is_contact_level = TRUE
	generate_asteroid = TRUE
	is_accessable_level = TRUE
	custom_z_names = TRUE
	height = 1


/obj/effect/shuttle_landmark/finalfrontier/nav1
	name = "UTSEV Final Frontier Starboard"
	icon_state = "shuttle-green"
	landmark_tag = "nav_finalfrontier_1"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/finalfrontier/nav2
	name = "UTSEV Final Frontier Port"
	icon_state = "shuttle-green"
	landmark_tag = "nav_finalfrontier_2"
	base_area = /area/space
	base_turf = /turf/space

