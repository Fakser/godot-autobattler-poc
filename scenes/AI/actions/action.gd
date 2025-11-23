extends Node
class_name Action

var target
var done: bool = false

func get_action_value(unit, tile) -> int:
	return randi_range(0, 10)

func set_target(tile: Tile) -> void:
	target = tile
