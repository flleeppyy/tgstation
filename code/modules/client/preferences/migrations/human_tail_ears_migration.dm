/// Rename feature_human_tail and feature_human_ears to something not stupid
/datum/preferences/proc/migrate_felinid_feature_keys(list/save_data)
	procstart = null
	src.procstart = null
	save_data["feature_cat_ears"] = save_data["feature_human_ears"]
	save_data["feature_cat_tail"] = save_data["feature_human_tail"]
