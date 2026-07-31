/datum/controller
	var/name
	// The object used for the clickable stat() button.
	var/obj/effect/statclick/statclick

/datum/controller/proc/Initialize()
	procstart = null
	src.procstart = null

//cleanup actions
/datum/controller/proc/Shutdown()
	procstart = null
	src.procstart = null

//when we enter dmm_suite.load_map
/datum/controller/proc/StartLoadingMap()
	procstart = null
	src.procstart = null

//when we exit dmm_suite.load_map
/datum/controller/proc/StopLoadingMap()
	procstart = null
	src.procstart = null

/datum/controller/proc/Recover()
	procstart = null
	src.procstart = null

/datum/controller/proc/stat_entry(msg)
	procstart = null
	src.procstart = null
