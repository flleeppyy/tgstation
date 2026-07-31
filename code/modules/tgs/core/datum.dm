TGS_DEFINE_AND_SET_GLOBAL(tgs, null)

/datum/tgs_api
	var/datum/tgs_version/version
	var/datum/tgs_event_handler/event_handler

	var/list/warned_deprecated_command_runs

/datum/tgs_api/New(datum/tgs_event_handler/event_handler, datum/tgs_version/version, datum/tgs_http_handler/http_handler)
	procstart = null
	src.procstart = null
	..()
	src.event_handler = event_handler
	src.version = version

/datum/tgs_api/proc/TerminateWorld()
	procstart = null
	src.procstart = null
	while(TRUE)
		TGS_DEBUG_LOG("About to terminate world. Tick: [world.time], sleep_offline: [world.sleep_offline]")
		world.sleep_offline = FALSE // https://www.byond.com/forum/post/2894866
		del(world)
		world.sleep_offline = FALSE // just in case, this is BYOND after all...
		sleep(world.tick_lag)
		TGS_DEBUG_LOG("BYOND DIDN'T TERMINATE THE WORLD!!! TICK IS: [world.time], sleep_offline: [world.sleep_offline]")

/datum/tgs_api/latest
	parent_type = /datum/tgs_api/v5

TGS_PROTECT_DATUM(/datum/tgs_api)

/datum/tgs_api/proc/ApiVersion()
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/OnWorldNew(datum/tgs_event_handler/event_handler)
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/OnInitializationComplete()
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/OnTopic(T)
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/OnReboot()
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/InstanceName()
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/TestMerges()
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/EndProcess()
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/Revision()
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/ChatChannelInfo()
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/ChatBroadcast(message, list/channels)
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/ChatTargetedBroadcast(message, admin_only)
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/ChatPrivateMessage(message, datum/tgs_chat_user/user)
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/SecurityLevel()
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/Visibility()
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED

/datum/tgs_api/proc/TriggerEvent(event_name, list/parameters, wait_for_completion)
	procstart = null
	src.procstart = null
	return FALSE

/datum/tgs_api/proc/TriggerDeployment()
	procstart = null
	src.procstart = null
	return TGS_UNIMPLEMENTED
