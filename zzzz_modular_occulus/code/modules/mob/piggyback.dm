/mob/living/carbon/human/verb/piggyback()
	set name = "Piggyback"
	set desc = "climb on someone's back."
	set category = "IC"

	var/mob/living/carbon/human/target
	if(!is_physically_disabled())
		target = get_grabbed_mob(src)
		if(target)
			to_chat(src, "CLIMB ON THEY")
			to_chat(target, "GET CLIMBED ON")

