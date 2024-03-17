extends Node

@onready var music_stream_player = $MusicStreamPlayer
@onready var sfx_stream_player = $SFXStreamPlayer
@onready var walk_sfx_stream_player = $WalkSFXStreamPlayer

const COBAYES_01 = preload("res://assets/audio/gamejam_cobayes_2024_01.ogg")
const COBAYES_02 = preload("res://assets/audio/gamejam_cobayes_2024_02.ogg")
const FOOTSTEPS = preload("res://assets/audio/Valorant  Footstep Sound Effect.mp3")

func _ready():
	play_music(COBAYES_01)


func play_music(stream: AudioStream) -> void:
	music_stream_player.stream = stream
	music_stream_player.play()

func walk_sfx():
	if not walk_sfx_stream_player.playing:
		walk_sfx_stream_player.stream = FOOTSTEPS
		walk_sfx_stream_player.play(1.5)
