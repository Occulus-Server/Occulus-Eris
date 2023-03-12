// Syzygy's snowflake locker overrides

/obj/structure/closet/secure_closet/reinforced/captains/populate_contents()
	new /obj/item/storage/backpack/captain(src)
	new /obj/item/storage/backpack/satchel/captain(src)
	new /obj/item/clothing/head/caphat/cap(src)
	new /obj/item/clothing/under/rank/captain(src)
	new /obj/item/clothing/under/rank/captain_jumpskirt(src)
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/clothing/head/armor/helmet(src)
	new /obj/item/clothing/shoes/color/brown(src)
	new /obj/item/device/radio/headset/heads/captain(src)
	new /obj/item/clothing/gloves/captain(src)
	new /obj/item/gun/projectile/avasarala(src)
	new /obj/item/ammo_magazine/magnum/rubber(src)
	new /obj/item/ammo_magazine/magnum/rubber(src)
	new /obj/item/ammo_magazine/magnum/rubber(src)
	new /obj/item/ammo_magazine/magnum/rubber(src)
	new /obj/item/melee/telebaton(src)
	new /obj/item/clothing/head/caphat/formal(src)
	new /obj/item/clothing/under/captainformal(src)
	new /obj/spawner/cloth/holster(src)
	new /obj/item/clothing/suit/storage/captains_coat(src)

/obj/structure/closet/secure_closet/personal/ensign
	name = "\improper Ensign's locker"
	req_access = list(access_heads)
	icon = 'zzzz_modular_occulus/icons/obj/closet.dmi'
	icon_state = "ensign"

/obj/structure/closet/secure_closet/personal/ensign/populate_contents()
	new /obj/item/clothing/under/rank/ensign(src)
	new /obj/item/clothing/under/rank/ensign/blueshield(src)
	new /obj/item/clothing/head/beret/fashion/blueshield(src)
	new /obj/item/device/radio/headset/heads/hop/ensign(src)
	new /obj/item/clothing/shoes/leather(src)
	new /obj/item/storage/backpack/satchel/leather(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/device/flash(src)
	new /obj/item/storage/belt/utility/full(src)
	new /obj/item/tool/multitool(src)
