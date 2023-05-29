// TODO: Split this file apart completely

//Disks

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_mk58
	disk_name = "Frozen Star - .35 MK58 Handgun Pack"
	icon_state = "frozenstar"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_regulator
	disk_name = "Frozen Star - .50 Regulator Shotgun"
	icon_state = "frozenstar"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_heavysniper
	disk_name = "Serbian Arms - .60 Penetrator AMR"
	icon_state = "serbian"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_protector
	disk_name = "Frozen Star - Protector Grenade Launcher"
	icon_state = "frozenstar"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_counselor
	disk_name = "Frozen Star - Councelor PDW E"
	icon_state = "frozenstar"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_nemesis
	disk_name = "Serbian Arms - Nemesis Energy Crossbow"
	icon_state = "serbian"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_themis
	disk_name = "Serbian Arms - Themis Energy Crossbow"
	icon_state = "serbian"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_lightfall
	disk_name = "Mekhane Armory - Lightfall Laser Gun"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_valkirye
	disk_name = "Mekhane Armory - Valkyrie Energy Rifle"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_halicon
	disk_name = "Frozen Star - Halicon Ion Rifle"
	icon_state = "frozenstar"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_dominion
	disk_name = "Mekhane Armory - Dominion Plasma Rifle"

/obj/item/computer_hardware/hard_drive/portable/design/guns/nt_purger
	disk_name = "Mekhane Armory - Purger Plasma Rifle"

/obj/item/computer_hardware/hard_drive/portable/design/armor/generic
	disk_name = "Aegis Combat Equipment - Standard Armor"

/obj/item/computer_hardware/hard_drive/portable/design/armor/generic/bulletproof
	disk_name = "Aegis Combat Equipment - Bulletproof Armor"

/obj/item/computer_hardware/hard_drive/portable/design/armor/generic/ablative
	disk_name = "Aegis Combat Equipment - Laserproof Armor"

/obj/item/computer_hardware/hard_drive/portable/design/armor/ih
	disk_name = "Aegis Combat Equipment - Operator Armor"

/obj/item/computer_hardware/hard_drive/portable/design/armor/ih/bulletproof
	disk_name = "Aegis Combat Equipment - Bulletproof Operator Armor"

/obj/item/clothing/suit/armor/bulletproof/ironhammer
	desc = "A vest with hand and arm-guards attached that excels in protecting the wearer against high-velocity solid projectiles. \
			This one has been done in Aegis Security colors."

/obj/item/clothing/suit/armor/vest/full/ironhammer
	desc = "An armored vest painted in Aegis Security colors. This one has shoulderpads and knee pads included to protect all parts of the body."

/obj/item/tool/knife/neotritual
	name = "Mekhane ritual knife"

// Armor
/obj/item/clothing/head/armor/bulletproof/ironhammer_full
	desc = "Standard-issue Aegis ballistic helmet with a basic HUD included, covers the operator's entire face."

// Mine
/obj/item/emp_mine
	name = "SDF EMP Mine"
	desc = "Self-rechargeable EMP Skrellian mine. Not just a small holoplant."

//Mech
/mob/living/exosuit/premade/powerloader
	name = "S.E.U. \"Ripley\"" //Space Excavation Unit
	desc = "A cheap utility exosuit. An old Union design, now used just about everywhere due to internal data leaks."

//Radio, God help me do this right
/obj/item/device/encryptionkey/headset_church //Radio keys
	channels = list("MeK Voice" = 1)

/obj/item/device/encryptionkey/heads/captain
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 0, "MeK Voice" = 0, "Science" = 0, "Medical" = 0, "Supply" = 0, "Service" = 0)

/obj/item/device/encryptionkey/heads/ai_integrated
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Mek Voice" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "AI Private" = 1)

/obj/item/device/encryptionkey/heads/hop
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 0, "MeK Voice" = 0, "Science" = 0, "Medical" = 0, "Supply" = 0, "Service" = 0)

/obj/item/device/encryptionkey/heads/preacher
	channels = list("MeK Voice" = 1, "Command" = 1)

/obj/item/device/encryptionkey/heads/admin
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "MeK Voice" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "AI Private" = 1, "Mercenary" = 1)

/obj/machinery/telecomms/server/presets/nt //Telecomms preset
	id = "MeK Voice Server"

/obj/item/device/radio/random_radio //Radios
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "MeK Voice" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "AI Private" = 1)

//Roaches
/mob/living/carbon/superior_animal/roach
	name = "Kampfer Roach"
	desc = "A monstrous, dog-sized cockroach. These huge mutants can be found everywhere on the ship."

/obj/item/tool_upgrade/augment/randomizer
	name = "Anomolous liquid metal"
	desc = "This unidentified tar-like liquid warps and bends reality around it. Applying it to a tool may have unexpected results."
	matter = list(MATERIAL_PLASMA = 4, MATERIAL_URANIUM = 4)
	rarity_value = 100

/obj/machinery/autolathe/bioprinter
	name = "Mekhane Bioprinter"
	desc = "Mekhane's machine for printing things using biomass."

/obj/item/grenade/frag
	name = "FS DFG \"Pomme\""

//Machines
/obj/machinery/microwave
	name = "GenTech Autocooker 5000"
	desc = "From the company that brought you the Absolute Zero Fridge comes the Autocooker 5000! Dinner, desserts, shellfish, it does it all!"

//One Star

/obj/item/organ/external/robotic/one_star
	name = "One star"
	desc = "Advanced, extremly resileant and mobile prosthetic. Far beyond today's robotics advancements."

/obj/item/tool/pickaxe/onestar
	name = "One Star pickaxe"
	desc = "A standard One Star basic tool. Uses advanced technology which makes it powerful and energy-efficent at the same time."


/obj/item/tool/pickaxe/jackhammer/onestar
	name = "One Star jackhammer"
	desc = "A heavy One Star tool that cracks rocks with blasts, perfect for killing flimsy organics"

/obj/structure/sign/faction/one_star
	name = "One Star"
	desc = "One Star's all-seeing eye, a banner of a now fallen empire. They once controlled this sector from their capital in Nullspace. Now it's all just dust, forgotten derelicts and automated ships."

//Alert levels
/decl/security_level/default/code_green
	down_description = "All threats to the ship have passed. Crew members are to return to normal duties."

/decl/security_level/default/code_blue
	up_description = "The ship has received reliable information about possible danger to it's safety. Crew members are to prepare general quarters and see their respective command member for details."
	down_description = "The immediate threat has passed. Crew members are to remain on alert and see their respective command member for details."

/decl/security_level/default/code_red
	up_description = "There is an immediate serious threat to the ship. Privacy rights are suspended and crew members are to listen to all command orders."
	down_description = "The self-destruct mechanism has been deactivated, there is still however an immediate serious threat to the ship. Privacy rights are still suspended and crew members are to listen to all command orders."

/decl/security_level/default/code_delta/switching_up_to()
	security_announcement_delta.Announce("The self-destruct mechanism has been engaged. All crew members are ordered to obey all instructions given by command. These orders can be enforced by lethal force. This is not a drill.", "Attention! Delta security level reached!")
	notify_station()

/*
* Split this into the right files when you can - Jamini
*/
