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
		return 10 + randi_range(0, 3)
	else:
		return 0

func is_in_meele_distance(unit: Unit) -> bool:
	var target_unit_id = unit.ai.current_action.target.unit.unit_id
	var target_current_position = unit.level.units[target_unit_id].global_position
	var target_position_id = unit.level.tile_map.local_to_map(target_current_position)
	var unit_current_position = unit.global_position
	var unit_position_id = unit.level.tile_map.local_to_map(unit_current_position)
	if unit_position_id.distance_to(target_position_id) > 1:
		return false
	else:
		return true

func state_transition(unit: Unit) -> String:
	if not is_in_meele_distance(unit):
		return "statefollow"
	else:
		return "stateattackmeele"

func is_combat_action() -> bool:
	return true
