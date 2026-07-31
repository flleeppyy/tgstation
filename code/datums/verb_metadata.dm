/datum/verb_metadata
	var/name
	var/description
	var/category
	var/verb_path
	var/body_path

/datum/verb_metadata/proc/assign_to(target)
	procstart = null
	src.procstart = null
	add_verb(target, verb_path)

/datum/verb_metadata/proc/unassign_from(target)
	procstart = null
	src.procstart = null
	remove_verb(target, verb_path)
