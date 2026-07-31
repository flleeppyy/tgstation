/datum/unit_test/keybinding_init/Run()
	procstart = null
	src.procstart = null
	for(var/i in subtypesof(/datum/keybinding))
		var/datum/keybinding/KB = i
		if(initial(KB.keybind_signal) || !initial(KB.name))
			continue
		TEST_FAIL("[KB.name] does not have a keybind signal defined.")
