extends Node2D

func _on_button_start_button_down():
	get_tree().change_scene_to_file("res://scenes/world_raph.tscn")


func _on_button_credits_button_down():
	get_tree().change_scene_to_file("res://scenes/Credits.tscn")


func _on_button_quit_button_down():
	get_tree().quit()
