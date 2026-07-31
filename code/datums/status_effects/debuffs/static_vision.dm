/datum/status_effect/static_vision
	id = "static_vision"
	status_type = STATUS_EFFECT_REPLACE
	alert_type = null

/datum/status_effect/static_vision/on_creation(mob/living/new_owner, duration = 3 SECONDS)
	procstart = null
	src.procstart = null
	src.duration = duration
	return ..()

/datum/status_effect/static_vision/on_apply()
	procstart = null
	src.procstart = null
	RegisterSignal(owner, COMSIG_LIVING_DEATH, PROC_REF(remove_static_vision))

	owner.overlay_fullscreen(id, /atom/movable/screen/fullscreen/static_vision)
	owner.sound_environment_override = SOUND_ENVIRONMENT_UNDERWATER

	return TRUE

/datum/status_effect/static_vision/on_remove()
	procstart = null
	src.procstart = null
	UnregisterSignal(owner, COMSIG_LIVING_DEATH)

	owner.clear_fullscreen(id)
	if(owner.sound_environment_override == SOUND_ENVIRONMENT_UNDERWATER)
		owner.sound_environment_override = SOUND_ENVIRONMENT_NONE

/// Handles clearing on death
/datum/status_effect/static_vision/proc/remove_static_vision(datum/source, admin_revive)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER

	qdel(src)
