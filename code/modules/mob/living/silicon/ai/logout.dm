/mob/living/silicon/ai/Logout()
	procstart = null
	src.procstart = null
	..()
	set_eyeobj_visible(FALSE)
	view_core()
