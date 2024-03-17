extends Area2D

@export var text_box_scene: PackedScene
@onready var tile_map = $"../../World/TileMap"
@onready var player = $"../../Player"
@onready var astar_grid: AStarGrid2D
@onready var path_line: Line2D
@onready var target_position: Vector2
var rng = RandomNumberGenerator.new()
var mob_type

var has_talked = false

var dialogs = [
"Plus tard, peut-être demain.",
"Veux tu une clope?",
"Pourquoi partager quand tu peux tout garder pour toi?",
"La vengeance est un plat qui se mange froid.",
"L'argent est le pouvoir!",
"Laisse les autres faire le travail à ta place.",
"Une petite vite, ça te dis?",
"La pelouse est toujours plus verte ailleurs.",
"Tu es tellement génial que même les miroirs te flattent.",
"On se fais un p'tit resto?",
"TOUJOURS PLUS!",
"Ça peux attendre demain...",
"T'as tu déjà manger du rhinocéros?",
"Remet rien en cause tu as toujours raison!",
"Come on, juste une puff.",
"Jt'a boute!!",
"T'es pas toi quand t'as faim.",
"Je vais péter un câble!",
]

func _ready():
	$UpdatePositionTimer.wait_time = randf_range(0.84, 1.42)
	mob_type = rng.randi_range(GameManager.ArgumentType.LUST, GameManager.ArgumentType.PRIDE)
	$Slime.self_modulate = GameManager.colors[mob_type]
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
	if not has_talked and rng.randi_range(0, 15) == 7:
		# Instantiate the scene
		var text_box = text_box_scene.instantiate()
		add_child(text_box)
		text_box.display_text(dialogs[rng.randi_range( 0, dialogs.size() - 1)])
		has_talked = true
	
	if player == null:
		return

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


func _on_area_entered(area):
	if area.name == "Player":
		GameManager.adjust_innocence(-1)
		area.kill_nearby_enemies()


func die():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -20), 0.5)
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	tween.tween_callback(self.queue_free)
