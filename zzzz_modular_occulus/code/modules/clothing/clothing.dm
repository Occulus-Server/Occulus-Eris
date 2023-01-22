/obj/item/clothing
	var/ear_protection = 0

/obj/item/clothing/under
	var/rolldown = FALSE

/obj/item/clothing/under/verb/roll_down()
	set name = "Toggle Jumpsuit"
	set desc = "Toggle the appearance of your jumpsuit."
	set category = "Object"

	usr.visible_message("[usr] adjusts their jumpsuit.", \
	"You adjust your jumpsuit.")
	rolldown = !rolldown
	usr.update_inv_w_uniform()
