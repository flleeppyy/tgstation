/datum/antagonist/blood_worm
	name = "\improper Blood Worm"
	roundend_category = "blood worms"
	antagpanel_category = ANTAG_GROUP_BLOODY
	pref_flag = ROLE_BLOOD_WORM
	antag_hud_name = "blood_worm"
	antag_moodlet = /datum/mood_event/blood_worm
	hijack_speed = 0.5
	show_to_ghosts = TRUE // I mean let's be honest, even the roundstart versions will become painfully apparent soon enough.
	stinger_sound = 'sound/effects/magic/exit_blood.ogg'
	ui_name = "AntagInfoBloodWorm"

	var/datum/team/blood_worm/team = null

/datum/antagonist/blood_worm/Destroy()
	procstart = null
	src.procstart = null
	team = null
	return ..()

/datum/antagonist/blood_worm/greet()
	procstart = null
	src.procstart = null
	. = ..()

	to_chat(owner, span_bold("A species of space-faring leech, massive in size and ferocious in hunting. \
							Your origins are unknown to most, but to some, you are among their greatest creations. \
							A failed Syndicate bioweapons project, snuffed out by benefactors after a \"lack of results\", and yet... \
							here you find yourself. On a Nanotrasen space station. What a fitting habitat for you, isn't it?"))
	to_chat(owner, span_bolddanger("KILL, CONSUME, MULTIPLY, CONQUER."))

	owner.announce_objectives()

/datum/antagonist/blood_worm/forge_objectives()
	procstart = null
	src.procstart = null
	objectives |= team.objectives

/datum/antagonist/blood_worm/create_team(datum/team/new_team)
	procstart = null
	src.procstart = null
	GLOB.blood_worm_team ||= new()
	team = GLOB.blood_worm_team

/datum/antagonist/blood_worm/get_team()
	procstart = null
	src.procstart = null
	return team

/datum/antagonist/blood_worm/on_gain()
	procstart = null
	src.procstart = null
	forge_objectives()
	ADD_TRAIT(owner, TRAIT_UNCONVERTABLE, REF(src)) // No blood cultist worms or whatever the fuck
	return ..()

/datum/antagonist/blood_worm/on_removal()
	procstart = null
	src.procstart = null
	REMOVE_TRAITS_IN(owner, REF(src))
	return ..()

/datum/antagonist/blood_worm/apply_innate_effects(mob/living/mob_override)
	procstart = null
	src.procstart = null
	var/mob/living/target = mob_override || owner.current

	add_team_hud(target)

	if (!istype(target, /mob/living/basic/blood_worm))
		target.add_faction(FACTION_BLOOD_WORM)

	// Apathy and fearlessness are traits inherent to the very mind of a blood worm.
	// Being immune to hunger, withdrawals, etc. are physical traits of blood worm hosts.
	target.add_traits(list(TRAIT_APATHETIC, TRAIT_FEARLESS), REF(src))

/datum/antagonist/blood_worm/remove_innate_effects(mob/living/mob_override)
	procstart = null
	src.procstart = null
	var/mob/living/target = mob_override || owner.current

	if (!istype(target, /mob/living/basic/blood_worm))
		target.remove_faction(FACTION_BLOOD_WORM)

	REMOVE_TRAITS_IN(target, REF(src))

/datum/antagonist/blood_worm/admin_add(datum/mind/new_owner, mob/admin)
	procstart = null
	src.procstart = null
	if (!new_owner.current)
		return

	if (!istype(new_owner.current, /mob/living/basic/blood_worm))
		var/old_mob = new_owner.current

		var/mob/living/basic/blood_worm/hatchling/new_worm = new(get_turf(new_owner.current))
		new_owner.transfer_to(new_worm, force_key_move = TRUE)

		qdel(old_mob)

	return ..()

/datum/antagonist/blood_worm/get_preview_icon()
	procstart = null
	src.procstart = null
	var/datum/universal_icon/icon = uni_icon('icons/mob/nonhuman-player/blood_worm_32x32.dmi', "juvenile")

	icon.crop(1, 1, 32, 32)
	icon.shift(SOUTH, 4)
	icon.scale(ANTAGONIST_PREVIEW_ICON_SIZE, ANTAGONIST_PREVIEW_ICON_SIZE)

	return icon

/datum/antagonist/blood_worm/ui_static_data(mob/user)
	procstart = null
	src.procstart = null
	. = ..()
	var/list/team_data = list()
	team_data["blood_consumed_total"] = floor(team.blood_consumed_total)
	team_data["times_reproduced_total"] = floor(team.times_reproduced_total)
	.["team"] = team_data

/datum/antagonist/blood_worm/infestation
	pref_flag = ROLE_BLOOD_WORM_INFESTATION
	jobban_flag = ROLE_BLOOD_WORM
	show_in_antagpanel = FALSE
