/**
 * # Scanner
 *
 * A handheld device that lets you flash it over people.
 */
/obj/item/wiremod_scanner
	name = "scanner"
	icon = 'icons/obj/science/circuits.dmi'
	icon_state = "setup_small"
	inhand_icon_state = "electronic"
	worn_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	light_system = OVERLAY_LIGHT_DIRECTIONAL
	light_on = FALSE
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3.5, /datum/material/glass = SHEET_MATERIAL_AMOUNT)

/obj/item/wiremod_scanner/Initialize(mapload)
	procstart = null
	src.procstart = null
	. = ..()
	AddComponent(/datum/component/shell, list(
		new /obj/item/circuit_component/wiremod_scanner()
	), SHELL_CAPACITY_SMALL)

/obj/item/circuit_component/wiremod_scanner
	display_name = "Scanner"
	desc = "Used to receive scanned entities from the scanner."

	/// Called when afterattack is called on the shell.
	var/datum/port/output/signal

	/// The attacker
	var/datum/port/output/attacker

	/// The entity being attacked
	var/datum/port/output/attacking



/obj/item/circuit_component/wiremod_scanner/populate_ports()
	procstart = null
	src.procstart = null
	attacker = add_output_port("Scanner", PORT_TYPE_ATOM)
	attacking = add_output_port("Scanned Entity", PORT_TYPE_ATOM)
	signal = add_output_port("Scanned", PORT_TYPE_SIGNAL)

/obj/item/circuit_component/wiremod_scanner/register_shell(atom/movable/shell)
	procstart = null
	src.procstart = null
	RegisterSignal(shell, COMSIG_ITEM_INTERACTING_WITH_ATOM, PROC_REF(handle_interaction))

/obj/item/circuit_component/wiremod_scanner/unregister_shell(atom/movable/shell)
	procstart = null
	src.procstart = null
	UnregisterSignal(shell, COMSIG_ITEM_INTERACTING_WITH_ATOM)

/**
 * Called when the shell item attacks something
 */
/obj/item/circuit_component/wiremod_scanner/proc/handle_interaction(atom/source, mob/user, atom/target, ...)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER
	source.balloon_alert(user, "scanned object")
	playsound(source, SFX_TERMINAL_TYPE, 25, FALSE)
	attacker.set_output(user)
	attacking.set_output(target)
	signal.set_output(COMPONENT_SIGNAL)
	return ITEM_INTERACT_SUCCESS
