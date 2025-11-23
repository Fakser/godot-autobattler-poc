extends Node2D
class_name Level

@onready var tile_map = $TileMapLayer
var units: Dictionary
var astar_grid: AStarGrid2D
var tile_grid: Array
var turn: int
var update_turn: bool = false
var _fractions = Fractions.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.turn = 0
	_set_units()
	_update_units()
	_update_astar()
	_update_tile_grid()

func _set_units() -> void:
	var children = get_children()
	for i in children.size():
		var child = children[i]
		if child is Unit:
			child.position = tile_map.map_to_local(
				tile_map.local_to_map(child.position))
			child.set_unit_id(i)

func _update_units() -> void:
	self.units = {}
	var children = get_children()
	for i in children.size():
		var child = children[i]
		if child is Unit:
			units[i] = child

func _update_astar() -> void:
	self.astar_grid = AStarGrid2D.new()
	var used_rect = tile_map.get_used_rect()
	astar_grid.region = used_rect
	astar_grid.cell_size = Vector2(16, 16)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.update()
	for x in used_rect.size.x:
		for y in used_rect.size.y:
			var tile_position = Vector2i(
				x + used_rect.position.x,
				y + used_rect.position.y,
			)
			var tile_data = tile_map.get_cell_tile_data(tile_position)
			if tile_data == null or tile_data.get_custom_data("walkable") == false:
				astar_grid.set_point_solid(tile_position)
	for unit in units.values():
		var unit_position = tile_map.local_to_map(unit.position)
		astar_grid.set_point_solid(unit_position)
	astar_grid.update()

func _update_tile_grid() -> void:
	var new_tile_grid = []
	for i in range(16):
		var new_tile_grid_row = []
		for j in range(16):
			var tile_position_id = Vector2i(i, j)
			var tile_position = tile_map.map_to_local(tile_position_id)
			new_tile_grid_row.append(Tile.new(tile_position))
		new_tile_grid.append(new_tile_grid_row)
	for unit in units.values():
		var unit_position = tile_map.local_to_map(unit.position)
		new_tile_grid[unit_position.x][unit_position.y].unit = unit
	self.tile_grid = new_tile_grid

func safe_turn_update() -> bool:
	for unit in units.values():
		if unit.turn < self.turn:
			return false
	self.update_turn = true
	return true

func _process(delta: float) -> void:
	if update_turn:
		turn += 1
		update_turn = false
		_update_units()
		_update_astar()
		_update_tile_grid() 
		for unit in units.values():
			if unit.ai.current_action:
				print(unit.fraction, ", ", unit.state_machine.current_state.name, ", ", unit.ai.current_action, ", ", unit.ai.current_action.target)
