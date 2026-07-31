/// Logging for dynamic procs
/proc/log_dynamic(text, list/data)
	procstart = null
	src.procstart = null
	logger.Log(LOG_CATEGORY_DYNAMIC, text, data)
