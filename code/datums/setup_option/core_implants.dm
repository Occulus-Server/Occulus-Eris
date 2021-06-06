/datum/category_item/setup_option/core_implant/cruciform
	name = "Mekhanite Cruciform"
	desc = "Deus Ex Anima. A marvelous confection of modern technology, the Cruciform <br>\
	allows a faithful acolyte to retain their mind and soul even in death.<br>\
	Signifies your dedication and loyalty to Children of The Mekhane.<br>\
	Ostensibly provided for free to new inductees."	// OCCULUS EDIT - hammering out the lore
	implant_type = /obj/item/weapon/implant/core_implant/cruciform
	restricted_depts = IRONHAMMER | COMMAND
	allowed_depts = CHURCH
	allow_modifications = TRUE

/datum/category_item/setup_option/core_implant/cruciform/apply(mob/living/carbon/human/character)
	if(character.mind.assigned_role != "Robot")	// OCCULUS EDIT - Check if they're a cyborg before doing it
		var/obj/item/weapon/implant/core_implant/cruciform/C = new implant_type
		C.install(character)
		C.activate()
		C.install_default_modules_by_job(character.mind.assigned_job)
		C.access.Add(character.mind.assigned_job.cruciform_access)
		spawn(1)
			var/datum/core_module/cruciform/cloning/R = C.get_module(CRUCIFORM_CLONING)
			R.ckey = character.ckey

/datum/category_item/setup_option/core_implant/soulcrypt
	name = "Soulcrypt"	//Syzygy edit - lazarus doesn't exist
	desc = "An Innovation in the fields of neural networking and biological technology!<br>\
	The Soulcrypt not only saves a DNA profile of you,<br>\
	but also a scan of your entire brain allowing you to be reborn in the event of death!<br>\
	Features a very steep price tag and requires a subscription to function, but employers tend to subsidize their installation and usage."	// OCCULUS EDIT - hammering out the lore
	implant_type = /obj/item/weapon/implant/core_implant/soulcrypt
	allow_modifications = TRUE

/datum/category_item/setup_option/core_implant/soulcrypt/apply(mob/living/carbon/human/character)
	if(character.mind.assigned_role != "Robot")	// OCCULUS EDIT - Check if they're a cyborg before doing it
		character.create_soulcrypt()
