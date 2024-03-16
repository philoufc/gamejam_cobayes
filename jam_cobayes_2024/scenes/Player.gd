extends Node2D

@onready var tile_map = $"../World/TileMap"

var astar_grid: AStarGrid2D
var current_id_path: Array[Vector2i]
var target_position: Vector2
var is_moving: bool

func _ready():
	await get_tree().process_frame
	astar_grid = AStarGrid2D.new()
	astar_grid.region = tile_map.get_used_rect()
	# astar_grid.cell_size = Vector2(64, 32) # 64 by 32 pixels
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ONLY_IF_NO_OBSTACLES
	astar_grid.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	astar_grid.default_estimate_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN 
	#astar_grid.jumping_enabled = true
	astar_grid.update()
	
	for x in tile_map.get_used_rect().size.x:
		for y in tile_map.get_used_rect().size.y:
			var tile_position = Vector2i(
				x + int(astar_grid.region.position.x),
				y + int(astar_grid.region.position.y)
			)
			
			var tile_data = tile_map.get_cell_tile_data(0, tile_position)
			
			if tile_data == null or tile_data.get_custom_data("walkable") == false:
				astar_grid.set_point_solid(tile_position)

func _input(event):
	if event.is_action_pressed("move") == false:
		return
	
	var id_path
	
	if is_moving:
		id_path = astar_grid.get_id_path(
			tile_map.local_to_map(target_position),
			tile_map.local_to_map(get_local_mouse_position())
		)
		print("is_moving: ", id_path)
	else:
		id_path = astar_grid.get_id_path(
			tile_map.local_to_map(global_position),
			tile_map.local_to_map(get_local_mouse_position())
		)
		print("else: ", id_path)
		
	if id_path.is_empty() == false:
		current_id_path = id_path
	

func _physics_process(_delta):
	if current_id_path.is_empty():
		return
	
	if is_moving == false:
		target_position = tile_map.map_to_local(current_id_path.front())
		is_moving = true
	
	global_position = global_position.move_toward(target_position, 1)
	
	if global_position == target_position:
		current_id_path.pop_front()
		
		if current_id_path.is_empty() == false:
			target_position = tile_map.map_to_local(current_id_path.front())
		else:
			is_moving = false

