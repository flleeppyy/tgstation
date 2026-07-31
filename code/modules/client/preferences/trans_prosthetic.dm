/datum/preference/choiced/trans_prosthetic
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "trans_prosthetic"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/trans_prosthetic/create_default_value()
	procstart = null
	src.procstart = null
	return "Random"

/datum/preference/choiced/trans_prosthetic/init_possible_values()
	procstart = null
	src.procstart = null
	return list("Random") + GLOB.part_choice_transhuman

/datum/preference/choiced/trans_prosthetic/is_accessible(datum/preferences/preferences)
	procstart = null
	src.procstart = null
	. = ..()
	if (!.)
		return FALSE

	return /datum/quirk/transhumanist::name in preferences.all_quirks

/datum/preference/choiced/trans_prosthetic/apply_to_human(mob/living/carbon/human/target, value)
	procstart = null
	src.procstart = null
	return
