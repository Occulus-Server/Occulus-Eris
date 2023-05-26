/*
 * Contains:
 *		Security
 *		Detective  // Occulus Edit - Remove Eris corp. references
 *		Aegis Commander  // Occulus Edit - Remove Eris corp. references
 */

/*
 * Security
 */

/obj/item/clothing/under/security_formal
	name = "ironhammer formal uniform"
	desc = "A navy blue suit. Often used by Ironhammer personnel, for shooting with style."
	icon_state = "ih_formal"
	item_state = "ih_formal"
	spawn_blacklisted = TRUE

/obj/item/clothing/under/rank/warden
	desc = "The uniform worn by Ironhammer Sergeants, the sight of it is often followed by shouting. It has\"Gunnery Sergeant\" rank pins on the shoulders."
	name = "Gunnery Sergeant jumpsuit"
	icon_state = "warden"
	item_state = "r_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/warden/skirt
	name = "Gunnery Sergeant jumpskirt"
	desc = "It's made of a slightly sturdier material than standard jumpskirts, to allow for more robust protection. It has\"Gunnery Sergeant\" rank pins on the shoulders."
	icon_state = "warden_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/head/warden //legacy security hat
	name = "warden hat"
	desc = "A special helmet issued to the Warden of a securiy force."
	icon_state = "policehelm"
	body_parts_covered = NONE

/obj/item/clothing/under/rank/security
	name = "Cobalt Operative jumpsuit" // Occulus Edit - Remove Eris corp. references
	desc = "It's made of a slightly sturdier material than standard jumpsuits, to allow for robust protection." // Occulus Edit - Remove Eris corp. references
	icon_state = "security"
	item_state = "ba_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/security/turtleneck
	name = "Cobalt Operative's turtleneck"  // Occulus Edit - Remove Eris corp. references
	desc = "Military style turtleneck, made of a slightly sturdier material than standard jumpsuits, to allow for robust protection" // Occulus Edit - Remove Eris corp. references
	icon_state = "securityrturtle"

/obj/item/clothing/under/rank/security/skirt
	name = "Cobalt Operative jumpskirt"
	desc = "It's made of a slightly sturdier material than standard jumpskirts, to allow for robust protection."
	icon_state = "security_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/rank/medspec
	name = "Medical Specialist's jumpsuit"
	desc = "It's made of a slightly sturdier material than standard jumpsuits, to allow for robust protection. It has the words \"Medical Specialist\" written on the shoulders."  // Occulus Edit - Remove Eris corp. references
	icon_state = "medspec"
	item_state = "ba_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/medspec/skirt
	name = "Medical Specialist's jumpskirt"
	desc = "It's made of a slightly sturdier material than standard jumpskirts, to allow for robust protection. It has the words \"Medical Specialist\" written on the shoulders."  // Occulus Edit - Remove Eris corp. references
	icon_state = "medspec_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/*
 * Inspector
 */
/obj/item/clothing/under/rank/inspector
	name = "inspector's suit"
	desc = "Casual turtleneck and jeans, civilian clothes of the Aegis Inspector."  // Occulus Edit - Remove Eris corp. references
	icon_state = "insp_under"
	item_state = "insp_under"
	siemens_coefficient = 0.8
	no_fibers = TRUE	// OCCULUS EDIT

/obj/item/clothing/under/rank/det
	name = "inspector's suit"
	desc = "A rumpled white dress shirt paired with well-worn grey slacks, complete with a blue striped tie and a faux-gold tie clip."
	icon_state = "detective"
	item_state = "det"
	siemens_coefficient = 0.8
	no_fibers = TRUE	// OCCULUS EDIT

/obj/item/clothing/under/rank/det/black
	icon_state = "detective3"
	//item_state = "sl_suit"
	desc = "An immaculate white dress shirt, paired with a pair of dark grey dress pants, a red tie, and a charcoal vest."

/obj/item/clothing/head/detective
	name = "fedora"
	desc = "A brown fedora - either the cornerstone of a detective's style or a poor attempt at looking cool, depending on the person wearing it."
	icon_state = "detective_brown"
	item_state_slots = list(
		slot_l_hand_str = "detective_hat",
		slot_r_hand_str = "detective_hat",
		)
	allowed = list(/obj/item/reagent_containers/food/snacks/candy_corn, /obj/item/pen)
	armor = list(
		melee = 2,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.8
	body_parts_covered = NONE

/obj/item/clothing/head/detective/grey
	icon_state = "detective_gray"
	desc = "A grey fedora - either the cornerstone of a detective's style or a poor attempt at looking cool, depending on the person wearing it."

/obj/item/clothing/head/detective/black
	icon_state = "detective_black"
	desc = "A black fedora - either the cornerstone of a detective's style or a poor attempt at looking cool, depending on the person wearing it."


/*
 * Aegis Commander
 */
/obj/item/clothing/under/rank/ih_commander
	desc = "It's a jumpsuit worn by those few with the dedication to achieve the position of \"Aegis Commander\"."  // Occulus Edit - Remove Eris corp. references
	name = "Aegis Cobalt Commander's jumpsuit"  // Occulus Edit - Remove Eris corp. references
	icon_state = "hos"
	item_state = "r_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/ih_commander/skirt
	name = "Aegis Cobalt Commander's jumpskirt"  // Occulus Edit - Remove Eris corp. references
	desc = "It's a jumpskirt worn by those few with the dedication to achieve the position of \"Aegis Commander\"."  // Occulus Edit - Remove Eris corp. references
	icon_state = "hos_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/head/HoS
	name = "Aegis Cobalt Commander Hat"  // Occulus Edit - Remove Eris corp. references
	desc = "The hat of the Aegis Commander. For showing the officers who's in charge."  // Occulus Edit - Remove Eris corp. references
	icon_state = "hoshat"
	body_parts_covered = NONE
	siemens_coefficient = 0.8
	rarity_value = 50

/*
 * "Navy" uniforms
 */
/obj/item/clothing/under/rank/cadet
	name = "Cobalt Cadet jumpskirt" // Occulus Edit - Remove Eris corp. references
	desc = "It's a sailor's uniform used for cadets in training, though more frequently in acts of hazing." // Occulus Edit - Remove Eris corp. references
	icon_state = "cadet"
	item_state = "cadet"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
