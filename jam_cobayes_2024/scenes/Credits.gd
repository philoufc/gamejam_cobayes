extends Control

var section = 0

var credits = [
	'[center][rainbow]Line Ocence et les 7 péchés[/rainbow]\nGame Jam[/center]',
	'[center][color=red]Jeu développé par[/color]\nLudovic Descary\nMathieu Grondin\nMolie Robert\nPhilou Fortier-Charette\nRaphaël Boisvert[/center]',
	'[center][color=red]Outils[/color]\nDéveloppé avec :\nGodot Engine 4.2.1, \nProcreate, \nGithub, \nPhotoshop, \nLMMS \nLibreSprite[/center]',
	'[center]Meow! :3[/center]'
]

func _ready():
	$RichTextLabel.bbcode_text = credits[section]
	$RichTextLabel/AnimationPlayer.play("haut-milieu")
	await $RichTextLabel/AnimationPlayer.animation_finished

func terminer():
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")


func montrer_section():
	$RichTextLabel/AnimationPlayer.play("milieu-bas")
	await $RichTextLabel/AnimationPlayer.animation_finished
	$RichTextLabel.bbcode_text = credits[section]
	$RichTextLabel/AnimationPlayer.play("haut-milieu")
	await $RichTextLabel/AnimationPlayer.animation_finished

func _on_Minuteur_timeout():
	section += 1
	if section < len(credits):
		montrer_section()
	else:
		terminer()

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		terminer()
