extends Node

@export var mob_scene: PackedScene
var score
var tile_map_rect: Rect2

# Called when the node enters the scene tree for the first time.
func _ready():
	tile_map_rect = $World/TileMap.get_used_rect()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mob_timer_timeout():
	pass
	#var mob = mob_scene.instantiate()
	#var direction = mob_spawn_location.rotation + PI / 2
	#mob.position = mob_spawn_location.position
	#direction += randf_range(-PI / 4, PI / 4)
	#mob.rotation = direction
	#var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	#mob.linear_velocity = velocity.rotated(direction)
	#add_child(mob)


func _spawn_mob():
	var x = int(tile_map_rect.position.x) + randi() % int(tile_map_rect.size.x)
	var y = int(tile_map_rect.position.y) + randi() % int(tile_map_rect.size.y)
	
	add_label("", x,y)
	
	var mob = mob_scene.instantiate()
	mob.position = Vector2i(x,y)
	add_child(mob)
	print()
	
func add_label(text: String, x: int, y: int):
	var label_settings = LabelSettings.new()
	label_settings.font_size = 8
	var abs_pos = tile_map.map_to_local(Vector2i(x, y))
	
	var tile_label = Label.new()
	tile_label.text = "(%s, %s)" % [x, y]
	tile_label.position = Vector2i(abs_pos.x, abs_pos.y-4)
	tile_label.top_level = true
	tile_label.label_settings = label_settings
	tile_map.add_child(tile_label)
