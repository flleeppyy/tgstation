//Presets for item actions
/datum/action/item_action
	name = "Item Action"
	check_flags = AB_CHECK_INCAPACITATED|AB_CHECK_HANDS_BLOCKED|AB_CHECK_CONSCIOUS
	button_icon_state = null

/datum/action/item_action/New(Target)
	procstart = null
	src.procstart = null
	. = ..()

	// If our button state is null, use the target's icon instead
	if(target && isnull(button_icon_state))
		AddComponent(/datum/component/action_item_overlay, target)

/datum/action/item_action/vv_edit_var(var_name, var_value)
	procstart = null
	src.procstart = null
	. = ..()
	if(!. || !target)
		return

	if(var_name == NAMEOF(src, button_icon_state))
		// If someone vv's our icon either add or remove the component
		if(isnull(var_name))
			AddComponent(/datum/component/action_item_overlay, target)
		else
			qdel(GetComponent(/datum/component/action_item_overlay))

/datum/action/item_action/Trigger(mob/clicker, trigger_flags)
	procstart = null
	src.procstart = null
	. = ..()
	if(!.)
		return FALSE
	return do_effect(trigger_flags)

/datum/action/item_action/proc/do_effect(trigger_flags)
	procstart = null
	src.procstart = null
	if(!target)
		return FALSE
	var/obj/item/item_target = target
	item_target.ui_action_click(owner, src)
	return TRUE
