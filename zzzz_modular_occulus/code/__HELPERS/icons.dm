/proc/getFlatIcon(image/A, defdir, deficon, defstate, defblend, start = TRUE, no_anim = FALSE)
	// We start with a blank canvas, otherwise some icon procs crash silently
	var/icon/flat = icon('icons/effects/effects.dmi', "nothing") // Final flattened icon
	if(!A)
		return flat
	if(A.alpha <= 0)
		return flat
	var/noIcon = FALSE

	if(start)
		if(!defdir)
			defdir = A.dir
		if(!deficon)
			deficon = A.icon
		if(!defstate)
			defstate = A.icon_state
		if(!defblend)
			defblend = A.blend_mode

	var/curicon
	if(A.icon)
		curicon = A.icon
	else
		curicon = deficon

	if(!curicon)
		noIcon = TRUE // Do not render this object.

	var/curstate
	if(A.icon_state)
		curstate = A.icon_state
	else
		curstate = defstate

	if(!noIcon && !(curstate in icon_states(curicon)))
		if("" in icon_states(curicon))
			curstate = ""
		else
			noIcon = TRUE // Do not render this object.

	var/curdir
	var/base_icon_dir	//We'll use this to get the icon state to display if not null BUT NOT pass it to overlays as the dir we have

	//These should use the parent's direction (most likely)
	if(!A.dir || A.dir == SOUTH)
		curdir = defdir
	else
		curdir = A.dir

	//Let's check if the icon actually contains any diagonals, just skip if it's south to save (lot of) time
	if(curdir != SOUTH)
		var/icon/test_icon
		var/directionals_exist = FALSE
		var/list/dirs_to_check = cardinal - SOUTH
		outer:
			for(var/possible_dir in dirs_to_check)
				test_icon = icon(curicon,curstate,possible_dir,frame=1)
				for(var/x in 1 to world.icon_size)
					for(var/y in 1 to world.icon_size)
						if(!isnull(test_icon.GetPixel(x,y)))
							directionals_exist = TRUE
							break outer
		if(!directionals_exist)
			base_icon_dir = SOUTH
	if(!base_icon_dir)
		base_icon_dir = curdir

	var/curblend
	if(A.blend_mode == BLEND_DEFAULT)
		curblend = defblend
	else
		curblend = A.blend_mode


	// Layers will be a sorted list of icons/overlays, based on the order in which they are displayed
	var/list/layers = list()
	var/image/copy
	// Add the atom's icon itself, without pixel_x/y offsets.
	if(!noIcon)
		copy = image(icon=curicon, icon_state=curstate, layer=A.layer, dir=base_icon_dir)
		copy.color = A.color
		copy.alpha = A.alpha
		copy.blend_mode = curblend
		layers[copy] = A.layer

	// Loop through the underlays, then overlays, sorting them into the layers list
	var/list/process = A.underlays // Current list being processed
	var/pSet=0 // Which list is being processed: 0 = underlays, 1 = overlays
	var/curIndex=1 // index of 'current' in list being processed
	var/current // Current overlay being sorted
	var/currentLayer // Calculated layer that overlay appears on (special case for FLOAT_LAYER)
	var/compare // The overlay 'add' is being compared against
	var/cmpIndex // The index in the layers list of 'compare'
	while(TRUE)
		if(curIndex<=process.len)
			current = process[curIndex]
			if(!current)
				curIndex++ //Try the next layer
				continue
			var/image/I = current
			if(I.plane != FLOAT_PLANE && I.plane != A.plane)
				curIndex++
				continue
			currentLayer = I.layer
			if(currentLayer<0) // Special case for FLOAT_LAYER
				if(currentLayer <= -1000)
					return flat
				if(pSet == 0) // Underlay
					currentLayer = A.layer+currentLayer/1000
				else // Overlay
					currentLayer = A.layer+(1000+currentLayer)/1000

			// Sort add into layers list
			for(cmpIndex=1,cmpIndex<=layers.len,cmpIndex++)
				compare = layers[cmpIndex]
				if(currentLayer < layers[compare]) // Associated value is the calculated layer
					layers.Insert(cmpIndex,current)
					layers[current] = currentLayer
					break
			if(cmpIndex>layers.len) // Reached end of list without inserting
				layers[current]=currentLayer // Place at end

			curIndex++

		if(curIndex>process.len)
			if(pSet == 0) // Switch to overlays
				curIndex = 1
				pSet = 1
				process = A.overlays
			else // All done
				break

	var/icon/add // Icon of overlay being added

	// Current dimensions of flattened icon
	var/flatX1=1
	var/flatX2=flat.Width()
	var/flatY1=1
	var/flatY2=flat.Height()
	// Dimensions of overlay being added
	var/addX1
	var/addX2
	var/addY1
	var/addY2

	for(var/V in layers)
		var/image/I = V
		if(I.alpha == 0)
			continue

		if(I == copy) // 'I' is an /image based on the object being flattened.
			curblend = BLEND_OVERLAY
			add = icon(I.icon, I.icon_state, base_icon_dir)
		else // 'I' is an appearance object.
			add = getFlatIcon(new/image(I), curdir, curicon, curstate, curblend, FALSE, no_anim)

		// Find the new dimensions of the flat icon to fit the added overlay
		addX1 = min(flatX1, I.pixel_x+1)
		addX2 = max(flatX2, I.pixel_x+add.Width())
		addY1 = min(flatY1, I.pixel_y+1)
		addY2 = max(flatY2, I.pixel_y+add.Height())

		if(addX1!=flatX1 || addX2!=flatX2 || addY1!=flatY1 || addY2!=flatY2)
			// Resize the flattened icon so the new icon fits
			flat.Crop(addX1-flatX1+1, addY1-flatY1+1, addX2-flatX1+1, addY2-flatY1+1)
			flatX1=addX1;flatX2=addX2
			flatY1=addY1;flatY2=addY2

		// Blend the overlay into the flattened icon
		flat.Blend(add, blendMode2iconMode(curblend), I.pixel_x + 2 - flatX1, I.pixel_y + 2 - flatY1)

	if(A.color)
		flat.Blend(A.color, ICON_MULTIPLY)
	if(A.alpha < 255)
		flat.Blend(rgb(255, 255, 255, A.alpha), ICON_MULTIPLY)

	if(no_anim)
		//Clean up repeated frames
		var/icon/cleaned = new /icon()
		cleaned.Insert(flat, "", SOUTH, 1, 0)
		return cleaned
	else
		return icon(flat, "", SOUTH)

/proc/animate_aura(var/atom/A, var/simple_icons, var/color = "#00FF22", var/anim_duration = 5, var/offset = 1, var/loops = 1, var/grow_to = 2, var/pixel_scale = FALSE)
	ASSERT(A)

	//Take a guess at this, if they didn't set it
	if(isnull(simple_icons))
		if(ismob(A))
			simple_icons = FALSE
		else
			simple_icons = TRUE

	//Get their icon
	var/icon/hole

	if(simple_icons)
		hole = icon(A.icon, A.icon_state)
	else
		hole = getCompoundIcon(A)

	hole.MapColors(0,0,0, 0,0,0, 0,0,0, 1,1,1) //White.

	//Make a bigger version
	var/icon/grower = new(hole)
	var/orig_width = grower.Width()
	var/orig_height = grower.Height()
	var/end_width = orig_width+(offset*2)
	var/end_height = orig_height+(offset*2)
	var/half_diff_width = (end_width-orig_width)*0.5
	var/half_diff_height = (end_height-orig_height)*0.5

	//Make icon black
	grower.SwapColor("#FFFFFF","#000000") //Black.

	//Scale both icons big so we don't have to deal with low-pixel garbage issues
	grower.Scale(orig_width*10,orig_height*10)
	hole.Scale(orig_width*9,orig_height*9)

	//Blend the hole in
	grower.Blend(hole,ICON_OVERLAY, x = ((orig_width*10-orig_width*9)*0.5)+1, y = ((orig_height*10-orig_height*9)*0.5)+1)

	//Swap white to zero alpha
	grower.SwapColor("#FFFFFF","#00000000")

	//Color it
	grower.SwapColor("#000000",color)

	//Scale it to final height
	grower.Scale(end_width,end_height)

	//Flick it onto them
	var/image/img = image(grower,A)
	if(pixel_scale)
		img.appearance_flags |= PIXEL_SCALE
	img.pixel_x = half_diff_width*-1
	img.pixel_y = half_diff_height*-1
	flick_overlay_view(img, A, anim_duration*loops, TRUE)

	//Animate it growing
	animate(img, alpha = 0, transform = matrix()*grow_to, time = anim_duration, loop = loops)

//getFlatIcon but generates an icon that can face ALL four directions. The only four.
/proc/getCompoundIcon(atom/A)
	var/icon/north = getFlatIcon(A,defdir=NORTH)
	var/icon/south = getFlatIcon(A,defdir=SOUTH)
	var/icon/east = getFlatIcon(A,defdir=EAST)
	var/icon/west = getFlatIcon(A,defdir=WEST)

	//Starts with a blank icon because of byond bugs.
	var/icon/full = icon('icons/effects/effects.dmi', "icon_state"="nothing")

	full.Insert(north,dir=NORTH)
	full.Insert(south,dir=SOUTH)
	full.Insert(east,dir=EAST)
	full.Insert(west,dir=WEST)
	qdel(north)
	qdel(south)
	qdel(east)
	qdel(west)
	return full
