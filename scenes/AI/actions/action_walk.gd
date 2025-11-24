extends Action
class_name ActionWalk

func get_action_value(unit: Unit, tile: Tile) -> int:
	if not tile.unit:
		return randi_range(0, 10)
	else:
		return -10

func state_transition(unit: Unit) -> String:
	return "statewalk"
