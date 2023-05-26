/obj/item/organ/external/robotic/attack_self(mob/living/user as mob)
	if(organ_tag == BP_CHEST)
		var/mob/living/carbon/human/newbody = new/mob/living/carbon/human(user.loc)
		newbody.set_species(SPECIES_HUMAN)
		newbody.custom_species = "Synth"
		newbody.age = 0
		var/list/stat_modifiers = list(
			STAT_ROB = 10,
			STAT_TGH = 10,
			STAT_BIO = 10,
			STAT_MEC = 10,
			STAT_VIG = 10,
			STAT_COG = 10
		)
		for(var/stat in stat_modifiers)
			newbody.stats.changeStat(stat, stat_modifiers[stat])
		newbody.UpdateAppearance()
		newbody.stat = DEAD //So it doesn't display the "Seizes up" message
		sleep(1) //Game needs time to process all this or it gives you a weird wrong named character
		user.unEquip(src)
		for(var/obj/item/organ/external/EO in newbody.organs)
			if(EO.organ_tag == BP_CHEST)
				src.replaced(EO)
				continue
			else
				EO.removed()
				qdel(EO)
		user.visible_message("[user.name] begins building the [src].", "You begin to build the [src].")
		newbody.timeofdeath = 10 HOURS
	..()

/obj/item/organ/internal/brain/attackby(obj/item/I, mob/user)
	if(nature == 2 && istype(I, /obj/item/device/mmi))
		var/obj/item/device/mmi/transfer = I
		if(transfer.brainmob)
			user.visible_message("[user.name] begins uploading [transfer.name] into the [src].", "You begin uploading [transfer.name] into the [src].")
			if (do_after(user, 5))
				user.visible_message("[user.name] finishes uploading [transfer.name] into the [src].", "You begin uploading [transfer.name] into the [src].")
				brainmob = transfer.brainmob
				transfer.brainmob = null
				name = "\the [brainmob.real_name]'s [initial(src.name)]"
				to_chat(brainmob, SPAN_NOTICE("You feel slightly disoriented."))
