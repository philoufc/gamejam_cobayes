extends Area2D

var argument_type
var rng = RandomNumberGenerator.new()

func _ready():
	argument_type = rng.randi_range(GameManager.ArgumentType.LUST, GameManager.ArgumentType.NO)
	modulate = GameManager.colors[argument_type]


func _on_area_entered(area):
	if area.name == "Player":
		var tween = create_tween()
		
		tween.tween_property(self, "position", position + Vector2(0, -20), 0.5)
		
		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		
		GameManager.collect_argument(argument_type)
		
		tween.tween_callback(self.queue_free)
