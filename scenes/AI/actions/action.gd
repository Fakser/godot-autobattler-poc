extends Node
class_name Action

var target: Tile
var done: bool = false

func get_action_value(unit: Unit, tile: Tile) -> int:
	return randi_range(0, 10)

func set_target(tile: Tile) -> void:
	target = tile

func state_transition(unit: Unit) -> String:
	return unit.state_machine.current_state.name

func is_combat_action() -> bool:
	return false
