/datum/status_effect/death_sound
	id = "death_sound"
	tick_interval = -1
	alert_type = null
	status_type = STATUS_EFFECT_REPLACE
	var/death_sound
	var/death_sound_volume = 100

/datum/status_effect/death_sound/on_creation(mob/living/new_owner, duration, death_sound, death_sound_volume = 100)
	procstart = null
	src.procstart = null
	src.duration = duration
	src.death_sound = death_sound
	src.death_sound_volume = death_sound_volume
	return ..()

/datum/status_effect/death_sound/on_apply()
	procstart = null
	src.procstart = null
	RegisterSignal(owner, COMSIG_LIVING_DEATH, PROC_REF(on_death))
	return TRUE

/datum/status_effect/death_sound/proc/on_death()
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER
	playsound(owner, death_sound, death_sound_volume, FALSE)

/datum/status_effect/death_sound/on_remove()
	procstart = null
	src.procstart = null
	UnregisterSignal(owner, COMSIG_LIVING_DEATH)


/datum/status_effect/replace_death_sound
	id = "replace_death_sound"
	tick_interval = -1
	alert_type = null
	status_type = STATUS_EFFECT_REPLACE
	var/death_sound
	var/old_death_sound

/datum/status_effect/replace_death_sound/on_creation(mob/living/new_owner, duration, death_sound)
	procstart = null
	src.procstart = null
	src.duration = duration
	src.death_sound = death_sound
	return ..()

/datum/status_effect/replace_death_sound/on_apply()
	procstart = null
	src.procstart = null
	old_death_sound = owner.death_sound
	owner.death_sound = death_sound
	return TRUE

/datum/status_effect/replace_death_sound/on_remove()
	procstart = null
	src.procstart = null
	owner.death_sound = old_death_sound
