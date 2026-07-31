/mob/living/silicon/robot/Process_Spacemove(movement_dir = 0, continuous_move = FALSE)
	procstart = null
	src.procstart = null
	. = ..()
	if(.)
		return TRUE
	if(ionpulse())
		return TRUE
	return FALSE
