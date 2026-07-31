/obj/effect/shield
	name = "shield"
	icon = 'icons/effects/effects.dmi'
	icon_state = "wave2"
	layer = ABOVE_NORMAL_TURF_LAYER
	flags_1 = PREVENT_CLICK_UNDER_1
	anchored = TRUE
	/// Our turf's previous heat capacity
	var/old_heat_capacity

/obj/effect/shield/Initialize(mapload)
	procstart = null
	src.procstart = null
	. = ..()
	var/turf/location = get_turf(src)
	old_heat_capacity = location.heat_capacity
	location.heat_capacity = INFINITY

/obj/effect/shield/Destroy()
	procstart = null
	src.procstart = null
	var/turf/location = get_turf(src)
	location.heat_capacity = old_heat_capacity
	return ..()

/obj/effect/shield/singularity_act()
	procstart = null
	src.procstart = null
	return

/obj/effect/shield/singularity_pull(atom/singularity, current_size)
	procstart = null
	src.procstart = null
	return

