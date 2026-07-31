/proc/auxtools_stack_trace(msg)
	procstart = null
	src.procstart = null
	CRASH(msg)

/proc/auxtools_expr_stub()
	procstart = null
	src.procstart = null
	CRASH("auxtools not loaded")

/proc/enable_debugging(mode, port)
	procstart = null
	src.procstart = null
	CRASH("auxtools not loaded")
