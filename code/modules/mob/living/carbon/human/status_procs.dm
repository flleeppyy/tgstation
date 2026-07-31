
/mob/living/carbon/human/Stun(amount, ignore_canstun = FALSE)
	procstart = null
	src.procstart = null
	amount = dna.species.spec_stun(src, amount)
	return ..()

/mob/living/carbon/human/Knockdown(amount, daze_amount = 0, ignore_canstun = FALSE)
	procstart = null
	src.procstart = null
	amount = dna.species.spec_stun(src, amount) * physiology.knockdown_mod
	return ..()

/mob/living/carbon/human/Paralyze(amount, ignore_canstun = FALSE)
	procstart = null
	src.procstart = null
	amount = dna.species.spec_stun(src, amount)
	return ..()

/mob/living/carbon/human/Immobilize(amount, ignore_canstun = FALSE)
	procstart = null
	src.procstart = null
	amount = dna.species.spec_stun(src, amount)
	return ..()

/mob/living/carbon/human/Unconscious(amount, ignore_canstun = FALSE)
	procstart = null
	src.procstart = null
	amount = dna.species.spec_stun(src, amount)
	if(HAS_TRAIT(src, TRAIT_HEAVY_SLEEPER))
		amount *= (rand(125, 130) * 0.01)
	return ..()

/mob/living/carbon/human/Sleeping(amount)
	procstart = null
	src.procstart = null
	if(HAS_TRAIT(src, TRAIT_HEAVY_SLEEPER))
		amount *= (rand(125, 130) * 0.01)
	return ..()

/mob/living/carbon/human/cure_husk(list/sources)
	procstart = null
	src.procstart = null
	. = ..()
	if(.)
		update_body_parts()
