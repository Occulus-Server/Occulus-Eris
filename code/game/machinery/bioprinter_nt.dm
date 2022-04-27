/obj/machinery/autolathe/bioprinter
	name = "NanoTrasen Bioprinter"
	desc = "NanoTrasen machine for printing things using biomass."
	icon_state = "bioprinter"
	circuit = /obj/item/electronics/circuitboard/neotheology/bioprinter

	build_type = AUTOLATHE | BIOPRINTER
	unsuitable_materials = list()

/obj/machinery/autolathe/bioprinter/disk
	default_disk = /obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter

/obj/machinery/autolathe/bioprinter/public
	default_disk = /obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter_public
