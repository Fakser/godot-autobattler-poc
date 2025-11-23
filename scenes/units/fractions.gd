extends Node
class_name Fractions

enum FRACTIONS {
	PLAYER,
	TREES,
	FROGS,
	WIZARDS,
	WARRIORS,
}

enum RELATIONS {
	HOSTILE,
	NEUTRAL,
	ALLIANCE,
}

var _fractions_relations_list = [
	[FRACTIONS.PLAYER, FRACTIONS.TREES, RELATIONS.NEUTRAL],
	[FRACTIONS.PLAYER, FRACTIONS.FROGS, RELATIONS.ALLIANCE],
	[FRACTIONS.PLAYER, FRACTIONS.WIZARDS, RELATIONS.HOSTILE],
	[FRACTIONS.PLAYER, FRACTIONS.WARRIORS, RELATIONS.HOSTILE],
	[FRACTIONS.TREES, FRACTIONS.FROGS, RELATIONS.NEUTRAL],
	[FRACTIONS.TREES, FRACTIONS.WIZARDS, RELATIONS.NEUTRAL],
	[FRACTIONS.TREES, FRACTIONS.WARRIORS, RELATIONS.NEUTRAL],
	[FRACTIONS.FROGS, FRACTIONS.WARRIORS, RELATIONS.NEUTRAL],
	[FRACTIONS.FROGS, FRACTIONS.WIZARDS, RELATIONS.NEUTRAL],
	[FRACTIONS.WARRIORS, FRACTIONS.WIZARDS, RELATIONS.ALLIANCE],
]

var FRACTIONS_RELATIONS_MAP = {}

func _fraction_relation_key(fraction_a: int, fraction_b: int) -> String:
	var fractions = [fraction_a, fraction_b]
	fractions.sort()
	var fraction_relation_key = "%s_%s"
	fraction_relation_key = fraction_relation_key % fractions
	return fraction_relation_key

func get_fraction_relation(fraction_a: int, fraction_b: int) -> int:
	var fraction_relation_key = _fraction_relation_key(fraction_a, fraction_b)
	return FRACTIONS_RELATIONS_MAP[fraction_relation_key]

func _init() -> void:
	for fraction_relation in _fractions_relations_list:
		var fraction_relation_key = _fraction_relation_key(fraction_relation[0], fraction_relation[1])
		FRACTIONS_RELATIONS_MAP[fraction_relation_key] = fraction_relation[2]
		#fraction_relation_key = _fraction_relation_key(fraction_relation[1], fraction_relation[0])
		#FRACTIONS_RELATIONS_MAP[fraction_relation_key] = fraction_relation[2]
	for fraction in FRACTIONS.values():
		var fraction_relation_key = _fraction_relation_key(fraction, fraction)
		FRACTIONS_RELATIONS_MAP[fraction_relation_key] = RELATIONS.ALLIANCE
