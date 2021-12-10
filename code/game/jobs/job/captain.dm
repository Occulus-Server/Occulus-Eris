var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/captain
	title = "Captain"
	flag = CAPTAIN
	department = DEPARTMENT_COMMAND
	head_position = 1
	department_flag = COMMAND
	faction = "CEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "your heart, wisdom and NanoTrasen"
	selection_color = "#ccccff"
	req_admin_notify = 1
	wage = WAGE_NONE //The captain doesn't get paid, he's the one who does the paying
	//The ship account is his, and he's free to draw as much salary as he likes

	wl_config_heads = TRUE		//Eclipse edit.


	perks = list(/datum/perk/sommelier)

	ideal_character_age = 70 // Old geezer captains ftw
	outfit_type = /decl/hierarchy/outfit/job/captain

	description = "You are the Captain. <br>\
The assigned supervisor of the vast rusting hulk that is the CEV Northern Light. At least, as long as you keep sending the expedition reports.<br>\
This ship is a pinnacle of your career, crewed by an alliance of corporations and factions that must cooperate to survive.<br>\

You are the leader of this ship. Your word is law, but only as long as you can enforce that law.<br>\
Your command staff are comprised the leaders from each faction. They have their own agendas, and their interests must be served too. If you make them unhappy, the loyalty of their faction goes with them.<br>\
Treat your command officers with respect, and listen to their council. Try not to micromanage their departments or interfere in their affairs, and they should serve you well<br>\

You are a free agent, able to go where you will. Your loyalty given to whoever you see fit. You cannot run this ship alone, however. You need everyone."

	loyalties = "Your first loyalty is to The Board of Investors. The board appointed you here as their representative and CEO. Do not disappoint them. <br>\
	Your second loyalty is to the Northern Light, your ship. It is the pinnacle of your career, and you are nothing without it. If it were to be destroyed, you and your descendants would be ruined for centuries. <br>\
	Your third loyalty is to your command staff. They represent their entire faction while on-duty. Listen to their counsel. Ensure their interests are served. Keep them happy"

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = 25,
		STAT_COG = 15
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	equip(var/mob/living/carbon/human/H)
		if(!..())	return 0
		if(H.age>49)
			var/obj/item/clothing/under/U = H.w_uniform
			if(istype(U)) U.accessories += new /obj/item/clothing/accessory/medal/gold/captain(U)
		return 1

	get_access()
		return get_all_station_access()

/obj/landmark/join/start/captain
	name = "Captain"
	icon_state = "player-gold-officer"
	join_tag = /datum/job/captain



/datum/job/hop
	title = "First Officer"
	flag = FIRSTOFFICER
	department = DEPARTMENT_COMMAND
	head_position = 1
	department_flag = COMMAND
	faction = "CEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ddddff"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	also_known_languages = list(LANGUAGE_CYRILLIC = 20, LANGUAGE_SERBIAN = 15)
	perks = list(/datum/perk/sommelier)
	ideal_character_age = 50

	wl_config_heads = TRUE		//Eclipse edit.

	description = "You are the captain's right hand. Their second in command. Wherever they go, you follow. Wherever they lead, you drag everyone else along. You make sure their will is done, their orders obeyed, and their laws enforced.<br>\
If they make mistakes, discreetly inform them. Help to cover up their indiscretions and smooth relations with the crew, especially other command staff. Keep the captain safe, by endangering yourself in their stead if necessary.<br>\
<br>\
Do not embarrass them or harm relations with faction leaders.<br>\
<br>\
But who are you?<br>\
Perhaps you are the captain's lifelong friend, or a trusted associate to whom they gave a position of power.<br>\
Perhaps you're a consummate professional who comes highly recommended.<br>\
A retired general or naval officer?<br>\
Perhaps you're the captain's sibling, firstborn, or spouse. Nobody can prevent nepotism if they choose<br>\
Perhaps you're a foreign diplomat, your position a ceremonial one to ensure a treaty.<br>\

Whatever your origin, you are fiercely loyal to the captain"

	duties = "Oversee everyone else, especially the other command staff, to ensure the captain's orders are being carried out.<br>\
Handle job reassignments and promotion requests, if an appropriate faction leader isn't available<br>\
Act as the captain's surrogate in risky situations where a command presence is required<br>\
Replace the captain if they become incapacitated, need to take a break, or suffer a premature death<br>\
Act as the captain's sidekick, bodyguard, and last line of defense in a crisis or mutiny situation"

	loyalties = "Your first and only loyalty is to the captain. Unless you're an antagonist and have a good reason for betrayal, you should remain loyal to the death. You are the only one they can truly trust"

	outfit_type = /decl/hierarchy/outfit/job/hop


	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	get_access()
		return get_all_station_access()

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 10,
		STAT_MEC = 10,
		STAT_VIG = 20,
		STAT_COG = 10
	)

/obj/landmark/join/start/hop
	name = "First Officer"
	icon_state = "player-gold"
	join_tag = /datum/job/hop

/datum/job/ensign //Occulus Edit - We define this here for list ordering
	title = "Ensign" //Occulus Edit - We define this here for list ordering


