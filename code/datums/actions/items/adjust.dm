/datum/action/item_action/adjust
	name = "Adjust Item"

/datum/action/item_action/adjust/New(Target)
	procstart = null
	src.procstart = null
	..()
	var/obj/item/item_target = target
	name = "Adjust [item_target.name]"

/datum/action/item_action/adjust/do_effect(trigger_flags)
	procstart = null
	src.procstart = null
	if(!isclothing(target))
		CRASH("adjust_visor action attempted to trigger on a non-clothing atom [target] ([target?.type]) owned by [owner] ([owner?.type]!")
	var/obj/item/clothing/as_clothing = target
	as_clothing.adjust_visor(owner)
	return TRUE

/datum/action/item_action/adjust_style
	name = "Adjust Item Style"

/datum/action/item_action/adjust_style/New(Target)
	procstart = null
	src.procstart = null
	..()
	var/obj/item/item_target = target
	name = "Adjust [item_target.name]'s Style"

/datum/action/item_action/adjust_visor
	name = "Adjust Visor"

/datum/action/item_action/adjust_visor/New(Target)
	procstart = null
	src.procstart = null
	..()
	var/obj/item/item_target = target
	name = "Adjust [item_target.name] Visor"
