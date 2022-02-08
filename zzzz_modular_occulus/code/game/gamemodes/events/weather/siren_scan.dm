//Radiation storms occur when the station passes through an irradiated area, and irradiate anyone not standing in protected areas (maintenance, emergency storage, etc.)
/datum/weather/siren_scan
	name = "anomalous scan signal"
	desc = "An intense scan of unknown origin passes through the area with an unknown purpose."

	telegraph_duration = 0
	telegraph_message = "<span class='danger'>The air begins to grow warm and your hair stands on end.</span>"

	weather_message = "<span class='userdanger'><i>You feel a strange prickling sensation!</i></span>"
	weather_overlay = "ash_storm"
	weather_duration_lower = 0
	weather_duration_upper = 0
	weather_color = "#5ca1cc"
	weather_sound = 'zzzz_modular_occulus/sound/effects/The_Siren.wav'

	end_duration = 50
	end_message = "<span class='notice'>The air seems to be returning to normal.</span>"

	area_type = /area
	protected_areas = list()
