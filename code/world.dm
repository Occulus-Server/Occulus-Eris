//This file is just for the necessary /world definition
//Try looking in game/world.dm

/**
 * # World
 *
 * Two possibilities exist: either we are alone in the Universe or we are not. Both are equally terrifying. ~ Arthur C. Clarke
 *
 * The byond world object stores some basic byond level config, and has a few hub specific procs for managing hub visiblity
 *
 * The world /New() is the root of where a round itself begins
 */

/*
	The initialization of the game happens roughly like this:

	1. All global variables are initialized (including the global_init and tgstation's master controller instances including subsystems).
	2. The map is initialized, and map objects are created.
	3. world/New() runs.
	4. tgstation's MC runs initialization for various subsystems (refer to its own defines for the load order).

*/
var/global/datum/global_init/init = new ()

/*
	Pre-map initialization stuff should go here.
*/

/datum/global_init/New()
	generate_gameid()
	load_configuration()
	makeDatumRefLists()

	initialize_chemical_reagents()
	initialize_chemical_reactions()

	qdel(src) //we're done

/datum/global_init/Destroy()
	return 1

var/game_id
/proc/generate_gameid()
	if(game_id != null)
		return
	game_id = ""

	var/list/c = list("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
	var/l = c.len

	var/t = world.timeofday
	for(var/_ = 1 to 4)
		game_id = "[c[(t % l) + 1]][game_id]"
		t = round(t / l)
	game_id = "-[game_id]"
	t = round(world.realtime / (10 * 60 * 60 * 24))
	for(var/_ = 1 to 3)
		game_id = "[c[(t % l) + 1]][game_id]"
		t = round(t / l)


/world
	mob = /mob/new_player
	turf = /turf/space
	area = /area/space
	view = "15x15"
	hub = "Exadv1.spacestation13"
	cache_lifespan = 0	//stops player uploaded stuff from being kept in the rsc past the current session
	fps = 20
