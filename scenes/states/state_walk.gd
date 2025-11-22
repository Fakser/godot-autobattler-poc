extends State
class_name StateWalk

var target_position

func enter():
	# get next tile id
	var unit_position_id = unit.level.tile_map.local_to_map(unit.global_position)
	var target_position_id = unit.level.tile_map.local_to_map(
		unit.ai.current_action.target.position)
	var id_path = unit.level.astar_grid.get_id_path(
		unit_position_id,
		target_position_id,
	).slice(1)

	if not id_path.is_empty():
		unit.id_path = [id_path[0]]
		target_position = unit.level.tile_map.map_to_local(unit.id_path[0])
		if unit.level.tile_map.local_to_map(unit.ai.current_action.target.position) == unit.id_path[0]:
			unit.ai.current_action.done = true
	
func physics_update(delta: float):
	if unit.id_path.is_empty():
		state_exited.emit(self, "stateidle")
	else:
		unit.global_position = unit.global_position.move_toward(target_position, unit.speed)
		if unit.global_position == target_position:
			unit.id_path.pop_front()
