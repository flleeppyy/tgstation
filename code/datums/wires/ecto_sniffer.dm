/datum/wires/ecto_sniffer
	proper_name = "Ectoscopic Sniffer"
	randomize = TRUE //Only one wire don't need blueprints
	holder_type = /obj/machinery/ecto_sniffer

/datum/wires/ecto_sniffer/New(atom/holder)
	procstart = null
	src.procstart = null
	wires = list(WIRE_ACTIVATE)
	..()

/datum/wires/ecto_sniffer/on_pulse(wire)
	procstart = null
	src.procstart = null
	var/obj/machinery/ecto_sniffer/our_sniffer = holder
	our_sniffer.activate()
	..()

/datum/wires/ecto_sniffer/on_cut(wire, mend, source)
	procstart = null
	src.procstart = null
	var/obj/machinery/ecto_sniffer/our_sniffer = holder
	our_sniffer.sensor_enabled = mend
