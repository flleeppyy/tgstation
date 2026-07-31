/datum/bt_node/ai_behavior/fail

/datum/bt_node/ai_behavior/fail/perform(seconds_per_tick, datum/ai_controller/controller)
	procstart = null
	src.procstart = null
	return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_FAILED
