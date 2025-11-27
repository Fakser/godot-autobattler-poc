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


func set_direction(target: Unit) -> void:
	var target_unit_id = target.unit_id
	var target_current_position = target.global_position
	self.direction = self.weapon.unit.global_position.direction_to(target_current_position)
	self.global_position = self.weapon.unit.global_position
	self.rotation = self.direction.angle()
  
func _physics_process(delta: float) -> void:
	self.range -= speed
	self.position += self.direction * self.speed

func _on_projectile_area_entered(area):
	if area is Unit and self.weapon.unit.unit_id != area.unit_id:
		area.health.reduce(self.damage)
		self.queue_free()
