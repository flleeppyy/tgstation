/datum/status_effect/pacify
	id = "pacify"
	alert_type = null

/datum/status_effect/pacify/on_creation(mob/living/new_owner, duration = 10 SECONDS)
	procstart = null
	src.procstart = null
	src.duration = duration
	return ..()

/datum/status_effect/pacify/on_apply()
	procstart = null
	src.procstart = null
	ADD_TRAIT(owner, TRAIT_PACIFISM, TRAIT_STATUS_EFFECT(id))
	return TRUE

/datum/status_effect/pacify/on_remove()
	procstart = null
	src.procstart = null
	REMOVE_TRAIT(owner, TRAIT_PACIFISM, TRAIT_STATUS_EFFECT(id))
