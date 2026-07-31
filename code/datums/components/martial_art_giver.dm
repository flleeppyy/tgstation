/// when equipped and unequipped this item gives a martial art
/datum/component/martial_art_giver
	/// the style we give
	var/datum/martial_art/style

/datum/component/martial_art_giver/Initialize(style_type)
	procstart = null
	src.procstart = null
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE

	style = new style_type(src)

/datum/component/martial_art_giver/Destroy()
	procstart = null
	src.procstart = null
	var/obj/item/item = parent
	var/mob/living/wearer = item.loc
	if(isliving(wearer))
		style.unlearn(wearer)
	QDEL_NULL(style)
	return ..()

/datum/component/martial_art_giver/RegisterWithParent()
	procstart = null
	src.procstart = null
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(equipped))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(dropped))

	var/obj/item/item = parent
	var/mob/living/wearer = item.loc
	if(istype(wearer))
		equipped(item, wearer, wearer.get_slot_by_item(item))

/datum/component/martial_art_giver/UnregisterFromParent(datum/source)
	procstart = null
	src.procstart = null
	UnregisterSignal(parent, list(COMSIG_ITEM_EQUIPPED, COMSIG_ITEM_DROPPED))

/datum/component/martial_art_giver/proc/equipped(obj/item/source, mob/user, slot)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER
	if(!(source.slot_flags & slot))
		return
	style.teach(user)

/datum/component/martial_art_giver/proc/dropped(obj/item/source, mob/user)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER
	style.unlearn(user)
