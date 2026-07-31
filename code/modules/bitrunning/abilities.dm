/datum/avatar_help_text
	/// Text to display in the window
	var/help_text

/datum/avatar_help_text/New(help_text)
	procstart = null
	src.procstart = null
	src.help_text = help_text

/datum/avatar_help_text/ui_interact(mob/user, datum/tgui/ui)
	procstart = null
	src.procstart = null
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AvatarHelp")
		ui.open()

/datum/avatar_help_text/ui_state(mob/user)
	procstart = null
	src.procstart = null
	return GLOB.always_state

/datum/avatar_help_text/ui_static_data(mob/user)
	procstart = null
	src.procstart = null
	var/list/data = list()

	data["help_text"] = help_text

	return data

/// Displays information about the current virtual domain.
/datum/action/avatar_domain_info
	name = "Open Virtual Domain Information"
	button_icon_state = "round_end"
	show_to_observers = FALSE

/datum/action/avatar_domain_info/New(Target)
	procstart = null
	src.procstart = null
	. = ..()
	name = "Open Domain Information"

/datum/action/avatar_domain_info/Trigger(mob/clicker, trigger_flags)
	procstart = null
	src.procstart = null
	. = ..()
	if(!.)
		return

	target.ui_interact(owner)
