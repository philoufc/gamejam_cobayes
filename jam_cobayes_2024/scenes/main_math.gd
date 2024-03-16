extends Node

@export var mob_scene: PackedScene
var score
var tile_map_rect: Rect2
var count = 1
var limit = 10;

# Called when the node enters the scene tree for the first time.
func _ready():
	tile_map_rect = $World/TileMap.get_used_rect()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _spawn_mob():
	if count > limit:
		return
	count += 1
	var x = int(tile_map_rect.position.x) + (randi() % int(tile_map_rect.size.x))
	var y = int(tile_map_rect.position.y) + (randi() % int(tile_map_rect.size.y))
	var abs_pos = $World/TileMap.map_to_local(Vector2i(x, y))
	add_label("", x,y)
	
	var mob = mob_scene.instantiate()
	mob.position = Vector2i(abs_pos.x, abs_pos.y)
	add_child(mob)
	print()
	
func add_label(text: String, x: int, y: int):
	var label_settings = LabelSettings.new()
	label_settings.font_size = 8
	var abs_pos = $World/TileMap.map_to_local(Vector2i(x, y))
	
	var tile_label = Label.new()
	tile_label.text = "(%s, %s)" % [abs_pos.x, abs_pos.y]
	tile_label.position = Vector2i(abs_pos.x, abs_pos.y-4)
	tile_label.top_level = true
	tile_label.label_settings = label_settings
	$World/TileMap.add_child(tile_label)
