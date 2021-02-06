// code/game/objects/items/devices/radio/radio.dm

//First, let's start out by defining the radio sprite to use the new sprite.
/obj/item/device/radio
	icon = 'zzzz_modular_occulus/icons/obj/xpr.dmi'		//This is overridden for borg radios and encryption keys don't inherit; the rest are reset below.
	icon_state = "xprgrey"
	desc = "A basic two-way radio."

/obj/item/device/radio/color		//Accursed American English spellings...
	desc = "A basic two-way radio. This one in particular is a nondescript black."

	/* We are not adding pre-loaded channels here. Let them read from the user's
	 * ID card, or we'll probably run into weird channel access issues.
	 */

/obj/item/device/radio/color/interact(mob/user)		//calls for icon updating
	..()
	update_icon()

/obj/item/device/radio/color/ToggleBroadcast()
	..()
	update_icon()

/obj/item/device/radio/color/ToggleReception()
	..()
	update_icon()

/obj/item/device/radio/color/update_icon()		//Icon updating (for disabled radios)
	if(!(broadcasting || listening))		//if not broadcasting or listening
		icon_state = "[initial(icon_state)]-off"
	else
		icon_state = initial(icon_state)

//Now we define pre-coloured radios.
/obj/item/device/radio/color/red		//Security
	icon_state = "xprred"
	desc = "A basic two-way radio. This one in particular is robust red."

/obj/item/device/radio/color/brown		//Cargo and Supply
	icon_state = "xprbrown"
	desc = "A basic two-way radio. This one in particular is cardboard brown."

/obj/item/device/radio/color/yellow		//Engineering
	icon_state = "xpryellow"
	desc = "A basic two-way radio. This one in particular is heavy-duty yellow."

/obj/item/device/radio/color/green		//CentComm
	icon_state = "xprgreen"
	desc = "A basic two-way radio. This one in particular is a commanding green."

/obj/item/device/radio/color/navyblue		//Heads of Staff/CDir
	icon_state = "xprblue"
	desc = "A basic two-way radio. This one in particular is royalty blue."

/obj/item/device/radio/color/lightblue		//Medical
	icon_state = "xprmedblue"
	desc = "A basic two-way radio. This one in particular is a sterile blue-and-white."

/obj/item/device/radio/color/lightblue/emergency		//Medbay emergency radio.
	name = "\improper Medbay Emergency Radio Link"
	icon = 'icons/obj/radio.dmi' //We want to differentiate between the base radio and the emergency link, so we'll use the old sprite.
	icon_state = "walkietalkie"
	desc = "An emergency radio for quick, one-way contact with the medbay. This radio has been programmed with a frequency lock, which prevents it from changing channels."		//Short of admin intervention, anyway...
	frequency = MED_I_FREQ
	freqlock = TRUE

/obj/item/device/radio/color/lightblue/emergency/update_icon()
	icon_state = initial(icon_state)		//No 'off' sprite.

/obj/item/device/radio/color/purple		//Research
	icon_state = "xprviolet"
	desc = "A basic two-way radio. This one in particular is an experimental purple."


///////////////// END OF FUNCTIONAL CODE /////////////////

// These are not redefined elsewhere, so we need to stick these here to prevent from breaking the sprites.
/obj/item/device/radio/beacon
	icon = 'icons/obj/radio.dmi'

/obj/item/device/radio/electropack
	icon = 'icons/obj/radio.dmi'

/obj/item/device/radio/headset
	icon = 'icons/obj/radio.dmi'

/obj/item/device/radio/intercom
	icon = 'icons/obj/radio.dmi'

//We don't touch the base update_icon() proc so there's no need to redefine that.

var/global/list/all_radio_squelch_sounds = list('sound/effects/radio_squelch/squelch1.ogg', 'sound/effects/radio_squelch/squelch2.ogg', 'sound/effects/radio_squelch/squelch3.ogg', 'sound/effects/radio_squelch/squelch4.ogg')

/obj/item/device/radio
	var/audible_squelch_enabled = TRUE
	var/audible_squelch_type = 'sound/misc/null.ogg'		//should be overwritten on New()

/obj/item/device/radio/proc/play_squelch_sound(var/audiofile)
	if(audible_squelch_enabled)
		playsound(loc, audiofile, 25, 1, 1)

/obj/item/device/radio/beacon
	audible_squelch_enabled = FALSE

/obj/item/device/radio/borg
	audible_squelch_enabled = FALSE

/obj/item/device/radio/exosuit
	audible_squelch_enabled = FALSE

/obj/item/device/radio/electropack
	audible_squelch_enabled = FALSE

/obj/item/device/radio/intercom		//we don't want intercoms to do this.
	audible_squelch_enabled = FALSE

/obj/item/device/radio/phone
	audible_squelch_enabled = FALSE

/obj/item/device/radio/spy
	audible_squelch_enabled = FALSE