extends State

func enter() -> void:
	self.unit.alive = false
	self.unit.ai.current_action = self.unit.ai.default_action

func update(delta: float) -> void:
	self.unit.animation.play("dead")

func physics_update(delta: float) -> void:
	if unit.turn < unit.level.turn:
		unit.turn += 1
