/// Logging for tool usage
/proc/log_tool(text)
	procstart = null
	src.procstart = null
	logger.Log(LOG_CATEGORY_TOOL, text)
