extends Node2D
class_name Unit

@export var animation: AnimatedSprite2D
@export var state_machine: StateMachine
@export var ai: AI
@export var level: Level
@export var speed = 1
var turn: int = 0
var id_path: Array
var fraction: int
var _fractions: Fractions
