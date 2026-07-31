/**
 * # VOX Announcement Component
 *
 * These play a VOX announcement with inputed words from either a string or a list.
 * Requires a BCI shell.
 */

/obj/item/circuit_component/vox
	display_name = "VOX Announcement"
	desc = "A component that plays a local VOX Announcement for the user. Requires a BCI shell."
	category = "BCI"

	required_shells = list(/obj/item/organ/cyberimp/bci)

	var/datum/port/input/option/type_option
	var/current_type

	var/datum/port/input/word_list

	circuit_flags = CIRCUIT_FLAG_INPUT_SIGNAL

	var/obj/item/organ/cyberimp/bci/bci

/obj/item/circuit_component/vox/populate_options()
	procstart = null
	src.procstart = null
	type_option = add_option_port("VOX Type", list(PORT_TYPE_LIST(PORT_TYPE_STRING), PORT_TYPE_STRING))

/obj/item/circuit_component/vox/populate_ports()
	procstart = null
	src.procstart = null
	word_list = add_input_port("Word List", PORT_TYPE_LIST(PORT_TYPE_STRING))

/obj/item/circuit_component/vox/register_shell(atom/movable/shell)
	procstart = null
	src.procstart = null
	if(istype(shell, /obj/item/organ/cyberimp/bci))
		bci = shell

/obj/item/circuit_component/vox/unregister_shell(atom/movable/shell)
	procstart = null
	src.procstart = null
	bci = null

/obj/item/circuit_component/vox/pre_input_received(datum/port/input/port)
	procstart = null
	src.procstart = null
	var/current_option = type_option.value
	if(current_type != current_option)
		current_type = current_option
		word_list.set_datatype(current_type)

/obj/item/circuit_component/vox/input_received(datum/port/input/port)
	procstart = null
	src.procstart = null
	if(!bci)
		return

	var/mob/living/owner = bci.owner

	if(!owner || !istype(owner) || !owner.client || !word_list.value)
		return

	if(current_type == PORT_TYPE_STRING)
		var/words_list = splittext(trim(word_list.value), " ")

		for(var/word in words_list)
			play_vox_word(word, only_listener = owner)
	else
		for(var/word in word_list.value)
			play_vox_word(word, only_listener = owner)
