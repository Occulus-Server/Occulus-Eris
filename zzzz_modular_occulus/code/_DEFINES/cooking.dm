// Cooking appliances.
#define MIX					1 << 0
#define FRYER				1 << 1
#define OVEN				1 << 2
#define SKILLET				1 << 3
#define SAUCEPAN			1 << 4
#define POT					1 << 5
#define GRILL				1 << 6
#define PLANCHA				1 << 7

// Cooking misc.
// can_insert return values
#define CANNOT_INSERT		0
#define CAN_INSERT			1
#define INSERT_GRABBED		2

// check_contents return values
#define CONTAINER_EMPTY		0
#define CONTAINER_SINGLE	1
#define CONTAINER_MANY		2

// check_items/check_reagents/check_fruits return values
#define COOK_CHECK_FAIL		-1
#define COOK_CHECK_EXTRA	0
#define COOK_CHECK_EXACT	1

// This tells us how much of a thing to transfer for cooking, taken from Aurora.
#define REAGENT_VOLUME(REAGENT_HOLDER, REAGENT_TYPE) (REAGENT_HOLDER?.reagent_list && REAGENT_HOLDER.reagent_list[REAGENT_TYPE])
#define REAGENT_DATA(REAGENT_HOLDER, REAGENT_TYPE)   (REAGENT_HOLDER?.reagent_list    && REAGENT_HOLDER.reagent_list[REAGENT_TYPE])