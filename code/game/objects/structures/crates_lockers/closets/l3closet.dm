/obj/structure/closet/l3closet
	name = "level 3 biohazard gear closet"
	desc = "It's a storage unit for level 3 biohazard gear."
	icon_state = "bio"

/obj/structure/closet/l3closet/PopulateContents()
	procstart = null
	src.procstart = null
	new /obj/item/storage/bag/bio(src)
	new /obj/item/clothing/suit/bio_suit/general(src)
	new /obj/item/clothing/head/bio_hood/general(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/oxygen(src)
	new /obj/item/reagent_containers/syringe/antiviral(src)

/obj/structure/closet/l3closet/scientist
	icon_door = "bio_sci"

/obj/structure/closet/l3closet/scientist/PopulateContents()
	procstart = null
	src.procstart = null
	new /obj/item/storage/bag/xeno(src)
	new /obj/item/clothing/suit/bio_suit/scientist(src)
	new /obj/item/clothing/head/bio_hood/scientist(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/oxygen(src)


/obj/structure/closet/l3closet/virology
	icon_door = "bio_viro"

/obj/structure/closet/l3closet/virology/PopulateContents()
	procstart = null
	src.procstart = null
	new /obj/item/storage/bag/bio(src)
	new /obj/item/clothing/suit/bio_suit/virology(src)
	new /obj/item/clothing/head/bio_hood/virology(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/oxygen(src)
	new /obj/item/reagent_containers/syringe/antiviral(src)


/obj/structure/closet/l3closet/security
	icon_door = "bio_sec"

/obj/structure/closet/l3closet/security/PopulateContents()
	procstart = null
	src.procstart = null
	new /obj/item/clothing/suit/bio_suit/security(src)
	new /obj/item/clothing/head/bio_hood/security(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/oxygen(src)
	new /obj/item/reagent_containers/syringe/antiviral(src)


/obj/structure/closet/l3closet/janitor
	icon_door = "bio_jan"

/obj/structure/closet/l3closet/janitor/PopulateContents()
	procstart = null
	src.procstart = null
	new /obj/item/clothing/suit/bio_suit/janitor(src)
	new /obj/item/clothing/head/bio_hood/janitor(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/oxygen(src)
	new /obj/item/reagent_containers/syringe/antiviral(src)
