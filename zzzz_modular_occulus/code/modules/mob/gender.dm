/datum/gender
	var/identity = "gender"
	var/himself = "themselves"

/datum/gender/male
	identity = "Male"
	himself = "himself"

/datum/gender/female
	identity = "Female"
	himself = "herself"

/datum/gender/neuter
	himself = "itself"

/datum/gender/genderneutral
	identity = "Non Binary"
	key = GENDERNEUTRAL

/datum/gender/neuter/nonpersonal
	identity = "Agender"
	key = NONPERSONAL