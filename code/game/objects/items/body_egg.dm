/obj/item/organ/body_egg
	name = "body egg"
	desc = "All slimy and yuck."
	icon_state = "innards"
	visual = TRUE
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_PARASITE_EGG
	organ_flags = parent_type::organ_flags | ORGAN_HAZARDOUS

/obj/item/organ/body_egg/on_find(mob/living/finder)
	procstart = null
	src.procstart = null
	..()
	to_chat(finder, span_warning("You found an unknown alien organism in [owner]'s [zone]!"))

/obj/item/organ/body_egg/feel_for_damage(self_aware)
	procstart = null
	src.procstart = null
	// keep these stealthy for now, revisit later
	return ""

/obj/item/organ/body_egg/Initialize(mapload)
	procstart = null
	src.procstart = null
	. = ..()
	if(iscarbon(loc))
		Insert(loc)

/obj/item/organ/body_egg/on_mob_insert(mob/living/carbon/egg_owner, special = FALSE, movement_flags)
	procstart = null
	src.procstart = null
	. = ..()

	egg_owner.add_traits(list(TRAIT_XENO_HOST, TRAIT_XENO_IMMUNE), ORGAN_TRAIT)
	egg_owner.med_hud_set_status()
	INVOKE_ASYNC(src, PROC_REF(AddInfectionImages), egg_owner)

/obj/item/organ/body_egg/on_mob_remove(mob/living/carbon/egg_owner, special, movement_flags)
	procstart = null
	src.procstart = null
	. = ..()
	egg_owner.remove_traits(list(TRAIT_XENO_HOST, TRAIT_XENO_IMMUNE), ORGAN_TRAIT)
	egg_owner.med_hud_set_status()
	INVOKE_ASYNC(src, PROC_REF(RemoveInfectionImages), egg_owner)

/obj/item/organ/body_egg/on_death(seconds_per_tick)
	procstart = null
	src.procstart = null
	. = ..()
	if(!owner)
		return
	egg_process(seconds_per_tick)

/obj/item/organ/body_egg/on_life(seconds_per_tick)
	procstart = null
	src.procstart = null
	. = ..()
	egg_process(seconds_per_tick)

/obj/item/organ/body_egg/proc/egg_process(seconds_per_tick)
	procstart = null
	src.procstart = null
	return

/obj/item/organ/body_egg/proc/RefreshInfectionImage()
	procstart = null
	src.procstart = null
	RemoveInfectionImages()
	AddInfectionImages()

/obj/item/organ/body_egg/proc/AddInfectionImages()
	procstart = null
	src.procstart = null
	return

/obj/item/organ/body_egg/proc/RemoveInfectionImages()
	procstart = null
	src.procstart = null
	return
