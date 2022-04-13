/obj/item/biosyphon
	desc = "A device found within the Northern Light when it was first explored. No expert has any idea how or where it makes anything - but given that it only prints donuts it naturally became Aegis property"

/obj/item/biosyphon/Process()
	if(world.time >= (last_produce + cooldown))
		var/path = pick(/obj/item/reagent_containers/food/snacks/donut/stat_buff/mec,
		/obj/item/reagent_containers/food/snacks/donut/stat_buff/cog,
		/obj/item/reagent_containers/food/snacks/donut/stat_buff/bio,
		/obj/item/reagent_containers/food/snacks/donut/stat_buff/rob,
		/obj/item/reagent_containers/food/snacks/donut/stat_buff/tgh,
		/obj/item/reagent_containers/food/snacks/donut/stat_buff/vig)

		var/obj/item/reagent_containers/food/snacks/donut/stat_buff/D = new path(get_turf(src))
		visible_message(SPAN_NOTICE("[name] dispenses [D]."))
		last_produce = world.time

/obj/item/device/radio/random_radio
	desc = "Radio that can pick up message from secure channels, or other places and times. No one's sure where it knows loot is, but is that really a question you want to ask?"

/obj/item/device/techno_tribalism
	name = "The Cube"
	desc = "An unknown device that feeds on rare tools, tool mods and other tech items. After being fed enough, will produce a strange technological part that doesn't seem to fit in anything."

/obj/item/device/von_krabin
	name = "Von-Krabin Stimulator"
	desc = "Named after the doctor who found this within the vessel, it seems to stimulate cognitive functions through unknown means."

