/datum/actionspeed_modifier/wound_interaction_inefficiency
	variable = TRUE

	var/datum/wound/parent

/datum/actionspeed_modifier/wound_interaction_inefficiency/New(new_id, datum/wound/parent)
	procstart = null
	src.procstart = null

	src.parent = parent

	return ..()
