extends Node2D

@onready var tile_map = $TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	print(tile_map.get_used_cells(0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
