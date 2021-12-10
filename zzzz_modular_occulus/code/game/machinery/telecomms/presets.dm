// Occulus stuff for preconfigured telecomms machines

/obj/machinery/telecomms/relay/preset/science
	id = "Count Doku Relay"
	autolinkers = list("d_relay")

/obj/machinery/telecomms/hub/preset
	autolinkers = list("hub", "relay", "c_relay", "s_relay", "m_relay", "r_relay", "science", "medical",
	"supply", "service", "common", "command", "engineering", "security", "nt", "unused",
	"receiverA", "broadcasterA", "d_relay")

/obj/machinery/telecomms/hub/preset_cent
	autolinkers = list("hub_cent", "c_relay", "s_relay", "m_relay", "r_relay",
	 "centcom", "receiverCent", "broadcasterCent", "d_relay")
