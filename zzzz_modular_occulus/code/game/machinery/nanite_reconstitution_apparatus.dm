#define SANITIZE_LATHE_COST(n) round(n * mat_efficiency, 0.01)


#define ERR_OK 0
#define ERR_NOTFOUND "not found"
#define ERR_NOMATERIAL "no material"
#define ERR_NOREAGENT "no reagent"


/obj/machinery/nanite_reconstitution_apparatus //machine itself
	name = "Nanite Reconstitution Apparatus"
	desc = "Machine used for restoring old equipment and items."
	icon = 'zzzz_modular_occulus/icons/obj/machine.dmi'
	icon_state = "nra"
	circuit = /obj/item/weapon/electronics/circuitboard/nanite_reconstitution_apparatus
	density = TRUE
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 0
	active_power_usage = 15000

	// base smelting speed - based on levels of manipulators
	var/speed = 10

	// based on levels of matter bins
	var/storage_capacity = 120

	var/list/stored_material = list()
	var/mat_efficiency = 1

	var/show_category
	var/list/categories
	var/progress = 0
	var/obj/item/loaded_item = null
	var/busy = FALSE
	var/have_reagents = TRUE
	var/have_materials = TRUE
	var/obj/item/weapon/reagent_containers/glass/container = null
	var/forbidden_materials = list(MATERIAL_CARDBOARD,MATERIAL_WOOD,MATERIAL_BIOMATTER)
	var/can_fix = FALSE
	var/working = FALSE

	//some UI stuff here
	var/show_config = FALSE
	var/show_iconfig = FALSE
	var/show_oconfig = FALSE
	var/show_rconfig = FALSE
	var/activated = FALSE

/obj/machinery/nanite_reconstitution_apparatus/Initialize() //initializing
	. = ..()


/obj/machinery/nanite_reconstitution_apparatus/proc/reconstitute() //Proc called to de-oldify objects
	if(loaded_item)
		loaded_item.make_young()	//deoldifies
		working = FALSE				//Sets working to False
		loaded_item.forceMove(drop_location())			//Ejects item. Or is supposed to, atleast.
		loaded_item = null
		progress = 0				//Stops progress.
	return ..()


/obj/machinery/nanite_reconstitution_apparatus/update_icon() //Icon updater. code may need to be updated, not sure.
	..()
	if(loaded_item)
		icon_state ="nra-loaded"
	if(progress)
		icon_state = "nra-process"
	else
		icon_state = "nra"

/obj/machinery/nanite_reconstitution_apparatus/proc/materials_data()	// Mat data proc. used when machine is ran?
	var/list/data = list()

	data["mat_efficiency"] = mat_efficiency
	data["mat_capacity"] = storage_capacity

	data["container"] = !!container
	if(container && container.reagents)
		var/list/L = list()
		for(var/datum/reagent/R in container.reagents.reagent_list)
			var/list/LE = list("name" = R.name, "amount" = R.volume)
			L.Add(list(LE))

		data["reagents"] = L

	var/list/M = list()
	for(var/mtype in stored_material)
		if(stored_material[mtype] <= 0)
			continue

		var/material/MAT = get_material_by_name(mtype)
		var/list/ME = list("name" = MAT.display_name, "id" = mtype, "amount" = stored_material[mtype], "ejectable" = !!MAT.stack_type)

		M.Add(list(ME))

	data["materials"] = M

	return data

/obj/machinery/nanite_reconstitution_apparatus/ui_data() //UI Stuffs. Used in templates
	var/list/data = list()

	data["currentItem"] = loaded_item?.name
	data["progress"] = progress
	data["have_reagents"] = have_reagents
	data["have_materials"] = have_materials

	data |= materials_data()

	return data


/obj/machinery/nanite_reconstitution_apparatus/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS) //Calls specific templates for the UI
	var/list/data = ui_data(user, ui_key)

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "nanite_reconstitution_apparatus.tmpl", src.name, 600, 400)

		ui.add_template("_materials", "nanite_reconstitution_apparatus_materials.tmpl")
		ui.add_template("_reagents", "nanite_reconstitution_apparatus_reagents.tmpl")

		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/nanite_reconstitution_apparatus/power_change() //Autolathe had this. Dunno why it's important tbh.
	..()
	if(stat & NOPOWER)
		working = FALSE
	update_icon()
	SSnano.update_uis(src)


/obj/machinery/nanite_reconstitution_apparatus/Process()
	if(stat & NOPOWER)
		return

	if(activated)	//activated in Nanite_reconstitutiona_apparatus.tmpl button
		if(loaded_item) //Item is infact, inserted into machine.
			consume_materials()			//Supposed to remove materials from MRA
		if(can_fix)		//Has enough materials in consume materials.
			use_power(2)	//power use increase
			working = TRUE	//machine is working- Used for icons
			update_icon()	//updates icon to working sprite
			progress += speed //starts progress bar
			if(progress >= 100)	// If progress reachs 100
				reconstitute()	//Deoldifies!
				activated = FALSE
	else
		working = FALSE

	use_power = working ? ACTIVE_POWER_USE : IDLE_POWER_USE	//No idea what this does -RF
	update_icon()
	SSnano.update_uis(src)

/obj/machinery/nanite_reconstitution_apparatus/proc/consume_materials()	//Figure out way to make this work for me.
	if((stored_material[MATERIAL_STEEL]>=10) && (stored_material[MATERIAL_PLASTEEL]>=3) && (container.reagents.has_reagent("uncap nanites",20)))
		stored_material[MATERIAL_STEEL] -= 10
		stored_material[MATERIAL_PLASTEEL] -=3
		container.reagents["uncap nanites"] -= 20
		can_fix = TRUE
	else
		can_fix = FALSE
		return FALSE




/obj/machinery/nanite_reconstitution_apparatus/proc/eject(obj/O)		//This iwas intended to drop the object on it's location similar to autolathes. However, when grabbing the object,
	O.forceMove(drop_location())									//It teleports the object to the NRA. Poss. issue with eject proc being called repeatedly.

//Autolathes can eject decimal quantities of material as a shard
/obj/machinery/nanite_reconstitution_apparatus/proc/eject_material(material, amount)
	if(!(material in stored_material))
		return

	if(!amount)
		return

	var/material/M = get_material_by_name(material)

	if(!M.stack_type)
		return
	amount = min(amount, stored_material[material])

	var/whole_amount = round(amount)
	var/remainder = amount - whole_amount

	if(whole_amount)
		var/obj/item/stack/material/S = new M.stack_type(drop_location())

		//Accounting for the possibility of too much to fit in one stack
		if(whole_amount <= S.max_amount)
			S.amount = whole_amount
			S.update_strings()
			S.update_icon()
		else
			//There's too much, how many stacks do we need
			var/fullstacks = round(whole_amount / S.max_amount)
			//And how many sheets leftover for this stack
			S.amount = whole_amount % S.max_amount

			if(!S.amount)
				qdel(S)

			for(var/i = 0; i < fullstacks; i++)
				var/obj/item/stack/material/MS = new M.stack_type(drop_location())
				MS.amount = MS.max_amount
				MS.update_strings()
				MS.update_icon()

	//And if there's any remainder, we eject that as a shard
	if(remainder)
		new /obj/item/weapon/material/shard(drop_location(), material, _amount = remainder)

	//The stored material gets the amount (whole+remainder) subtracted
	stored_material[material] -= amount

/obj/machinery/nanite_reconstitution_apparatus/RefreshParts()		//Standard machine parts! Uses Manips and matterbins.
	..()

	var/manipulator_rating = 0
	var/manipulator_count = 0
	for(var/obj/item/weapon/stock_parts/manipulator/M in component_parts)
		manipulator_rating += M.rating
		++manipulator_count

	speed = initial(speed)*(manipulator_rating/manipulator_count)

	var/mb_rating = 0
	var/mb_count = 0
	for(var/obj/item/weapon/stock_parts/matter_bin/MB in component_parts)
		mb_rating += MB.rating
		++mb_count
	storage_capacity = round(initial(storage_capacity)*(mb_rating/mb_count))


/obj/machinery/nanite_reconstitution_apparatus/attackby(var/obj/item/I, var/mob/user)		//Clicking on NRA!
	message_admins("attackby")
	if(busy)
		to_chat(user, SPAN_NOTICE("\The [src] is busy right now."))							//Is currently running.
		return
	if(loaded_item)
		to_chat(user, SPAN_NOTICE("There is something already loaded into \the [src]."))	//NRA is full.
		return

	if(default_deconstruction(I, user))														//deconstructs NRA
		return

	if(default_part_replacement(I, user))													//Part replacement for RND
		return

	// Some item types are consumed by default
	if(istype(I, /obj/item/stack))															//Accepts Material stacks specifically!
		eat(user, I)
		return

	if(istype(I, /obj/item/weapon/reagent_containers/glass/beaker))							//Unique insert for beakers.
		insert_beaker(user, I)
		return

	if(!loaded_item && istype(I))															//If no loaded item and it's an item, Remove obj from user, set to busy,
		if(I.is_old())
			if(user.unEquip(I, src))
				busy = TRUE
				loaded_item = I
				to_chat(user, SPAN_NOTICE("You add \the [I] to \the [src]."))					//add loaded item to the NRA, 'flick' inserting obj to machine icon,
				flick("d_analyzer_la", src)
				addtimer(CALLBACK(src, .proc/reset_busy), 1 SECONDS)							//add timer, make machinbe busy briefly due to inserting obj.
				user.set_machine(src)																	//Actually bring up ui for user.
				ui_interact(user)
		else
			to_chat(user, SPAN_NOTICE("\the [I] does not need reconstitution!"))

/obj/machinery/nanite_reconstitution_apparatus/attack_hand(mob/user)							//This may be unnessicary, Attackby should handle this. Why am I duplicating it?
	if(..())
		return TRUE

	user.set_machine(src)
	ui_interact(user)

/obj/machinery/nanite_reconstitution_apparatus/proc/insert_beaker(mob/living/user, obj/item/weapon/reagent_containers/glass/beaker) //Beaker insertion proc. called during attackby
	if(!beaker && istype(user))
		beaker = user.get_active_hand()

	if(!istype(beaker))
		return

	if(!Adjacent(user) && !Adjacent(beaker))
		return

	if(!have_reagents)
		to_chat(user, SPAN_WARNING("[src] has no slot for a beaker."))
		return

	if(container)
		to_chat(user, SPAN_WARNING("There's already \a [container] inside [src]."))
		return

	if(istype(user) && (beaker in user))
		user.unEquip(beaker, src)

	beaker.forceMove(src)
	container = beaker
	to_chat(user, SPAN_NOTICE("You put \the [beaker] into [src]."))
	SSnano.update_uis(src)

/obj/machinery/nanite_reconstitution_apparatus/proc/eject_beaker(mob/living/user)	//Beaker removal proc. Called during button click in interface.
	if(!container)
		return

	container.forceMove(drop_location())
	to_chat(usr, SPAN_NOTICE("You remove \the [container] from \the [src]."))

	if(istype(user) && Adjacent(user))
		user.put_in_active_hand(container)

	container = null

/obj/machinery/nanite_reconstitution_apparatus/proc/eject_loaded_item(mob/living/user)	//remove obj from NRA. Places into hand.
	if(!loaded_item)
		return

	loaded_item.forceMove(drop_location())
	to_chat(usr, SPAN_NOTICE("You remove \the [loaded_item] from \the [src]."))

	if(istype(user) && Adjacent(user))
		user.put_in_active_hand(loaded_item)

	loaded_item = null

/obj/machinery/nanite_reconstitution_apparatus/proc/eat(mob/living/user, obj/item/eating) // materialstack 'eating'.
	if(!eating && istype(user))
		eating = user.get_active_hand()

	if(!istype(eating))
		return FALSE

	if(stat)
		return FALSE

	if(!Adjacent(user) && !Adjacent(eating))
		return FALSE

	if(is_robot_module(eating))
		return FALSE

	var/filltype = 0       // Used to determine message.
	var/reagents_filltype = 0
	var/total_used = 0     // Amount of material used.
	var/mass_per_sheet = 0 // Amount of material constituting one sheet.

	var/list/total_material_gained = list()

	for(var/obj/O in eating.GetAllContents(includeSelf = TRUE))
		var/list/_matter = O.get_matter()
		if(_matter)
			for(var/material in _matter)
				if(material in forbidden_materials)
					continue

				if(!(material in stored_material))
					stored_material[material] = 0

				if(!(material in total_material_gained))
					total_material_gained[material] = 0

				if(stored_material[material] + total_material_gained[material] >= storage_capacity)
					continue

				var/total_material = _matter[material]

				//If it's a stack, we eat multiple sheets.
				if(istype(O, /obj/item/stack))
					var/obj/item/stack/material/stack = O
					total_material *= stack.get_amount()

				if(stored_material[material] + total_material > storage_capacity)
					total_material = storage_capacity - stored_material[material]
					filltype = 1
				else
					filltype = 2

				total_material_gained[material] += total_material
				total_used += total_material
				mass_per_sheet += O.matter[material]

		if(O.matter_reagents)
			if(container)
				var/datum/reagents/RG = new(0)
				for(var/r in O.matter_reagents)
					RG.maximum_volume += O.matter_reagents[r]
					RG.add_reagent(r ,O.matter_reagents[r])
				reagents_filltype = 1
				RG.trans_to(container, RG.total_volume)

			else
				reagents_filltype = 2

		if(O.reagents && container)
			O.reagents.trans_to(container, O.reagents.total_volume)

	if(!filltype && !reagents_filltype)
		to_chat(user, SPAN_NOTICE("\The [src] is full or this thing isn't suitable for this autolathe type. Try remove material from [src] in order to insert more."))
		return

	// Determine what was the main material
	var/main_material
	var/main_material_amt = 0
	for(var/material in total_material_gained)
		stored_material[material] += total_material_gained[material]
		if(total_material_gained[material] > main_material_amt)
			main_material_amt = total_material_gained[material]
			main_material = material

	if(istype(eating, /obj/item/stack))
		var/obj/item/stack/stack = eating
		var/used_sheets = min(stack.get_amount(), round(total_used/mass_per_sheet))

		to_chat(user, SPAN_NOTICE("You add [used_sheets] [main_material] [stack.singular_name]\s to \the [src]."))

		if(!stack.use(used_sheets))
			qdel(stack)	// Protects against weirdness
	else
		to_chat(user, SPAN_NOTICE("You recycle \the [eating] in \the [src]."))
		qdel(eating)

	if(reagents_filltype == 1)
		to_chat(user, SPAN_NOTICE("Some liquid flowed to \the [container]."))
	else if(reagents_filltype == 2)
		to_chat(user, SPAN_NOTICE("Some liquid flowed to the floor from \the [src]."))

/obj/machinery/nanite_reconstitution_apparatus/proc/check_craftable_amount_by_material(datum/design/design, material)
	return stored_material[material] / max(1, SANITIZE_LATHE_COST(design.materials[material])) // loaded material / required material

/obj/machinery/nanite_reconstitution_apparatus/proc/check_craftable_amount_by_chemical(datum/design/design, reagent)
	if(!container || !container.reagents)
		return 0

	return container.reagents.get_reagent_amount(reagent) / max(1, design.chemicals[reagent])


/obj/machinery/nanite_reconstitution_apparatus/on_deconstruction()
	for(var/mat in stored_material)
		eject_material(mat, stored_material[mat])

	..()

/obj/machinery/nanite_reconstitution_apparatus/proc/reset_busy()
	busy = FALSE
	update_icon()


obj/machinery/nanite_reconstitution_apparatus/Topic(href, href_list) //UI BUTTONS! I THINK! OR SOMETHING!
	if(..())
		return

	usr.set_machine(src)

	if(href_list["insert"])
		if(istype(usr.get_active_hand(), /obj/item/stack))
			eat(usr)
			return 1
	if(href_list["eject"])
		if(loaded_item)
			eject_loaded_item(usr)
		return 1
	if(href_list["container"])
		if(container)
			eject_beaker(usr)
		else
			insert_beaker(usr)
		return 1

	if(href_list["category"] && categories)
		var/new_category = text2num(href_list["category"])

		if(new_category && new_category <= length(categories))
			show_category = categories[new_category]
		return 1

	if(href_list["eject_material"])
		var/material = href_list["eject_material"]
		var/material/M = get_material_by_name(material)

		if(!M.stack_type)
			return

		var/num = input("Enter sheets number to eject. 0-[stored_material[material]]","Eject",0) as num
		if(!CanUseTopic(usr))
			return

		num = min(max(num,0), stored_material[material])

		eject_material(material, num)
		return 1
	if(href_list["activate"]) //Needs to be added to templ.
		if(loaded_item)
			activated = TRUE

		return 1

/obj/item/weapon/electronics/circuitboard/nanite_reconstitution_apparatus
	name = T_BOARD("nanite reconstitution apparatus")
	build_path = /obj/machinery/nanite_reconstitution_apparatus
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 6, TECH_DATA = 6, TECH_MATERIAL = 6)
	req_components = list(
		/obj/item/weapon/stock_parts/scanning_module = 1,
		/obj/item/weapon/stock_parts/micro_laser = 2,
		/obj/item/weapon/stock_parts/manipulator = 2,
		/obj/item/weapon/stock_parts/matter_bin = 2,
		/obj/item/weapon/stock_parts/console_screen = 1
	)

////////////////////////////////////////////////////////////////////////////////////////////////
// A version with some materials already loaded, to be used on map spawn
/obj/machinery/nanite_reconstitution_apparatus/loaded
	stored_material = list(
		MATERIAL_STEEL = 60,
		MATERIAL_PLASTEEL = 20,
		MATERIAL_GLASS = 60,	//Make nanite
		)

/obj/machinery/nanite_reconstitution_apparatus/loaded/Initialize()
	. = ..()
	container = new /obj/item/weapon/reagent_containers/glass/beaker(src)


// You (still) can't flicker overlays in BYOND, and this is a vis_contents hack to provide the same functionality.
// Used for materials loading animation.
/obj/effect/flicker_overlay
	name = ""
	icon_state = ""
	// Acts like a part of the object it's created for when in vis_contents
	// Inherits everything but the icon_state
	vis_flags = VIS_INHERIT_ICON | VIS_INHERIT_DIR | VIS_INHERIT_LAYER | VIS_INHERIT_PLANE | VIS_INHERIT_ID

/obj/effect/flicker_overlay/New(atom/movable/loc)
	..()
	// Just VIS_INHERIT_ICON isn't enough: flicker() needs an actual icon to be set
	icon = loc.icon
	loc.vis_contents += src

/obj/effect/flicker_overlay/Destroy()
	if(istype(loc, /atom/movable))
		var/atom/movable/A = loc
		A.vis_contents -= src
	return ..()
