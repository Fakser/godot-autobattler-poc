extends State
class_name StateAttackMeele

var target: Unit

func update(delta: float):
	unit.animation.play("walk")

func enter():
	var target_unit_id = unit.ai.current_action.target.unit.unit_id
	target = unit.level.units[target_unit_id]

func physics_update(delta: float):
	unit.weapon.attack(target)
	self.unit.ai.current_action.done = true
	self.unit.in_combat = false
	state_exited.emit(self, "stateidle")
