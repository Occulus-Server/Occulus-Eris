/datum/job/hop
	also_known_languages = list(LANGUAGE_CYRILLIC = 0)

/decl/hierarchy/outfit/job/ensign
	name = OUTFIT_JOB_NAME("Ensign")
	uniform = /obj/item/clothing/under/rank/ensign
	l_ear = /obj/item/device/radio/headset/heads/hop
	shoes = /obj/item/clothing/shoes/reinforced
	id_type = /obj/item/weapon/card/id/hop
	pda_type = /obj/item/modular_computer/pda/heads/hop
	backpack_contents = list(/obj/item/weapon/tool/knife/dagger/ceremonial = 1)

/obj/item/clothing/under/rank/ensign
	desc = "It's a jumpsuit worn by a low-ranking officer."
	name = "ensign jumpsuit"
	icon_state = "genericb"
	item_state = "b_suit"

/datum/job/ensign
	flag = ENSIGN
	department = DEPARTMENT_COMMAND
	department_flag = COMMAND
	faction = "NEV Northern Light"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the first officer and captain"
	selection_color = "#ddddff"
	wage = WAGE_LABOUR
	alt_titles = list("Helmsman", "Communications Officer")
	perks = list(/datum/perk/sommelier)
	ideal_character_age = 30

	description = "You are a low-ranking officer on the ship. While not yet trusted or influential enough to be a full member of command, <br>\
you have access to a wide variety of systems.<br>\
<br>\
Your job is to ensure that the ship runs smoothly. Utilize your access to crew monitors, communications, cameras, <br>\
and the helm to help other members of the crew.<br>\
<br>\
You are, in esssence, the glue that helps keep the ship together.<br>\
<br>\
Prove your loyalty and capability and you may one day find yourself commanding your own ship.<br>\
Above all you are loyal to the first officer and the captain."

	duties = "Provide remote support to the crew with cameras and monitors<br>\
Helm the ship if the captain and first officer are unable or unwilling to do so<br>\
Act as the eyes and ears of the first officer and captain.<br>\
Should the worst occur, defend your ship, post, and commanders with your life."

	loyalties = "You are loyal to the first officer and captain. Unless you're an antagonist and have a good reason for betrayal, you should remain loyal to the death."

	outfit_type = /decl/hierarchy/outfit/job/ensign


	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	access = list(
		access_maint_tunnels, access_heads, access_RC_announce, access_sec_doors, access_tcomsat,
		access_moebius, access_tech_storage, access_teleporter
	)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 5,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_VIG = 20,
		STAT_COG = 10
	)

/obj/landmark/join/start/ensign
	name = "Ensign"
	icon_state = "player-gold"
	join_tag = /datum/job/ensign
