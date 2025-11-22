extends Node
class_name Tile

var position: Vector2
var unit: Unit

func _init(position: Vector2i) -> void:
	self.position = position

func set_unit(unit: Unit) -> void:
	self.unit = unit
