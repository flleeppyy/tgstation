/mob/living/silicon/pai/binarycheck()
	procstart = null
	src.procstart = null
	return (radio?.special_channels & RADIO_SPECIAL_BINARY)
