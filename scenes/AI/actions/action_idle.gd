extends Action
class_name ActionIdle

func state_transition(unit: Unit) -> String:
	self.done = true
	return "stateidle"
