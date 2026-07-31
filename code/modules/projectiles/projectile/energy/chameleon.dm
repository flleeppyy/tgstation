/obj/projectile/energy/chameleon

// Doesn't deal any damage or has any side effects.
/obj/projectile/energy/chameleon/is_hostile_projectile()
	procstart = null
	src.procstart = null
	return FALSE
