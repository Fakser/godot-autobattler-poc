extends State
class_name StateIdle


func enter():
	unit.turn += 1

func update(delta: float):
	unit.animation.play("idle")
	
func physics_update(delta: float):
	if unit.turn < unit.level.turn:
		if not unit.ai.current_action or unit.ai.current_action.done:
			unit.ai.set_new_action()
		if unit.ai.current_action is ActionAttackMeele:
			if not unit.ai.current_action.is_in_meele_distance(unit):
				state_exited.emit(self, "statefollow")
			else:
				state_exited.emit(self, "stateidle")
		if unit.ai.current_action is ActionWalk:
			state_exited.emit(self, "statewalk")
		elif unit.ai.current_action is ActionIdle:
			unit.ai.current_action.done = true
			state_exited.emit(self, "stateidle")
