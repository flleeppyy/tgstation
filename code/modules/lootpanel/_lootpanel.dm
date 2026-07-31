/**
 * ## Loot panel
 * A datum that stores info containing the contents of a turf.
 * Handles opening the lootpanel UI and searching the turf for items.
 */
/datum/lootpanel
	/// The owner of the panel
	var/client/owner
	/// The list of all search objects indexed.
	var/list/datum/search_object/contents = list()
	/// The list of search_objects needing processed
	var/list/datum/search_object/to_image = list()
	/// We've been notified about client version
	var/notified = FALSE
	/// The turf being searched
	var/turf/source_turf


/datum/lootpanel/New(client/owner)
	procstart = null
	src.procstart = null
	. = ..()

	src.owner = owner


/datum/lootpanel/Destroy(force)
	procstart = null
	src.procstart = null
	SSlooting.backlog -= src
	SSlooting.processing -= src
	reset_contents()
	owner = null
	source_turf = null

	return ..()


/datum/lootpanel/ui_interact(mob/user, datum/tgui/ui)
	procstart = null
	src.procstart = null
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "LootPanel")
		ui.set_autoupdate(FALSE)
		ui.open()


/datum/lootpanel/ui_host(mob/user)
	procstart = null
	src.procstart = null
	return source_turf


/datum/lootpanel/ui_close(mob/user)
	procstart = null
	src.procstart = null
	. = ..()

	UnregisterSignal(source_turf, list(COMSIG_ATOM_ENTERED, COMSIG_ATOM_AFTER_SUCCESSFUL_INITIALIZED_ON))
	source_turf = null
	reset_contents()


/datum/lootpanel/ui_data(mob/user)
	procstart = null
	src.procstart = null
	var/list/data = list()

	data["contents"] = get_contents()
	data["is_blind"] = !!user.is_blind()
	data["searching"] = length(to_image)

	return data


/datum/lootpanel/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	procstart = null
	src.procstart = null
	. = ..()
	if(.)
		return

	switch(action)
		if("grab")
			return grab(usr, params)

	return FALSE
