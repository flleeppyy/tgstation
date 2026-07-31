
/proc/log_fish(text, list/data)
	procstart = null
	src.procstart = null
	logger.Log(LOG_CATEGORY_FISHING, text, data)
