/datum/job/skeleton/zizoid
	title = "Skeleton-cultist"
	tutorial = null
	department_flag = MOB_UNDEAD
	job_flags = (JOB_EQUIP_RANK)
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	show_in_credits = FALSE
	give_bank_account = FALSE
	hidden_job = TRUE
	announce_latejoin = FALSE
	allowed_races = ALL_RACES_TYPES
	cmode_music = 'sound/music/cmode/antag/combat_cult.ogg'
	outfit = /datum/outfit/skeleton/zizoid
	give_bank_account = FALSE
	languages = list(/datum/language/undead)

	traits = list(
		TRAIT_NOMOOD,
		TRAIT_INFINITE_STAMINA,
		TRAIT_NOLIMBDISABLE,
		TRAIT_NOHUNGER,
		TRAIT_NOBREATH,
		TRAIT_NOPAIN,
		TRAIT_TOXIMMUNE,
		TRAIT_NOSLEEP,
		TRAIT_SHOCKIMMUNE
	)


/datum/outfit/job/skeleton/zizoid/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.set_patron(/datum/patron/inhumen/zizo)

	H.possible_rmb_intents = list(/datum/rmb_intent/feint,\
	/datum/rmb_intent/aimed,\
	/datum/rmb_intent/riposte,\
	/datum/rmb_intent/strong,\
	/datum/rmb_intent/weak)
	H.swap_rmb_intent(num=1)

	var/datum/antagonist/new_antag = new /datum/antagonist/skeleton()
	H.mind.add_antag_datum(new_antag)

	H.grant_language(/datum/language/undead)

	var/datum/language_holder/language_holder = H.get_language_holder()
	language_holder.selected_default_language = /datum/language/undead

	H.STASTR = rand(7, 13)
	H.STAWIL = rand(7, 12)
	H.STACON = rand(8, 13)
	H.STAINT = rand(1, 3)
	H.STAPER = rand(7, 1)
	H.STALUC = rand(5, 12)
		subclass_skills = list(
	/datum/skill/craft/carpentry = SKILL_LEVEL_NOVICE,
	/datum/skill/craft/masonry = SKILL_LEVEL_NOVICE,
	/datum/skill/craft/crafting = SKILL_LEVEL_NOVICE,
	/datum/skill/craft/sewing = SKILL_LEVEL_NOVICE,
	/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
	/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
	/datum/skill/combat/axes = SKILL_LEVEL_JOURNEYMAN,
	/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
	/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
	/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
	/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
	/datum/skill/combat/shields = SKILL_LEVEL_APPRENTICE,
	/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
	/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
	)
	// Randomized armor
	if(prob(10))
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson
	if(prob(10))
		armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	if(prob(10))
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail/paalloy
	if(prob(10))
		armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/aalloy
	if(prob(10))
		armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket
	if(prob(10))
		armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron

	// Randomized headgear
	switch(pick(1,9))
		if (1) head = /obj/item/clothing/head/roguetown/helmet/kettle
		if (2) head = /obj/item/clothing/head/roguetown/helmet/winged
		if (3) head = /obj/item/clothing/head/roguetown/helmet/leather
		if (4) head = /obj/item/clothing/head/roguetown/helmet/coppercap
		if (5) neck = /obj/item/clothing/neck/roguetown/coif/heavypadding
		if (6) neck = /obj/item/clothing/neck/roguetown/coif/padded
		if (7) head = /obj/item/clothing/head/roguetown/helmet/horned
		if (8) head = /obj/item/clothing/head/roguetown/helmet/skullcap
		if (9) head = /obj/item/clothing/head/roguetown/helmet/skullcap/cult

	// Shield
	if(prob(20))
		backr = /obj/item/rogueweapon/shield/iron

	// Randomized weapons
	switch(pick(1,6))
		if (1)
			var/obj/item/weapon/sword/short/iron/P = new()
			equipped_human.put_in_hands(P, forced = TRUE)
		if (2)
			var/obj/item/weapon/axe/copper/P = new()
			equipped_human.put_in_hands(P, forced = TRUE)
		if (3)
			var/obj/item/weapon/mace/P = new()
			equipped_human.put_in_hands(P, forced = TRUE)
		if (4)
			var/obj/item/weapon/polearm/spear/P = new()
			equipped_human.put_in_hands(P, forced = TRUE)
		if (5)
			var/obj/item/weapon/sword/long/rider/copper/P = new()
			equipped_human.put_in_hands(P, forced = TRUE)
		if (6)
			var/obj/item/weapon/flail/militia/P = new()
			equipped_human.put_in_hands(P, forced = TRUE)
