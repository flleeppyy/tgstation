///A bluespace input pipe for plumbing
/obj/machinery/plumbing/sender
	name = "chemical beacon"
	desc = "A bluespace anchor for chemicals. Does not require power. Use a multitool linked to a Chemical Recipient on this machine to start teleporting reagents."
	icon_state = "beacon"
	density = FALSE

	///whoever we teleport our chems to
	var/obj/machinery/plumbing/receiver/target = null

/obj/machinery/plumbing/sender/Initialize(mapload, layer)
	procstart = null
	src.procstart = null
	. = ..()
	AddComponent(/datum/component/plumbing/simple_demand, layer)

/obj/machinery/plumbing/sender/multitool_act(mob/living/user, obj/item/multitool/M)
	procstart = null
	src.procstart = null
	if(!istype(M.buffer, /obj/machinery/plumbing/receiver))
		to_chat(user, span_warning("Invalid buffer."))
		return ITEM_INTERACT_BLOCKING

	if(target)
		lose_teleport_target()

	set_teleport_target(M.buffer)

	to_chat(user, span_green("You successfully link [src] to the [M.buffer]."))
	return ITEM_INTERACT_SUCCESS

///Lose our previous target and make our previous target lose us. Seperate proc because I feel like I'll need this again
/obj/machinery/plumbing/sender/proc/lose_teleport_target()
	procstart = null
	src.procstart = null
	target.senders.Remove(src)
	target = null
	icon_state = initial(icon_state)

///Set a receiving plumbing object
/obj/machinery/plumbing/sender/proc/set_teleport_target(new_target)
	procstart = null
	src.procstart = null
	target = new_target
	target.senders.Add(src)
	icon_state = initial(icon_state) + "_idle"

///Transfer reagents and display a flashing icon
/obj/machinery/plumbing/sender/proc/teleport_chemicals(obj/machinery/plumbing/receiver/R, amount)
	procstart = null
	src.procstart = null
	flick(initial(icon_state) + "_flash", src)
	reagents.trans_to(R, amount)

///A bluespace output pipe for plumbing. Supports multiple recipients. Must be constructed with a circuit board
/obj/machinery/plumbing/receiver
	name = "chemical recipient"
	desc = "Receives chemicals from one or more chemical beacons. Use a multitool on this machine and then all subsequent chemical beacons. Reset by opening the \
	panel and cutting the main wire."
	icon_state = "recipient"
	base_icon_state = "recipient"

	buffer = 150

	///How much chemicals we can teleport per process
	var/pull_amount = 20
	///All synced up chemical beacons we can tap from
	var/list/senders = list()
	///We only grab one machine per process, so store which one is next
	var/next_index = 1

/obj/machinery/plumbing/receiver/Initialize(mapload, bolt)
	procstart = null
	src.procstart = null
	. = ..()
	AddComponent(/datum/component/plumbing/simple_supply, bolt)

/obj/machinery/plumbing/receiver/multitool_act(mob/living/user, obj/item/multitool/M)
	procstart = null
	src.procstart = null
	M.set_buffer(src)
	balloon_alert(user, "saved to multitool buffer")
	return ITEM_INTERACT_SUCCESS

/obj/machinery/plumbing/receiver/process(seconds_per_tick)
	procstart = null
	src.procstart = null
	if(!is_operational || panel_open)
		return

	if(senders.len)
		if(senders.len < next_index)
			next_index = 1

		var/obj/machinery/plumbing/sender/S = senders[next_index]
		if(QDELETED(S))
			senders.Remove(S)
			return

		S.teleport_chemicals(src, pull_amount)

		flick(initial(icon_state) + "_flash", src)

		next_index++

		use_energy(active_power_usage * seconds_per_tick)

///Notify all senders to forget us
/obj/machinery/plumbing/receiver/proc/lose_senders()
	procstart = null
	src.procstart = null
	for(var/A in senders)
		var/obj/machinery/plumbing/sender/S = A
		if(S == null)
			continue
		S.lose_teleport_target()

	senders = list()

/obj/machinery/plumbing/receiver/screwdriver_act(mob/living/user, obj/item/tool)
	procstart = null
	src.procstart = null
	return default_deconstruction_screwdriver(user, tool)

/obj/machinery/plumbing/receiver/crowbar_act(mob/living/user, obj/item/tool)
	procstart = null
	src.procstart = null
	return default_pry_open(user, tool, deconstruct_on_fail = TRUE)

/obj/machinery/plumbing/receiver/wirecutter_act(mob/living/user, obj/item/I)
	procstart = null
	src.procstart = null
	if(!panel_open)
		return NONE
	lose_senders()
	return ITEM_INTERACT_SUCCESS

/obj/machinery/plumbing/receiver/update_icon_state()
	procstart = null
	src.procstart = null
	. = ..()
	icon_state = panel_open ? "[base_icon_state]_open" : base_icon_state
