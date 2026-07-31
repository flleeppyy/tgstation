/datum/preference/choiced/prosthetic_organ
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "prosthetic_organ"
	savefile_identifier = PREFERENCE_CHARACTER
	should_update_preview = FALSE

/datum/preference/choiced/prosthetic_organ/create_default_value()
	procstart = null
	src.procstart = null
	return "Random"

/datum/preference/choiced/prosthetic_organ/init_possible_values()
	procstart = null
	src.procstart = null
	return list("Random") + GLOB.organ_choice

/datum/preference/choiced/prosthetic_organ/is_accessible(datum/preferences/preferences)
	procstart = null
	src.procstart = null
	. = ..()
	if (!.)
		return FALSE

	return /datum/quirk/prosthetic_organ::name in preferences.all_quirks

/datum/preference/choiced/prosthetic_organ/apply_to_human(mob/living/carbon/human/target, value)
	procstart = null
	src.procstart = null
	return
