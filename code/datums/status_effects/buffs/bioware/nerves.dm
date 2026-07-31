// Bioware that affects the CNS
/datum/status_effect/bioware/nerves
	id = "nerves"

// Grounded Nerves - Immunity to being zapped
/datum/status_effect/bioware/nerves/grounded

/datum/status_effect/bioware/nerves/grounded/bioware_gained()
	procstart = null
	src.procstart = null
	ADD_TRAIT(owner, TRAIT_SHOCKIMMUNE, TRAIT_STATUS_EFFECT(id))

/datum/status_effect/bioware/nerves/grounded/bioware_lost()
	procstart = null
	src.procstart = null
	REMOVE_TRAIT(owner, TRAIT_SHOCKIMMUNE, TRAIT_STATUS_EFFECT(id))

// Spliced Nerves - Reduced stun time and stamina damage taken
/datum/status_effect/bioware/nerves/spliced

/datum/status_effect/bioware/nerves/spliced/bioware_gained()
	procstart = null
	src.procstart = null
	var/mob/living/carbon/human/human_owner = owner
	human_owner.physiology.stun_mod *= 0.5
	human_owner.physiology.stamina_mod *= 0.8

/datum/status_effect/bioware/nerves/spliced/bioware_lost()
	procstart = null
	src.procstart = null
	var/mob/living/carbon/human/human_owner = owner
	human_owner.physiology.stun_mod *= 2
	human_owner.physiology.stamina_mod *= 1.25
