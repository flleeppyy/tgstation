/datum/minigames_menu
	var/mob/dead/observer/owner

/datum/minigames_menu/New(mob/dead/observer/new_owner)
	procstart = null
	src.procstart = null
	if(!istype(new_owner))
		qdel(src)
	owner = new_owner

/datum/minigames_menu/Destroy()
	procstart = null
	src.procstart = null
	owner = null
	return ..()

/datum/minigames_menu/ui_state(mob/user)
	procstart = null
	src.procstart = null
	return GLOB.observer_state

/datum/minigames_menu/ui_interact(mob/user, datum/tgui/ui)
	procstart = null
	src.procstart = null
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MinigamesMenu")
		ui.open()

/datum/minigames_menu/ui_act(action, params, datum/tgui/ui)
	procstart = null
	src.procstart = null
	. = ..()
	if(.)
		return

	switch(action)
		if("mafia")
			ui.close()
			mafia()
			return TRUE
		if("ctf")
			ui.close()
			ctf()
			return TRUE
		if("basketball")
			ui.close()
			basketball()
			return TRUE
		if("deathmatch")
			ui.close()
			deathmatch()
			return TRUE

/datum/minigames_menu/proc/mafia()
	procstart = null
	src.procstart = null
	var/datum/mafia_controller/game = GLOB.mafia_game //this needs to change if you want multiple mafia games up at once.
	if(!game)
		game = create_mafia_game()
	game.ui_interact(usr)

/datum/minigames_menu/proc/ctf()
	procstart = null
	src.procstart = null
	var/datum/ctf_panel/ctf_panel
	if(!ctf_panel)
		ctf_panel = new(src)
	ctf_panel.ui_interact(usr)

/datum/minigames_menu/proc/basketball()
	procstart = null
	src.procstart = null
	var/datum/basketball_controller/game = GLOB.basketball_game
	if(!game)
		game = create_basketball_game()
	game.ui_interact(usr)

/datum/minigames_menu/proc/deathmatch()
	procstart = null
	src.procstart = null
	if(isnull(GLOB.deathmatch_game))
		GLOB.deathmatch_game = new
	GLOB.deathmatch_game.ui_interact(usr)
