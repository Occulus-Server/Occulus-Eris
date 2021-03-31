/obj/machinery/portable_atmospherics/hydroponics/soil
	icon = 'zzzz_modular_occulus/icons/obj/hydroponics_machines.dmi'
	name = "wooden planter"

/obj/machinery/portable_atmospherics/hydroponics/soil/attackby(var/obj/item/I, var/mob/user)
	..()

/datum/craft_recipe/furniture/planter
	name = "wooden planter"
	result = /obj/machinery/portable_atmospherics/hydroponics/soil
	time = 200
	flags = CRAFT_ON_FLOOR
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SAWING, 15, 20),
		list(QUALITY_HAMMERING, 15, 20)
	)


