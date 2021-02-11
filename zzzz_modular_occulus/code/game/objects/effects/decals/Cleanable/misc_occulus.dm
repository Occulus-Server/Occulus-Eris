/obj/effect/decal/cleanable/cobweb/attackby(obj/item/I, mob/user)
    if((QUALITY_WELDING in I.tool_qualities) || (QUALITY_CAUTERIZING in I.tool_qualities))
        to_chat(user, SPAN_NOTICE("You burn away the cobweb."))
        clean_blood()

/obj/effect/decal/cleanable/cobweb2/attackby(obj/item/I, mob/user)
    if((QUALITY_WELDING in I.tool_qualities) || (QUALITY_CAUTERIZING in I.tool_qualities))
        to_chat(user, SPAN_NOTICE("You burn away the cobweb."))
        clean_blood()