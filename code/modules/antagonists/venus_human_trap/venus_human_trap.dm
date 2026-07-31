/datum/antagonist/venus_human_trap
	name = "\improper Venus Human Trap"
	antagpanel_category = ANTAG_GROUP_OVERGROWTH
	show_in_roundend = FALSE
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	show_to_ghosts = TRUE

/datum/antagonist/venus_human_trap/on_gain()
	procstart = null
	src.procstart = null
	forge_objectives()
	. = ..()

/datum/antagonist/venus_human_trap/greet()
	procstart = null
	src.procstart = null
	. = ..()
	owner.announce_objectives()

/datum/objective/venus_human_trap
	explanation_text = "Spread the infestation."

/datum/objective/venus_human_trap/check_completion()
	procstart = null
	src.procstart = null
	return owner.current && owner.current.stat != DEAD

/datum/antagonist/venus_human_trap/forge_objectives()
	procstart = null
	src.procstart = null
	var/datum/objective/venus_human_trap/objective = new
	objective.owner = owner
	objectives += objective
