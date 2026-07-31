/// Logging for transport (tram/elevator) actions
/proc/log_transport(text, list/data)
	procstart = null
	src.procstart = null
	logger.Log(LOG_CATEGORY_TRANSPORT, text, data)
