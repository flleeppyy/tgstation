/obj/machinery/abductor/pad
	name = "Alien Telepad"
	desc = "Use this to transport to and from the humans' habitat."
	icon = 'icons/obj/antags/abductor.dmi'
	icon_state = "alien-pad-idle"
	var/turf/teleport_target
	var/obj/machinery/abductor/console/console

/obj/machinery/abductor/pad/Destroy()
	procstart = null
	src.procstart = null
	if(console)
		console.pad = null
		console = null
	return ..()

/obj/machinery/abductor/pad/proc/Warp(mob/living/target)
	procstart = null
	src.procstart = null
	if(!target.buckled)
		target.forceMove(get_turf(src))

/obj/machinery/abductor/pad/proc/Send()
	procstart = null
	src.procstart = null
	if(teleport_target == null)
		teleport_target = GLOB.teleportlocs[pick(GLOB.teleportlocs)]
	flick("alien-pad", src)
	for(var/mob/living/target in loc)
		target.forceMove(teleport_target)
		new /obj/effect/temp_visual/dir_setting/ninja(get_turf(target), target.dir)
		to_chat(target, span_warning("The instability of the warp leaves you disoriented!"))
		target.Stun(60)

/obj/machinery/abductor/pad/proc/Retrieve(mob/living/target)
	procstart = null
	src.procstart = null
	flick("alien-pad", src)
	new /obj/effect/temp_visual/dir_setting/ninja(get_turf(target), target.dir)
	Warp(target)

/obj/machinery/abductor/pad/proc/doMobToLoc(place, atom/movable/target)
	procstart = null
	src.procstart = null
	flick("alien-pad", src)
	target.forceMove(place)
	new /obj/effect/temp_visual/dir_setting/ninja(get_turf(target), target.dir)

/obj/machinery/abductor/pad/proc/MobToLoc(place,mob/living/target)
	procstart = null
	src.procstart = null
	new /obj/effect/temp_visual/teleport_abductor(place)
	addtimer(CALLBACK(src, PROC_REF(doMobToLoc), place, target), 8 SECONDS)

/obj/machinery/abductor/pad/proc/doPadToLoc(place)
	procstart = null
	src.procstart = null
	flick("alien-pad", src)
	for(var/mob/living/target in get_turf(src))
		target.forceMove(place)
		new /obj/effect/temp_visual/dir_setting/ninja(get_turf(target), target.dir)

/obj/machinery/abductor/pad/proc/PadToLoc(place)
	procstart = null
	src.procstart = null
	new /obj/effect/temp_visual/teleport_abductor(place)
	addtimer(CALLBACK(src, PROC_REF(doPadToLoc), place), 8 SECONDS)

/obj/effect/temp_visual/teleport_abductor
	name = "Huh"
	icon = 'icons/obj/antags/abductor.dmi'
	icon_state = "teleport"
	duration = 8 SECONDS

/obj/effect/temp_visual/teleport_abductor/Initialize(mapload)
	procstart = null
	src.procstart = null
	. = ..()
	do_sparks(10, FALSE, loc)

/obj/effect/temp_visual/teleport_golem
	name = "bluespace silhouette"
	icon = 'icons/obj/antags/abductor.dmi'
	icon_state = "teleport"
	duration = 6 SECONDS
