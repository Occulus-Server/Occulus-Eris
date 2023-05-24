/obj/item/gun/projectile/shotgun/pump/pump(mob/M)
	var/turf/newloc = get_turf(src)
	playsound(M, 'sound/weapons/shotgunpump.ogg', 60, 1)

	if(chambered)//We have a shell in the chamber
		chambered.forceMove(newloc) //Eject casing
		chambered = null

	if(loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC

	if(ammo_magazine.stored_ammo.len)
		var/obj/item/ammo_casing/AC = ammo_magazine.stored_ammo[1] 
		ammo_magazine.stored_ammo -= AC 
		chambered = AC

	update_icon()