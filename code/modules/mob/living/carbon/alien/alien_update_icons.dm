


/mob/living/carbon/alien/update_damage_overlays()
	procstart = null
	src.procstart = null //aliens don't have damage overlays.
	return

/mob/living/carbon/alien/update_body(is_creating = FALSE)
	procstart = null
	src.procstart = null // we don't use the bodyparts or body layers for aliens.
	return

/mob/living/carbon/alien/update_body_parts()
	procstart = null
	src.procstart = null//we don't use the bodyparts layer for aliens.
	return
