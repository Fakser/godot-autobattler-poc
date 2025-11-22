extends Action
class_name ActionAttackMeele

func get_action_value(unit: Unit, tile: Tile) -> int:
	if not tile.unit:
		return -20
	var _fractions = unit._fractions
	var relation = _fractions.get_fraction_relation(unit.fraction, tile.unit.fraction)
	if relation == _fractions.RELATIONS.ALLIANCE:
		return -10
	elif relation == _fractions.RELATIONS.NEUTRAL:
		return -5
	elif relation == _fractions.RELATIONS.HOSTILE:
		return 10 + randi_range(-3, 3)
	else: 
		return 0

func set_target(tile: Tile):
	target = tile.unit

func is_in_meele_distance(unit) -> bool:
	print(unit.position.x, ", ", unit.position.y, ", ", target.position.x, ", ", target.position.y)
	return false
