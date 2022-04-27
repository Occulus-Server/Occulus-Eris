//OCCULUS EDIT: Basically the whole file, revamping telescience.
/obj/item/electronics/circuitboard/telesci_pad
	name = T_BOARD("advanced telepad")
	build_path = /obj/machinery/telesci_pad
	board_type = "machine"
	origin_tech = list(TECH_MATERIAL = 3, TECH_BLUESPACE = 4)

	req_components = list(
		/obj/item/bluespace_crystal = 2,
		/obj/item/stock_parts/capacitor = 1
	)

/obj/item/electronics/circuitboard/telesci_console
	name = T_BOARD("Telescience Console")
	build_path = /obj/machinery/computer/telesci_console
	origin_tech = list(TECH_DATA = 3, TECH_BLUESPACE = 2)

/obj/item/electronics/circuitboard/telesci_relay
	name = T_BOARD("telepad relay")
	build_path = /obj/machinery/telesci_relay
	board_type = "machine"
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_BLUESPACE = 3)

	req_components = list(
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stock_parts/micro_laser = 1
	)

/obj/item/electronics/circuitboard/tele_inhibitor
	name = T_BOARD("bluespace inhibitor")
	build_path = /obj/machinery/telesci_inhibitor
	origin_tech = list(TECH_MATERIAL = 2, TECH_POWER = 2, TECH_BLUESPACE = 2)

	req_components = list(
		/obj/item/stock_parts/subspace/ansible = 2
	)

/datum/design/research/circuit/telesci/relay
	name = "TeleSci Relay"
	build_path = /obj/item/electronics/circuitboard/telesci_relay
	sort_string = "VAAF"
	category = CAT_BLUE

/datum/design/research/circuit/telesci/inhibit
	name = "Teleporter Inhibitor"
	build_path = /obj/item/electronics/circuitboard/tele_inhibitor
	sort_string = "VAAQ"
	category = CAT_BLUE