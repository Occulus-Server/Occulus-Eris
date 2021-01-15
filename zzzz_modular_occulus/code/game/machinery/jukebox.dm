/obj/machinery/media/jukebox/Process()
	if(playing)
		for(var/mob/living/carbon/human/listener in range)
			listener.sanity.onMusic()

