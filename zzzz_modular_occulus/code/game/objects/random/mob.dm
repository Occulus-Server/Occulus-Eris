#define SPAWN_SPUD "spud"
#define SPAWN_ROOMBATTLER "roombattler"
#define SPAWN_TAG_BOSSTOWN MERGE_SPAWN_TAGS(SPAWN_SPUD, SPAWN_ROOMBATTLER)

/obj/spawner/mob/spud
	tags_to_spawn = list(SPAWN_SPUD)

/obj/spawner/mob/cluster/roombattler
	tags_to_spawn = list(SPAWN_ROOMBATTLER)
