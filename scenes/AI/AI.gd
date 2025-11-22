extends Node
class_name AI

var actions: Dictionary
var current_action: Action
@export var unit: Unit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actions = {}
	for child in get_children():
		if child is Action:
			#child.state_exited.connect(_on_child_state_exit)
			actions[child.name.to_lower()] = child
		#current_action = actions["actionidle"]

func _sort_actions(a, b) -> bool:
	if a[2] < b[2]:
		return true
	return false

func get_possible_actions() -> Array:
	var tile_grid = unit.level.tile_grid
	var possible_actions = []
	for action in actions.values():
		if action is ActionIdle:
			possible_actions.append([action, tile_grid[0][0],  2])
		else:
			for i in tile_grid.size():
				for j in tile_grid[i].size():
					var tile = tile_grid[i][j]
					var action_value = action.get_action_value(self.unit, tile)
					possible_actions.append([action, tile, action_value])

	return possible_actions

func set_new_action() -> void:
	var possible_actions = get_possible_actions()
	possible_actions.sort_custom(_sort_actions)
	
	current_action = possible_actions[0][0]
	current_action.target = possible_actions[0][1]
	current_action.done = false
