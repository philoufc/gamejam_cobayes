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
		

func get_middle_cell_coords(tilemap:TileMap) -> Vector2i:
	var middle_coords :Vector2i = tilemap.get_used_rect().size / 2 + tilemap.get_used_rect().position
	
	return middle_coords
