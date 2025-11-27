extends State
class_name StateIdle


func enter():
	unit.turn += 1

func update(delta: float):
	unit.animation.play("idle")
	
func physics_update(delta: float):
	if not unit.health.is_alive():
		state_exited.emit(self, "statedead")
	if unit.turn < unit.level.turn and unit.turn_start_delay.is_stopped():
		#print(self.unit.turn_start_delay.timeout)
		if unit.in_combat and not unit.ai.current_action.is_combat_action():
			unit.ai.current_action.done = true
		if unit.ai.current_action.done:
			unit.ai.set_new_action()
		var new_state = unit.ai.current_action.state_transition(self.unit)
		state_exited.emit(self, new_state)
