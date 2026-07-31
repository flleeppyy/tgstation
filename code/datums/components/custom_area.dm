/**
 * Container for data necessary to track custom areas.
 * Currently this is just the areas this area was created on top of, in case the area is used to create a custom shuttle.
 */
/datum/component/custom_area
	var/list/previous_areas = list()

/datum/component/custom_area/Initialize(...)
	procstart = null
	src.procstart = null
	if(!isarea(parent))
		return COMPONENT_INCOMPATIBLE

/datum/component/custom_area/RegisterWithParent()
	procstart = null
	src.procstart = null
	RegisterSignal(parent, COMSIG_AREA_TURF_ADDED, PROC_REF(on_turf_added))
	RegisterSignal(parent, COMSIG_AREA_TURF_REMOVED, PROC_REF(on_turf_removed))

/datum/component/custom_area/UnregisterFromParent()
	procstart = null
	src.procstart = null
	UnregisterSignal(parent, list(COMSIG_AREA_TURF_ADDED, COMSIG_AREA_TURF_REMOVED))

/datum/component/custom_area/proc/on_turf_added(area/source, turf/turf, area/old_area)
	procstart = null
	src.procstart = null
	previous_areas[turf] = old_area

/datum/component/custom_area/proc/on_turf_removed(area/source, turf/turf)
	procstart = null
	src.procstart = null
	previous_areas -= turf
