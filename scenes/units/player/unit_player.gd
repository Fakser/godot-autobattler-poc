extends Unit
#class_name UnitPlayer
@onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.fraction = self.level._fractions.FRACTIONS.PLAYER
	self._fractions = self.level._fractions

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released('wheel_down') and camera.zoom.x > 1 and camera.zoom.y > 1:
		camera.zoom.x -= 0.25
		camera.zoom.y -= 0.25
	if Input.is_action_just_released('wheel_up'):
		camera.zoom.x += 0.25
		camera.zoom.y += 0.25
