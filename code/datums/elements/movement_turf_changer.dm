/**
 * movement_turf_changer element; which makes the movement of a movable atom change the turf it moved to
 *
 * Used for moonicorns!
 */
/datum/element/movement_turf_changer
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2
	///Path of the turf added on top
	var/turf_type

/datum/element/movement_turf_changer/Attach(datum/target, turf_type)
	procstart = null
	src.procstart = null
	. = ..()

	if(!ismovable(target))
		return ELEMENT_INCOMPATIBLE

	src.turf_type = turf_type
	RegisterSignal(target, COMSIG_MOVABLE_MOVED, PROC_REF(on_moved))

/datum/element/movement_turf_changer/Detach(datum/target)
	procstart = null
	src.procstart = null
	UnregisterSignal(target, COMSIG_MOVABLE_MOVED)
	. = ..()

/datum/element/movement_turf_changer/proc/on_moved(atom/movable/target, atom/origin, direction, forced)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER

	var/turf/destination = target.loc
	if(!isturf(destination) || istype(destination, turf_type) || isgroundlessturf(destination))
		return

	destination.place_on_top(turf_type)
