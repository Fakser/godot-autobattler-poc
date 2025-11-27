extends Component
class_name Health

var value: int
@export var max: int

func _ready() -> void:
	self.value = self.max

func is_alive() -> bool:
	return self.value > 0

func reduce(value) -> void:
	self.value -= value
