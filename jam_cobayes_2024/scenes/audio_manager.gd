extends Node

@onready var music_stream_player = $MusicStreamPlayer

const COBAYES_01 = preload("res://assets/audio/gamejam_cobayes_2024_01.ogg")
const COBAYES_02 = preload("res://assets/audio/gamejam_cobayes_2024_02.ogg")

func _ready():
	play_music(COBAYES_01)


func play_music(stream: AudioStream) -> void:
	music_stream_player.stream = stream
	music_stream_player.play()
