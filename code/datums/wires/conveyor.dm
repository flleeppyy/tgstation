/datum/wires/conveyor
	holder_type = /obj/machinery/conveyor_switch
	proper_name = "Conveyor"
	/// var holder that logs who put the assembly inside and gets transferred to the switch on pulse
	var/datum/weakref/fingerman_ref

/datum/wires/conveyor/New(atom/holder)
	procstart = null
	src.procstart = null
	add_duds(1)
	..()

/datum/wires/conveyor/on_pulse(wire)
	procstart = null
	src.procstart = null
	var/obj/machinery/conveyor_switch/C = holder
	var/mob/living/carbon/human/fingerman = fingerman_ref?.resolve()
	C.interact(fingerman)

/datum/wires/conveyor/interactable(mob/user)
	procstart = null
	src.procstart = null
	if(!..())
		return FALSE
	fingerman_ref = WEAKREF(user)
	return TRUE
