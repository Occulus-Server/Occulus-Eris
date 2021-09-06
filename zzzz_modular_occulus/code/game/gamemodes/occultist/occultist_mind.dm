/obj/item/organ/internal/occultist
	max_damage = 90 //occultist organs are resilient


/obj/item/organ/internal/brain/occultist
	name = "brain tumor"
	health = 400
	max_damage = 400
	desc = "a meat of juicy piece found in a head's person."
	parent_organ_base = BP_HEAD
	organ_efficiency = list(BP_BRAIN_CULTIST = 200, BP_BRAIN = 200)
	unique_tag = BP_BRAIN_CULTIST
	specific_organ_size = 0
	vital = 1
	var/list/purchasedpowers = list()
	var/madnesspoints = 10

	owner_verbs = list(
		/obj/item/organ/internal/brain/occultist/proc/KnowledgeMenu
	)

/mob/proc/make_occultist()
	var/mob/living/carbon/human/user = src
	var/mindxfer = src.ckey
	if(istype(user))
		var/obj/item/organ/external/head = user.get_organ(BP_HEAD)
		if(head)
			var/obj/item/organ/internal/brain/occultist/B = new /obj/item/organ/internal/brain/occultist
			B.replaced(head)
			src.ckey = mindxfer
	if(stats)
		stats.addPerk(PERK_EMPATH)

/obj/item/organ/internal/brain/occultist/Topic(href, href_list)
	if(href_list["P"])
		purchasePower(href_list["P"])
		KnowledgeMenu()
	..()

/obj/item/organ/internal/brain/occultist/proc/spendpoints(var/amount)
	if(madnesspoints < amount)
		return FALSE
	else
		madnesspoints -= amount
		return TRUE