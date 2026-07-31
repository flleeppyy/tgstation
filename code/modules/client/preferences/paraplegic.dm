/datum/preference/choiced/paraplegic
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "paraplegic"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/paraplegic/init_possible_values()
	procstart = null
	src.procstart = null
	return GLOB.paraplegic_choice

/datum/preference/choiced/paraplegic/create_default_value()
	procstart = null
	src.procstart = null
	return "Default"

/datum/preference/choiced/paraplegic/is_accessible(datum/preferences/preferences)
	procstart = null
	src.procstart = null
	. = ..()
	if (!.)
		return FALSE

	return /datum/quirk/paraplegic::name in preferences.all_quirks

/datum/preference/choiced/paraplegic/apply_to_human(mob/living/carbon/human/target, value)
	procstart = null
	src.procstart = null
	return
