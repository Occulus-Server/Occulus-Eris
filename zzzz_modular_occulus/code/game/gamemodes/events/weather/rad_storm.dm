////Radiation storms occur when the station passes through an irradiated area, and irradiate anyone not standing in protected areas (maintenance, emergency storage, etc.)
///This is the rad_storm modular file for Occulus. Please add any additions to the radiation storm event here. Thanks!

/datum/weather/rad_storm
	protected_areas = list(
		/area/shuttle/escape,
		/area/shuttle/escape_pod1,
		/area/shuttle/escape_pod2,
		/area/shuttle/escape_pod3,
		/area/shuttle/escape_pod5,
		/area/eris/crew_quarters/sleep/cryo,
		/area/eris/security/disposal,
		/area/eris/security/maintpost,
		/area/shuttle/specops/centcom,
		/area/shuttle/mercenary,
		/area/shuttle/administration,
		/area/eris/maintenance,
		/area/eris/rnd/anomalisoltwo,
		/area/eris/rnd/anomalisolthree,
		/area/eris/rnd/server,
		/area/deepmaint,
		/area/eris/elevator
		)
