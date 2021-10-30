#include "Final Frontier.dmm"

//MINING-1 // CLUSTER
/obj/effect/overmap/sector/finalfrontier
	name = "UTEV Final Frontier"
	desc = "A large asteroid. Mineral content detected."
	generic_waypoints = list(
		"nav_finalfrontier_1",
		"nav_finalfrontier_2"
	)
	known = 1
	in_space = 0

	name_stages = list( "unknown object", "UTEV Final Frontier")

/obj/effect/overmap/sector/finalfrontier/Initialize()
	. = ..()
	icon_stages = icon_stages = list("eris", "ship", "poi")

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

/area/awaymission/finalfrontier
	icon_state = "bridge"
	forced_ambience = list('sound/ambience/maintambience.ogg', 'zzzz_modular_occulus/sound/ambience/scaryambience.ogg')
	sound_env = ASTEROID
	vessel = null

/area/awaymission/finalfrontier/engineering
	name = "\improper Engineering"
	icon_state = "engineering"

/area/awaymission/finalfrontier/medical
	name = "Medbay"
	icon_state = "medbay"

/area/awaymission/finalfrontier/bridge
	name = "\improper Bridge"
	icon_state = "bridge"

/area/awaymission/finalfrontier/security
	name = "\improper Security "
	icon_state = "brig"

/area/awaymission/finalfrontier/aichamber
	name = "\improper Computing Central Core"
	icon_state = "tcomsatcham"

/area/awaymission/finalfrontier/secondarybridge
	name = "Mine"
	icon_state = "explored"

/area/awaymission/finalfrontier/hallway
	name = "Primary Hallway"
	icon_state = "erisgreen"

/area/awaymission/finalfrontier/maintenance
	name = "Maintenance Hallway"
	icon_state = "disposal"

/area/awaymission/finalfrontier/science
	name = "\improper Research and Development"
	icon_state = "research"