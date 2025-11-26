extends Node2D
class_name Projectile

@export var weapon: Weapon

@export var range: int
@export var speed: float
@export var type: int
@export var damage: int
@export var attacking_unit_id: int
@export var target_unit_id: int

var direction: Vector2

func _ready() -> void:
	if not self.weapon:
		self.weapon=owner
	self.range=self.weapon.range
	self.speed=self.weapon.projectile_speed
	self.type=self.weapon.type
	self.damage=self.weapon.damage
	self.attacking_unit_id=self.weapon.unit.unit_id

func get_projectile_position_adj(direction: Vector2):
	if direction == Vector2(0.0, 1.0):
		return Vector2(8.0, -8.0)
	elif direction == Vector2(1.0, 0.0):
		return Vector2(-8.0, -8.0)
	elif direction == Vector2(-1.0, 0.0):
		return Vector2(8.0, 8.0)
	elif direction == Vector2(0.0, -1.0):
		return Vector2(-8.0, 8.0)

func set_direction(target: Unit) -> void:
	var target_unit_id = target.unit_id
	var target_current_position = target.global_position
	self.direction = self.weapon.unit.global_position.direction_to(target_current_position)
	var position_vector_adj = get_projectile_position_adj(direction)
	self.global_position = self.weapon.unit.global_position + position_vector_adj
	self.rotation = self.direction.angle()

func _physics_process(delta: float) -> void:
	self.range -= speed
	self.position += self.direction * self.speed
