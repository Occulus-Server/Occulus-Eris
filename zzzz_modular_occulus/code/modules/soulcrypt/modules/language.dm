/datum/soulcrypt_module/language
	name = "language adder"
	description = "A passive module that grants its user fluency in a particular language until it is uninstalled. Consumes no resources other than program space."
	var/list/languages_to_add = list(LANGUAGE_COMMON)

/datum/soulcrypt_module/language/on_install()
	for(var/known_language in owner.host_languages)
		languages_to_add -= known_language
		if(!languages_to_add)
			owner.send_host_message("<b>[name]:</b> No applicable effects to user. Recommend immediate uninstallation.", MESSAGE_WARNING)

	if(languages_to_add)
		for(var/language in languages_to_add)
			owner.wearer.add_language(language)

/datum/soulcrypt_module/language/on_uninstall()
	for(var/language in languages_to_add)
		owner.wearer.remove_language(language)

/datum/soulcrypt_module/language/jive
	name = "Language: Jive"
	languages_to_add = list(LANGUAGE_JIVE)

/datum/soulcrypt_module/language/sol
	name = "Language: Sol Common"
	languages_to_add = list(LANGUAGE_SOL_COMMON)

/datum/soulcrypt_module/language/yiff
	name = "Language: Yueldisch"
	languages_to_add = list(LANGUAGE_YUELDISCH)
