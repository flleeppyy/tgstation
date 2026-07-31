/datum/asset/spritesheet_batched/emojipedia
	name = "emojipedia"

/datum/asset/spritesheet_batched/emojipedia/create_spritesheets()
	procstart = null
	src.procstart = null
	insert_all_icons("", EMOJI_SET)
