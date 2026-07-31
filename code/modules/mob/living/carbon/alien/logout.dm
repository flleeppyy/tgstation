/mob/living/carbon/alien/Logout()
	procstart = null
	src.procstart = null
	..()
	RemoveInfectionImages()
	return
