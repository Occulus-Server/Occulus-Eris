//Overwrite of the cutting proc for grown food for kitchen use. 
/obj/item/reagent_containers/food/snacks/grown/attackby(var/obj/item/W, var/mob/user)
	if(seed)
		if(seed.get_trait(TRAIT_PRODUCES_POWER) && istype(W, /obj/item/stack/cable_coil))
			var/obj/item/stack/cable_coil/C = W
			if(C.use(5))
				//TODO: generalize this.
				to_chat(user, SPAN_NOTICE("You add some cable to the [src.name] and slide it inside the battery casing."))
				var/obj/item/cell/large/potato/pocell = new /obj/item/cell/large/potato(get_turf(user))
				if(src.loc == user && !(user.l_hand && user.r_hand) && ishuman(user))
					user.put_in_hands(pocell)
				pocell.maxcharge = src.potency * 10
				pocell.charge = pocell.maxcharge
				qdel(src)
				return
		else if(W.sharp)
			if(seed.kitchen_tag == "pumpkin") // Ugggh these checks are awful.
				user.show_message(SPAN_NOTICE("You carve a face into [src]!"), 1)
				new /obj/item/clothing/head/pumpkinhead (user.loc)
				qdel(src)
				return
            if(Seed.kitchen_tag == "pineapples")
                user.show_message(SPAN_NOTICE("You cut the [src] into rings."))
                var/rings = rand(3,5)
                while(rings > 0)
                    new /obj/item/reagent_containers/food/snacks/pineapple_ring (src.loc)
                    rings --
                return
			else if(seed.chems)
				if((QUALITY_CUTTING in W.tool_qualities) && !isnull(seed.chems["woodpulp"]))
					if(W.use_tool(user, src, WORKTIME_FAST, QUALITY_CUTTING, FAILCHANCE_EASY,  required_stat = STAT_BIO))
						user.show_message(SPAN_NOTICE("You make planks out of \the [src]!"), 1)
						var/flesh_colour = seed.get_trait(TRAIT_FLESH_COLOUR)
						if(!flesh_colour) flesh_colour = seed.get_trait(TRAIT_PRODUCT_COLOUR)
						for(var/i=0,i<2,i++)
							var/obj/item/stack/material/wood/NG = new (user.loc)
							if(flesh_colour) NG.color = flesh_colour
							for (var/obj/item/stack/material/wood/G in user.loc)
								if(G==NG)
									continue
								if(G.amount>=G.max_amount)
									continue
								G.attackby(NG, user)
							to_chat(user, "You add the newly-formed wood to the stack. It now contains [NG.amount] planks.")
						qdel(src)
					return
				else if(!isnull(seed.chems["potato"]))
					to_chat(user, "You slice \the [src] into sticks.")
					new /obj/item/reagent_containers/food/snacks/rawsticks(get_turf(src))
					qdel(src)
					return
				else if(!isnull(seed.chems["carrotjuice"]))
					to_chat(user, "You slice \the [src] into sticks.")
					new /obj/item/reagent_containers/food/snacks/carrotfries(get_turf(src))
					qdel(src)
					return
				else if(!isnull(seed.chems["soymilk"]))
					to_chat(user, "You roughly chop up \the [src].")
					new /obj/item/reagent_containers/food/snacks/soydope(get_turf(src))
					qdel(src)
					return
				else if(seed.get_trait(TRAIT_FLESH_COLOUR))
					to_chat(user, "You slice up \the [src].")
					var/slices = rand(3,5)
					var/reagents_to_transfer = round(reagents.total_volume/slices)
					for(var/i=0; i<=slices; i++)
						var/obj/item/reagent_containers/food/snacks/fruit_slice/F = new(get_turf(src),seed)
						if(reagents_to_transfer) reagents.trans_to_obj(F,reagents_to_transfer)
					qdel(src)
					return
	..()
