extends Component
class_name Health

@export var value: int
@export var max: int

func is_alive() -> bool:
	return self.value > 0
