/datum/element/inverted_movement

/datum/element/inverted_movement/Attach(datum/target)
	procstart = null
	src.procstart = null
	. = ..()
	if(!isliving(target))
		return ELEMENT_INCOMPATIBLE
	RegisterSignal(target, COMSIG_MOB_CLIENT_PRE_MOVE, PROC_REF(invert_movement))

/datum/element/inverted_movement/Detach(datum/source)
	procstart = null
	src.procstart = null
	UnregisterSignal(source, COMSIG_MOB_CLIENT_PRE_MOVE)
	return ..()

/datum/element/inverted_movement/proc/invert_movement(mob/living/source, move_args)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER
	var/new_direct = REVERSE_DIR(move_args[MOVE_ARG_DIRECTION])
	move_args[MOVE_ARG_DIRECTION] = new_direct
	move_args[MOVE_ARG_NEW_LOC] = get_step(source, new_direct)
