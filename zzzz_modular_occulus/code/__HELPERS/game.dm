/proc/flick_overlay_view(image/I, atom/target, duration, gc_after) //Legacy wrapper proc
	var/list/viewing = list()
	for(var/m in viewers(target))
		var/mob/M = m
		if(M.client)
			viewing += M.client
	flick_overlay(I, viewing, duration, gc_after)