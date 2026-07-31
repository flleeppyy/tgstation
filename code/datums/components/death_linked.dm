/**
 * ## Death link component
 *
 * When the owner of this component dies it also gibs a linked mob
 */
/datum/component/death_linked
	///The mob that also dies when the user dies
	var/datum/weakref/linked_mob

/datum/component/death_linked/Initialize(mob/living/target_mob)
	procstart = null
	src.procstart = null
	. = ..()
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	if(isnull(target_mob))
		stack_trace("[type] added to [parent] with no linked mob.")
	src.linked_mob = WEAKREF(target_mob)

/datum/component/death_linked/RegisterWithParent()
	procstart = null
	src.procstart = null
	. = ..()
	RegisterSignal(parent, COMSIG_LIVING_DEATH, PROC_REF(on_death))

/datum/component/death_linked/UnregisterFromParent()
	procstart = null
	src.procstart = null
	. = ..()
	UnregisterSignal(parent, COMSIG_LIVING_DEATH)

///signal called by the stat of the target changing
/datum/component/death_linked/proc/on_death(mob/living/target, gibbed)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER
	var/mob/living/linked_mob_resolved = linked_mob?.resolve()
	linked_mob_resolved?.gib(DROP_ALL_REMAINS)
