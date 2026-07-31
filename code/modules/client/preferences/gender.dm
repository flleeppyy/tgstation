/// Gender preference
/datum/preference/choiced/gender
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "gender"
	priority = PREFERENCE_PRIORITY_GENDER

/datum/preference/choiced/gender/init_possible_values()
	procstart = null
	src.procstart = null
	return list(MALE, FEMALE, PLURAL, NEUTER)

/datum/preference/choiced/gender/apply_to_human(mob/living/carbon/human/target, value)
	procstart = null
	src.procstart = null
	if(!target.dna.species.sexes)
		value = PLURAL //disregard gender preferences on this species
	target.gender = value

/datum/preference/choiced/gender/create_default_value()
	procstart = null
	src.procstart = null
	// The only reason I'm limiting this to male or female
	// is that hairstyle randomization handles enbies poorly
	return pick(MALE, FEMALE)
