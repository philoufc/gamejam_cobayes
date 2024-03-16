extends Node2D

@onready var tile_map = $TileMap
@export_enum("S", "M", "L") var map_size = "S"


func _ready():
	init_map()

func init_map():
	var x_range_low
	var x_range_high
	var y_range_low
	var y_range_high
	match map_size:
		"S":
			x_range_low = -1
			x_range_high = 18
			y_range_low = -1
			y_range_high = 41
		"M":
			x_range_low = -19
			x_range_high = 36
			y_range_low = -42
			y_range_high = 82
		"L":
			x_range_low = -27
			x_range_high = 54
			y_range_low = -83
			y_range_high = 123
		
			
	for x in range(x_range_low, x_range_high):
				for y in range(y_range_low, y_range_high):
					tile_map.set_cell(0, Vector2i(x, y), 0, Vector2i(0, 0), 0)
					#add_labels(x, y)
		

func get_middle_cell_coords(tilemap:TileMap) -> Vector2i:
	var middle_coords :Vector2i = tilemap.get_used_rect().size / 2 + tilemap.get_used_rect().position
	
	return middle_coords
	
func add_labels(x: int, y: int):
	var label_settings = LabelSettings.new()
	label_settings.font_size = 8
	var abs_pos = tile_map.map_to_local(Vector2i(x, y))
	
	var tile_label = Label.new()
	tile_label.text = "(%s, %s)" % [x, y]
	tile_label.position = Vector2i(abs_pos.x, abs_pos.y-4)
	tile_label.top_level = true
	tile_label.label_settings = label_settings
	tile_map.add_child(tile_label)
	
	var tile_label_abs = Label.new()
	tile_label_abs.text = "(%s, %s)" % [abs_pos.x, abs_pos.y]
	tile_label_abs.position = Vector2i(abs_pos.x, abs_pos.y+4)
	tile_label_abs.top_level = true
	tile_label_abs.label_settings = label_settings
	tile_map.add_child(tile_label_abs)

