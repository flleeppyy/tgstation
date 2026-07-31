/*
 * A component given to mobs that can climb trees
 */
/datum/component/tree_climber
	///the distance to climb up and down
	var/climbing_distance = 20
	///the tree we are on
	var/obj/current_tree

/datum/component/tree_climber/Initialize(climbing_distance = 20)
	procstart = null
	src.procstart = null
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	src.climbing_distance = climbing_distance

	ADD_TRAIT(parent, TRAIT_SUBTREE_REQUIRED_OPERATIONAL_DATUM, type)

/datum/component/tree_climber/RegisterWithParent()
	procstart = null
	src.procstart = null
	RegisterSignal(parent, COMSIG_HOSTILE_PRE_ATTACKINGTARGET, PROC_REF(climb_tree))
	RegisterSignal(parent, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))

/datum/component/tree_climber/UnregisterFromParent()
	procstart = null
	src.procstart = null
	UnregisterSignal(parent, list(COMSIG_HOSTILE_PRE_ATTACKINGTARGET, COMSIG_ATOM_EXAMINE))

/datum/component/tree_climber/Destroy()
	procstart = null
	src.procstart = null
	if(current_tree)
		handle_climb_tree(parent, current_tree) //remove mob from tree and handle deletion of signals
	return ..()

/datum/component/tree_climber/proc/climb_tree(mob/living/source, atom/target)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER

	if(!istype(target, /obj/structure/flora/tree))
		return

	if(!can_climb_tree(target)) //check if another animal is on the tree
		to_chat(source, span_warning("[target] is blocked!"))
		return COMPONENT_HOSTILE_NO_ATTACK

	handle_climb_tree(source, target)

	if(current_tree)
		source.forceMove(get_turf(current_tree))
		return COMPONENT_HOSTILE_NO_ATTACK

	var/list/possible_drops = get_adjacent_open_turfs(target)
	for(var/turf/droploc as anything in possible_drops)
		if(!droploc.is_blocked_turf(exclude_mobs = TRUE))
			continue
		possible_drops -= droploc
	if(possible_drops.len)
		source.forceMove(pick(possible_drops))
	return COMPONENT_HOSTILE_NO_ATTACK

/datum/component/tree_climber/proc/on_examine(datum/source, mob/user, list/examine_text)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER
	if(current_tree)
		examine_text += "It is clinging to [current_tree]!"

/datum/component/tree_climber/proc/can_climb_tree(obj/structure/flora/tree/target)
	procstart = null
	src.procstart = null
	if(current_tree)
		return TRUE
	var/turf/tree_turf = get_turf(target)
	if(locate(/mob/living) in tree_turf.contents)
		return FALSE
	return TRUE

/datum/component/tree_climber/proc/handle_climb_tree(mob/living/climber, obj/structure/target_tree)
	procstart = null
	src.procstart = null
	var/offset = current_tree ? -(climbing_distance) : climbing_distance
	animate(climber, pixel_y = climber.pixel_y + offset, time = 2)
	climber.Stun(2 SECONDS, ignore_canstun = TRUE)
	if(current_tree)
		remove_tree_signals()
		current_tree = null
		return

	current_tree = target_tree
	register_tree_signals()

/datum/component/tree_climber/proc/remove_from_tree()
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER

	handle_climb_tree(parent, current_tree)

/datum/component/tree_climber/proc/register_tree_signals()
	procstart = null
	src.procstart = null
	RegisterSignal(parent, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(remove_from_tree))
	RegisterSignal(current_tree, COMSIG_PREQDELETED, PROC_REF(remove_from_tree))

/datum/component/tree_climber/proc/remove_tree_signals()
	procstart = null
	src.procstart = null
	UnregisterSignal(parent, COMSIG_MOVABLE_PRE_MOVE)
	UnregisterSignal(current_tree, COMSIG_PREQDELETED)

