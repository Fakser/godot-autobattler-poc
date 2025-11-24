extends Action
class_name ActionAttackMeele


func get_action_value(unit: Unit, tile: Tile) -> int:
	if not tile.unit:
		return -20
	var _fractions = unit._fractions
	var relation = _fractions.get_fraction_relation(unit.fraction, tile.unit.fraction)
	print(unit.fraction, ", ", tile.unit.fraction, ", ",  relation)
	if relation == _fractions.RELATIONS.ALLIANCE:
		return -10
	elif relation == _fractions.RELATIONS.NEUTRAL:
		return -5
	elif relation == _fractions.RELATIONS.HOSTILE:
		return 10 + randi_range(0, 3)
	else:
		return 0

func is_in_meele_distance(unit: Unit) -> bool:
	#print(unit.position.x, ", ", unit.position.y, ", ", unit.level.units[target].position.x, ", ", unit.level.units[target].position.y)
	return false

func state_transition(unit: Unit) -> String:
	if not is_in_meele_distance(unit):
		return "statefollow"
	else:
		return "stateidle"

func is_combat_action() -> bool:
	return true
