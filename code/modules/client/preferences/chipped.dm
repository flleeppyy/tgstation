/datum/preference/choiced/chipped
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "chipped"
	savefile_identifier = PREFERENCE_CHARACTER
	should_update_preview = FALSE

/datum/preference/choiced/chipped/create_default_value()
	procstart = null
	src.procstart = null
	return "Random"

/datum/preference/choiced/chipped/init_possible_values()
	procstart = null
	src.procstart = null
	return list("Random") + assoc_to_keys(GLOB.quirk_chipped_choice)

/datum/preference/choiced/chipped/is_accessible(datum/preferences/preferences)
	procstart = null
	src.procstart = null
	. = ..()
	if (!.)
		return FALSE

	return /datum/quirk/chipped::name in preferences.all_quirks

/datum/preference/choiced/chipped/apply_to_human(mob/living/carbon/human/target, value)
	procstart = null
	src.procstart = null
	return
