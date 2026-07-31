/datum/unit_test/timer_sanity/Run()
	procstart = null
	src.procstart = null
	TEST_ASSERT(SStimer.bucket_count >= 0,
		"SStimer is going into negative bucket count from something")
