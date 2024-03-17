extends RigidBody2D

@onready var tile_map = $"../../World/TileMap"
@onready var player = $"../../Player"
@onready var astar_grid: AStarGrid2D
@onready var path_line: Line2D
@onready var target_position: Vector2
var rng = RandomNumberGenerator.new()
var mob_type

func _ready():
	$UpdatePositionTimer.wait_time = randf_range(0.84, 1.42)
	mob_type = rng.randi_range(GameManager.ArgumentType.LUST, GameManager.ArgumentType.NO)
	modulate = GameManager.colors[mob_type]
	astar_grid = player.astar_grid
	$Slime/AnimationPlayer.play("Slime_Basic")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if target_position != global_position:
		global_position = global_position.move_toward(target_position, 1)
		$Slime.flip_h =  global_position.x > target_position.x
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_update_position():
	var start = tile_map.local_to_map(global_position)
	var destination = tile_map.local_to_map(player.position)
	var id_path = astar_grid.get_id_path(
		start,
		destination
	)

	if id_path.size() > 1:
		if target_position == tile_map.map_to_local(id_path.front()):
			id_path.pop_front()
		target_position = tile_map.map_to_local(id_path.front())
	
	#print("target_position", target_position)

#func drawLine(id_path: Array[Vector2i]):
#	pass
	#path_line.clear_points()
	#for p in id_path:
		#path_line.add_point(tile_map.map_to_local(p))
		#path_line.top_level = true

