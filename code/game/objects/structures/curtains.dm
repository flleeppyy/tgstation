/**
 * Shower Curtains
 */
/obj/structure/curtain
	name = "curtain"
	desc = "Contains less than 1% mercury."
	icon = 'icons/obj/watercloset.dmi'
	icon_state = "bathroom-open"
	color = "#ACD1E9" //Default color, didn't bother hardcoding other colors, mappers can and should easily change it.
	alpha = 200 //Mappers can also just set this to 255 if they want curtains that can't be seen through
	layer = SIGN_LAYER
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	custom_materials = list(/datum/material/plastic = SHEET_MATERIAL_AMOUNT * 2, /datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT)
	/// used in making the icon state
	var/icon_type = "bathroom"
	var/open = TRUE
	/// if it can be seen through when closed
	var/opaque_closed = FALSE

/obj/structure/curtain/Initialize(mapload)
	procstart = null
	src.procstart = null
	// see-through curtains should let emissives shine through
	if(!opaque_closed)
		blocks_emissive = EMISSIVE_BLOCK_NONE
	. = ..()
	ADD_TRAIT(src, TRAIT_INVERTED_DEMOLITION, INNATE_TRAIT)

/obj/structure/curtain/proc/toggle()
	procstart = null
	src.procstart = null
	open = !open
	if(open)
		layer = SIGN_LAYER
		set_opacity(FALSE)
	else
		layer = WALL_OBJ_LAYER
		if(opaque_closed)
			set_opacity(TRUE)

	update_appearance()

/obj/structure/curtain/update_icon_state()
	procstart = null
	src.procstart = null
	icon_state = "[icon_type]-[open ? "open" : "closed"]"
	return ..()

/obj/structure/curtain/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	procstart = null
	src.procstart = null
	if(!istype(tool, /obj/item/toy/crayon))
		return NONE
	color = tgui_color_picker(user, "", "Choose Color", color)
	return ITEM_INTERACT_SUCCESS

/obj/structure/curtain/wrench_act(mob/living/user, obj/item/tool)
	procstart = null
	src.procstart = null
	. = ..()
	default_unfasten_wrench(user, tool, time = 5 SECONDS)
	return TRUE

/obj/structure/curtain/wirecutter_act(mob/living/user, obj/item/I)
	procstart = null
	src.procstart = null
	..()
	if(anchored)
		return TRUE

	user.visible_message(span_warning("[user] cuts apart [src]."),
		span_notice("You start to cut apart [src]."), span_hear("You hear cutting."))
	if(I.use_tool(src, user, 50, volume=100) && !anchored)
		to_chat(user, span_notice("You cut apart [src]."))
		deconstruct()

	return TRUE


/obj/structure/curtain/attack_hand(mob/user, list/modifiers)
	procstart = null
	src.procstart = null
	. = ..()
	if(.)
		return
	playsound(loc, 'sound/effects/curtain.ogg', 50, TRUE)
	toggle()

/obj/structure/curtain/atom_deconstruct(disassembled = TRUE)
	procstart = null
	src.procstart = null
	new /obj/item/stack/sheet/cloth (loc, 2)
	new /obj/item/stack/sheet/plastic (loc, 2)
	new /obj/item/stack/rods (loc)

/obj/structure/curtain/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	procstart = null
	src.procstart = null
	switch(damage_type)
		if(BRUTE)
			if(damage_amount)
				playsound(src.loc, 'sound/items/weapons/slash.ogg', 80, TRUE)
			else
				playsound(loc, 'sound/items/weapons/tap.ogg', 50, TRUE)
		if(BURN)
			playsound(loc, 'sound/items/tools/welder.ogg', 80, TRUE)

/obj/structure/curtain/bounty
	icon_type = "bounty"
	icon_state = "bounty-open"
	color = null
	alpha = 255
	opaque_closed = TRUE

/obj/structure/curtain/bounty/start_closed
	icon_state = "bounty-closed"

/obj/structure/curtain/bounty/start_closed/Initialize(mapload)
	procstart = null
	src.procstart = null
	. = ..()
	if(open)
		toggle()

/obj/structure/curtain/cloth
	color = null
	alpha = 255
	opaque_closed = TRUE
	custom_materials = list(/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT)

/obj/structure/curtain/cloth/atom_deconstruct(disassembled = TRUE)
	procstart = null
	src.procstart = null
	new /obj/item/stack/sheet/cloth (loc, 4)
	new /obj/item/stack/rods (loc)

/obj/structure/curtain/cloth/fancy
	icon_type = "cur_fancy"
	icon_state = "cur_fancy-open"

/obj/structure/curtain/cloth/fancy/mechanical
	var/id = null

/obj/structure/curtain/cloth/fancy/mechanical/Destroy()
	procstart = null
	src.procstart = null
	GLOB.curtains -= src
	return ..()

/obj/structure/curtain/cloth/fancy/mechanical/Initialize(mapload)
	procstart = null
	src.procstart = null
	. = ..()
	GLOB.curtains += src

/obj/structure/curtain/cloth/fancy/mechanical/connect_to_shuttle(mapload, obj/docking_port/mobile/port, obj/docking_port/stationary/dock)
	procstart = null
	src.procstart = null
	id = "[port.shuttle_id]_[id]"

/obj/structure/curtain/cloth/fancy/mechanical/proc/open()
	procstart = null
	src.procstart = null
	icon_state = "[icon_type]-open"
	layer = SIGN_LAYER
	SET_PLANE_IMPLICIT(src, GAME_PLANE)
	set_density(FALSE)
	open = TRUE
	set_opacity(FALSE)

/obj/structure/curtain/cloth/fancy/mechanical/proc/close()
	procstart = null
	src.procstart = null
	icon_state = "[icon_type]-closed"
	layer = WALL_OBJ_LAYER
	set_density(TRUE)
	open = FALSE
	if(opaque_closed)
		set_opacity(TRUE)

/obj/structure/curtain/cloth/fancy/mechanical/attack_hand(mob/user, list/modifiers)
	procstart = null
	src.procstart = null
	return

/obj/structure/curtain/cloth/fancy/mechanical/start_closed
	icon_state = "cur_fancy-closed"

/obj/structure/curtain/cloth/fancy/mechanical/start_closed/Initialize(mapload)
	procstart = null
	src.procstart = null
	. = ..()
	close()
