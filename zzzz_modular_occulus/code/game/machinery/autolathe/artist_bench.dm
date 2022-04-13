/obj/machinery/autolathe/artist_bench/proc/name_piece(var/obj/artwork, mob/living/carbon/human/user)
	var/objectname = null
	var/objectdesc = null
	objectname = input(user, "What will you name this piece?", "Name", "")
	if(objectname)
		artwork.name = objectname
	if(!istype(artwork, /obj/item/gun/projectile/revolver))
		objectdesc = input(user, "Describe your artwork!", "Description", "")
		if(objectdesc)
			artwork.desc = objectdesc