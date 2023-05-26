/obj/item/card/id
	var/datum/gender/pronouns = "\[UNSET\]"

/mob/living/carbon/human/set_id_info(var/obj/item/card/id/id_card)
	id_card.pronouns 			= gender_datums[get_gender()]
	id_card.age 				= age
	id_card.registered_name		= real_name
	id_card.sex 				= capitalize(gender)
	id_card.set_id_photo(src)

	id_card.blood_type		= b_type
	id_card.dna_hash		= dna_trace
	id_card.fingerprint_hash= fingers_trace
	id_card.update_name()

/obj/item/card/id/dat()
	var/dat = ("<table><tr><td>")
	dat += text("Name: []</A><BR>", registered_name)
	dat += text("Sex: []</A><BR>\n", sex)
	dat += text("Gender Identity: []</A><BR>\n", pronouns.identity)
	dat += text("Age: []</A><BR>\n", age)
	dat += text("Rank: []</A><BR>\n", assignment)
	dat += text("Fingerprint: []</A><BR>\n", fingerprint_hash)
	dat += text("Blood Type: []<BR>\n", blood_type)
	dat += text("DNA Hash: []<BR><BR>\n", dna_hash)
	if(front && side)
		dat +="<td align = center valign = top>Photo:<br><img src=front.png height=80 width=80 border=4><img src=side.png height=80 width=80 border=4></td>"
	dat += "</tr></table>"
	return dat