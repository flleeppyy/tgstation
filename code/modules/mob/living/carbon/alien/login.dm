/mob/living/carbon/alien/Login()
	procstart = null
	src.procstart = null
	. = ..()
	if(!. || !client)
		return FALSE
	AddInfectionImages()
	return
