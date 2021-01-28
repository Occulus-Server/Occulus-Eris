/obj/screen/fullscreen
	icon = 'icons/obj/hud_full.dmi'
	icon_state = "default"
	screen_loc = "CENTER-7,CENTER-7"
	layer = FULLSCREEN_LAYER
	plane = FULLSCREEN_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	var/severity = 0 //Occulus Var
	var/allstate = 0 //shows if it should show up for dead people too //Occulus Var, worried what it'll impact

/obj/screen/fullscreen/New(new_icon_state)
	..(null)
	if(new_icon_state)
		src.icon_state = new_icon_state

/obj/screen/fullscreen/tile
	icon = 'icons/mob/screen1.dmi'
	screen_loc = ui_entire_screen

///// Occulus changes start, stole all this from baycode just to make credits work. /////

/mob
	var/list/screens = list()

/mob/proc/set_fullscreen(condition, screen_name, screen_type, arg)
	condition ? overlay_fullscreen(screen_name, screen_type, arg) : clear_fullscreen(screen_name)

/mob/proc/overlay_fullscreen(category, type, severity)
	var/obj/screen/fullscreen/screen = screens[category]

	if(screen)
		if(screen.type != type)
			clear_fullscreen(category, FALSE)
			screen = null
		else if(!severity || severity == screen.severity)
			return null

	if(!screen)
		screen = new type()

	screen.icon_state = "[initial(screen.icon_state)][severity]"
	screen.severity = severity

	screens[category] = screen
	if(client && (stat != DEAD || screen.allstate))
		client.screen += screen
	return screen

/mob/proc/clear_fullscreen(category, animated = 10)
	var/obj/screen/fullscreen/screen = screens[category]
	if(!screen)
		return

	screens -= category

	if(animated)
		spawn(0)
			animate(screen, alpha = 0, time = animated)
			sleep(animated)
			if(client)
				client.screen -= screen
			qdel(screen)
	else
		if(client)
			client.screen -= screen
		qdel(screen)

/mob/proc/clear_fullscreens()
	for(var/category in screens)
		clear_fullscreen(category)

/mob/proc/hide_fullscreens()
	if(client)
		for(var/category in screens)
			client.screen -= screens[category]

/mob/proc/reload_fullscreen()
	if(client)
		for(var/category in screens)
			client.screen |= screens[category]

/obj/screen/fullscreen/Destroy()
	severity = 0
	return ..()

/obj/screen/fullscreen/fadeout
	icon = 'icons/mob/screen1.dmi'
	icon_state = "black"
	screen_loc = ui_entire_screen
	layer = FULLSCREEN_LAYER
	alpha = 0

/obj/screen/fullscreen/fishbed
	icon_state = "fishbed"
///// Occulus changes end /////
