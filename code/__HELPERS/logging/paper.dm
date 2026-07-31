/// Logging for writing made on paper
/proc/log_paper(text, list/data)
	procstart = null
	src.procstart = null
	logger.Log(LOG_CATEGORY_PAPER, text, data)
