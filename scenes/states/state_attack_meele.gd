extends State
class_name StateAttackMeele


func update(delta: float):
	unit.animation.play("walk")

func enter():
	# get next tile id
	var target_unit_id = unit.ai.current_action.target.unit.unit_id
	var target = unit.level.units[target_unit_id]
	unit.weapon.attack(target)


	
func physics_update(delta: float):
	state_exited.emit(self, "stateidle")
