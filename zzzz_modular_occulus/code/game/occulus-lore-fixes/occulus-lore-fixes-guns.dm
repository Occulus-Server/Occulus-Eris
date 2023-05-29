
//Guns&Armor
/obj/item/gun/projectile/automatic/modular/mk58/get_initial_name()
	if(grip_type)
		switch(grip_type)
			if("wood")
				return "FS HG [caliber] \"Mk58 C\"" //civillian
			if("black")
				return "FS HG [caliber] \"Mk58 S\"" //security
			if("rubber")
				return "FS HG [caliber] \"Mk58 T\"" //tacticool
			if("excelsior")
				return "FS HG [caliber] \"Mk58 M\"" //military
			if("serbian")
				return "SA HG [caliber] \"Mk58\"" //serbian arms
			if("makeshift")
				return "HM HG [caliber] \"Mk58\""
	else
		return "FS [caliber] \"Mk58\""
/obj/item/gun/projectile/automatic/modular/mk58/gray/stock
	desc = "The FS Mk58 is a cheap, ubiquitous sidearm, that was produced by Frozen Star. Uses standard .35 and high capacity magazines."

/obj/item/gun/projectile/automatic/modular/mk58/gray/wood
	desc = "The FS Mk58 is a cheap, ubiquitous sidearm, produced by Frozen Star. This one has a sweet wooden grip. Uses standard .35 Auto mags."

/obj/item/gun/projectile/shotgun/pump/regulator
	name = "FS SG \"Regulator 1000\""
	desc = "Designed for close quarters combat, the Regulator is widely regarded as a weapon of choice for repelling boarders. \
			Some may say that it's too old, but it actually proved itself useful. Can hold up to 7 shells in tube magazine."

/obj/item/gun/projectile/shotgun/pump/grenade
	name = "FS GL \"Protector\""
	desc = "A bulky pump-action grenade launcher. Holds up to 6 grenades in a revolving magazine."

/obj/item/gun/energy/taser
	name = "FS SP \"Counselor\""
	desc = "The NT SP \"Counselor\" is a taser gun used for non-lethal takedowns."

/obj/item/gun/energy/stunrevolver
	name = "FS SP \"Zeus\""
	desc = "Also know as stunrevolver. Older and less precise solution for non-lethal takedowns. This gun has smaller capacity in exchange for S-cells use."
	icon = 'icons/obj/guns/energy/stunrevolver.dmi'

/obj/item/gun/energy/laser
	name = "MK LG \"Lightfall\""
	desc = "\"Mekhane\" brand laser carbine. Deadly and radiant, like the ire of zealotry it represents."

/obj/item/gun/energy/laser/practice
	name = "MK LG \"Lightfall\" - P"
	desc = "A modified version of \"Mekhane\" brand laser carbine, this one fires less concentrated energy bolts, designed for target practice."

/obj/item/gun/energy/crossbow
	name = "SA EC \"Nemesis\""
	desc = "Mini energy crossbow, produced by Serbian Arms, discontinued now. A weapon favored by many mercenary stealth specialists."
	icon = 'icons/obj/guns/energy/crossbow.dmi'

/obj/item/gun/energy/crossbow/largecrossbow
	name = "SA EC \"Themis\""
	desc = "Energy crossbow, produced by Serbian Arms, discontinued now. A weapon favored by mercenary infiltration teams."

/obj/item/gun/energy/ionrifle
	name = "FS IR \"Halicon\""
	desc = "The FS IR Halicon is a man-portable anti-armor weapon designed to disable mechanical threats, produced by Frozen Star. Not the best of its type, but gets the job done."

/obj/item/gun/energy/nt_svalinn
	name = "MK LP \"Svalinn\""
	desc = "\"Mekhane\" brand laser pistol. Small and easily concealable, it's still a reasonable punch for a laser weapon."

/obj/item/gun/energy/plasma
	name = "MK PR \"Dominion\""
	desc = "A \"Mekhane\" weapon that uses advanced plasma generation technology to emit highly controllable blasts of energized matter. Due to its complexity and cost, it is rarely seen in use, except by specialists."

/obj/item/gun/energy/plasma/destroyer
	name = "MK PR \"Purger\""
	desc = "A more recent \"Mekhane\" brand plasma rifle, developed in direct response to compete against the highly successful \"Cassad\" design."

/obj/item/gun/energy/plasma/martyr // or should it be  Zealot
	name = "MK PR \"Martyr\""
	desc = "A \"Mekhane\" weapon that uses advanced biomass conversion controllable blasts of energized matter. is a disposable side arm, good enough to save you and be recycled."

/obj/item/gun/energy/sniperrifle
	name = "MK MER \"Valkyrie\""
	desc = "\"Valkyrie\" is an older design of Mekhane, \"Lightfall\" was based on it. A designated marksman rifle capable of shooting powerful ionized beams, this is a weapon for killing from a distance."
