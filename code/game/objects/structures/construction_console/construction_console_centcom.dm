///admin-only base consturctino console subtype for building anywhere!
/obj/machinery/computer/camera_advanced/base_construction/centcom
	name = "centcom base construction console"
	circuit = /obj/item/circuitboard/computer/base_construction/centcom

/obj/machinery/computer/camera_advanced/base_construction/centcom/Initialize(mapload)
	procstart = null
	src.procstart = null
	internal_rcd = new(src)
	return ..()

/obj/machinery/computer/camera_advanced/base_construction/centcom/restock_materials()
	procstart = null
	src.procstart = null
	internal_rcd.matter = internal_rcd.max_matter

/obj/machinery/computer/camera_advanced/base_construction/centcom/populate_actions_list()
	procstart = null
	src.procstart = null
	actions += new /datum/action/innate/construction/configure_mode(src) //Action for switching the RCD's build modes
	actions += new /datum/action/innate/construction/build(src) //Action for using the RCD
