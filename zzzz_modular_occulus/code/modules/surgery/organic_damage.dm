/datum/surgery_step/fix_brute
	allowed_tools = list(
		/obj/item/stack/medical/advanced/bruise_pack = 100,
		/obj/item/stack/medical/bruise_pack = 20,
	)

	duration = 80

/datum/surgery_step/fix_brute/can_use(mob/living/user, obj/item/organ/external/organ, obj/item/stack/tool)
	return BP_IS_ORGANIC(organ) && organ.is_open() && organ.brute_dam >= 15

/datum/surgery_step/fix_brute/begin_step(mob/living/user, obj/item/organ/external/organ, obj/item/stack/tool)
	user.visible_message(
		SPAN_NOTICE("[user] begins to mend [organ.get_surgery_name()]."),
		SPAN_NOTICE("You begin to mend [organ.get_surgery_name()].")
	)

/datum/surgery_step/fix_brute/end_step(mob/living/user, obj/item/organ/external/organ, obj/item/stack/tool)
	user.visible_message(
		SPAN_NOTICE("[user] finishes mending [organ.get_surgery_name()]."),
		SPAN_NOTICE("You finish mending [organ.get_surgery_name()].")
	)
	if(tool.use(1))
		organ.heal_damage(rand(10, 15), 0, 1, 1)

/datum/surgery_step/fix_brute/fail_step(mob/living/user, obj/item/organ/external/organ, obj/item/stack/tool)
	user.visible_message(
		SPAN_WARNING("[user]'s hand slips, further damaging [organ.get_surgery_name()]!"),
		SPAN_WARNING("Your hand slips, further damaging [organ.get_surgery_name()]!")
	)
	organ.take_damage(rand(5,10), 0)

/datum/surgery_step/fix_burn
	allowed_tools = list(
	/obj/item/stack/medical/advanced/ointment = 100,
	/obj/item/stack/medical/ointment = 20,
	)

	duration = 80

/datum/surgery_step/fix_burn/can_use(mob/living/user, obj/item/organ/external/organ, obj/item/stack/tool)
	return BP_IS_ORGANIC(organ) && organ.is_open() && organ.burn_dam >= 15

/datum/surgery_step/fix_burn/begin_step(mob/living/user, obj/item/organ/external/organ, obj/item/stack/tool)
	user.visible_message(
		SPAN_NOTICE("[user] begins to treat [organ.get_surgery_name()]."),
		SPAN_NOTICE("You begin to treat [organ.get_surgery_name()].")
	)

/datum/surgery_step/fix_burn/end_step(mob/living/user, obj/item/organ/external/organ, obj/item/stack/tool)
	user.visible_message(
		SPAN_NOTICE("[user] finishes treating [organ.get_surgery_name()]."),
		SPAN_NOTICE("You finish treating [organ.get_surgery_name()].")
	)
	if(tool.use(1))
		organ.heal_damage(0, rand(10, 15), 1, 1)

/datum/surgery_step/fix_burn/fail_step(mob/living/user, obj/item/organ/external/organ, obj/item/stack/tool)
	user.visible_message(
		SPAN_WARNING("[user] hand slips, further injuring [organ.get_surgery_name()]!"),
		SPAN_WARNING("Your hand slips, further injuring [organ.get_surgery_name()]!")
	)
	organ.take_damage(rand(5,10))