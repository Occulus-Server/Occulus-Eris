/obj/item/weapon/augmentor
	name = "augmentor"
	desc = "I'm just testing some stuff give me a break"
	icon = 'zzzz_modular_occulus/icons/obj/augmentor.dmi'
	icon_state = "augmentor"
	item_state = "syringe_0"
	var/augmentpath
	var/obj/item/organ_module/augment = null
	spawn_blacklisted = TRUE

/obj/item/weapon/augmentor/New()
	augment = new augmentpath

/obj/item/weapon/augmentor/attack(mob/living/M, mob/living/user)
	if(!istype(M) || !augment)
		return
	
	var/obj/item/organ/external/limbtarget = null
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		limbtarget = H.get_organ(user.targeted_organ)

	M.visible_message(SPAN_WARNING("[user] is attemping to implant [M]."))

	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	user.do_attack_animation(M)

	if(do_mob(user, M, 50) && src && augment)
		augment.loc = user.loc
		augment.install(limbtarget)
		visible_message(SPAN_WARNING("[user] has implanted [M]."))
		augment = null
		update_icon()
	else
		visible_message(SPAN_WARNING("[user] failed to implant [M]."))
		
/obj/item/weapon/augmentor/on_update_icon()
	if(augment)
		icon_state = "augmentor"
	else
		icon_state = "augmentor_used"
	return

obj/item/weapon/augmentor/debug
	name = "Debugmentor"
	desc = "This is a debugging tool"
	augmentpath = /obj/item/organ_module/debugger

/obj/item/weapon/augmentor/e_armblade
	name = "Augmentor (Energy Armblade)"
	desc = "A self augmentation device, this one holding an energetic armblade. It's your fault if you install it into your head and become a unicorn"
	augmentpath = /obj/item/organ_module/active/simple/armblade/energy_blade

/obj/item/weapon/augmentor/hurricane
	name = "Augmentor (Hurricane)"
	desc = "A self augmentation device, this one holding an Integrated .35 Auto PDW. Ammo not included, designed to fit into arms."
	augmentpath = /obj/item/organ_module/active/simple/armsmg/hurricane

/obj/item/weapon/augmentor/typhoon
	name = "Augmentor (Typhoon)"
	desc = "A self augmentation device, this one holding an Integrated .40 Magnum Auto-Revolver. Ammo not included, designed to fit into arms."
	augmentpath = /obj/item/organ_module/active/simple/armsmg/typhoon

/obj/item/weapon/augmentor/tornado
	name = "Augmentor (Tornado)"
	desc = "A self augmentation device, this one holding an Integrated .25 Caseless PDW. Ammo not included, designed to fit into arms."
	augmentpath = /obj/item/organ_module/active/simple/armsmg/tornado