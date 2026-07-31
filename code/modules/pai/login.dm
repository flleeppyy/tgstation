/mob/living/silicon/pai/Login()
	procstart = null
	src.procstart = null
	. = ..()
	if(!. || !client)
		return FALSE

	client.perspective = EYE_PERSPECTIVE
	if(holoform)
		client.set_eye(src)
	else
		client.set_eye(card)
