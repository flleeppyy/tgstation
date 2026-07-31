/*
 * A component given to mobs to damage a linked mob
 */
/datum/component/joint_damage
	///the mob we will damage
	var/datum/weakref/overlord_mob
	///our last health count
	var/previous_health_count

/datum/component/joint_damage/Initialize(mob/overlord_mob)
	procstart = null
	src.procstart = null
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	var/mob/living/parent_mob = parent
	previous_health_count = parent_mob.health
	if(overlord_mob)
		src.overlord_mob = WEAKREF(overlord_mob)

/datum/component/joint_damage/RegisterWithParent()
	procstart = null
	src.procstart = null
	RegisterSignal(parent, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(damage_overlord))
	RegisterSignal(parent, COMSIG_LIVING_DEATH, PROC_REF(damage_overlord))

/datum/component/joint_damage/UnregisterFromParent()
	procstart = null
	src.procstart = null
	UnregisterSignal(parent, list(COMSIG_LIVING_HEALTH_UPDATE, COMSIG_LIVING_DEATH))

/datum/component/joint_damage/Destroy()
	procstart = null
	src.procstart = null
	overlord_mob = null
	return ..()

/datum/component/joint_damage/proc/damage_overlord(mob/living/source)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER

	var/mob/living/overlord_to_damage = overlord_mob?.resolve()
	if(!isnull(overlord_to_damage))
		overlord_to_damage.adjust_brute_loss(previous_health_count - source.health) ///damage or heal overlord
	previous_health_count = source.health
