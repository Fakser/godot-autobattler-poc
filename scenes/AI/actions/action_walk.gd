extends Action
class_name ActionWalk

func get_action_value(unit, tile) -> int:
	if not tile.unit:
		return randi_range(0, 10)
	else:
		return -10
