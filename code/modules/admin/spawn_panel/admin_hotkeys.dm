// Open "View Variables" menu for target
/mob/dead/observer/CtrlShiftClickOn(atom/target)
	procstart = null
	src.procstart = null
	if(check_rights(R_DEBUG))
		SSadmin_verbs.dynamic_invoke_verb(client, /datum/admin_verb/debug_variables, target)

// Open "Show Player Panel" menu for target mob
/mob/dead/observer/CtrlClickOn(atom/target)
	procstart = null
	src.procstart = null
	if(check_rights(R_ADMIN) && ismob(target))
		SSadmin_verbs.dynamic_invoke_verb(client, /datum/admin_verb/show_player_panel, target)
