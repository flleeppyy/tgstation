/datum/asset/spritesheet_batched/mecha_equipment
	name = "mecha_equipment"

/datum/asset/spritesheet_batched/mecha_equipment/create_spritesheets()
	procstart = null
	src.procstart = null
	insert_all_icons("", 'icons/obj/devices/mecha_equipment.dmi')
	insert_all_icons("", 'icons/obj/ore.dmi')
