extends Equipment
class_name Weapon

@export var projectile: Projectile
@export var unit: Unit
@export var damage: int
@export var range: int
@export var projectile_speed: int
@export var type: int
@export var attacks_per_turn: int

func attack(target: Unit) -> void:

	var target_unit_id = target.unit_id
	var target_current_position = target.position
	var target_direction = unit.position.direction_to(target_current_position)
	for i in attacks_per_turn:
		var attack = projectile.duplicate()
		attack.set_direction(target)
		attack.visible = true
		self.unit.level.add_child(attack)
