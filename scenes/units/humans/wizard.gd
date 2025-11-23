extends Unit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.fraction = self.level._fractions.FRACTIONS.WIZARDS
	self._fractions = self.level._fractions

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
