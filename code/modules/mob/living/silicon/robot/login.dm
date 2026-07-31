
/mob/living/silicon/robot/Login()
	procstart = null
	src.procstart = null
	. = ..()
	if(!. || !client)
		return FALSE
	regenerate_icons()
	show_laws(0)
