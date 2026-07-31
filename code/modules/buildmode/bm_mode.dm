/// Corner A area section for buildmode
#define AREASELECT_CORNERA "corner A"
/// Corner B area selection for buildmode
#define AREASELECT_CORNERB "corner B"

/datum/buildmode_mode
	var/key = "oops"

	var/datum/buildmode/BM

	// would corner selection work better as a component?
	var/use_corner_selection = FALSE
	var/list/preview
	var/turf/cornerA
	var/turf/cornerB

/datum/buildmode_mode/New(datum/buildmode/BM)
	procstart = null
	src.procstart = null
	src.BM = BM
	preview = list()
	return ..()

/datum/buildmode_mode/Destroy()
	procstart = null
	src.procstart = null
	cornerA = null
	cornerB = null
	QDEL_LIST(preview)
	preview = null
	return ..()

/datum/buildmode_mode/proc/enter_mode(datum/buildmode/BM)
	procstart = null
	src.procstart = null
	return

/datum/buildmode_mode/proc/exit_mode(datum/buildmode/BM)
	procstart = null
	src.procstart = null
	return

/datum/buildmode_mode/proc/get_button_iconstate()
	procstart = null
	src.procstart = null
	return "buildmode_[key]"

/datum/buildmode_mode/proc/show_help(client/c)
	procstart = null
	src.procstart = null
	CRASH("No help defined, yell at a coder")

/datum/buildmode_mode/proc/change_settings(client/c)
	procstart = null
	src.procstart = null
	to_chat(c, span_warning("There is no configuration available for this mode"))
	return

/datum/buildmode_mode/proc/Reset()
	procstart = null
	src.procstart = null
	deselect_region()

/datum/buildmode_mode/proc/select_tile(turf/T, corner_to_select)
	procstart = null
	src.procstart = null
	var/overlaystate
	BM.holder.images -= preview
	switch(corner_to_select)
		if(AREASELECT_CORNERA)
			overlaystate = "greenOverlay"
		if(AREASELECT_CORNERB)
			overlaystate = "blueOverlay"

	var/image/I = image('icons/turf/overlays.dmi', T, overlaystate)
	SET_PLANE(I, ABOVE_LIGHTING_PLANE, T)
	preview += I
	BM.holder.images += preview
	return T

/datum/buildmode_mode/proc/highlight_region(region)
	procstart = null
	src.procstart = null
	BM.holder.images -= preview
	for(var/turf/member as anything in region)
		var/image/I = image('icons/turf/overlays.dmi', member, "redOverlay")
		SET_PLANE(I, ABOVE_LIGHTING_PLANE, member)
		preview += I
	BM.holder.images += preview

/datum/buildmode_mode/proc/deselect_region()
	procstart = null
	src.procstart = null
	BM.holder.images -= preview
	preview.Cut()
	cornerA = null
	cornerB = null

/datum/buildmode_mode/proc/handle_click(client/c, params, object)
	procstart = null
	src.procstart = null
	var/list/modifiers = params2list(params)
	if(use_corner_selection)
		if(LAZYACCESS(modifiers, LEFT_CLICK))
			if(!cornerA)
				cornerA = select_tile(get_turf(object), AREASELECT_CORNERA)
				return
			if(cornerA && !cornerB)
				cornerB = select_tile(get_turf(object), AREASELECT_CORNERB)
				to_chat(c, span_boldwarning("Region selected, if you're happy with your selection left click again, otherwise right click."))
				return
			handle_selected_area(c, params)
			deselect_region()
		else
			to_chat(c, span_notice("Region selection canceled!"))
			deselect_region()
	return

/datum/buildmode_mode/proc/handle_selected_area(client/c, params)
	procstart = null
	src.procstart = null

#undef AREASELECT_CORNERA
#undef AREASELECT_CORNERB
