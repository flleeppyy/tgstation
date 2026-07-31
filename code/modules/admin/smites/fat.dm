/// Fattens the target
/datum/smite/fat
	name = "Fatten up"

/datum/smite/fat/effect(client/user, mob/living/target)
	procstart = null
	src.procstart = null
	. = ..()
	target.set_nutrition(NUTRITION_LEVEL_FAT * 2)
