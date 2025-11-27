extends Node2D

@onready var level = $Level
@onready var turn_timer = $TurnTimer
var pause: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if turn_timer.is_stopped() and not pause:
		level.safe_turn_update()
		turn_timer.start()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause = not pause
