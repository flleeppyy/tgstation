/datum/antagonist/spider
	name = "\improper Spider"
	antagpanel_category = ANTAG_GROUP_ARACHNIDS
	show_in_roundend = FALSE
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	show_to_ghosts = TRUE
	/// Orders given to us by the queen
	var/directive

/datum/antagonist/spider/New(directive)
	procstart = null
	src.procstart = null
	. = ..()
	src.directive = directive

/datum/antagonist/spider/on_gain()
	procstart = null
	src.procstart = null
	forge_objectives(directive)
	return ..()

/datum/antagonist/spider/greet()
	procstart = null
	src.procstart = null
	. = ..()
	owner.announce_objectives()

/datum/objective/spider
	explanation_text = "Spread the infestation."

/datum/objective/spider/New(directive)
	procstart = null
	src.procstart = null
	..()
	if(directive)
		explanation_text = "Your queen has given you a directive! Follow it at all costs: [directive]"

/datum/objective/spider/check_completion()
	procstart = null
	src.procstart = null
	return owner.current && owner.current.stat != DEAD

/datum/antagonist/spider/forge_objectives()
	procstart = null
	src.procstart = null
	var/datum/objective/spider/objective = new(directive)
	objective.owner = owner
	objectives += objective

/// Subtype for flesh spiders who don't have a queen
/datum/antagonist/spider/flesh
	name = "Flesh Spider"

/datum/antagonist/spider/flesh/forge_objectives()
	procstart = null
	src.procstart = null
	var/datum/objective/custom/destroy = new()
	destroy.owner = owner
	destroy.explanation_text = "Wreak havoc and consume living flesh."
	objectives += destroy

	var/datum/objective/survive/dont_die = new()
	dont_die.owner = owner
	objectives += dont_die

/datum/antagonist/spider/flesh/greet()
	procstart = null
	src.procstart = null
	. = ..()
	to_chat(owner, span_boldwarning("An abomination of flesh set upon the station by changelings, \
		you are aggressive to all living beings outside of your species and know no loyalties... even to your creator. \
		<br>Your malleable flesh quickly regenerates if you can avoid taking damage for a few seconds."))
