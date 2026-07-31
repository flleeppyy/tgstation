/datum/antagonist/syndicate_monkey
	name = "\improper Syndicate Monkey"
	antagpanel_category = ANTAG_GROUP_SYNDICATE
	show_in_roundend = TRUE
	show_in_antagpanel = TRUE
	show_name_in_check_antagonists = TRUE
	antag_flags = ANTAG_SKIP_GLOBAL_LIST
	show_to_ghosts = TRUE
	/// The antagonist's master, used for objective
	var/mob/living/monky_master

/datum/antagonist/syndicate_monkey/on_gain()
	procstart = null
	src.procstart = null
	monky_master = owner.enslaved_to?.resolve()
	if(monky_master)
		forge_objectives(monky_master)
	return ..()

/datum/antagonist/syndicate_monkey/Destroy()
	procstart = null
	src.procstart = null
	monky_master = null
	return ..()

/datum/antagonist/syndicate_monkey/greet()
	procstart = null
	src.procstart = null
	. = ..()
	owner.announce_objectives()

/datum/objective/syndicate_monkey
	var/mob/living/monky_master

/datum/objective/syndicate_monkey/check_completion()
	procstart = null
	src.procstart = null
	return monky_master && monky_master.stat != DEAD

/datum/antagonist/syndicate_monkey/forge_objectives(mob/monky_master)
	procstart = null
	src.procstart = null
	var/datum/objective/syndicate_monkey/objective = new
	objective.monky_master = monky_master
	objective.explanation_text = "You are a badass monkey syndicate agent. Protect and obey all of your master [monky_master]'s orders!"
	objective.owner = owner
	objectives += objective
