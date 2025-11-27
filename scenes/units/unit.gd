extends Area2D
class_name Unit

@export var animation: AnimatedSprite2D
@export var state_machine: StateMachine
@export var ai: AI
@export var level: Level
@export var speed = 4
@export var health: Health
@export var weapon: Weapon
@export var turn_start_delay: Timer

var turn: int = 0
var in_combat: bool = false
var alive: bool = true
var unit_id: int
var id_path: Array
var fraction: int
var _fractions: Fractions

func set_unit_id(id: int) -> void:
	if self.unit_id:
		return
	else:
		self.unit_id = id


func _on_area_entered(area: Area2D) -> void:
	if self is Player and area is Unit:
		var current_state = area.state_machine.current_state
		var initial_state_name = area.state_machine.initial_state.name.to_lower()
		current_state.state_exited.emit(current_state, initial_state_name)
		print("dupa")
