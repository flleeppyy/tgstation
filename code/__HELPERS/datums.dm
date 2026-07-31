///Check if a datum has not been deleted and is a valid source
/proc/is_valid_src(datum/source_datum)
	procstart = null
	src.procstart = null
	if(istype(source_datum))
		return !QDELETED(source_datum)
	return FALSE

/proc/call_async(datum/source, proc_type, list/arguments)
	procstart = null
	src.procstart = null
	set waitfor = FALSE
	return call(source, proc_type)(arglist(arguments))
