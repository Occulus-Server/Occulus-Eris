/datum/category_item/setup_option/core_implant/cruciform
	name = "Mekhanite Cruciform"
	desc = "Deus Ex Anima. A marvelous confection of modern technology, the Cruciform <br>\
	allows a faithful acolyte to retain their mind and soul even in death.<br>\
	Signifies your dedication and loyalty to Children of The Mekhane."
	implant_type = /obj/item/weapon/implant/core_implant/cruciform
	restricted_depts = IRONHAMMER | COMMAND
	allowed_depts = CHURCH
	allow_modifications = TRUE

/datum/category_item/setup_option/core_implant/cruciform/apply(mob/living/carbon/human/character)
	var/obj/item/weapon/implant/core_implant/C = new implant_type
	C.install(character)
	C.activate()
	C.install_default_modules_by_job(character.mind.assigned_job)
	C.access.Add(character.mind.assigned_job.cruciform_access)

/datum/category_item/setup_option/core_implant/soulcrypt
	name = "Soulcrypt"	//Syzygy edit - lazarus doesn't exist
	desc = "An Innovation in the fields of neural networking and biological technology!<br>\
	The Soulcrypt not only saves a DNA profile of you,<br>\
	but also a scan of your entire brain allowing you to be reborn in the event of death!"
	implant_type = /obj/item/weapon/implant/core_implant/soulcrypt
	allow_modifications = TRUE

/datum/category_item/setup_option/core_implant/soulcrypt/apply(mob/living/carbon/human/character)
	character.create_soulcrypt()

// SYZYGY SPAGHETTI START - This is to make it so that old characters with the cruciform selected pre-update won't get borked over completely
/datum/category_item/setup_option/core_implant/cruciform/oldprefsfix
	name = "Core Implant"
	desc = "DEBUG OPTION: This is to prevent a glitch where characters saved with cruciforms selected before the church rework update get permanently stuck with a non-existant implant. <br>\
	Deus Ex Anima. A marvelous confection of modern technology, the Cruciform <br>\
	allows a faithful acolyte to retain their mind and soul even in death.<br>\
	Signifies your dedication and loyalty to Children of The Mekhane."
// SYZYGY SPAGHETTI END
