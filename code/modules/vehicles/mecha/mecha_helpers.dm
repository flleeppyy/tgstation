///////////////////////
///// Power stuff /////
///////////////////////
/obj/vehicle/sealed/mecha/proc/has_charge(amount)
	procstart = null
	src.procstart = null
	return (get_charge() >= amount)

/obj/vehicle/sealed/mecha/proc/get_charge()
	procstart = null
	src.procstart = null
	return cell?.charge

/obj/vehicle/sealed/mecha/proc/use_energy(amount)
	procstart = null
	src.procstart = null
	var/output = cell.use(amount)
	if (output)
		diag_hud_set_mechcell()
	return output

/obj/vehicle/sealed/mecha/proc/give_power(amount)
	procstart = null
	src.procstart = null
	if(!isnull(get_charge()))
		cell.give(amount)
		return TRUE
	return FALSE

//////////////////////
///// Ammo stuff /////
//////////////////////

///Max the ammo stored in all ballistic weapons for this mech
/obj/vehicle/sealed/mecha/proc/max_ammo()
	procstart = null
	src.procstart = null
	for(var/obj/item/I as anything in flat_equipment)
		if(istype(I, /obj/item/mecha_parts/mecha_equipment/weapon/ballistic))
			var/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/gun = I
			gun.projectiles_cache = gun.projectiles_cache_max

///Called when the mecha with an MMI in it tries opening a door.
/obj/vehicle/sealed/mecha/proc/retrieve_access(datum/source, list/player_access)
	procstart = null
	src.procstart = null
	SIGNAL_HANDLER
	player_access += accesses
