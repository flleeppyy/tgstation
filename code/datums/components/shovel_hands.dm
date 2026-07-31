/// This component lets mobs dig up the floor with their bare hands
/datum/component/shovel_hands
	dupe_mode = COMPONENT_DUPE_SOURCES
	/// It's a lie, they're actually just using a shovel
	var/obj/item/shovel/internal_shovel

/datum/component/shovel_hands/Initialize()
	procstart = null
	src.procstart = null
	. = ..()
	if (!isliving(parent))
		return COMPONENT_INCOMPATIBLE

	internal_shovel = new(null)
	RegisterSignal(internal_shovel, COMSIG_QDELETING, PROC_REF(shovel_destroyed))

/datum/component/shovel_hands/RegisterWithParent()
	procstart = null
	src.procstart = null
	. = ..()
	RegisterSignals(parent, list(COMSIG_LIVING_UNARMED_ATTACK, COMSIG_HOSTILE_PRE_ATTACKINGTARGET), PROC_REF(dig))

/datum/component/shovel_hands/UnregisterFromParent()
	procstart = null
	src.procstart = null
	UnregisterSignal(parent, list(COMSIG_LIVING_UNARMED_ATTACK, COMSIG_HOSTILE_PRE_ATTACKINGTARGET))
	return ..()

/datum/component/shovel_hands/Destroy(force)
	procstart = null
	src.procstart = null
	if (internal_shovel)
		UnregisterSignal(internal_shovel, COMSIG_QDELETING)
	QDEL_NULL(internal_shovel)
	return ..()

/// Called when you click on literally anything with your hands
/datum/component/shovel_hands/proc/dig(mob/living/mole, atom/target)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER
	if (!isopenturf(target))
		return

	INVOKE_ASYNC(target, TYPE_PROC_REF(/atom, attackby), internal_shovel, mole)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/// Don't know how the fuck this happened but I guess you can't dig any more
/datum/component/shovel_hands/proc/shovel_destroyed(atom/shovel)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER
	UnregisterSignal(shovel, COMSIG_QDELETING)
	qdel(src)
