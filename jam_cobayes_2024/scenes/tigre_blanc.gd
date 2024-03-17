extends Sprite2D

var is_moving: bool
@onready var tile_map = $"../../World/TileMap"
@onready var player = $"../../Player"
@onready var astar_grid: AStarGrid2D
@onready var target_position: Vector2
@onready var tile_map_rect: Rect2
const SPEED = 60

func _ready():
	astar_grid = player.astar_grid
	$AnimatedSprite2D.play("tiger_side")
	tile_map_rect = tile_map.get_used_rect()
	update_target_position()
	print(target_position)

func _physics_process(delta):
	if global_position != target_position:
		global_position = global_position.move_toward(target_position, delta * SPEED)
		$AnimatedSprite2D.flip_h =  global_position.x > target_position.x
	
func _on_timer_timeout():
	update_target_position()

func update_target_position():
	var x = int(tile_map_rect.position.x) + (randi() % int(tile_map_rect.size.x))
	var y = int(tile_map_rect.position.y) + (randi() % int(tile_map_rect.size.y))
	target_position = tile_map.map_to_local(Vector2(x,y))
	
