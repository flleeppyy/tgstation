/datum/component/wormborn

/datum/component/wormborn/Initialize(...)
	procstart = null
	src.procstart = null
	. = ..()
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE

/datum/component/wormborn/RegisterWithParent()
	procstart = null
	src.procstart = null
	. = ..()
	RegisterSignal(parent, COMSIG_LIVING_DEATH, PROC_REF(second_breath))

/datum/component/wormborn/UnregisterFromParent()
	procstart = null
	src.procstart = null
	. = ..()
	UnregisterSignal(parent, COMSIG_LIVING_DEATH)

/datum/component/wormborn/proc/second_breath(mob/living/source)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER

	if(get_area(source) == GLOB.areas_by_type[/area/centcom/wizard_station])
		return
	source.buckled?.unbuckle_mob(source, force = TRUE)

	if(source.movement_type & VENTCRAWLING)
		source.forceMove(get_turf(source))

	var/mob/living/worm = new /mob/living/basic/wizard_worm(get_turf(source))
	source.mind?.transfer_to(worm)
	source.forceMove(worm)

/mob/living/basic/wizard_worm
	name = "Magic Worm"
	desc = "Large blue worm. What happens if you put your hand in his mouth?."
	icon = 'icons/mob/simple/mob.dmi'
	icon_state = "wizard_start"
	icon_living = "wizard_start"
	base_icon_state = "wizard"
	maxHealth = 800
	health = 800
	melee_damage_lower = 20
	melee_damage_upper = 30
	obj_damage = 200
	speed = 0
	move_force = MOVE_FORCE_OVERPOWERING
	move_resist = MOVE_FORCE_OVERPOWERING
	pull_force = MOVE_FORCE_OVERPOWERING
	mob_size = MOB_SIZE_HUGE
	sentience_type = SENTIENCE_BOSS
	mob_biotypes = MOB_ORGANIC|MOB_SPECIAL

/mob/living/basic/wizard_worm/has_gravity(turf/gravity_turf)
	procstart = null
	src.procstart = null
	return TRUE

/mob/living/basic/wizard_worm/can_be_pulled(user, force)
	procstart = null
	src.procstart = null
	return FALSE

/mob/living/basic/wizard_worm/Initialize(mapload, spawn_bodyparts = TRUE)
	procstart = null
	src.procstart = null
	. = ..()
	AddElement(/datum/element/wall_tearer)

	if(spawn_bodyparts)
		build_tail()

/mob/living/basic/wizard_worm/proc/build_tail(mob/living/tail)
	procstart = null
	src.procstart = null
	AddComponent(/datum/component/mob_chain, vary_icon_state = TRUE)
	var/mob/living/basic/wizard_worm/prev = src
	for(var/i in 1 to 5)
		prev = new_segment(behind = prev)
	update_appearance(UPDATE_ICON_STATE)

/mob/living/basic/wizard_worm/proc/new_segment(mob/living/basic/wizard_worm/behind)
	procstart = null
	src.procstart = null
	var/mob/living/segment = new type(drop_location(), FALSE)
	ADD_TRAIT(segment, TRAIT_PERMANENTLY_MORTAL, INNATE_TRAIT)
	segment.AddComponent(/datum/component/mob_chain, front = behind, vary_icon_state = TRUE)
	return segment
