/// Sends the target a fake adminhelp sound
/datum/smite/fake_bwoink
	name = "Fake bwoink"

/datum/smite/fake_bwoink/effect(client/user, mob/living/target)
	procstart = null
	src.procstart = null
	. = ..()
	SEND_SOUND(target, 'sound/effects/adminhelp.ogg')
