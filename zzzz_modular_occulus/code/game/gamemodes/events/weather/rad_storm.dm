////Radiation storms occur when the station passes through an irradiated area, and irradiate anyone not standing in protected areas (maintenance, emergency storage, etc.)
///This is the rad_storm modular file for Occulus. Please add any additions to the radiation storm event here. Thanks!

/datum/weather/rad_storm/New()
	protected_areas += list(
		/area/eris/elevator
		)
