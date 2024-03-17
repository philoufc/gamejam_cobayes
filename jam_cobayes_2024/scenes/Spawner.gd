extends Node

@export var entity: PackedScene
@export var world: PackedScene
@export var limit = 10;
var tile_map_rect: Rect2
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	tile_map_rect = $"../World/TileMap".get_used_rect()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_timer_timeout():
	if count > limit || $"../Player" == null:
		return
		
	count += 1
	var x = int(tile_map_rect.position.x) + (randi() % int(tile_map_rect.size.x))
	var y = int(tile_map_rect.position.y) + (randi() % int(tile_map_rect.size.y))
	var abs_pos = $"../World/TileMap".map_to_local(Vector2i(x, y))
	
	var new_entity = entity.instantiate()
	new_entity.position = Vector2i(abs_pos.x, abs_pos.y)
	add_child(new_entity)
