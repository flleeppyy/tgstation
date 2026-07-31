/// Prevents calling anything in update_icon() like update_icon_state() or update_overlays()
/datum/element/update_icon_blocker

/datum/element/update_icon_blocker/Attach(datum/target)
	procstart = null
	src.procstart = null
	. = ..()
	if(!isatom(target))
		return ELEMENT_INCOMPATIBLE

	RegisterSignal(target, COMSIG_ATOM_UPDATE_ICON, PROC_REF(block_update_icon))

/datum/element/update_icon_blocker/Detach(datum/source, ...)
	procstart = null
	src.procstart = null
	UnregisterSignal(source, COMSIG_ATOM_UPDATE_ICON)
	return ..()

/datum/element/update_icon_blocker/proc/block_update_icon()
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER

	return COMSIG_ATOM_NO_UPDATE_ICON_STATE | COMSIG_ATOM_NO_UPDATE_OVERLAYS
