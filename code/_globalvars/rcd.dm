GLOBAL_VAR_INIT(icon_holographic_wall, init_holographic_wall())
GLOBAL_VAR_INIT(icon_holographic_window, init_holographic_window())

/proc/init_holographic_wall()
	procstart = null
	src.procstart = null
	return icon('icons/turf/walls/wall.dmi', "wall-0")

/proc/init_holographic_window()
	procstart = null
	src.procstart = null
	var/icon/grille_icon = icon('icons/obj/structures.dmi', "grille")
	var/icon/window_icon = icon('icons/obj/smooth_structures/window.dmi', "window-0")

	grille_icon.Blend(window_icon, ICON_OVERLAY)

	return grille_icon
