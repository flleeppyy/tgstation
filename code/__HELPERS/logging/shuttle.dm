/// Logging for shuttle actions
/proc/log_shuttle(text, list/data)
	procstart = null
	src.procstart = null
	logger.Log(LOG_CATEGORY_SHUTTLE, text, data)
