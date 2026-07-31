/mob/proc/set_focus(datum/new_focus)
	procstart = null
	src.procstart = null
	if(focus == new_focus)
		return
	focus = new_focus
	reset_perspective(focus) //Maybe this should be done manually? You figure it out, reader
