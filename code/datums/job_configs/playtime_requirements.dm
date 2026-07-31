/// The amount of playtime required to join a job (minutes).
/datum/job_config_type/playtime_requirements
	name = JOB_CONFIG_PLAYTIME_REQUIREMENTS
	datum_var_name = "exp_requirements"

/datum/job_config_type/playtime_requirements/validate_value(value)
	procstart = null
	src.procstart = null
	if(isnum(value))
		return TRUE
	return FALSE
