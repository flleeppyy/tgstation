/// This mob can flash others from behind and still get at least a partial
// Component and not element because elements can't stack.
// I don't want to have a bunch of helpers for that. We need to do this generally
// because this keeps coming up.
/datum/component/can_flash_from_behind
	dupe_mode = COMPONENT_DUPE_SOURCES

/datum/component/can_flash_from_behind/Initialize()
	procstart = null
	src.procstart = null
	if (!ismob(parent))
		return COMPONENT_INCOMPATIBLE

/datum/component/can_flash_from_behind/RegisterWithParent()
	procstart = null
	src.procstart = null
	RegisterSignal(parent, COMSIG_MOB_PRE_FLASHED_MOB, PROC_REF(on_pre_flashed_carbon))

/datum/component/can_flash_from_behind/UnregisterFromParent()
	procstart = null
	src.procstart = null
	UnregisterSignal(parent, COMSIG_MOB_PRE_FLASHED_MOB)

/datum/component/can_flash_from_behind/proc/on_pre_flashed_carbon(source, flashed, flash, deviation)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER

	// Always partial flash at the very least
	return (deviation == DEVIATION_FULL) ? DEVIATION_OVERRIDE_PARTIAL : NONE
