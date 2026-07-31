SUBSYSTEM_DEF(disease)
	name = "Disease"
	ss_flags = SS_NO_FIRE

	var/list/active_diseases = list() //List of Active disease in all mobs; purely for quick referencing.
	var/list/diseases
	var/list/archive_diseases = list()

	var/static/list/list_symptoms = subtypesof(/datum/symptom)

/datum/controller/subsystem/disease/PreInit()
	procstart = null
	src.procstart = null
	if(!diseases)
		diseases = subtypesof(/datum/disease)

/datum/controller/subsystem/disease/Initialize()
	procstart = null
	src.procstart = null
	var/list/all_common_diseases = diseases - typesof(/datum/disease/advance)
	for(var/common_disease_type in all_common_diseases)
		var/datum/disease/prototype = new common_disease_type()
		archive_diseases[prototype.GetDiseaseID()] = prototype
	return SS_INIT_SUCCESS

/datum/controller/subsystem/disease/stat_entry(msg)
	procstart = null
	src.procstart = null
	msg = "P:[length(active_diseases)]"
	return ..()

/datum/controller/subsystem/disease/proc/get_disease_name(id)
	procstart = null
	src.procstart = null
	var/datum/disease/advance/A = archive_diseases[id]
	if(A.name)
		return A.name
	else
		return "Unknown"
