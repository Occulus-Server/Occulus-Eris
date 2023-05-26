/obj/item/tool/sword/cult
	name = "Non-Euclidean Blade"
	spawn_blacklisted = TRUE

	desc = "Standing around, staring at this for what are you? To killing get!"
	icon = 'zzzz_modular_occulus/icons/obj/occultist_weap/occsword.dmi'

	icon_state = "non-euclidian_blade"
	//item_state = "righthand"

	matter = list(MATERIAL_STEEL = 1, MATERIAL_OH_GOD_HELP_ME_I_AM_TRAPPED_IN_HERE = 15, MATERIAL_LEATHER = 5) //This is messed up on purpose. Don't fix it. It's supposed to cause wierd shit
	sharp = FALSE
	edge = FALSE
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT | SLOT_BACK
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	tool_qualities = list(QUALITY_PULSING = 7, QUALITY_SCREW_DRIVING = 3)
	item_icons = list(
		slot_l_hand_str = 'zzzz_modular_occulus/icons/obj/occultist_weap/occsword.dmi',
		slot_r_hand_str = 'zzzz_modular_occulus/icons/obj/occultist_weap/occsword.dmi',
		slot_belt_str = 'zzzz_modular_occulus/icons/obj/occultist_weap/occsword.dmi',
		slot_back_str = 'zzzz_modular_occulus/icons/obj/occultist_weap/occsword.dmi')
	item_state_slots = list(
		slot_l_hand_str = "lefthand",
		slot_r_hand_str = "righthand",
		slot_belt_str = "belt",
		slot_back_str = "back"
		)

/obj/item/tool/sword/cult/attack(mob/living/carbon/human/M, mob/user)
	if(istype(M, /mob/living/carbon/human))
		if(M.sanity)
			M.sanity.onPsyDamage(36)
			to_chat(M, SPAN_DANGER(M.sanity.pick_quote_20()))
			M.adjust_hallucination(10, 10)
	..()
	return


/obj/item/tool/hammer/homewrecker/cult
	name = "Soulcrusher"

	icon = 'zzzz_modular_occulus/icons/obj/occultist_weap/occhammer.dmi'

	desc = "Heavy extremely sledgehammer. A Handle resembles a chunk welded to which a large long steel."
	icon_state = "soulcrusher"
	item_icons = list(
		slot_l_hand_str = 'zzzz_modular_occulus/icons/obj/occultist_weap/occhammer.dmi',
		slot_r_hand_str = 'zzzz_modular_occulus/icons/obj/occultist_weap/occhammer.dmi',
		)
	item_state_slots = list(
		slot_l_hand_str = "lefthand",
		slot_r_hand_str = "righthand",
		)
	wielded_icon = "wielded"
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_SHOVELING = 1, QUALITY_DIGGING = 1, QUALITY_EXCAVATING = 100, QUALITY_WELDING = 21)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_THEVOICESTHEVOICESTHEVOICES = 15, MATERIAL_MARBLE = 1)
	spawn_blacklisted = TRUE


/obj/item/tool/hammer/homewrecker/cult/attack(mob/living/carbon/human/M, mob/user)
	if(istype(M, /mob/living/carbon/human))
		if(M.sanity)
			M.sanity.onPsyDamage(26)
			to_chat(M, SPAN_DANGER(M.sanity.pick_quote_20()))
			do_sparks(1, 0, M.loc)
	..()
	return

/obj/item/tool/hammer/homewrecker/cult/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(isrobot(target))
		return ..()
	var/obj/item/organ/external/affecting
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		affecting = H.get_organ(hit_zone)
	if(affecting)
		target.stun_effect_act(0, 26, hit_zone, src)
	..()


/obj/item/tool/saw/chain/cult
	name = "Chainripper"
	desc = "Cut trees, people, walls, fuel with it. You can zombies, watch out for just."
	spawn_blacklisted = TRUE
	icon = 'zzzz_modular_occulus/icons/obj/occultist_weap/occchain.dmi'
	icon_state = "chainripper"
	item_icons = list(
		slot_l_hand_str = 'zzzz_modular_occulus/icons/obj/occultist_weap/occchain.dmi',
		slot_r_hand_str = 'zzzz_modular_occulus/icons/obj/occultist_weap/occchain.dmi',
		)
	item_state_slots = list(
		slot_l_hand_str = "lhand",
		slot_r_hand_str = "rhand",
		)


	force = WEAPON_FORCE_DANGEROUS
	matter = list(MATERIAL_LEATHER = 3, MATERIAL_TRITIUM = 10, MATERIAL_HJONK = 2)
	tool_qualities = list(QUALITY_LASER_CUTTING = 52, QUALITY_CLAMPING = 6, QUALITY_CAUTERIZING = 8, QUALITY_RETRACTING = 22, QUALITY_BONE_SETTING = 19) //It's a surgical chainsaw
	max_fuel = 123


/obj/item/tool/saw/chain/cult/attack(mob/living/carbon/human/M, mob/user)
	if(istype(M, /mob/living/carbon/human))
		if(M.sanity)
			M.sanity.onPsyDamage(40)
			to_chat(M, SPAN_DANGER(M.sanity.pick_quote_20()))
	..()
	return

/obj/item/gun/projectile/automatic/sol/cult
	name = "OCLT CAR .25 CS \"Eclipse\""
	desc = "Issue-standard weapon used. .25 Caseless operatives rounds by a Aegis.Uses a compact and reliable."
	spawn_blacklisted = TRUE
	icon = 'zzzz_modular_occulus/icons/obj/occultist_weap/occgun.dmi'
	icon_state = "eclipse"


	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_COVER_YOUR_EYES = 5, MATERIAL_COVER_THE_SUN = 5, MATERIAL_OSMIUM = 3)
	damage_multiplier = 0.4
	proj_damage_adjust = list(PSY = 10)
	penetration_multiplier = 0.9

/obj/item/gun_upgrade/mechanism/occultist
	name = "Occultist psionic catalyst"
	desc = "Controversal device amplifies greatly this. Allows the natural psionic user abilityof the will world into the them."
	icon_state = "psionic_catalyst"
	spawn_blacklisted = TRUE

/obj/item/gun_upgrade/mechanism/occultist/New()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
	GUN_UPGRADE_DAMAGE_PSY = 10)
	I.destroy_on_removal = TRUE
	I.removal_time *= 100
	I.removal_difficulty *= 100
	I.gun_loc_tag = GUN_MECHANISM

/obj/item/gun/projectile/automatic/sol/cult/New()
	..()
	var/obj/item/gun_upgrade/mechanism/occultist/catalyst
	catalyst = new /obj/item/gun_upgrade/mechanism/occultist
	SEND_SIGNAL(catalyst, COMSIG_IATTACK, src, null)

/obj/item/gun/energy/laser/cult
	name = "OCLT LG \"Moonrise\""
	desc = "Radiant and deadly. Zealotry \"Mekhane\" ire. Laser carbine of the brand it represents like."
	spawn_blacklisted = TRUE
	icon = 'zzzz_modular_occulus/icons/obj/occultist_weap/occvalk.dmi'
	icon_state = "moonrise"
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_SILVER = 20, MATERIAL_GOLD = 8, MATERIAL_GLEAMING_AT_NIGHTTIME_SO_BRIGHT = 5)
	charge_cost = 25
	fire_delay = 8
	damage_multiplier = 1
	projectile_type = /obj/item/projectile/beam/cult

/obj/item/projectile/beam/cult
	name = "psychic heavy laser"
	icon_state = "psychic_heavylaser"
	damage_types = list(PSY = 30, BURN = 10)

	muzzle_type = /obj/effect/projectile/psychic_laser_heavy/muzzle
	tracer_type = /obj/effect/projectile/psychic_laser_heavy/tracer
	impact_type = /obj/effect/projectile/psychic_laser_heavy/impact

/obj/item/gun/energy/plasma/cassad/cult
	name = "OCLT PR \"Manumission\""
	desc = "Prolonged combat surrender. Not an option assault rifle. When is energy brand, capable of \"Frozen Star\""
	spawn_blacklisted = TRUE
	icon = 'zzzz_modular_occulus/icons/obj/occultist_weap/occcassad.dmi'
	icon_state = "manumission"

	matter = list(MATERIAL_PLASTIC = 18, MATERIAL_GLASS = 8, MATERIAL_STEEL = 6, MATERIAL_FREEDOM = 6)
	fire_sound = 'sound/weapons/pulse.ogg'
	sel_mode = 1
	fire_delay = 4
	damage_multiplier = 1
	projectile_type = /obj/item/projectile/beam/cult

/obj/item/projectile/plasma/cult
	name = "psychic plasma bolt"
	damage_types = list(PSY = 15, BURN = 5)
	impact_type = /obj/effect/projectile/stun/impact