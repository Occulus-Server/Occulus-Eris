/obj/effect/overmap/ship
	var/scanrange = PASSIVE_SCAN_RANGE//By default we have a scan range of 3

/obj/effect/overmap/ship/Process()
	if(scanners)//do we have any scanners in the list?
		var/x = scanners.len
		scanrange = 0//if we do, zero out the scan range
		for(var/obj/machinery/power/long_range_scanner/scanner in scanners)
			if(scanner.scan_range > scanrange)
				scanrange = scanner.scan_range
	if(!is_still())
		var/list/deltas = list(0,0)
		for(var/i=1, i<=2, i++)
			if(speed[i] && world.time > last_movement[i] + default_delay - speed_mod*abs(speed[i]))
				deltas[i] = speed[i] > 0 ? 1 : -1
				last_movement[i] = world.time
		var/turf/newloc = locate(x + deltas[1], y + deltas[2], z)
		if(newloc)
			Move(newloc)
			handle_wraparound()
		update_icon()