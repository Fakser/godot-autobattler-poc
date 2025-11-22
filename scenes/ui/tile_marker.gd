extends Node2D
class_name TileMarker

@export var size = Vector2.ONE * 16.0
@export var unit: Unit
var color = Color.DARK_GREEN

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _draw() -> void:
	if (
		unit.ai.current_action and unit.ai.current_action.target and 
		unit.ai.current_action.target.position - unit.position != unit.position
	):   
		self.position = unit.ai.current_action.target.position - unit.position - Vector2(1, 1)
		draw_rect(Rect2(-size / 2.0, size), color, false, 1.1)

func _process(delta: float) -> void:
	queue_redraw()
