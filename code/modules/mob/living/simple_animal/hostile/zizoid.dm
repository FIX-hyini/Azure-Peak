/mob/living/simple_animal/hostile/retaliate/blood
	name = "FLESH HOMUNCULUS"
	desc = null
	hud_type = /datum/hud/human
	icon = 'icons/mob/mob.dmi'
	icon_state = "FLESH"
	icon_living = "FLESH"

	mob_biotypes = MOB_EPIC
	footstep_type = FOOTSTEP_MOB_HEAVY
	vision_range = 6
	aggro_vision_range = 6
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	retreat_distance = 0
	minimum_distance = 0

	health = 900
	maxHealth = 900
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak,
					/obj/item/bodypart,
					/obj/item/organ)

	base_intents = list(/datum/intent/unarmed/claw)
	attack_sound = list('sound/combat/wooshes/blunt/wooshhuge (1).ogg','sound/combat/wooshes/blunt/wooshhuge (2).ogg','sound/combat/wooshes/blunt/wooshhuge (3).ogg')
	melee_damage_lower = 40
	melee_damage_upper = 60
	STASTR = 14
	STAPER = 8
	STAINT = 1
	STACON = 15
	STAWIL = 16
	STASPD = 2
	STALUC = 15
	defprob = 20
	del_on_deaggro = 99 SECONDS
	retreat_health = 0
	food = 0

	dodgetime = 20
	aggressive = TRUE
//	stat_attack = UNCONSCIOUS
	remains_type = /obj/effect/decal/remains/troll // Placeholder until Troll remains are sprited.

	ai_controller = /datum/ai_controller/zizoid



/mob/living/simple_animal/hostile/retaliate/blood/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_aggro_system)
	ADD_TRAIT(src, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/blood/ascended
	name = "???"
	desc = ""
	hud_type = /datum/hud/human
	icon_state = "ascend"
	icon_living = "ascend"
	icon = 'icons/mob/32x64.dmi'
	move_to_delay = 0
	base_intents = list(/datum/intent/unarmed/ascendedclaw)
	melee_damage_lower = 250
	melee_damage_upper = 550
	health = 666666
	maxHealth = 666666
	STASTR = 66
	STAPER = 66
	STAINT = 66
	STACON = 66
	STAWIL = 66
	STASPD = 20
	STALUC = 66

/mob/living/simple_animal/hostile/retaliate/blood/ascended/examine(mob/user)
	. = ..()
	. += "<span class='narsiesmall'>It is impossible to comprehend such a thing.</span>"

/mob/living/simple_animal/hostile/retaliate/blood/ascended/Initialize()
	. = ..()
	set_light(5,5,5, l_color =  LIGHT_COLOR_RED)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/blood/ascended/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("pain")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("death")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("idle")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')
		if("cidle")
			return pick('sound/misc/HL (1).ogg','sound/misc/HL (2).ogg','sound/misc/HL (3).ogg','sound/misc/HL (4).ogg','sound/misc/HL (5).ogg','sound/misc/HL (6).ogg')

/mob/living/simple_animal/hostile/retaliate/blood/death(gibbed)
	. = ..()
	gib()
	qdel(src)

/mob/living/simple_animal/hostile/retaliate/blood/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/troll/aggro1.ogg','sound/vo/mobs/troll/aggro2.ogg')
		if("pain")
			return pick('sound/vo/mobs/troll/pain1.ogg','sound/vo/mobs/troll/pain2.ogg')
		if("death")
			return pick('sound/vo/mobs/troll/death.ogg')
		if("idle")
			return pick('sound/vo/mobs/troll/idle1.ogg','sound/vo/mobs/troll/idle2.ogg')
		if("cidle")
			return pick('sound/vo/mobs/troll/cidle1.ogg','sound/vo/mobs/troll/aggro2.ogg')

/mob/living/simple_animal/hostile/retaliate/blood/taunted(mob/user)
	emote("aggro")
	return


/mob/living/simple_animal/hostile/retaliate/blood/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "nose"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "foreleg"
		if(BODY_ZONE_L_ARM)
			return "foreleg"
	return ..()

/// Very temporary sprite
/mob/living/simple_animal/hostile/retaliate/blood/weird
	icon = 'icons/roguetown/underworld/carriageman.dmi'
	icon_state = "weird"

/datum/ai_controller/zizoid
	movement_delay = 0.4 SECONDS

	ai_movement = /datum/ai_movement/hybrid_pathing

	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic/zizoid(),
		BB_PET_TARGETING_DATUM = new /datum/targetting_datum/basic/not_friends(),
		BB_FLESH_HUNGER = 0,
		BB_FLESH_FRENZY_COOLDOWN = 0,
		BB_FLESH_CONSUMED_BODIES = 0,
		BB_FLESH_LAST_HEALTH = 900,
		BB_FLESH_IS_REGENERATING = FALSE,
		BB_FLESH_AMBUSH_TARGET = null,
		BB_FLESH_FRENZY_ACTIVE = FALSE
	)

	planning_subtrees = list(
		/datum/ai_planning_subtree/flesh_frenzy_subtree,
		/datum/ai_planning_subtree/flesh_regeneration_subtree,
		/datum/ai_planning_subtree/flesh_hunger_subtree,
		/datum/ai_planning_subtree/flesh_ambush_subtree,
		/datum/ai_planning_subtree/aggro_find_target,
		/datum/ai_planning_subtree/flesh_advanced_melee_attack,
		/datum/ai_planning_subtree/find_dead_bodies,
		/datum/ai_planning_subtree/eat_dead_body,
	)

	idle_behavior = /datum/idle_behavior/flesh_idle

/datum/idle_behavior/flesh_idle/proc/find_lurk_spot(datum/ai_controller/controller)
	var/mob/living/simple_animal/hostile/retaliate/blood/flesh = controller.pawn
	var/list/possible_lurk_spots = list()

	for(var/turf/open/T in orange(7, flesh))
		if(T.opacity || (T.get_lumcount() < 0.5))
			if(!flesh.CanReach(T))
				continue
			possible_lurk_spots += T

	if(length(possible_lurk_spots))
		return pick(possible_lurk_spots)
	return null

/datum/idle_behavior/flesh_idle/perform_idle_behavior(delta_time, datum/ai_controller/controller)
	var/mob/living/simple_animal/hostile/retaliate/blood/flesh = controller.pawn

	if(prob(15) && !controller.blackboard[BB_FLESH_IS_REGENERATING])
		var/turf/lurk_spot = find_lurk_spot(controller)
		if(lurk_spot)
			controller.set_movement_target(lurk_spot)
			return

	if(prob(5))
		playsound(flesh, pick('sound/effects/wounds/crack2.ogg', 'sound/effects/wounds/pierce1.ogg', 'sound/effects/wounds/splatter.ogg'), 100, TRUE)
		flesh.visible_message("<span class='warning'>[flesh] makes a disturbing wet sound.</span>")

	var/move_prob = 50
	if(controller.blackboard[BB_FLESH_HUNGER] > 75)
		move_prob = 80
	else if(controller.blackboard[BB_FLESH_IS_REGENERATING])
		move_prob = 20

	if(prob(move_prob))
		var/movement_target = locate(flesh.x + rand(-10, 10), flesh.y + rand(-10, 10), flesh.z)
		if(movement_target)
			controller.set_movement_target(movement_target)

/datum/intent/unarmed/ascendedclaw
	name = "claw"
	icon_state = "inclaw"
	attack_verb = list("claws", "mauls", "eviscerates")
	animname = "claw"
	blade_class = BCLASS_CHOP
	hitsound = "genslash"
	penfactor = 131
	damfactor = 40
	candodge = TRUE
	canparry = TRUE
	miss_text = "slashes the air!"
	miss_sound = "bluntwooshlarge"
	item_d_type = "slash"

/datum/component/ai_aggro_system
	/// Default threat threshold before a mob is considered hostile
	var/default_threat_threshold = 10
	/// Default range at which mobs detect and add threats
	var/default_aggro_range = 9
	/// Default range at which mobs maintain aggro before dropping target
	var/default_maintain_range = 12
	/// Default decay rate per second
	var/default_decay_rate = 2

/datum/component/ai_aggro_system/Initialize(threat_threshold, aggro_range, maintain_range, decay_rate)
	. = ..()
	if(!ismob(parent))
		return COMPONENT_INCOMPATIBLE

	var/mob/living/living_mob = parent
	living_mob.AddElement(/datum/element/relay_attackers)
	if(!living_mob.ai_controller)
		return COMPONENT_INCOMPATIBLE

	// Initialize the aggro table
	living_mob.ai_controller.blackboard[BB_MOB_AGGRO_TABLE] = list()

	// Set configurable parameters
	living_mob.ai_controller.set_blackboard_key(BB_THREAT_THRESHOLD, threat_threshold || default_threat_threshold)
	living_mob.ai_controller.set_blackboard_key(BB_AGGRO_RANGE, aggro_range || default_aggro_range)
	living_mob.ai_controller.set_blackboard_key(BB_AGGRO_MAINTAIN_RANGE, maintain_range || default_maintain_range)

	START_PROCESSING(SSaggro, src)
	// Register signals
	RegisterSignal(parent, COMSIG_ATOM_WAS_ATTACKED, PROC_REF(on_attacked))
	RegisterSignal(parent, COMSIG_MOB_DEATH, PROC_REF(on_death))

/datum/component/ai_aggro_system/Destroy(force, silent)
	STOP_PROCESSING(SSaggro, src)

	// Unregister signals
	UnregisterSignal(parent, list(
		COMSIG_ATOM_WAS_ATTACKED,
		COMSIG_MOB_DEATH
	))

	return ..()

/// Public method to add threat to specific mob
/datum/component/ai_aggro_system/proc/add_threat_to_mob(mob/target, amount)
	if(!target || !parent)
		return

	var/mob/living/living_mob = parent
	add_threat(living_mob, target, amount)

/// Public method to add threat to specific mob
/datum/component/ai_aggro_system/proc/add_threat_to_mob_capped(mob/target, amount, cap)
	if(!target || !parent)
		return
	var/mob/living/living_mob = parent
	var/list/aggro_table = living_mob.ai_controller.blackboard[BB_MOB_AGGRO_TABLE]
	if(!length(aggro_table))
		add_threat(living_mob, target, amount)
	var/aggro = aggro_table[living_mob]
	if(aggro >= cap)
		return
	amount -= aggro
	add_threat(living_mob, target, amount)

/// Adds threat to an attacker based on damage dealt
/datum/component/ai_aggro_system/proc/on_attacked(mob/victim, atom/attacker, damage)
	SIGNAL_HANDLER

	if(!victim.ai_controller)
		return

	if(!ismob(attacker))
		return

	// Base threat from being attacked
	var/threat_to_add = 5

	// Add additional threat based on damage if provided
	if(damage)
		threat_to_add += damage * 0.5

	add_threat(victim, attacker, threat_to_add)

/// Clears the aggro table when the mob dies
/datum/component/ai_aggro_system/proc/on_death(mob/living/source)
	SIGNAL_HANDLER

	if(!source.ai_controller)
		return

	// Clear aggro table on death
	source.ai_controller.blackboard[BB_MOB_AGGRO_TABLE] = list()
	source.ai_controller.clear_blackboard_key(BB_HIGHEST_THREAT_MOB)

/// Adds or modifies threat level for a specific mob
/datum/component/ai_aggro_system/proc/add_threat(mob/victim, mob/attacker, amount)
	if(!victim?.ai_controller || !attacker)
		return

	var/list/aggro_table = victim.ai_controller.blackboard[BB_MOB_AGGRO_TABLE]
	if(!aggro_table)
		aggro_table = list()

	// Add or update threat level
	if(aggro_table[attacker])
		aggro_table[attacker] += amount
	else
		aggro_table[attacker] = amount

	// Ensure threat level isn't negative
	if(aggro_table[attacker] < 0)
		aggro_table[attacker] = 0

	// Update the aggro table
	victim.ai_controller.blackboard[BB_MOB_AGGRO_TABLE] = aggro_table

	// Update highest threat mob
	update_highest_threat(victim)

/// Periodically decays threat levels
/datum/component/ai_aggro_system/process()
	var/decay_amount = default_decay_rate * 10
	var/mob/living/living_mob = parent
	if(!living_mob?.ai_controller)
		return

	var/list/aggro_table = living_mob.ai_controller.blackboard[BB_MOB_AGGRO_TABLE]
	if(!aggro_table || !length(aggro_table))
		return

	var/list/to_remove = list()

	// Decay all threat values
	for(var/mob/threat_mob as anything in aggro_table)
		aggro_table[threat_mob] -= decay_amount

		// If threat drops below 0, mark for removal
		if(aggro_table[threat_mob] <= 0)
			to_remove += threat_mob

	// Remove any mobs with 0 or negative threat
	for(var/mob/threat_mob as anything in to_remove)
		aggro_table -= threat_mob

	// Update the aggro table
	living_mob.ai_controller.blackboard[BB_MOB_AGGRO_TABLE] = aggro_table

	// Update highest threat mob
	update_highest_threat(living_mob)

/// Updates who the highest threat mob is
/datum/component/ai_aggro_system/proc/update_highest_threat(mob/living/source)
	if(!source?.ai_controller)
		return

	var/list/aggro_table = source.ai_controller.blackboard[BB_MOB_AGGRO_TABLE]
	if(!aggro_table || !length(aggro_table))
		source.ai_controller.clear_blackboard_key(BB_HIGHEST_THREAT_MOB)
		return

	var/highest_threat = 0
	var/mob/highest_threat_mob = null

	// Find the mob with the highest threat
	for(var/mob/threat_mob as anything in aggro_table)
		if(aggro_table[threat_mob] > highest_threat)
			highest_threat = aggro_table[threat_mob]
			highest_threat_mob = threat_mob

	// Update highest threat mob if it meets threshold
	var/threat_threshold = source.ai_controller.blackboard[BB_THREAT_THRESHOLD] || default_threat_threshold
	if(highest_threat >= threat_threshold)
		source.ai_controller.set_blackboard_key(BB_HIGHEST_THREAT_MOB, highest_threat_mob)
		SEND_SIGNAL(source, COMSIG_AI_GENERAL_CHANGE, "Threat Changed: [highest_threat_mob]")
	else
		source.ai_controller.clear_blackboard_key(BB_HIGHEST_THREAT_MOB)

/datum/targetting_datum/basic/zizoid/can_attack(mob/living/living_mob, atom/the_target)
	if(isliving(the_target))
		var/mob/living/target = the_target
		if(target.mind?.has_antag_datum(/datum/antagonist/zizocultist))
			return FALSE
	. = ..()

/datum/targetting_datum/basic/not_friends/can_attack(mob/living/living_mob, atom/target, vision_range)
	if(!target) // bail out on invalids
		return FALSE
	if(attack_closed_turf && isclosedturf(target))
		return TRUE

	if (ismob(target))
		var/mob/mob_target = target
		if (mob_target.stat > attack_until_past_stat)
			return FALSE

	if (living_mob.see_invisible < target.invisibility)
		return FALSE
	if (!isturf(target.loc)) // z check will always fail if target is in a mech
		return FALSE
	if (!living_mob.ai_controller) // How did you get here?
		return FALSE

	if((living_mob in SSmatthios_mobs.matthios_mobs) && (target in SSmatthios_mobs.matthios_mobs))
		return FALSE

	if (!(target in living_mob.ai_controller.blackboard[BB_FRIENDS_LIST]))
		// We don't have any friends, anything's fair game
		// OR This is not our friend, fire at will
		return TRUE
