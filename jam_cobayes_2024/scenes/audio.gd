extends Node

@onready var music_stream_player = $MusicStreamPlayer

const COBAYES_01 = preload("res://assets/audio/gamejam_cobayes_2024_01.ogg")
const COBAYES_02 = preload("res://assets/audio/gamejam_cobayes_2024_02.ogg")

func _ready():
	music_stream_player.stream = COBAYES_01
	music_stream_player.play()
