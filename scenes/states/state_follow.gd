extends State
class_name StateFollow

#var target_current_position: Vector2
var target_path_next_tile: Vector2
#var tiles_around_target: Array = [
	#Vector2i(0, 1), Vector2i(1, 0), Vector2i(1, 1),
	#Vector2i(0, -1), Vector2i(-1, 0), Vector2i(-1, -1),
	#Vector2i(1, -1), Vector2i(-1, 1),]

func get_id_path(unit_position_id: Vector2i, target_position_id: Vector2i) -> Array:
	#for tile in tiles_around_target:
	var id_path = unit.level.astar_grid.get_id_path(
		unit_position_id,
		target_position_id, # + tile,
		true
	).slice(1)
	if not id_path.is_empty():
		return id_path
	return []

func enter():
	# get next tile id
	var target_current_position = unit.level.units[unit.ai.current_action.target.unit.unit_id].position
	var unit_position_id = unit.level.tile_map.local_to_map(unit.global_position)
	var target_position_id = unit.level.tile_map.local_to_map(
		target_current_position)
	var id_path = get_id_path(unit_position_id, target_position_id)

	if not id_path.is_empty():
		unit.id_path = [id_path[0]]
		target_path_next_tile = unit.level.tile_map.map_to_local(unit.id_path[0])
		if unit.level.tile_map.local_to_map(target_current_position) == unit.id_path[0]:
			unit.ai.current_action.done = true
	
func physics_update(delta: float):
	if unit.id_path.is_empty():
		state_exited.emit(self, "stateidle")
	else:
		unit.global_position = unit.global_position.move_toward(target_path_next_tile, unit.speed)
		if unit.global_position == target_path_next_tile:
			unit.id_path.pop_front()
